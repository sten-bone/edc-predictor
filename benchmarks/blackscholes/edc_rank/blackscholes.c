// Copyright (c) 2007 Intel Corp.

// Black-Scholes
// Analytical method for calculating European Options
//
// 
// Reference Source: Options, Futures, and Other Derivatives, 3rd Edition, Prentice 
// Hall, John C. Hull,

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#ifdef ENABLE_PARSEC_HOOKS
#include <hooks.h>
#endif

// Multi-threaded pthreads header
#ifdef ENABLE_THREADS
// Add the following line so that icc 9.0 is compatible with pthread lib.
#define __thread __threadp
MAIN_ENV
#undef __thread
#endif

// Multi-threaded OpenMP header
#ifdef ENABLE_OPENMP
#include <omp.h>
#endif

#ifdef ENABLE_TBB
#include "tbb/blocked_range.h"
#include "tbb/parallel_for.h"
#include "tbb/task_scheduler_init.h"
#include "tbb/tick_count.h"

using namespace std;
using namespace tbb;
#endif //ENABLE_TBB

// Multi-threaded header for Windows
#ifdef WIN32
#pragma warning(disable : 4305)
#pragma warning(disable : 4244)
#include <windows.h>
#endif

//Precision to use for calculations
#define fptype float

#define NUM_RUNS 100

typedef struct OptionData_ {
        fptype s;          // spot price
        fptype strike;     // strike price
        fptype r;          // risk-free interest rate
        fptype divq;       // dividend rate
        fptype v;          // volatility
        fptype t;          // time to maturity or option expiration in years 
                           //     (1yr = 1.0, 6mos = 0.5, 3mos = 0.25, ..., etc)  
        char OptionType;   // Option type.  "P"=PUT, "C"=CALL
        fptype divs;       // dividend vals (not used in this test)
        fptype DGrefval;   // DerivaGem Reference Value
} OptionData;

OptionData *data;
fptype *prices;
int numOptions;

int    * otype;
fptype * sptprice;
fptype * strike;
fptype * rate;
fptype * volatility;
fptype * otime;
int numError = 0;
int nThreads;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// Cumulative Normal Distribution Function
// See Hull, Section 11.8, P.243-244
#define inv_sqrt_2xPI 0.39894228040143270286

fptype CNDF ( fptype InputX ) 
{ 
    int sign;

    fptype OutputX;
    fptype xInput;
    fptype xNPrimeofX;
    fptype expValues;
    fptype xK2;
    fptype xK2_2, xK2_3;
    fptype xK2_4, xK2_5;
    fptype xLocal, xLocal_1;
    fptype xLocal_2, xLocal_3;

    // Check for negative value of InputX
    if (InputX < 0.0) { // 0 0 0 2
        InputX = -InputX; // 0 0 0 1
        sign = 1; // 0 0 0 1
    } else 
        sign = 0; // 0 0 0 1

    xInput = InputX; // 0 0 0 1
 
    // Compute NPrimeX term common to both four & six decimal accuracy calcs
    expValues = exp(-0.5f * InputX * InputX); // 0 0 0 1
    xNPrimeofX = expValues; // 0 0 0 1
    xNPrimeofX = xNPrimeofX * inv_sqrt_2xPI; // 0 0 0 1

    xK2 = 0.2316419 * xInput; // 0 0 0 1
    xK2 = 1.0 + xK2; // 0 0 0 1
    xK2 = 1.0 / xK2; // 0 0 0 1
    xK2_2 = xK2 * xK2; // 0 0 0 1
    xK2_3 = xK2_2 * xK2; // 0 0 0 1
    xK2_4 = xK2_3 * xK2; // 0 0 0 1
    xK2_5 = xK2_4 * xK2; // 0 0 0 1
    
    xLocal_1 = xK2 * 0.319381530; // 0 0 0 1
    xLocal_2 = xK2_2 * (-0.356563782); // 0 0 0 1
    xLocal_3 = xK2_3 * 1.781477937; // 0 0 0 1
    xLocal_2 = xLocal_2 + xLocal_3; // 0 0 0 1
    xLocal_3 = xK2_4 * (-1.821255978); // 0 0 0 1
    xLocal_2 = xLocal_2 + xLocal_3; // 0 0 0 1
    xLocal_3 = xK2_5 * 1.330274429; // 0 0 0 1
    xLocal_2 = xLocal_2 + xLocal_3; // 0 0 0 1

    xLocal_1 = xLocal_2 + xLocal_1; // 0 0 0 1
    xLocal   = xLocal_1 * xNPrimeofX; // 0 0 0 1
    xLocal   = 1.0 - xLocal; // 0 0 0 1

    OutputX  = xLocal; // 0 0 0 1
    
    if (sign) { // 0 0 0 1
        OutputX = 1.0 - OutputX; // 0 0 0 1
    }
    
    return OutputX;
} 

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
fptype BlkSchlsEqEuroNoDiv( fptype sptprice,
                            fptype strike, fptype rate, fptype volatility,
                            fptype time, int otype, float timet )
{ 
    fptype OptionPrice;

    // local private working variables for the calculation
    fptype xStockPrice;
    fptype xStrikePrice;
    fptype xRiskFreeRate;
    fptype xVolatility;
    fptype xTime;
    fptype xSqrtTime;

    fptype logValues;
    fptype xLogTerm;
    fptype xD1; 
    fptype xD2;
    fptype xPowerTerm;
    fptype xDen;
    fptype d1;
    fptype d2;
    fptype FutureValueX;
    fptype NofXd1;
    fptype NofXd2;
    fptype NegNofXd1;
    fptype NegNofXd2;    
    
    xStockPrice = sptprice; // 0 0 0 1
    xStrikePrice = strike; // 0 0 0 1
    xRiskFreeRate = rate; // 0 0 0 1
    xVolatility = volatility; // 0 0 0 1

    xTime = time; // 0 0 0 1
    xSqrtTime = sqrt(xTime); // 0 0 0 1

    logValues = log( sptprice / strike ); // 0 0 0 1
        
    xLogTerm = logValues; // 0 0 0 1
        
    
    xPowerTerm = xVolatility * xVolatility; // 0 0 0 1
    xPowerTerm = xPowerTerm * 0.5; // 0 0 0 1
        
    xD1 = xRiskFreeRate + xPowerTerm; // 0 0 0 1
    xD1 = xD1 * xTime; // 0 0 0 1
    xD1 = xD1 + xLogTerm; // 0 0 0 1

    xDen = xVolatility * xSqrtTime; // 0 0 0 1
    xD1 = xD1 / xDen; // 0 0 0 1
    xD2 = xD1 -  xDen; // 0 0 0 1

    d1 = xD1; // 0 0 0 1
    d2 = xD2; // 0 0 0 1
    
    NofXd1 = CNDF( d1 ); // 0 0 0 1
    NofXd2 = CNDF( d2 ); // 0 0 0 1

    FutureValueX = strike * ( exp( -(rate)*(time) ) );        // 0 0 0 1
    if (otype == 0) {            // 0 0 0 3
        OptionPrice = (sptprice * NofXd1) - (FutureValueX * NofXd2); // 0 0 0 1
    } else {  
        NegNofXd1 = (1.0 - NofXd1); // 0 0 0 1
        NegNofXd2 = (1.0 - NofXd2); // 0 0 0 1
        OptionPrice = (FutureValueX * NegNofXd2) - (sptprice * NegNofXd1); // 0 0 0 1
    }
    
    return OptionPrice;
}

#ifdef ENABLE_TBB
struct mainWork {
  mainWork() {}
  mainWork(mainWork &w, tbb::split) {}

  void operator()(const tbb::blocked_range<int> &range) const {
    fptype price;
    int begin = range.begin(); // 0 0 1 1
    int end = range.end(); // 0 0 1 1

    for (int i=begin; i!=end; i++) { // 1 0 0 0
      /* Calling main function to calculate option value based on 
       * Black & Scholes's equation.
       */

      price = BlkSchlsEqEuroNoDiv( sptprice[i], strike[i],
                                   rate[i], volatility[i], otime[i], 
                                   otype[i], 0); // 1 0 0 1/7
      prices[i] = price; // 2 0 0 1/2

#ifdef ERR_CHK 
      fptype priceDelta = data[i].DGrefval - price; // 2 0 0 1/2
      if( fabs(priceDelta) >= 1e-5 ){ // 1 0 0 1
        fprintf(stderr,"Error on %d. Computed=%.5f, Ref=%.5f, Delta=%.5f\n",
               i, price, data[i].DGrefval, priceDelta); // 1 0 0 0
        numError ++; // 2 0 0 1
      }
#endif
    }
  }
};

#endif // ENABLE_TBB

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

#ifdef ENABLE_TBB
int bs_thread(void *tid_ptr) {
    int j;
    tbb::affinity_partitioner a;

    mainWork doall;
    for (j=0; j<NUM_RUNS; j++) { // 1 0 0 0
      tbb::parallel_for(tbb::blocked_range<int>(0, numOptions), doall, a); // 1 0 0 0
    }

    return 0;
}
#else // !ENABLE_TBB

#ifdef WIN32
DWORD WINAPI bs_thread(LPVOID tid_ptr){
#else
int bs_thread(void *tid_ptr) {
#endif
    int i, j;
    fptype price;
    fptype priceDelta;
    int tid = *(int *)tid_ptr; // 0 0 3 1
    int start = tid * (numOptions / nThreads); // 0 0 3 1
    int end = start + (numOptions / nThreads); // 0 0 3 1

    for (j=0; j<NUM_RUNS; j++) { // 1 2 2 0
#ifdef ENABLE_OPENMP
#pragma omp parallel for private(i, price, priceDelta)
        for (i=0; i<numOptions; i++) { // 2 1 1 0
#else  //ENABLE_OPENMP
        for (i=start; i<end; i++) { // 3 0 0 0
#endif //ENABLE_OPENMP
            /* Calling main function to calculate option value based on 
             * Black & Scholes's equation.
             */
            price = BlkSchlsEqEuroNoDiv( sptprice[i], strike[i],
                                         rate[i], volatility[i], otime[i], 
                                         otype[i], 0); // 4 0 0 1/7
            prices[i] = price; // 4 0 0 1

#ifdef ERR_CHK
            priceDelta = data[i].DGrefval - price; // 4 0 0 1/2
            if( fabs(priceDelta) >= 1e-4 ){ // 4 0 0 1
                printf("Error on %d. Computed=%.5f, Ref=%.5f, Delta=%.5f\n",
                       i, price, data[i].DGrefval, priceDelta); // 4 0 0 0
                numError ++; // 4 0 0 1
            }
#endif
        }
    }

    return 0;
}
#endif //ENABLE_TBB

int main (int argc, char **argv)
{
    FILE *file;
    int i;
    int loopnum;
    fptype * buffer;
    int * buffer2;
    int rv;

#ifdef PARSEC_VERSION
#define __PARSEC_STRING(x) #x
#define __PARSEC_XSTRING(x) __PARSEC_STRING(x)
        printf("PARSEC Benchmark Suite Version "__PARSEC_XSTRING(PARSEC_VERSION)"\n");
	fflush(NULL);
#else
        printf("PARSEC Benchmark Suite\n");
	fflush(NULL);
#endif //PARSEC_VERSION
#ifdef ENABLE_PARSEC_HOOKS
   __parsec_bench_begin(__parsec_blackscholes);
#endif

   if (argc != 4) // 0 0 1 0
        {
                printf("Usage:\n\t%s <nthreads> <inputFile> <outputFile>\n", argv[0]);
                exit(1);
        }
    nThreads = atoi(argv[1]); // 0 0 1 1
    char *inputFile = argv[2]; // 0 0 1 1
    char *outputFile = argv[3]; // 0 0 1 1

    //Read input data from file
    file = fopen(inputFile, "r"); // 0 0 1 1
    if(file == NULL) { // 0 0 1 0
      printf("ERROR: Unable to open file `%s'.\n", inputFile);
      exit(1);
    }
    rv = fscanf(file, "%i", &numOptions); // 0 0 1 1
    if(rv != 1) { // 0 0 1 0
      printf("ERROR: Unable to read from file `%s'.\n", inputFile);
      fclose(file);
      exit(1);
    }
    if(nThreads > numOptions) { // 0 0 1 0
      printf("WARNING: Not enough work, reducing number of threads to match number of options.\n");
      nThreads = numOptions;
    }

#if !defined(ENABLE_THREADS) && !defined(ENABLE_OPENMP) && !defined(ENABLE_TBB)
    if(nThreads != 1) { // 0 0 1 0
        printf("Error: <nthreads> must be 1 (serial version)\n");
        exit(1);
    }
#endif

    // alloc spaces for the option data
    data = (OptionData*)malloc(numOptions*sizeof(OptionData)); // 0 0 1 1
    prices = (fptype*)malloc(numOptions*sizeof(fptype)); // 0 0 1 1
    for ( loopnum = 0; loopnum < numOptions; ++ loopnum ) // 1 0 1 0
    {
        rv = fscanf(file, "%f %f %f %f %f %f %c %f %f", &data[loopnum].s, &data[loopnum].strike, &data[loopnum].r, &data[loopnum].divq, &data[loopnum].v, &data[loopnum].t, &data[loopnum].OptionType, &data[loopnum].divs, &data[loopnum].DGrefval); // 2 0 0 1/10
        if(rv != 9) { // 2 0 0 0
          printf("ERROR: Unable to read from file `%s'.\n", inputFile); // 2 0 0 0
          fclose(file); // 2 0 0 0
          exit(1); // 2 0 0 0
        }
    }
    rv = fclose(file); // 0 0 1 1
    if(rv != 0) { // 0 0 1 0
      printf("ERROR: Unable to close file `%s'.\n", inputFile); // 0 0 1 0
      exit(1); // 0 0 1 0
    }

#ifdef ENABLE_THREADS
    MAIN_INITENV(,8000000,nThreads);
#endif
    printf("Num of Options: %d\n", numOptions); // 0 0 1 0
    printf("Num of Runs: %d\n", NUM_RUNS); // 0 0 1 0

#define PAD 256
#define LINESIZE 64

    buffer = (fptype *) malloc(5 * numOptions * sizeof(fptype) + PAD); // 0 0 1 1
    sptprice = (fptype *) (((unsigned long long)buffer + PAD) & ~(LINESIZE - 1)); // 0 0 1 1
    strike = sptprice + numOptions; // 0 0 1 1
    rate = strike + numOptions; // 0 0 1 1
    volatility = rate + numOptions; // 0 0 1 1
    otime = volatility + numOptions; // 0 0 1 1

    buffer2 = (int *) malloc(numOptions * sizeof(fptype) + PAD); // 0 0 1 1
    otype = (int *) (((unsigned long long)buffer2 + PAD) & ~(LINESIZE - 1)); // 0 0 1 1

    for (i=0; i<numOptions; i++) { // 1 0 0 0
        otype[i]      = (data[i].OptionType == 'P') ? 1 : 0; // 2 0 0 1/2
        sptprice[i]   = data[i].s; // 2 0 0 1/2
        strike[i]     = data[i].strike; // 2 0 0 1/2
        rate[i]       = data[i].r; // 2 0 0 1/2
        volatility[i] = data[i].v; // 2 0 0 1/2
        otime[i]      = data[i].t; // 2 0 0 1/2
    }

    printf("Size of data: %d\n", numOptions * (sizeof(OptionData) + sizeof(int)));

#ifdef ENABLE_PARSEC_HOOKS
    __parsec_roi_begin();
#endif

#ifdef ENABLE_THREADS
#ifdef WIN32
    HANDLE *threads;
    int *nums;
    threads = (HANDLE *) malloc (nThreads * sizeof(HANDLE)); // 0 0 1 1
    nums = (int *) malloc (nThreads * sizeof(int)); // 0 0 1 1

    for(i=0; i<nThreads; i++) { // 1 0 1 0
        nums[i] = i; // 2 0 0 1
        threads[i] = CreateThread(0, 0, bs_thread, &nums[i], 0, 0); // 2 0 0 1/2
    }
    WaitForMultipleObjects(nThreads, threads, TRUE, INFINITE); // 0 0 1 0
    free(threads); // 0 0 1 0
    free(nums); // 0 0 1 0
#else
    int *tids;
    tids = (int *) malloc (nThreads * sizeof(int)); // 0 0 1 1

    for(i=0; i<nThreads; i++) { // 1 0 0 0
        tids[i]=i; // 2 0 0 1/2
        CREATE_WITH_ARG(bs_thread, &tids[i]); // 2 0 0 1/2
    }
    WAIT_FOR_END(nThreads); // 0 0 1 0
    free(tids); // 0 0 1 0
#endif //WIN32
#else //ENABLE_THREADS
#ifdef ENABLE_OPENMP
    {
        int tid=0; // 0 0 0 1
        omp_set_num_threads(nThreads);
        bs_thread(&tid);
    }
#else //ENABLE_OPENMP
#ifdef ENABLE_TBB
    tbb::task_scheduler_init init(nThreads); // 0 0 1 0

    int tid=0; // 0 0 1 1
    bs_thread(&tid); // 0 0 1 0
#else //ENABLE_TBB
    //serial version
    int tid=0; // 0 0 1 1
    bs_thread(&tid); // 0 0 1 0
#endif //ENABLE_TBB
#endif //ENABLE_OPENMP
#endif //ENABLE_THREADS

#ifdef ENABLE_PARSEC_HOOKS
    __parsec_roi_end(); // 0 0 1 0
#endif

    //Write prices to output file
    file = fopen(outputFile, "w"); // 0 0 1 1
    if(file == NULL) { // 0 0 1 0
      printf("ERROR: Unable to open file `%s'.\n", outputFile);
      exit(1);
    }
    rv = fprintf(file, "%i\n", numOptions); // 0 0 1 1
    if(rv < 0) { // 0 0 1 0
      printf("ERROR: Unable to write to file `%s'.\n", outputFile);
      fclose(file);
      exit(1);
    }
    for(i=0; i<numOptions; i++) { // 1 0 0 0
      rv = fprintf(file, "%.18f\n", prices[i]); // 2 0 0 1/2
      if(rv < 0) { // 2 0 0 0
        printf("ERROR: Unable to write to file `%s'.\n", outputFile); // 2 0 0 0
        fclose(file); // 2 0 0 0
        exit(1); // 2 0 0 0
      }
    }
    rv = fclose(file); // 0 0 0 1
    if(rv != 0) { // 0 0 1 0
      printf("ERROR: Unable to close file `%s'.\n", outputFile);
      exit(1);
    }

#ifdef ERR_CHK
    printf("Num Errors: %d\n", numError);
#endif
    free(data);
    free(prices);

#ifdef ENABLE_PARSEC_HOOKS
    __parsec_bench_end();
#endif

    return 0;
}

