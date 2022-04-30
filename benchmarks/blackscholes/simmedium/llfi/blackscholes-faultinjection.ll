; ModuleID = '/home/foo/edc-predictor/benchmarks/blackscholes/simmedium/llfi/blackscholes-llfi_index.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.OptionData_ = type { float, float, float, float, float, float, i8, float, float }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@numError = global i32 0, align 4
@numOptions = common global i32 0, align 4
@nThreads = common global i32 0, align 4
@sptprice = common global float* null, align 8
@strike = common global float* null, align 8
@rate = common global float* null, align 8
@volatility = common global float* null, align 8
@otime = common global float* null, align 8
@otype = common global i32* null, align 8
@prices = common global float* null, align 8
@.str = private unnamed_addr constant [24 x i8] c"PARSEC Benchmark Suite\0A\00", align 1
@.str1 = private unnamed_addr constant [48 x i8] c"Usage:\0A\09%s <nthreads> <inputFile> <outputFile>\0A\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str3 = private unnamed_addr constant [34 x i8] c"ERROR: Unable to open file `%s'.\0A\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"%i\00", align 1
@.str5 = private unnamed_addr constant [39 x i8] c"ERROR: Unable to read from file `%s'.\0A\00", align 1
@.str6 = private unnamed_addr constant [82 x i8] c"WARNING: Not enough work, reducing number of threads to match number of options.\0A\00", align 1
@.str7 = private unnamed_addr constant [46 x i8] c"Error: <nthreads> must be 1 (serial version)\0A\00", align 1
@data = common global %struct.OptionData_* null, align 8
@.str8 = private unnamed_addr constant [27 x i8] c"%f %f %f %f %f %f %c %f %f\00", align 1
@.str9 = private unnamed_addr constant [35 x i8] c"ERROR: Unable to close file `%s'.\0A\00", align 1
@.str10 = private unnamed_addr constant [20 x i8] c"Num of Options: %d\0A\00", align 1
@.str11 = private unnamed_addr constant [17 x i8] c"Num of Runs: %d\0A\00", align 1
@.str12 = private unnamed_addr constant [18 x i8] c"Size of data: %d\0A\00", align 1
@.str13 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str14 = private unnamed_addr constant [4 x i8] c"%i\0A\00", align 1
@.str15 = private unnamed_addr constant [38 x i8] c"ERROR: Unable to write to file `%s'.\0A\00", align 1
@.str16 = private unnamed_addr constant [7 x i8] c"%.18f\0A\00", align 1
@alloca_namestr = internal constant [7 x i8] c"alloca\00"
@fptrunc_namestr = internal constant [8 x i8] c"fptrunc\00"
@load_namestr = internal constant [5 x i8] c"load\00"
@fmul_namestr = internal constant [5 x i8] c"fmul\00"
@fpext_namestr = internal constant [6 x i8] c"fpext\00"
@fcmp_namestr = internal constant [5 x i8] c"fcmp\00"
@fsub_namestr = internal constant [5 x i8] c"fsub\00"
@call_namestr = internal constant [5 x i8] c"call\00"
@fdiv_namestr = internal constant [5 x i8] c"fdiv\00"
@fadd_namestr = internal constant [5 x i8] c"fadd\00"
@icmp_namestr = internal constant [5 x i8] c"icmp\00"
@getelementptr_namestr = internal constant [14 x i8] c"getelementptr\00"
@bitcast_namestr = internal constant [8 x i8] c"bitcast\00"
@sdiv_namestr = internal constant [5 x i8] c"sdiv\00"
@mul_namestr = internal constant [4 x i8] c"mul\00"
@add_namestr = internal constant [4 x i8] c"add\00"
@sext_namestr = internal constant [5 x i8] c"sext\00"
@ptrtoint_namestr = internal constant [9 x i8] c"ptrtoint\00"
@and_namestr = internal constant [4 x i8] c"and\00"
@inttoptr_namestr = internal constant [9 x i8] c"inttoptr\00"
@select_namestr = internal constant [7 x i8] c"select\00"

; Function Attrs: nounwind uwtable
define float @CNDF(float %InputX) #0 {
  %1 = alloca float, align 4, !llfi_index !1
  %fi1 = call float* @injectFault0(i64 1, float* %1, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %sign = alloca i32, align 4, !llfi_index !3
  %fi10 = call i32* @injectFault2(i64 2, i32* %sign, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %OutputX = alloca float, align 4, !llfi_index !4
  %fi11 = call float* @injectFault0(i64 3, float* %OutputX, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xInput = alloca float, align 4, !llfi_index !5
  %fi12 = call float* @injectFault0(i64 4, float* %xInput, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xNPrimeofX = alloca float, align 4, !llfi_index !6
  %fi13 = call float* @injectFault0(i64 5, float* %xNPrimeofX, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %expValues = alloca float, align 4, !llfi_index !7
  %fi14 = call float* @injectFault0(i64 6, float* %expValues, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xK2 = alloca float, align 4, !llfi_index !8
  %fi15 = call float* @injectFault0(i64 7, float* %xK2, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xK2_2 = alloca float, align 4, !llfi_index !9
  %fi16 = call float* @injectFault0(i64 8, float* %xK2_2, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xK2_3 = alloca float, align 4, !llfi_index !10
  %fi17 = call float* @injectFault0(i64 9, float* %xK2_3, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xK2_4 = alloca float, align 4, !llfi_index !11
  %fi18 = call float* @injectFault0(i64 10, float* %xK2_4, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xK2_5 = alloca float, align 4, !llfi_index !12
  %fi19 = call float* @injectFault0(i64 11, float* %xK2_5, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xLocal = alloca float, align 4, !llfi_index !13
  %fi20 = call float* @injectFault0(i64 12, float* %xLocal, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xLocal_1 = alloca float, align 4, !llfi_index !14
  %fi21 = call float* @injectFault0(i64 13, float* %xLocal_1, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xLocal_2 = alloca float, align 4, !llfi_index !15
  %fi = call float* @injectFault0(i64 14, float* %xLocal_2, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xLocal_3 = alloca float, align 4, !llfi_index !16
  %fi22 = call float* @injectFault0(i64 15, float* %xLocal_3, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %InputX, float* %fi1, align 4, !llfi_index !17
  %2 = load float* %fi1, align 4, !llfi_index !18
  %fi23 = call float @injectFault1(i64 17, float %2, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %3 = fpext float %fi23 to double, !llfi_index !19
  %fi24 = call double @injectFault3(i64 18, double %3, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %4 = fcmp olt double %fi24, 0.000000e+00, !llfi_index !20
  %fi25 = call i1 @injectFault4(i64 19, i1 %4, i32 47, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fcmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi25, label %5, label %8, !llfi_index !21

; <label>:5                                       ; preds = %0
  %6 = load float* %fi1, align 4, !llfi_index !22
  %fi26 = call float @injectFault1(i64 21, float %6, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %7 = fsub float -0.000000e+00, %fi26, !llfi_index !23
  %fi27 = call float @injectFault1(i64 22, float %7, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi27, float* %fi1, align 4, !llfi_index !24
  store i32 1, i32* %fi10, align 4, !llfi_index !25
  br label %9, !llfi_index !26

; <label>:8                                       ; preds = %0
  store i32 0, i32* %fi10, align 4, !llfi_index !27
  br label %9, !llfi_index !28

; <label>:9                                       ; preds = %8, %5
  %10 = load float* %fi1, align 4, !llfi_index !29
  %fi29 = call float @injectFault1(i64 28, float %10, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi29, float* %fi12, align 4, !llfi_index !30
  %11 = load float* %fi1, align 4, !llfi_index !31
  %fi30 = call float @injectFault1(i64 30, float %11, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %12 = fmul float -5.000000e-01, %fi30, !llfi_index !32
  %fi31 = call float @injectFault1(i64 31, float %12, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %13 = load float* %fi1, align 4, !llfi_index !33
  %fi32 = call float @injectFault1(i64 32, float %13, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %14 = fmul float %fi31, %fi32, !llfi_index !34
  %fi33 = call float @injectFault1(i64 33, float %14, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %15 = fpext float %fi33 to double, !llfi_index !35
  %fi34 = call double @injectFault3(i64 34, double %15, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %16 = call double @exp(double %fi34) #5, !llfi_index !36
  %fi35 = call double @injectFault3(i64 35, double %16, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %17 = fptrunc double %fi35 to float, !llfi_index !37
  %fi28 = call float @injectFault1(i64 36, float %17, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi28, float* %fi14, align 4, !llfi_index !38
  %18 = load float* %fi14, align 4, !llfi_index !39
  %fi37 = call float @injectFault1(i64 38, float %18, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi37, float* %fi13, align 4, !llfi_index !40
  %19 = load float* %fi13, align 4, !llfi_index !41
  %fi38 = call float @injectFault1(i64 40, float %19, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %20 = fpext float %fi38 to double, !llfi_index !42
  %fi39 = call double @injectFault3(i64 41, double %20, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %21 = fmul double %fi39, 0x3FD9884533D43651, !llfi_index !43
  %fi40 = call double @injectFault3(i64 42, double %21, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %22 = fptrunc double %fi40 to float, !llfi_index !44
  %fi41 = call float @injectFault1(i64 43, float %22, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi41, float* %fi13, align 4, !llfi_index !45
  %23 = load float* %fi12, align 4, !llfi_index !46
  %fi42 = call float @injectFault1(i64 45, float %23, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %24 = fpext float %fi42 to double, !llfi_index !47
  %fi43 = call double @injectFault3(i64 46, double %24, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %25 = fmul double 2.316419e-01, %fi43, !llfi_index !48
  %fi44 = call double @injectFault3(i64 47, double %25, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %26 = fptrunc double %fi44 to float, !llfi_index !49
  %fi45 = call float @injectFault1(i64 48, float %26, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi45, float* %fi15, align 4, !llfi_index !50
  %27 = load float* %fi15, align 4, !llfi_index !51
  %fi59 = call float @injectFault1(i64 50, float %27, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %28 = fpext float %fi59 to double, !llfi_index !52
  %fi60 = call double @injectFault3(i64 51, double %28, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %29 = fadd double 1.000000e+00, %fi60, !llfi_index !53
  %fi61 = call double @injectFault3(i64 52, double %29, i32 9, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fadd_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %30 = fptrunc double %fi61 to float, !llfi_index !54
  %fi62 = call float @injectFault1(i64 53, float %30, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi62, float* %fi15, align 4, !llfi_index !55
  %31 = load float* %fi15, align 4, !llfi_index !56
  %fi63 = call float @injectFault1(i64 55, float %31, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %32 = fpext float %fi63 to double, !llfi_index !57
  %fi64 = call double @injectFault3(i64 56, double %32, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %33 = fdiv double 1.000000e+00, %fi64, !llfi_index !58
  %fi36 = call double @injectFault3(i64 57, double %33, i32 16, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fdiv_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %34 = fptrunc double %fi36 to float, !llfi_index !59
  %fi65 = call float @injectFault1(i64 58, float %34, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi65, float* %fi15, align 4, !llfi_index !60
  %35 = load float* %fi15, align 4, !llfi_index !61
  %fi66 = call float @injectFault1(i64 60, float %35, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %36 = load float* %fi15, align 4, !llfi_index !62
  %fi4 = call float @injectFault1(i64 61, float %36, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %37 = fmul float %fi66, %fi4, !llfi_index !63
  %fi5 = call float @injectFault1(i64 62, float %37, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi5, float* %fi16, align 4, !llfi_index !64
  %38 = load float* %fi16, align 4, !llfi_index !65
  %fi6 = call float @injectFault1(i64 64, float %38, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %39 = load float* %fi15, align 4, !llfi_index !66
  %fi7 = call float @injectFault1(i64 65, float %39, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %40 = fmul float %fi6, %fi7, !llfi_index !67
  %fi8 = call float @injectFault1(i64 66, float %40, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi8, float* %fi17, align 4, !llfi_index !68
  %41 = load float* %fi17, align 4, !llfi_index !69
  %fi9 = call float @injectFault1(i64 68, float %41, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %42 = load float* %fi15, align 4, !llfi_index !70
  %fi67 = call float @injectFault1(i64 69, float %42, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %43 = fmul float %fi9, %fi67, !llfi_index !71
  %fi68 = call float @injectFault1(i64 70, float %43, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi68, float* %fi18, align 4, !llfi_index !72
  %44 = load float* %fi18, align 4, !llfi_index !73
  %fi69 = call float @injectFault1(i64 72, float %44, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %45 = load float* %fi15, align 4, !llfi_index !74
  %fi70 = call float @injectFault1(i64 73, float %45, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %46 = fmul float %fi69, %fi70, !llfi_index !75
  %fi71 = call float @injectFault1(i64 74, float %46, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi71, float* %fi19, align 4, !llfi_index !76
  %47 = load float* %fi15, align 4, !llfi_index !77
  %fi72 = call float @injectFault1(i64 76, float %47, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %48 = fpext float %fi72 to double, !llfi_index !78
  %fi73 = call double @injectFault3(i64 77, double %48, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %49 = fmul double %fi73, 0x3FD470BF3A92F8EC, !llfi_index !79
  %fi74 = call double @injectFault3(i64 78, double %49, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %50 = fptrunc double %fi74 to float, !llfi_index !80
  %fi75 = call float @injectFault1(i64 79, float %50, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi75, float* %fi21, align 4, !llfi_index !81
  %51 = load float* %fi16, align 4, !llfi_index !82
  %fi76 = call float @injectFault1(i64 81, float %51, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %52 = fpext float %fi76 to double, !llfi_index !83
  %fi77 = call double @injectFault3(i64 82, double %52, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %53 = fmul double %fi77, 0xBFD6D1F0E5A8325B, !llfi_index !84
  %fi78 = call double @injectFault3(i64 83, double %53, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %54 = fptrunc double %fi78 to float, !llfi_index !85
  %fi79 = call float @injectFault1(i64 84, float %54, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi79, float* %fi, align 4, !llfi_index !86
  %55 = load float* %fi17, align 4, !llfi_index !87
  %fi80 = call float @injectFault1(i64 86, float %55, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %56 = fpext float %fi80 to double, !llfi_index !88
  %fi81 = call double @injectFault3(i64 87, double %56, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %57 = fmul double %fi81, 0x3FFC80EF025F5E68, !llfi_index !89
  %fi82 = call double @injectFault3(i64 88, double %57, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %58 = fptrunc double %fi82 to float, !llfi_index !90
  %fi83 = call float @injectFault1(i64 89, float %58, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi83, float* %fi22, align 4, !llfi_index !91
  %59 = load float* %fi, align 4, !llfi_index !92
  %fi84 = call float @injectFault1(i64 91, float %59, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %60 = load float* %fi22, align 4, !llfi_index !93
  %fi85 = call float @injectFault1(i64 92, float %60, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %61 = fadd float %fi84, %fi85, !llfi_index !94
  %fi86 = call float @injectFault1(i64 93, float %61, i32 9, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fadd_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi86, float* %fi, align 4, !llfi_index !95
  %62 = load float* %fi18, align 4, !llfi_index !96
  %fi87 = call float @injectFault1(i64 95, float %62, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %63 = fpext float %fi87 to double, !llfi_index !97
  %fi88 = call double @injectFault3(i64 96, double %63, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %64 = fmul double %fi88, 0xBFFD23DD4EF278D0, !llfi_index !98
  %fi46 = call double @injectFault3(i64 97, double %64, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %65 = fptrunc double %fi46 to float, !llfi_index !99
  %fi2 = call float @injectFault1(i64 98, float %65, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi2, float* %fi22, align 4, !llfi_index !100
  %66 = load float* %fi, align 4, !llfi_index !101
  %fi3 = call float @injectFault1(i64 100, float %66, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %67 = load float* %fi22, align 4, !llfi_index !102
  %fi47 = call float @injectFault1(i64 101, float %67, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %68 = fadd float %fi3, %fi47, !llfi_index !103
  %fi48 = call float @injectFault1(i64 102, float %68, i32 9, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fadd_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi48, float* %fi, align 4, !llfi_index !104
  %69 = load float* %fi19, align 4, !llfi_index !105
  %fi49 = call float @injectFault1(i64 104, float %69, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %70 = fpext float %fi49 to double, !llfi_index !106
  %fi50 = call double @injectFault3(i64 105, double %70, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %71 = fmul double %fi50, 0x3FF548CDD6F42943, !llfi_index !107
  %fi51 = call double @injectFault3(i64 106, double %71, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %72 = fptrunc double %fi51 to float, !llfi_index !108
  %fi52 = call float @injectFault1(i64 107, float %72, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi52, float* %fi22, align 4, !llfi_index !109
  %73 = load float* %fi, align 4, !llfi_index !110
  %fi53 = call float @injectFault1(i64 109, float %73, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %74 = load float* %fi22, align 4, !llfi_index !111
  %fi54 = call float @injectFault1(i64 110, float %74, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %75 = fadd float %fi53, %fi54, !llfi_index !112
  %fi55 = call float @injectFault1(i64 111, float %75, i32 9, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fadd_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi55, float* %fi, align 4, !llfi_index !113
  %76 = load float* %fi, align 4, !llfi_index !114
  %fi56 = call float @injectFault1(i64 113, float %76, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %77 = load float* %fi21, align 4, !llfi_index !115
  %fi57 = call float @injectFault1(i64 114, float %77, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %78 = fadd float %fi56, %fi57, !llfi_index !116
  %fi58 = call float @injectFault1(i64 115, float %78, i32 9, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fadd_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi58, float* %fi21, align 4, !llfi_index !117
  %79 = load float* %fi21, align 4, !llfi_index !118
  %fi89 = call float @injectFault1(i64 117, float %79, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %80 = load float* %fi13, align 4, !llfi_index !119
  %fi90 = call float @injectFault1(i64 118, float %80, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %81 = fmul float %fi89, %fi90, !llfi_index !120
  %fi91 = call float @injectFault1(i64 119, float %81, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi91, float* %fi20, align 4, !llfi_index !121
  %82 = load float* %fi20, align 4, !llfi_index !122
  %fi92 = call float @injectFault1(i64 121, float %82, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %83 = fpext float %fi92 to double, !llfi_index !123
  %fi93 = call double @injectFault3(i64 122, double %83, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %84 = fsub double 1.000000e+00, %fi93, !llfi_index !124
  %fi94 = call double @injectFault3(i64 123, double %84, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %85 = fptrunc double %fi94 to float, !llfi_index !125
  %fi95 = call float @injectFault1(i64 124, float %85, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi95, float* %fi20, align 4, !llfi_index !126
  %86 = load float* %fi20, align 4, !llfi_index !127
  %fi96 = call float @injectFault1(i64 126, float %86, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi96, float* %fi11, align 4, !llfi_index !128
  %87 = load i32* %fi10, align 4, !llfi_index !129
  %fi97 = call i32 @injectFault5(i64 128, i32 %87, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %88 = icmp ne i32 %fi97, 0, !llfi_index !130
  %fi98 = call i1 @injectFault4(i64 129, i1 %88, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi98, label %89, label %94, !llfi_index !131

; <label>:89                                      ; preds = %9
  %90 = load float* %fi11, align 4, !llfi_index !132
  %fi99 = call float @injectFault1(i64 131, float %90, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %91 = fpext float %fi99 to double, !llfi_index !133
  %fi100 = call double @injectFault3(i64 132, double %91, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %92 = fsub double 1.000000e+00, %fi100, !llfi_index !134
  %fi101 = call double @injectFault3(i64 133, double %92, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %93 = fptrunc double %fi101 to float, !llfi_index !135
  %fi102 = call float @injectFault1(i64 134, float %93, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi102, float* %fi11, align 4, !llfi_index !136
  br label %94, !llfi_index !137

; <label>:94                                      ; preds = %89, %9
  %95 = load float* %fi11, align 4, !llfi_index !138
  %fi103 = call float @injectFault1(i64 137, float %95, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  ret float %fi103, !llfi_index !139
}

; Function Attrs: nounwind
declare double @exp(double) #1

; Function Attrs: nounwind uwtable
define float @BlkSchlsEqEuroNoDiv(float %sptprice, float %strike, float %rate, float %volatility, float %time, i32 %otype, float %timet) #0 {
  %1 = alloca float, align 4, !llfi_index !140
  %fi34 = call float* @injectFault0(i64 139, float* %1, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %2 = alloca float, align 4, !llfi_index !141
  %fi35 = call float* @injectFault0(i64 140, float* %2, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %3 = alloca float, align 4, !llfi_index !142
  %fi36 = call float* @injectFault0(i64 141, float* %3, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %4 = alloca float, align 4, !llfi_index !143
  %fi37 = call float* @injectFault0(i64 142, float* %4, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %5 = alloca float, align 4, !llfi_index !144
  %fi38 = call float* @injectFault0(i64 143, float* %5, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %6 = alloca i32, align 4, !llfi_index !145
  %fi39 = call i32* @injectFault2(i64 144, i32* %6, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %7 = alloca float, align 4, !llfi_index !146
  %fi40 = call float* @injectFault0(i64 145, float* %7, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %OptionPrice = alloca float, align 4, !llfi_index !147
  %fi41 = call float* @injectFault0(i64 146, float* %OptionPrice, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xStockPrice = alloca float, align 4, !llfi_index !148
  %fi42 = call float* @injectFault0(i64 147, float* %xStockPrice, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xStrikePrice = alloca float, align 4, !llfi_index !149
  %fi43 = call float* @injectFault0(i64 148, float* %xStrikePrice, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xRiskFreeRate = alloca float, align 4, !llfi_index !150
  %fi44 = call float* @injectFault0(i64 149, float* %xRiskFreeRate, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xVolatility = alloca float, align 4, !llfi_index !151
  %fi45 = call float* @injectFault0(i64 150, float* %xVolatility, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xTime = alloca float, align 4, !llfi_index !152
  %fi46 = call float* @injectFault0(i64 151, float* %xTime, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xSqrtTime = alloca float, align 4, !llfi_index !153
  %fi33 = call float* @injectFault0(i64 152, float* %xSqrtTime, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %logValues = alloca float, align 4, !llfi_index !154
  %fi49 = call float* @injectFault0(i64 153, float* %logValues, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xLogTerm = alloca float, align 4, !llfi_index !155
  %fi50 = call float* @injectFault0(i64 154, float* %xLogTerm, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xD1 = alloca float, align 4, !llfi_index !156
  %fi51 = call float* @injectFault0(i64 155, float* %xD1, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xD2 = alloca float, align 4, !llfi_index !157
  %fi52 = call float* @injectFault0(i64 156, float* %xD2, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xPowerTerm = alloca float, align 4, !llfi_index !158
  %fi53 = call float* @injectFault0(i64 157, float* %xPowerTerm, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %xDen = alloca float, align 4, !llfi_index !159
  %fi54 = call float* @injectFault0(i64 158, float* %xDen, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %d1 = alloca float, align 4, !llfi_index !160
  %fi55 = call float* @injectFault0(i64 159, float* %d1, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %d2 = alloca float, align 4, !llfi_index !161
  %fi56 = call float* @injectFault0(i64 160, float* %d2, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %FutureValueX = alloca float, align 4, !llfi_index !162
  %fi57 = call float* @injectFault0(i64 161, float* %FutureValueX, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %NofXd1 = alloca float, align 4, !llfi_index !163
  %fi58 = call float* @injectFault0(i64 162, float* %NofXd1, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %NofXd2 = alloca float, align 4, !llfi_index !164
  %fi59 = call float* @injectFault0(i64 163, float* %NofXd2, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %NegNofXd1 = alloca float, align 4, !llfi_index !165
  %fi47 = call float* @injectFault0(i64 164, float* %NegNofXd1, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %NegNofXd2 = alloca float, align 4, !llfi_index !166
  %fi48 = call float* @injectFault0(i64 165, float* %NegNofXd2, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %sptprice, float* %fi34, align 4, !llfi_index !167
  store float %strike, float* %fi35, align 4, !llfi_index !168
  store float %rate, float* %fi36, align 4, !llfi_index !169
  store float %volatility, float* %fi37, align 4, !llfi_index !170
  store float %time, float* %fi38, align 4, !llfi_index !171
  store i32 %otype, i32* %fi39, align 4, !llfi_index !172
  store float %timet, float* %fi40, align 4, !llfi_index !173
  %8 = load float* %fi34, align 4, !llfi_index !174
  %fi60 = call float @injectFault1(i64 173, float %8, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi60, float* %fi42, align 4, !llfi_index !175
  %9 = load float* %fi35, align 4, !llfi_index !176
  %fi61 = call float @injectFault1(i64 175, float %9, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi61, float* %fi43, align 4, !llfi_index !177
  %10 = load float* %fi36, align 4, !llfi_index !178
  %fi62 = call float @injectFault1(i64 177, float %10, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi62, float* %fi44, align 4, !llfi_index !179
  %11 = load float* %fi37, align 4, !llfi_index !180
  %fi63 = call float @injectFault1(i64 179, float %11, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi63, float* %fi45, align 4, !llfi_index !181
  %12 = load float* %fi38, align 4, !llfi_index !182
  %fi64 = call float @injectFault1(i64 181, float %12, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi64, float* %fi46, align 4, !llfi_index !183
  %13 = load float* %fi46, align 4, !llfi_index !184
  %fi65 = call float @injectFault1(i64 183, float %13, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %14 = fpext float %fi65 to double, !llfi_index !185
  %fi66 = call double @injectFault3(i64 184, double %14, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %15 = call double @sqrt(double %fi66) #5, !llfi_index !186
  %fi67 = call double @injectFault3(i64 185, double %15, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %16 = fptrunc double %fi67 to float, !llfi_index !187
  %fi68 = call float @injectFault1(i64 186, float %16, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi68, float* %fi33, align 4, !llfi_index !188
  %17 = load float* %fi34, align 4, !llfi_index !189
  %fi70 = call float @injectFault1(i64 188, float %17, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %18 = load float* %fi35, align 4, !llfi_index !190
  %fi71 = call float @injectFault1(i64 189, float %18, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %19 = fdiv float %fi70, %fi71, !llfi_index !191
  %fi72 = call float @injectFault1(i64 190, float %19, i32 16, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fdiv_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %20 = fpext float %fi72 to double, !llfi_index !192
  %fi73 = call double @injectFault3(i64 191, double %20, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %21 = call double @log(double %fi73) #5, !llfi_index !193
  %fi74 = call double @injectFault3(i64 192, double %21, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %22 = fptrunc double %fi74 to float, !llfi_index !194
  %fi = call float @injectFault1(i64 193, float %22, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi, float* %fi49, align 4, !llfi_index !195
  %23 = load float* %fi49, align 4, !llfi_index !196
  %fi1 = call float @injectFault1(i64 195, float %23, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi1, float* %fi50, align 4, !llfi_index !197
  %24 = load float* %fi45, align 4, !llfi_index !198
  %fi2 = call float @injectFault1(i64 197, float %24, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %25 = load float* %fi45, align 4, !llfi_index !199
  %fi3 = call float @injectFault1(i64 198, float %25, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %26 = fmul float %fi2, %fi3, !llfi_index !200
  %fi4 = call float @injectFault1(i64 199, float %26, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi4, float* %fi53, align 4, !llfi_index !201
  %27 = load float* %fi53, align 4, !llfi_index !202
  %fi5 = call float @injectFault1(i64 201, float %27, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %28 = fpext float %fi5 to double, !llfi_index !203
  %fi6 = call double @injectFault3(i64 202, double %28, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %29 = fmul double %fi6, 5.000000e-01, !llfi_index !204
  %fi7 = call double @injectFault3(i64 203, double %29, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %30 = fptrunc double %fi7 to float, !llfi_index !205
  %fi8 = call float @injectFault1(i64 204, float %30, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi8, float* %fi53, align 4, !llfi_index !206
  %31 = load float* %fi44, align 4, !llfi_index !207
  %fi9 = call float @injectFault1(i64 206, float %31, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %32 = load float* %fi53, align 4, !llfi_index !208
  %fi10 = call float @injectFault1(i64 207, float %32, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %33 = fadd float %fi9, %fi10, !llfi_index !209
  %fi69 = call float @injectFault1(i64 208, float %33, i32 9, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fadd_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi69, float* %fi51, align 4, !llfi_index !210
  %34 = load float* %fi51, align 4, !llfi_index !211
  %fi13 = call float @injectFault1(i64 210, float %34, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %35 = load float* %fi46, align 4, !llfi_index !212
  %fi14 = call float @injectFault1(i64 211, float %35, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %36 = fmul float %fi13, %fi14, !llfi_index !213
  %fi15 = call float @injectFault1(i64 212, float %36, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi15, float* %fi51, align 4, !llfi_index !214
  %37 = load float* %fi51, align 4, !llfi_index !215
  %fi16 = call float @injectFault1(i64 214, float %37, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %38 = load float* %fi50, align 4, !llfi_index !216
  %fi17 = call float @injectFault1(i64 215, float %38, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %39 = fadd float %fi16, %fi17, !llfi_index !217
  %fi18 = call float @injectFault1(i64 216, float %39, i32 9, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fadd_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi18, float* %fi51, align 4, !llfi_index !218
  %40 = load float* %fi45, align 4, !llfi_index !219
  %fi19 = call float @injectFault1(i64 218, float %40, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %41 = load float* %fi33, align 4, !llfi_index !220
  %fi20 = call float @injectFault1(i64 219, float %41, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %42 = fmul float %fi19, %fi20, !llfi_index !221
  %fi21 = call float @injectFault1(i64 220, float %42, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi21, float* %fi54, align 4, !llfi_index !222
  %43 = load float* %fi51, align 4, !llfi_index !223
  %fi22 = call float @injectFault1(i64 222, float %43, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %44 = load float* %fi54, align 4, !llfi_index !224
  %fi23 = call float @injectFault1(i64 223, float %44, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %45 = fdiv float %fi22, %fi23, !llfi_index !225
  %fi24 = call float @injectFault1(i64 224, float %45, i32 16, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fdiv_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi24, float* %fi51, align 4, !llfi_index !226
  %46 = load float* %fi51, align 4, !llfi_index !227
  %fi25 = call float @injectFault1(i64 226, float %46, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %47 = load float* %fi54, align 4, !llfi_index !228
  %fi26 = call float @injectFault1(i64 227, float %47, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %48 = fsub float %fi25, %fi26, !llfi_index !229
  %fi27 = call float @injectFault1(i64 228, float %48, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi27, float* %fi52, align 4, !llfi_index !230
  %49 = load float* %fi51, align 4, !llfi_index !231
  %fi28 = call float @injectFault1(i64 230, float %49, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi28, float* %fi55, align 4, !llfi_index !232
  %50 = load float* %fi52, align 4, !llfi_index !233
  %fi29 = call float @injectFault1(i64 232, float %50, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi29, float* %fi56, align 4, !llfi_index !234
  %51 = load float* %fi55, align 4, !llfi_index !235
  %fi30 = call float @injectFault1(i64 234, float %51, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %52 = call float @CNDF(float %fi30), !llfi_index !236
  %fi31 = call float @injectFault1(i64 235, float %52, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi31, float* %fi58, align 4, !llfi_index !237
  %53 = load float* %fi56, align 4, !llfi_index !238
  %fi32 = call float @injectFault1(i64 237, float %53, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %54 = call float @CNDF(float %fi32), !llfi_index !239
  %fi75 = call float @injectFault1(i64 238, float %54, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi75, float* %fi59, align 4, !llfi_index !240
  %55 = load float* %fi35, align 4, !llfi_index !241
  %fi76 = call float @injectFault1(i64 240, float %55, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %56 = fpext float %fi76 to double, !llfi_index !242
  %fi77 = call double @injectFault3(i64 241, double %56, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %57 = load float* %fi36, align 4, !llfi_index !243
  %fi78 = call float @injectFault1(i64 242, float %57, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %58 = fsub float -0.000000e+00, %fi78, !llfi_index !244
  %fi79 = call float @injectFault1(i64 243, float %58, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %59 = load float* %fi38, align 4, !llfi_index !245
  %fi80 = call float @injectFault1(i64 244, float %59, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %60 = fmul float %fi79, %fi80, !llfi_index !246
  %fi81 = call float @injectFault1(i64 245, float %60, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %61 = fpext float %fi81 to double, !llfi_index !247
  %fi82 = call double @injectFault3(i64 246, double %61, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %62 = call double @exp(double %fi82) #5, !llfi_index !248
  %fi83 = call double @injectFault3(i64 247, double %62, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %63 = fmul double %fi77, %fi83, !llfi_index !249
  %fi84 = call double @injectFault3(i64 248, double %63, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %64 = fptrunc double %fi84 to float, !llfi_index !250
  %fi85 = call float @injectFault1(i64 249, float %64, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi85, float* %fi57, align 4, !llfi_index !251
  %65 = load i32* %fi39, align 4, !llfi_index !252
  %fi11 = call i32 @injectFault5(i64 251, i32 %65, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %66 = icmp eq i32 %fi11, 0, !llfi_index !253
  %fi12 = call i1 @injectFault4(i64 252, i1 %66, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi12, label %67, label %75, !llfi_index !254

; <label>:67                                      ; preds = %0
  %68 = load float* %fi34, align 4, !llfi_index !255
  %fi86 = call float @injectFault1(i64 254, float %68, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %69 = load float* %fi58, align 4, !llfi_index !256
  %fi87 = call float @injectFault1(i64 255, float %69, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %70 = fmul float %fi86, %fi87, !llfi_index !257
  %fi88 = call float @injectFault1(i64 256, float %70, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %71 = load float* %fi57, align 4, !llfi_index !258
  %fi89 = call float @injectFault1(i64 257, float %71, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %72 = load float* %fi59, align 4, !llfi_index !259
  %fi90 = call float @injectFault1(i64 258, float %72, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %73 = fmul float %fi89, %fi90, !llfi_index !260
  %fi91 = call float @injectFault1(i64 259, float %73, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %74 = fsub float %fi88, %fi91, !llfi_index !261
  %fi92 = call float @injectFault1(i64 260, float %74, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi92, float* %fi41, align 4, !llfi_index !262
  br label %91, !llfi_index !263

; <label>:75                                      ; preds = %0
  %76 = load float* %fi58, align 4, !llfi_index !264
  %fi93 = call float @injectFault1(i64 263, float %76, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %77 = fpext float %fi93 to double, !llfi_index !265
  %fi94 = call double @injectFault3(i64 264, double %77, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %78 = fsub double 1.000000e+00, %fi94, !llfi_index !266
  %fi95 = call double @injectFault3(i64 265, double %78, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %79 = fptrunc double %fi95 to float, !llfi_index !267
  %fi96 = call float @injectFault1(i64 266, float %79, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi96, float* %fi47, align 4, !llfi_index !268
  %80 = load float* %fi59, align 4, !llfi_index !269
  %fi97 = call float @injectFault1(i64 268, float %80, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %81 = fpext float %fi97 to double, !llfi_index !270
  %fi98 = call double @injectFault3(i64 269, double %81, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %82 = fsub double 1.000000e+00, %fi98, !llfi_index !271
  %fi99 = call double @injectFault3(i64 270, double %82, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %83 = fptrunc double %fi99 to float, !llfi_index !272
  %fi100 = call float @injectFault1(i64 271, float %83, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi100, float* %fi48, align 4, !llfi_index !273
  %84 = load float* %fi57, align 4, !llfi_index !274
  %fi101 = call float @injectFault1(i64 273, float %84, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %85 = load float* %fi48, align 4, !llfi_index !275
  %fi102 = call float @injectFault1(i64 274, float %85, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %86 = fmul float %fi101, %fi102, !llfi_index !276
  %fi103 = call float @injectFault1(i64 275, float %86, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %87 = load float* %fi34, align 4, !llfi_index !277
  %fi104 = call float @injectFault1(i64 276, float %87, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %88 = load float* %fi47, align 4, !llfi_index !278
  %fi105 = call float @injectFault1(i64 277, float %88, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %89 = fmul float %fi104, %fi105, !llfi_index !279
  %fi106 = call float @injectFault1(i64 278, float %89, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %90 = fsub float %fi103, %fi106, !llfi_index !280
  %fi107 = call float @injectFault1(i64 279, float %90, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi107, float* %fi41, align 4, !llfi_index !281
  br label %91, !llfi_index !282

; <label>:91                                      ; preds = %75, %67
  %92 = load float* %fi41, align 4, !llfi_index !283
  %fi108 = call float @injectFault1(i64 282, float %92, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  ret float %fi108, !llfi_index !284
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind
declare double @log(double) #1

; Function Attrs: nounwind uwtable
define i32 @bs_thread(i8* %tid_ptr) #0 {
  %1 = alloca i8*, align 8, !llfi_index !285
  %fi = call i8** @injectFault6(i64 284, i8** %1, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %i = alloca i32, align 4, !llfi_index !286
  %fi1 = call i32* @injectFault2(i64 285, i32* %i, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %j = alloca i32, align 4, !llfi_index !287
  %fi2 = call i32* @injectFault2(i64 286, i32* %j, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %price = alloca float, align 4, !llfi_index !288
  %fi3 = call float* @injectFault0(i64 287, float* %price, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %priceDelta = alloca float, align 4, !llfi_index !289
  %fi4 = call float* @injectFault0(i64 288, float* %priceDelta, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %tid = alloca i32, align 4, !llfi_index !290
  %fi5 = call i32* @injectFault2(i64 289, i32* %tid, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %start = alloca i32, align 4, !llfi_index !291
  %fi6 = call i32* @injectFault2(i64 290, i32* %start, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %end = alloca i32, align 4, !llfi_index !292
  %fi7 = call i32* @injectFault2(i64 291, i32* %end, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i8* %tid_ptr, i8** %fi, align 8, !llfi_index !293
  %2 = load i8** %fi, align 8, !llfi_index !294
  %fi8 = call i8* @injectFault7(i64 293, i8* %2, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %3 = bitcast i8* %fi8 to i32*, !llfi_index !295
  %fi9 = call i32* @injectFault2(i64 294, i32* %3, i32 44, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @bitcast_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %4 = load i32* %fi9, align 4, !llfi_index !296
  %fi10 = call i32 @injectFault5(i64 295, i32 %4, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi10, i32* %fi5, align 4, !llfi_index !297
  %5 = load i32* %fi5, align 4, !llfi_index !298
  %fi11 = call i32 @injectFault5(i64 297, i32 %5, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %6 = load i32* @numOptions, align 4, !llfi_index !299
  %fi12 = call i32 @injectFault5(i64 298, i32 %6, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %7 = load i32* @nThreads, align 4, !llfi_index !300
  %fi13 = call i32 @injectFault5(i64 299, i32 %7, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %8 = sdiv i32 %fi12, %fi13, !llfi_index !301
  %fi14 = call i32 @injectFault5(i64 300, i32 %8, i32 15, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sdiv_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %9 = mul nsw i32 %fi11, %fi14, !llfi_index !302
  %fi16 = call i32 @injectFault5(i64 301, i32 %9, i32 12, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @mul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi16, i32* %fi6, align 4, !llfi_index !303
  %10 = load i32* %fi6, align 4, !llfi_index !304
  %fi17 = call i32 @injectFault5(i64 303, i32 %10, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %11 = load i32* @numOptions, align 4, !llfi_index !305
  %fi18 = call i32 @injectFault5(i64 304, i32 %11, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %12 = load i32* @nThreads, align 4, !llfi_index !306
  %fi19 = call i32 @injectFault5(i64 305, i32 %12, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %13 = sdiv i32 %fi18, %fi19, !llfi_index !307
  %fi20 = call i32 @injectFault5(i64 306, i32 %13, i32 15, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sdiv_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %14 = add nsw i32 %fi17, %fi20, !llfi_index !308
  %fi21 = call i32 @injectFault5(i64 307, i32 %14, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi21, i32* %fi7, align 4, !llfi_index !309
  store i32 0, i32* %fi2, align 4, !llfi_index !310
  br label %15, !llfi_index !311

; <label>:15                                      ; preds = %65, %0
  %16 = load i32* %fi2, align 4, !llfi_index !312
  %fi22 = call i32 @injectFault5(i64 311, i32 %16, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %17 = icmp slt i32 %fi22, 100, !llfi_index !313
  %fi15 = call i1 @injectFault4(i64 312, i1 %17, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi15, label %18, label %68, !llfi_index !314

; <label>:18                                      ; preds = %15
  %19 = load i32* %fi6, align 4, !llfi_index !315
  %fi24 = call i32 @injectFault5(i64 314, i32 %19, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi24, i32* %fi1, align 4, !llfi_index !316
  br label %20, !llfi_index !317

; <label>:20                                      ; preds = %61, %18
  %21 = load i32* %fi1, align 4, !llfi_index !318
  %fi25 = call i32 @injectFault5(i64 317, i32 %21, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %22 = load i32* %fi7, align 4, !llfi_index !319
  %fi26 = call i32 @injectFault5(i64 318, i32 %22, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %23 = icmp slt i32 %fi25, %fi26, !llfi_index !320
  %fi27 = call i1 @injectFault4(i64 319, i1 %23, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi27, label %24, label %64, !llfi_index !321

; <label>:24                                      ; preds = %20
  %25 = load i32* %fi1, align 4, !llfi_index !322
  %fi28 = call i32 @injectFault5(i64 321, i32 %25, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %26 = sext i32 %fi28 to i64, !llfi_index !323
  %fi29 = call i64 @injectFault9(i64 322, i64 %26, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %27 = load float** @sptprice, align 8, !llfi_index !324
  %fi30 = call float* @injectFault0(i64 323, float* %27, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %28 = getelementptr float* %fi30, i64 %fi29, !llfi_index !325
  %fi31 = call float* @injectFault0(i64 324, float* %28, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %29 = load float* %fi31, align 4, !llfi_index !326
  %fi32 = call float @injectFault1(i64 325, float %29, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %30 = load i32* %fi1, align 4, !llfi_index !327
  %fi33 = call i32 @injectFault5(i64 326, i32 %30, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %31 = sext i32 %fi33 to i64, !llfi_index !328
  %fi34 = call i64 @injectFault9(i64 327, i64 %31, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %32 = load float** @strike, align 8, !llfi_index !329
  %fi35 = call float* @injectFault0(i64 328, float* %32, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %33 = getelementptr float* %fi35, i64 %fi34, !llfi_index !330
  %fi23 = call float* @injectFault0(i64 329, float* %33, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %34 = load float* %fi23, align 4, !llfi_index !331
  %fi37 = call float @injectFault1(i64 330, float %34, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %35 = load i32* %fi1, align 4, !llfi_index !332
  %fi38 = call i32 @injectFault5(i64 331, i32 %35, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %36 = sext i32 %fi38 to i64, !llfi_index !333
  %fi39 = call i64 @injectFault9(i64 332, i64 %36, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %37 = load float** @rate, align 8, !llfi_index !334
  %fi40 = call float* @injectFault0(i64 333, float* %37, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %38 = getelementptr float* %fi40, i64 %fi39, !llfi_index !335
  %fi41 = call float* @injectFault0(i64 334, float* %38, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %39 = load float* %fi41, align 4, !llfi_index !336
  %fi42 = call float @injectFault1(i64 335, float %39, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %40 = load i32* %fi1, align 4, !llfi_index !337
  %fi43 = call i32 @injectFault5(i64 336, i32 %40, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %41 = sext i32 %fi43 to i64, !llfi_index !338
  %fi44 = call i64 @injectFault9(i64 337, i64 %41, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %42 = load float** @volatility, align 8, !llfi_index !339
  %fi45 = call float* @injectFault0(i64 338, float* %42, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %43 = getelementptr float* %fi45, i64 %fi44, !llfi_index !340
  %fi46 = call float* @injectFault0(i64 339, float* %43, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %44 = load float* %fi46, align 4, !llfi_index !341
  %fi47 = call float @injectFault1(i64 340, float %44, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %45 = load i32* %fi1, align 4, !llfi_index !342
  %fi48 = call i32 @injectFault5(i64 341, i32 %45, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %46 = sext i32 %fi48 to i64, !llfi_index !343
  %fi49 = call i64 @injectFault9(i64 342, i64 %46, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %47 = load float** @otime, align 8, !llfi_index !344
  %fi50 = call float* @injectFault0(i64 343, float* %47, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %48 = getelementptr float* %fi50, i64 %fi49, !llfi_index !345
  %fi51 = call float* @injectFault0(i64 344, float* %48, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %49 = load float* %fi51, align 4, !llfi_index !346
  %fi52 = call float @injectFault1(i64 345, float %49, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %50 = load i32* %fi1, align 4, !llfi_index !347
  %fi53 = call i32 @injectFault5(i64 346, i32 %50, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %51 = sext i32 %fi53 to i64, !llfi_index !348
  %fi54 = call i64 @injectFault9(i64 347, i64 %51, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %52 = load i32** @otype, align 8, !llfi_index !349
  %fi55 = call i32* @injectFault2(i64 348, i32* %52, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %53 = getelementptr i32* %fi55, i64 %fi54, !llfi_index !350
  %fi56 = call i32* @injectFault2(i64 349, i32* %53, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %54 = load i32* %fi56, align 4, !llfi_index !351
  %fi57 = call i32 @injectFault5(i64 350, i32 %54, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %55 = call float @BlkSchlsEqEuroNoDiv(float %fi32, float %fi37, float %fi42, float %fi47, float %fi52, i32 %fi57, float 0.000000e+00), !llfi_index !352
  %fi58 = call float @injectFault1(i64 351, float %55, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi58, float* %fi3, align 4, !llfi_index !353
  %56 = load float* %fi3, align 4, !llfi_index !354
  %fi59 = call float @injectFault1(i64 353, float %56, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %57 = load i32* %fi1, align 4, !llfi_index !355
  %fi60 = call i32 @injectFault5(i64 354, i32 %57, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %58 = sext i32 %fi60 to i64, !llfi_index !356
  %fi61 = call i64 @injectFault9(i64 355, i64 %58, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %59 = load float** @prices, align 8, !llfi_index !357
  %fi62 = call float* @injectFault0(i64 356, float* %59, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %60 = getelementptr float* %fi62, i64 %fi61, !llfi_index !358
  %fi63 = call float* @injectFault0(i64 357, float* %60, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi59, float* %fi63, align 4, !llfi_index !359
  br label %61, !llfi_index !360

; <label>:61                                      ; preds = %24
  %62 = load i32* %fi1, align 4, !llfi_index !361
  %fi64 = call i32 @injectFault5(i64 360, i32 %62, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %63 = add nsw i32 %fi64, 1, !llfi_index !362
  %fi65 = call i32 @injectFault5(i64 361, i32 %63, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi65, i32* %fi1, align 4, !llfi_index !363
  br label %20, !llfi_index !364

; <label>:64                                      ; preds = %20
  br label %65, !llfi_index !365

; <label>:65                                      ; preds = %64
  %66 = load i32* %fi2, align 4, !llfi_index !366
  %fi36 = call i32 @injectFault5(i64 365, i32 %66, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %67 = add nsw i32 %fi36, 1, !llfi_index !367
  %fi66 = call i32 @injectFault5(i64 366, i32 %67, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi66, i32* %fi2, align 4, !llfi_index !368
  br label %15, !llfi_index !369

; <label>:68                                      ; preds = %15
  ret i32 0, !llfi_index !370
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  call void @initInjections()
  %1 = alloca i32, align 4, !llfi_index !371
  %fi38 = call i32* @injectFault2(i64 370, i32* %1, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %2 = alloca i32, align 4, !llfi_index !372
  %fi39 = call i32* @injectFault2(i64 371, i32* %2, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %3 = alloca i8**, align 8, !llfi_index !373
  %fi40 = call i8*** @injectFault10(i64 372, i8*** %3, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %file = alloca %struct._IO_FILE*, align 8, !llfi_index !374
  %fi41 = call %struct._IO_FILE** @injectFault11(i64 373, %struct._IO_FILE** %file, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %i = alloca i32, align 4, !llfi_index !375
  %fi42 = call i32* @injectFault2(i64 374, i32* %i, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %loopnum = alloca i32, align 4, !llfi_index !376
  %fi43 = call i32* @injectFault2(i64 375, i32* %loopnum, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %buffer = alloca float*, align 8, !llfi_index !377
  %fi44 = call float** @injectFault12(i64 376, float** %buffer, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %buffer2 = alloca i32*, align 8, !llfi_index !378
  %fi45 = call i32** @injectFault13(i64 377, i32** %buffer2, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %rv = alloca i32, align 4, !llfi_index !379
  %fi46 = call i32* @injectFault2(i64 378, i32* %rv, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %inputFile = alloca i8*, align 8, !llfi_index !380
  %fi47 = call i8** @injectFault6(i64 379, i8** %inputFile, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %outputFile = alloca i8*, align 8, !llfi_index !381
  %fi48 = call i8** @injectFault6(i64 380, i8** %outputFile, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %tid = alloca i32, align 4, !llfi_index !382
  %fi49 = call i32* @injectFault2(i64 381, i32* %tid, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 0, i32* %fi38, !llfi_index !383
  store i32 %argc, i32* %fi39, align 4, !llfi_index !384
  store i8** %argv, i8*** %fi40, align 8, !llfi_index !385
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str, i32 0, i32 0)), !llfi_index !386
  %fi = call i32 @injectFault5(i64 385, i32 %4, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %5 = call i32 @fflush(%struct._IO_FILE* null), !llfi_index !387
  %fi1 = call i32 @injectFault5(i64 386, i32 %5, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %6 = load i32* %fi39, align 4, !llfi_index !388
  %fi2 = call i32 @injectFault5(i64 387, i32 %6, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %7 = icmp ne i32 %fi2, 4, !llfi_index !389
  %fi3 = call i1 @injectFault4(i64 388, i1 %7, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi3, label %8, label %13, !llfi_index !390

; <label>:8                                       ; preds = %0
  %9 = load i8*** %fi40, align 8, !llfi_index !391
  %fi4 = call i8** @injectFault6(i64 390, i8** %9, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %10 = getelementptr i8** %fi4, i64 0, !llfi_index !392
  %fi5 = call i8** @injectFault6(i64 391, i8** %10, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %11 = load i8** %fi5, align 8, !llfi_index !393
  %fi6 = call i8* @injectFault7(i64 392, i8* %11, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str1, i32 0, i32 0), i8* %fi6), !llfi_index !394
  %fi7 = call i32 @injectFault5(i64 393, i32 %12, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #6, !llfi_index !395
  unreachable, !llfi_index !396

; <label>:13                                      ; preds = %0
  %14 = load i8*** %fi40, align 8, !llfi_index !397
  %fi8 = call i8** @injectFault6(i64 396, i8** %14, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %15 = getelementptr i8** %fi8, i64 1, !llfi_index !398
  %fi9 = call i8** @injectFault6(i64 397, i8** %15, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %16 = load i8** %fi9, align 8, !llfi_index !399
  %fi10 = call i8* @injectFault7(i64 398, i8* %16, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %17 = call i32 @atoi(i8* %fi10) #7, !llfi_index !400
  %fi11 = call i32 @injectFault5(i64 399, i32 %17, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi11, i32* @nThreads, align 4, !llfi_index !401
  %18 = load i8*** %fi40, align 8, !llfi_index !402
  %fi12 = call i8** @injectFault6(i64 401, i8** %18, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %19 = getelementptr i8** %fi12, i64 2, !llfi_index !403
  %fi13 = call i8** @injectFault6(i64 402, i8** %19, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %20 = load i8** %fi13, align 8, !llfi_index !404
  %fi14 = call i8* @injectFault7(i64 403, i8* %20, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i8* %fi14, i8** %fi47, align 8, !llfi_index !405
  %21 = load i8*** %fi40, align 8, !llfi_index !406
  %fi15 = call i8** @injectFault6(i64 405, i8** %21, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %22 = getelementptr i8** %fi15, i64 3, !llfi_index !407
  %fi16 = call i8** @injectFault6(i64 406, i8** %22, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %23 = load i8** %fi16, align 8, !llfi_index !408
  %fi17 = call i8* @injectFault7(i64 407, i8* %23, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i8* %fi17, i8** %fi48, align 8, !llfi_index !409
  %24 = load i8** %fi47, align 8, !llfi_index !410
  %fi18 = call i8* @injectFault7(i64 409, i8* %24, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %25 = call %struct._IO_FILE* @fopen(i8* %fi18, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !411
  %fi19 = call %struct._IO_FILE* @injectFault8(i64 410, %struct._IO_FILE* %25, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store %struct._IO_FILE* %fi19, %struct._IO_FILE** %fi41, align 8, !llfi_index !412
  %26 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !413
  %fi20 = call %struct._IO_FILE* @injectFault8(i64 412, %struct._IO_FILE* %26, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %27 = icmp eq %struct._IO_FILE* %fi20, null, !llfi_index !414
  %fi21 = call i1 @injectFault4(i64 413, i1 %27, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi21, label %28, label %31, !llfi_index !415

; <label>:28                                      ; preds = %13
  %29 = load i8** %fi47, align 8, !llfi_index !416
  %fi22 = call i8* @injectFault7(i64 415, i8* %29, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str3, i32 0, i32 0), i8* %fi22), !llfi_index !417
  %fi23 = call i32 @injectFault5(i64 416, i32 %30, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #6, !llfi_index !418
  unreachable, !llfi_index !419

; <label>:31                                      ; preds = %13
  %32 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !420
  %fi24 = call %struct._IO_FILE* @injectFault8(i64 419, %struct._IO_FILE* %32, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %33 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %fi24, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32* @numOptions), !llfi_index !421
  %fi28 = call i32 @injectFault5(i64 420, i32 %33, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi28, i32* %fi46, align 4, !llfi_index !422
  %34 = load i32* %fi46, align 4, !llfi_index !423
  %fi29 = call i32 @injectFault5(i64 422, i32 %34, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %35 = icmp ne i32 %fi29, 1, !llfi_index !424
  %fi30 = call i1 @injectFault4(i64 423, i1 %35, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi30, label %36, label %41, !llfi_index !425

; <label>:36                                      ; preds = %31
  %37 = load i8** %fi47, align 8, !llfi_index !426
  %fi31 = call i8* @injectFault7(i64 425, i8* %37, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str5, i32 0, i32 0), i8* %fi31), !llfi_index !427
  %fi32 = call i32 @injectFault5(i64 426, i32 %38, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %39 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !428
  %fi33 = call %struct._IO_FILE* @injectFault8(i64 427, %struct._IO_FILE* %39, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %40 = call i32 @fclose(%struct._IO_FILE* %fi33), !llfi_index !429
  %fi34 = call i32 @injectFault5(i64 428, i32 %40, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #6, !llfi_index !430
  unreachable, !llfi_index !431

; <label>:41                                      ; preds = %31
  %42 = load i32* @nThreads, align 4, !llfi_index !432
  %fi35 = call i32 @injectFault5(i64 431, i32 %42, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %43 = load i32* @numOptions, align 4, !llfi_index !433
  %fi36 = call i32 @injectFault5(i64 432, i32 %43, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %44 = icmp sgt i32 %fi35, %fi36, !llfi_index !434
  %fi37 = call i1 @injectFault4(i64 433, i1 %44, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi37, label %45, label %48, !llfi_index !435

; <label>:45                                      ; preds = %41
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([82 x i8]* @.str6, i32 0, i32 0)), !llfi_index !436
  %fi50 = call i32 @injectFault5(i64 435, i32 %46, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %47 = load i32* @numOptions, align 4, !llfi_index !437
  %fi51 = call i32 @injectFault5(i64 436, i32 %47, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi51, i32* @nThreads, align 4, !llfi_index !438
  br label %48, !llfi_index !439

; <label>:48                                      ; preds = %45, %41
  %49 = load i32* @nThreads, align 4, !llfi_index !440
  %fi52 = call i32 @injectFault5(i64 439, i32 %49, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %50 = icmp ne i32 %fi52, 1, !llfi_index !441
  %fi53 = call i1 @injectFault4(i64 440, i1 %50, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi53, label %51, label %53, !llfi_index !442

; <label>:51                                      ; preds = %48
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str7, i32 0, i32 0)), !llfi_index !443
  %fi54 = call i32 @injectFault5(i64 442, i32 %52, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #6, !llfi_index !444
  unreachable, !llfi_index !445

; <label>:53                                      ; preds = %48
  %54 = load i32* @numOptions, align 4, !llfi_index !446
  %fi55 = call i32 @injectFault5(i64 445, i32 %54, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %55 = sext i32 %fi55 to i64, !llfi_index !447
  %fi56 = call i64 @injectFault9(i64 446, i64 %55, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %56 = mul i64 %fi56, 36, !llfi_index !448
  %fi57 = call i64 @injectFault9(i64 447, i64 %56, i32 12, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @mul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %57 = call noalias i8* @malloc(i64 %fi57) #5, !llfi_index !449
  %fi58 = call i8* @injectFault7(i64 448, i8* %57, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %58 = bitcast i8* %fi58 to %struct.OptionData_*, !llfi_index !450
  %fi59 = call %struct.OptionData_* @injectFault14(i64 449, %struct.OptionData_* %58, i32 44, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @bitcast_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store %struct.OptionData_* %fi59, %struct.OptionData_** @data, align 8, !llfi_index !451
  %59 = load i32* @numOptions, align 4, !llfi_index !452
  %fi60 = call i32 @injectFault5(i64 451, i32 %59, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %60 = sext i32 %fi60 to i64, !llfi_index !453
  %fi61 = call i64 @injectFault9(i64 452, i64 %60, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %61 = mul i64 %fi61, 4, !llfi_index !454
  %fi62 = call i64 @injectFault9(i64 453, i64 %61, i32 12, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @mul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %62 = call noalias i8* @malloc(i64 %fi62) #5, !llfi_index !455
  %fi63 = call i8* @injectFault7(i64 454, i8* %62, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %63 = bitcast i8* %fi63 to float*, !llfi_index !456
  %fi64 = call float* @injectFault0(i64 455, float* %63, i32 44, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @bitcast_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float* %fi64, float** @prices, align 8, !llfi_index !457
  store i32 0, i32* %fi43, align 4, !llfi_index !458
  br label %64, !llfi_index !459

; <label>:64                                      ; preds = %124, %53
  %65 = load i32* %fi43, align 4, !llfi_index !460
  %fi25 = call i32 @injectFault5(i64 459, i32 %65, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %66 = load i32* @numOptions, align 4, !llfi_index !461
  %fi26 = call i32 @injectFault5(i64 460, i32 %66, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %67 = icmp slt i32 %fi25, %fi26, !llfi_index !462
  %fi27 = call i1 @injectFault4(i64 461, i1 %67, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi27, label %68, label %127, !llfi_index !463

; <label>:68                                      ; preds = %64
  %69 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !464
  %fi68 = call %struct._IO_FILE* @injectFault8(i64 463, %struct._IO_FILE* %69, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %70 = load i32* %fi43, align 4, !llfi_index !465
  %fi69 = call i32 @injectFault5(i64 464, i32 %70, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %71 = sext i32 %fi69 to i64, !llfi_index !466
  %fi70 = call i64 @injectFault9(i64 465, i64 %71, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %72 = load %struct.OptionData_** @data, align 8, !llfi_index !467
  %fi71 = call %struct.OptionData_* @injectFault14(i64 466, %struct.OptionData_* %72, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %73 = getelementptr %struct.OptionData_* %fi71, i64 %fi70, !llfi_index !468
  %fi72 = call %struct.OptionData_* @injectFault14(i64 467, %struct.OptionData_* %73, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %74 = getelementptr %struct.OptionData_* %fi72, i32 0, i32 0, !llfi_index !469
  %fi73 = call float* @injectFault0(i64 468, float* %74, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %75 = load i32* %fi43, align 4, !llfi_index !470
  %fi74 = call i32 @injectFault5(i64 469, i32 %75, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %76 = sext i32 %fi74 to i64, !llfi_index !471
  %fi75 = call i64 @injectFault9(i64 470, i64 %76, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %77 = load %struct.OptionData_** @data, align 8, !llfi_index !472
  %fi76 = call %struct.OptionData_* @injectFault14(i64 471, %struct.OptionData_* %77, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %78 = getelementptr %struct.OptionData_* %fi76, i64 %fi75, !llfi_index !473
  %fi77 = call %struct.OptionData_* @injectFault14(i64 472, %struct.OptionData_* %78, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %79 = getelementptr %struct.OptionData_* %fi77, i32 0, i32 1, !llfi_index !474
  %fi78 = call float* @injectFault0(i64 473, float* %79, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %80 = load i32* %fi43, align 4, !llfi_index !475
  %fi79 = call i32 @injectFault5(i64 474, i32 %80, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %81 = sext i32 %fi79 to i64, !llfi_index !476
  %fi80 = call i64 @injectFault9(i64 475, i64 %81, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %82 = load %struct.OptionData_** @data, align 8, !llfi_index !477
  %fi81 = call %struct.OptionData_* @injectFault14(i64 476, %struct.OptionData_* %82, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %83 = getelementptr %struct.OptionData_* %fi81, i64 %fi80, !llfi_index !478
  %fi82 = call %struct.OptionData_* @injectFault14(i64 477, %struct.OptionData_* %83, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %84 = getelementptr %struct.OptionData_* %fi82, i32 0, i32 2, !llfi_index !479
  %fi83 = call float* @injectFault0(i64 478, float* %84, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %85 = load i32* %fi43, align 4, !llfi_index !480
  %fi84 = call i32 @injectFault5(i64 479, i32 %85, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %86 = sext i32 %fi84 to i64, !llfi_index !481
  %fi85 = call i64 @injectFault9(i64 480, i64 %86, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %87 = load %struct.OptionData_** @data, align 8, !llfi_index !482
  %fi86 = call %struct.OptionData_* @injectFault14(i64 481, %struct.OptionData_* %87, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %88 = getelementptr %struct.OptionData_* %fi86, i64 %fi85, !llfi_index !483
  %fi87 = call %struct.OptionData_* @injectFault14(i64 482, %struct.OptionData_* %88, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %89 = getelementptr %struct.OptionData_* %fi87, i32 0, i32 3, !llfi_index !484
  %fi88 = call float* @injectFault0(i64 483, float* %89, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %90 = load i32* %fi43, align 4, !llfi_index !485
  %fi89 = call i32 @injectFault5(i64 484, i32 %90, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %91 = sext i32 %fi89 to i64, !llfi_index !486
  %fi90 = call i64 @injectFault9(i64 485, i64 %91, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %92 = load %struct.OptionData_** @data, align 8, !llfi_index !487
  %fi91 = call %struct.OptionData_* @injectFault14(i64 486, %struct.OptionData_* %92, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %93 = getelementptr %struct.OptionData_* %fi91, i64 %fi90, !llfi_index !488
  %fi92 = call %struct.OptionData_* @injectFault14(i64 487, %struct.OptionData_* %93, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %94 = getelementptr %struct.OptionData_* %fi92, i32 0, i32 4, !llfi_index !489
  %fi93 = call float* @injectFault0(i64 488, float* %94, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %95 = load i32* %fi43, align 4, !llfi_index !490
  %fi94 = call i32 @injectFault5(i64 489, i32 %95, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %96 = sext i32 %fi94 to i64, !llfi_index !491
  %fi95 = call i64 @injectFault9(i64 490, i64 %96, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %97 = load %struct.OptionData_** @data, align 8, !llfi_index !492
  %fi96 = call %struct.OptionData_* @injectFault14(i64 491, %struct.OptionData_* %97, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %98 = getelementptr %struct.OptionData_* %fi96, i64 %fi95, !llfi_index !493
  %fi97 = call %struct.OptionData_* @injectFault14(i64 492, %struct.OptionData_* %98, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %99 = getelementptr %struct.OptionData_* %fi97, i32 0, i32 5, !llfi_index !494
  %fi98 = call float* @injectFault0(i64 493, float* %99, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %100 = load i32* %fi43, align 4, !llfi_index !495
  %fi99 = call i32 @injectFault5(i64 494, i32 %100, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %101 = sext i32 %fi99 to i64, !llfi_index !496
  %fi100 = call i64 @injectFault9(i64 495, i64 %101, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %102 = load %struct.OptionData_** @data, align 8, !llfi_index !497
  %fi101 = call %struct.OptionData_* @injectFault14(i64 496, %struct.OptionData_* %102, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %103 = getelementptr %struct.OptionData_* %fi101, i64 %fi100, !llfi_index !498
  %fi102 = call %struct.OptionData_* @injectFault14(i64 497, %struct.OptionData_* %103, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %104 = getelementptr %struct.OptionData_* %fi102, i32 0, i32 6, !llfi_index !499
  %fi103 = call i8* @injectFault7(i64 498, i8* %104, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %105 = load i32* %fi43, align 4, !llfi_index !500
  %fi104 = call i32 @injectFault5(i64 499, i32 %105, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %106 = sext i32 %fi104 to i64, !llfi_index !501
  %fi105 = call i64 @injectFault9(i64 500, i64 %106, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %107 = load %struct.OptionData_** @data, align 8, !llfi_index !502
  %fi106 = call %struct.OptionData_* @injectFault14(i64 501, %struct.OptionData_* %107, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %108 = getelementptr %struct.OptionData_* %fi106, i64 %fi105, !llfi_index !503
  %fi107 = call %struct.OptionData_* @injectFault14(i64 502, %struct.OptionData_* %108, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %109 = getelementptr %struct.OptionData_* %fi107, i32 0, i32 7, !llfi_index !504
  %fi108 = call float* @injectFault0(i64 503, float* %109, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %110 = load i32* %fi43, align 4, !llfi_index !505
  %fi109 = call i32 @injectFault5(i64 504, i32 %110, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %111 = sext i32 %fi109 to i64, !llfi_index !506
  %fi110 = call i64 @injectFault9(i64 505, i64 %111, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %112 = load %struct.OptionData_** @data, align 8, !llfi_index !507
  %fi111 = call %struct.OptionData_* @injectFault14(i64 506, %struct.OptionData_* %112, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %113 = getelementptr %struct.OptionData_* %fi111, i64 %fi110, !llfi_index !508
  %fi112 = call %struct.OptionData_* @injectFault14(i64 507, %struct.OptionData_* %113, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %114 = getelementptr %struct.OptionData_* %fi112, i32 0, i32 8, !llfi_index !509
  %fi113 = call float* @injectFault0(i64 508, float* %114, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %115 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %fi68, i8* getelementptr inbounds ([27 x i8]* @.str8, i32 0, i32 0), float* %fi73, float* %fi78, float* %fi83, float* %fi88, float* %fi93, float* %fi98, i8* %fi103, float* %fi108, float* %fi113), !llfi_index !510
  %fi114 = call i32 @injectFault5(i64 509, i32 %115, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi114, i32* %fi46, align 4, !llfi_index !511
  %116 = load i32* %fi46, align 4, !llfi_index !512
  %fi115 = call i32 @injectFault5(i64 511, i32 %116, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %117 = icmp ne i32 %fi115, 9, !llfi_index !513
  %fi116 = call i1 @injectFault4(i64 512, i1 %117, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi116, label %118, label %123, !llfi_index !514

; <label>:118                                     ; preds = %68
  %119 = load i8** %fi47, align 8, !llfi_index !515
  %fi117 = call i8* @injectFault7(i64 514, i8* %119, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %120 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str5, i32 0, i32 0), i8* %fi117), !llfi_index !516
  %fi118 = call i32 @injectFault5(i64 515, i32 %120, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %121 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !517
  %fi119 = call %struct._IO_FILE* @injectFault8(i64 516, %struct._IO_FILE* %121, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %122 = call i32 @fclose(%struct._IO_FILE* %fi119), !llfi_index !518
  %fi120 = call i32 @injectFault5(i64 517, i32 %122, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #6, !llfi_index !519
  unreachable, !llfi_index !520

; <label>:123                                     ; preds = %68
  br label %124, !llfi_index !521

; <label>:124                                     ; preds = %123
  %125 = load i32* %fi43, align 4, !llfi_index !522
  %fi121 = call i32 @injectFault5(i64 521, i32 %125, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %126 = add nsw i32 %fi121, 1, !llfi_index !523
  %fi122 = call i32 @injectFault5(i64 522, i32 %126, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi122, i32* %fi43, align 4, !llfi_index !524
  br label %64, !llfi_index !525

; <label>:127                                     ; preds = %64
  %128 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !526
  %fi123 = call %struct._IO_FILE* @injectFault8(i64 525, %struct._IO_FILE* %128, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %129 = call i32 @fclose(%struct._IO_FILE* %fi123), !llfi_index !527
  %fi65 = call i32 @injectFault5(i64 526, i32 %129, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi65, i32* %fi46, align 4, !llfi_index !528
  %130 = load i32* %fi46, align 4, !llfi_index !529
  %fi66 = call i32 @injectFault5(i64 528, i32 %130, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %131 = icmp ne i32 %fi66, 0, !llfi_index !530
  %fi67 = call i1 @injectFault4(i64 529, i1 %131, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi67, label %132, label %135, !llfi_index !531

; <label>:132                                     ; preds = %127
  %133 = load i8** %fi47, align 8, !llfi_index !532
  %fi129 = call i8* @injectFault7(i64 531, i8* %133, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str9, i32 0, i32 0), i8* %fi129), !llfi_index !533
  %fi130 = call i32 @injectFault5(i64 532, i32 %134, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #6, !llfi_index !534
  unreachable, !llfi_index !535

; <label>:135                                     ; preds = %127
  %136 = load i32* @numOptions, align 4, !llfi_index !536
  %fi131 = call i32 @injectFault5(i64 535, i32 %136, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %137 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str10, i32 0, i32 0), i32 %fi131), !llfi_index !537
  %fi132 = call i32 @injectFault5(i64 536, i32 %137, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %138 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str11, i32 0, i32 0), i32 100), !llfi_index !538
  %fi133 = call i32 @injectFault5(i64 537, i32 %138, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %139 = load i32* @numOptions, align 4, !llfi_index !539
  %fi134 = call i32 @injectFault5(i64 538, i32 %139, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %140 = mul nsw i32 5, %fi134, !llfi_index !540
  %fi135 = call i32 @injectFault5(i64 539, i32 %140, i32 12, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @mul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %141 = sext i32 %fi135 to i64, !llfi_index !541
  %fi136 = call i64 @injectFault9(i64 540, i64 %141, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %142 = mul i64 %fi136, 4, !llfi_index !542
  %fi137 = call i64 @injectFault9(i64 541, i64 %142, i32 12, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @mul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %143 = add i64 %fi137, 256, !llfi_index !543
  %fi138 = call i64 @injectFault9(i64 542, i64 %143, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %144 = call noalias i8* @malloc(i64 %fi138) #5, !llfi_index !544
  %fi139 = call i8* @injectFault7(i64 543, i8* %144, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %145 = bitcast i8* %fi139 to float*, !llfi_index !545
  %fi140 = call float* @injectFault0(i64 544, float* %145, i32 44, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @bitcast_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float* %fi140, float** %fi44, align 8, !llfi_index !546
  %146 = load float** %fi44, align 8, !llfi_index !547
  %fi141 = call float* @injectFault0(i64 546, float* %146, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %147 = ptrtoint float* %fi141 to i64, !llfi_index !548
  %fi142 = call i64 @injectFault9(i64 547, i64 %147, i32 42, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([9 x i8]* @ptrtoint_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %148 = add i64 %fi142, 256, !llfi_index !549
  %fi143 = call i64 @injectFault9(i64 548, i64 %148, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %149 = and i64 %fi143, -64, !llfi_index !550
  %fi144 = call i64 @injectFault9(i64 549, i64 %149, i32 23, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @and_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %150 = inttoptr i64 %fi144 to float*, !llfi_index !551
  %fi145 = call float* @injectFault0(i64 550, float* %150, i32 43, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([9 x i8]* @inttoptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float* %fi145, float** @sptprice, align 8, !llfi_index !552
  %151 = load float** @sptprice, align 8, !llfi_index !553
  %fi146 = call float* @injectFault0(i64 552, float* %151, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %152 = load i32* @numOptions, align 4, !llfi_index !554
  %fi147 = call i32 @injectFault5(i64 553, i32 %152, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %153 = sext i32 %fi147 to i64, !llfi_index !555
  %fi148 = call i64 @injectFault9(i64 554, i64 %153, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %154 = getelementptr float* %fi146, i64 %fi148, !llfi_index !556
  %fi149 = call float* @injectFault0(i64 555, float* %154, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float* %fi149, float** @strike, align 8, !llfi_index !557
  %155 = load float** @strike, align 8, !llfi_index !558
  %fi150 = call float* @injectFault0(i64 557, float* %155, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %156 = load i32* @numOptions, align 4, !llfi_index !559
  %fi151 = call i32 @injectFault5(i64 558, i32 %156, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %157 = sext i32 %fi151 to i64, !llfi_index !560
  %fi152 = call i64 @injectFault9(i64 559, i64 %157, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %158 = getelementptr float* %fi150, i64 %fi152, !llfi_index !561
  %fi153 = call float* @injectFault0(i64 560, float* %158, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float* %fi153, float** @rate, align 8, !llfi_index !562
  %159 = load float** @rate, align 8, !llfi_index !563
  %fi154 = call float* @injectFault0(i64 562, float* %159, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %160 = load i32* @numOptions, align 4, !llfi_index !564
  %fi155 = call i32 @injectFault5(i64 563, i32 %160, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %161 = sext i32 %fi155 to i64, !llfi_index !565
  %fi156 = call i64 @injectFault9(i64 564, i64 %161, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %162 = getelementptr float* %fi154, i64 %fi156, !llfi_index !566
  %fi157 = call float* @injectFault0(i64 565, float* %162, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float* %fi157, float** @volatility, align 8, !llfi_index !567
  %163 = load float** @volatility, align 8, !llfi_index !568
  %fi158 = call float* @injectFault0(i64 567, float* %163, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %164 = load i32* @numOptions, align 4, !llfi_index !569
  %fi159 = call i32 @injectFault5(i64 568, i32 %164, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %165 = sext i32 %fi159 to i64, !llfi_index !570
  %fi160 = call i64 @injectFault9(i64 569, i64 %165, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %166 = getelementptr float* %fi158, i64 %fi160, !llfi_index !571
  %fi161 = call float* @injectFault0(i64 570, float* %166, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float* %fi161, float** @otime, align 8, !llfi_index !572
  %167 = load i32* @numOptions, align 4, !llfi_index !573
  %fi162 = call i32 @injectFault5(i64 572, i32 %167, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %168 = sext i32 %fi162 to i64, !llfi_index !574
  %fi163 = call i64 @injectFault9(i64 573, i64 %168, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %169 = mul i64 %fi163, 4, !llfi_index !575
  %fi164 = call i64 @injectFault9(i64 574, i64 %169, i32 12, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @mul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %170 = add i64 %fi164, 256, !llfi_index !576
  %fi165 = call i64 @injectFault9(i64 575, i64 %170, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %171 = call noalias i8* @malloc(i64 %fi165) #5, !llfi_index !577
  %fi166 = call i8* @injectFault7(i64 576, i8* %171, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %172 = bitcast i8* %fi166 to i32*, !llfi_index !578
  %fi167 = call i32* @injectFault2(i64 577, i32* %172, i32 44, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @bitcast_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32* %fi167, i32** %fi45, align 8, !llfi_index !579
  %173 = load i32** %fi45, align 8, !llfi_index !580
  %fi168 = call i32* @injectFault2(i64 579, i32* %173, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %174 = ptrtoint i32* %fi168 to i64, !llfi_index !581
  %fi169 = call i64 @injectFault9(i64 580, i64 %174, i32 42, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([9 x i8]* @ptrtoint_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %175 = add i64 %fi169, 256, !llfi_index !582
  %fi170 = call i64 @injectFault9(i64 581, i64 %175, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %176 = and i64 %fi170, -64, !llfi_index !583
  %fi171 = call i64 @injectFault9(i64 582, i64 %176, i32 23, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @and_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %177 = inttoptr i64 %fi171 to i32*, !llfi_index !584
  %fi172 = call i32* @injectFault2(i64 583, i32* %177, i32 43, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([9 x i8]* @inttoptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32* %fi172, i32** @otype, align 8, !llfi_index !585
  store i32 0, i32* %fi42, align 4, !llfi_index !586
  br label %178, !llfi_index !587

; <label>:178                                     ; preds = %246, %135
  %179 = load i32* %fi42, align 4, !llfi_index !588
  %fi173 = call i32 @injectFault5(i64 587, i32 %179, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %180 = load i32* @numOptions, align 4, !llfi_index !589
  %fi174 = call i32 @injectFault5(i64 588, i32 %180, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %181 = icmp slt i32 %fi173, %fi174, !llfi_index !590
  %fi175 = call i1 @injectFault4(i64 589, i1 %181, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi175, label %182, label %249, !llfi_index !591

; <label>:182                                     ; preds = %178
  %183 = load i32* %fi42, align 4, !llfi_index !592
  %fi176 = call i32 @injectFault5(i64 591, i32 %183, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %184 = sext i32 %fi176 to i64, !llfi_index !593
  %fi177 = call i64 @injectFault9(i64 592, i64 %184, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %185 = load %struct.OptionData_** @data, align 8, !llfi_index !594
  %fi178 = call %struct.OptionData_* @injectFault14(i64 593, %struct.OptionData_* %185, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %186 = getelementptr %struct.OptionData_* %fi178, i64 %fi177, !llfi_index !595
  %fi179 = call %struct.OptionData_* @injectFault14(i64 594, %struct.OptionData_* %186, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %187 = getelementptr %struct.OptionData_* %fi179, i32 0, i32 6, !llfi_index !596
  %fi180 = call i8* @injectFault7(i64 595, i8* %187, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %188 = load i8* %fi180, align 1, !llfi_index !597
  %fi181 = call i8 @injectFault15(i64 596, i8 %188, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %189 = sext i8 %fi181 to i32, !llfi_index !598
  %fi182 = call i32 @injectFault5(i64 597, i32 %189, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %190 = icmp eq i32 %fi182, 80, !llfi_index !599
  %fi183 = call i1 @injectFault4(i64 598, i1 %190, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %191 = select i1 %fi183, i32 1, i32 0, !llfi_index !600
  %fi184 = call i32 @injectFault5(i64 599, i32 %191, i32 50, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @select_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %192 = load i32* %fi42, align 4, !llfi_index !601
  %fi185 = call i32 @injectFault5(i64 600, i32 %192, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %193 = sext i32 %fi185 to i64, !llfi_index !602
  %fi186 = call i64 @injectFault9(i64 601, i64 %193, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %194 = load i32** @otype, align 8, !llfi_index !603
  %fi187 = call i32* @injectFault2(i64 602, i32* %194, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %195 = getelementptr i32* %fi187, i64 %fi186, !llfi_index !604
  %fi188 = call i32* @injectFault2(i64 603, i32* %195, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi184, i32* %fi188, align 4, !llfi_index !605
  %196 = load i32* %fi42, align 4, !llfi_index !606
  %fi189 = call i32 @injectFault5(i64 605, i32 %196, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %197 = sext i32 %fi189 to i64, !llfi_index !607
  %fi190 = call i64 @injectFault9(i64 606, i64 %197, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %198 = load %struct.OptionData_** @data, align 8, !llfi_index !608
  %fi191 = call %struct.OptionData_* @injectFault14(i64 607, %struct.OptionData_* %198, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %199 = getelementptr %struct.OptionData_* %fi191, i64 %fi190, !llfi_index !609
  %fi192 = call %struct.OptionData_* @injectFault14(i64 608, %struct.OptionData_* %199, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %200 = getelementptr %struct.OptionData_* %fi192, i32 0, i32 0, !llfi_index !610
  %fi193 = call float* @injectFault0(i64 609, float* %200, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %201 = load float* %fi193, align 4, !llfi_index !611
  %fi194 = call float @injectFault1(i64 610, float %201, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %202 = load i32* %fi42, align 4, !llfi_index !612
  %fi195 = call i32 @injectFault5(i64 611, i32 %202, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %203 = sext i32 %fi195 to i64, !llfi_index !613
  %fi196 = call i64 @injectFault9(i64 612, i64 %203, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %204 = load float** @sptprice, align 8, !llfi_index !614
  %fi197 = call float* @injectFault0(i64 613, float* %204, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %205 = getelementptr float* %fi197, i64 %fi196, !llfi_index !615
  %fi198 = call float* @injectFault0(i64 614, float* %205, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi194, float* %fi198, align 4, !llfi_index !616
  %206 = load i32* %fi42, align 4, !llfi_index !617
  %fi199 = call i32 @injectFault5(i64 616, i32 %206, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %207 = sext i32 %fi199 to i64, !llfi_index !618
  %fi200 = call i64 @injectFault9(i64 617, i64 %207, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %208 = load %struct.OptionData_** @data, align 8, !llfi_index !619
  %fi201 = call %struct.OptionData_* @injectFault14(i64 618, %struct.OptionData_* %208, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %209 = getelementptr %struct.OptionData_* %fi201, i64 %fi200, !llfi_index !620
  %fi202 = call %struct.OptionData_* @injectFault14(i64 619, %struct.OptionData_* %209, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %210 = getelementptr %struct.OptionData_* %fi202, i32 0, i32 1, !llfi_index !621
  %fi203 = call float* @injectFault0(i64 620, float* %210, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %211 = load float* %fi203, align 4, !llfi_index !622
  %fi204 = call float @injectFault1(i64 621, float %211, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %212 = load i32* %fi42, align 4, !llfi_index !623
  %fi205 = call i32 @injectFault5(i64 622, i32 %212, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %213 = sext i32 %fi205 to i64, !llfi_index !624
  %fi206 = call i64 @injectFault9(i64 623, i64 %213, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %214 = load float** @strike, align 8, !llfi_index !625
  %fi207 = call float* @injectFault0(i64 624, float* %214, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %215 = getelementptr float* %fi207, i64 %fi206, !llfi_index !626
  %fi208 = call float* @injectFault0(i64 625, float* %215, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi204, float* %fi208, align 4, !llfi_index !627
  %216 = load i32* %fi42, align 4, !llfi_index !628
  %fi209 = call i32 @injectFault5(i64 627, i32 %216, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %217 = sext i32 %fi209 to i64, !llfi_index !629
  %fi210 = call i64 @injectFault9(i64 628, i64 %217, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %218 = load %struct.OptionData_** @data, align 8, !llfi_index !630
  %fi211 = call %struct.OptionData_* @injectFault14(i64 629, %struct.OptionData_* %218, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %219 = getelementptr %struct.OptionData_* %fi211, i64 %fi210, !llfi_index !631
  %fi212 = call %struct.OptionData_* @injectFault14(i64 630, %struct.OptionData_* %219, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %220 = getelementptr %struct.OptionData_* %fi212, i32 0, i32 2, !llfi_index !632
  %fi213 = call float* @injectFault0(i64 631, float* %220, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %221 = load float* %fi213, align 4, !llfi_index !633
  %fi214 = call float @injectFault1(i64 632, float %221, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %222 = load i32* %fi42, align 4, !llfi_index !634
  %fi215 = call i32 @injectFault5(i64 633, i32 %222, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %223 = sext i32 %fi215 to i64, !llfi_index !635
  %fi216 = call i64 @injectFault9(i64 634, i64 %223, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %224 = load float** @rate, align 8, !llfi_index !636
  %fi217 = call float* @injectFault0(i64 635, float* %224, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %225 = getelementptr float* %fi217, i64 %fi216, !llfi_index !637
  %fi218 = call float* @injectFault0(i64 636, float* %225, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi214, float* %fi218, align 4, !llfi_index !638
  %226 = load i32* %fi42, align 4, !llfi_index !639
  %fi219 = call i32 @injectFault5(i64 638, i32 %226, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %227 = sext i32 %fi219 to i64, !llfi_index !640
  %fi220 = call i64 @injectFault9(i64 639, i64 %227, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %228 = load %struct.OptionData_** @data, align 8, !llfi_index !641
  %fi221 = call %struct.OptionData_* @injectFault14(i64 640, %struct.OptionData_* %228, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %229 = getelementptr %struct.OptionData_* %fi221, i64 %fi220, !llfi_index !642
  %fi222 = call %struct.OptionData_* @injectFault14(i64 641, %struct.OptionData_* %229, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %230 = getelementptr %struct.OptionData_* %fi222, i32 0, i32 4, !llfi_index !643
  %fi223 = call float* @injectFault0(i64 642, float* %230, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %231 = load float* %fi223, align 4, !llfi_index !644
  %fi224 = call float @injectFault1(i64 643, float %231, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %232 = load i32* %fi42, align 4, !llfi_index !645
  %fi225 = call i32 @injectFault5(i64 644, i32 %232, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %233 = sext i32 %fi225 to i64, !llfi_index !646
  %fi226 = call i64 @injectFault9(i64 645, i64 %233, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %234 = load float** @volatility, align 8, !llfi_index !647
  %fi227 = call float* @injectFault0(i64 646, float* %234, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %235 = getelementptr float* %fi227, i64 %fi226, !llfi_index !648
  %fi228 = call float* @injectFault0(i64 647, float* %235, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi224, float* %fi228, align 4, !llfi_index !649
  %236 = load i32* %fi42, align 4, !llfi_index !650
  %fi229 = call i32 @injectFault5(i64 649, i32 %236, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %237 = sext i32 %fi229 to i64, !llfi_index !651
  %fi230 = call i64 @injectFault9(i64 650, i64 %237, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %238 = load %struct.OptionData_** @data, align 8, !llfi_index !652
  %fi231 = call %struct.OptionData_* @injectFault14(i64 651, %struct.OptionData_* %238, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %239 = getelementptr %struct.OptionData_* %fi231, i64 %fi230, !llfi_index !653
  %fi232 = call %struct.OptionData_* @injectFault14(i64 652, %struct.OptionData_* %239, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %240 = getelementptr %struct.OptionData_* %fi232, i32 0, i32 5, !llfi_index !654
  %fi233 = call float* @injectFault0(i64 653, float* %240, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %241 = load float* %fi233, align 4, !llfi_index !655
  %fi234 = call float @injectFault1(i64 654, float %241, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %242 = load i32* %fi42, align 4, !llfi_index !656
  %fi235 = call i32 @injectFault5(i64 655, i32 %242, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %243 = sext i32 %fi235 to i64, !llfi_index !657
  %fi236 = call i64 @injectFault9(i64 656, i64 %243, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %244 = load float** @otime, align 8, !llfi_index !658
  %fi237 = call float* @injectFault0(i64 657, float* %244, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %245 = getelementptr float* %fi237, i64 %fi236, !llfi_index !659
  %fi238 = call float* @injectFault0(i64 658, float* %245, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi234, float* %fi238, align 4, !llfi_index !660
  br label %246, !llfi_index !661

; <label>:246                                     ; preds = %182
  %247 = load i32* %fi42, align 4, !llfi_index !662
  %fi239 = call i32 @injectFault5(i64 661, i32 %247, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %248 = add nsw i32 %fi239, 1, !llfi_index !663
  %fi240 = call i32 @injectFault5(i64 662, i32 %248, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi240, i32* %fi42, align 4, !llfi_index !664
  br label %178, !llfi_index !665

; <label>:249                                     ; preds = %178
  %250 = load i32* @numOptions, align 4, !llfi_index !666
  %fi241 = call i32 @injectFault5(i64 665, i32 %250, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %251 = sext i32 %fi241 to i64, !llfi_index !667
  %fi242 = call i64 @injectFault9(i64 666, i64 %251, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %252 = mul i64 %fi242, 40, !llfi_index !668
  %fi243 = call i64 @injectFault9(i64 667, i64 %252, i32 12, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @mul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %253 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str12, i32 0, i32 0), i64 %fi243), !llfi_index !669
  %fi244 = call i32 @injectFault5(i64 668, i32 %253, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 0, i32* %fi49, align 4, !llfi_index !670
  %254 = bitcast i32* %fi49 to i8*, !llfi_index !671
  %fi245 = call i8* @injectFault7(i64 670, i8* %254, i32 44, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @bitcast_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %255 = call i32 @bs_thread(i8* %fi245), !llfi_index !672
  %fi246 = call i32 @injectFault5(i64 671, i32 %255, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %256 = load i8** %fi48, align 8, !llfi_index !673
  %fi247 = call i8* @injectFault7(i64 672, i8* %256, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %257 = call %struct._IO_FILE* @fopen(i8* %fi247, i8* getelementptr inbounds ([2 x i8]* @.str13, i32 0, i32 0)), !llfi_index !674
  %fi124 = call %struct._IO_FILE* @injectFault8(i64 673, %struct._IO_FILE* %257, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store %struct._IO_FILE* %fi124, %struct._IO_FILE** %fi41, align 8, !llfi_index !675
  %258 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !676
  %fi125 = call %struct._IO_FILE* @injectFault8(i64 675, %struct._IO_FILE* %258, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %259 = icmp eq %struct._IO_FILE* %fi125, null, !llfi_index !677
  %fi126 = call i1 @injectFault4(i64 676, i1 %259, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi126, label %260, label %263, !llfi_index !678

; <label>:260                                     ; preds = %249
  %261 = load i8** %fi48, align 8, !llfi_index !679
  %fi127 = call i8* @injectFault7(i64 678, i8* %261, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %262 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str3, i32 0, i32 0), i8* %fi127), !llfi_index !680
  %fi128 = call i32 @injectFault5(i64 679, i32 %262, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #6, !llfi_index !681
  unreachable, !llfi_index !682

; <label>:263                                     ; preds = %249
  %264 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !683
  %fi248 = call %struct._IO_FILE* @injectFault8(i64 682, %struct._IO_FILE* %264, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %265 = load i32* @numOptions, align 4, !llfi_index !684
  %fi249 = call i32 @injectFault5(i64 683, i32 %265, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %266 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %fi248, i8* getelementptr inbounds ([4 x i8]* @.str14, i32 0, i32 0), i32 %fi249), !llfi_index !685
  %fi250 = call i32 @injectFault5(i64 684, i32 %266, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi250, i32* %fi46, align 4, !llfi_index !686
  %267 = load i32* %fi46, align 4, !llfi_index !687
  %fi251 = call i32 @injectFault5(i64 686, i32 %267, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %268 = icmp slt i32 %fi251, 0, !llfi_index !688
  %fi252 = call i1 @injectFault4(i64 687, i1 %268, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi252, label %269, label %274, !llfi_index !689

; <label>:269                                     ; preds = %263
  %270 = load i8** %fi48, align 8, !llfi_index !690
  %fi253 = call i8* @injectFault7(i64 689, i8* %270, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %271 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str15, i32 0, i32 0), i8* %fi253), !llfi_index !691
  %fi254 = call i32 @injectFault5(i64 690, i32 %271, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %272 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !692
  %fi255 = call %struct._IO_FILE* @injectFault8(i64 691, %struct._IO_FILE* %272, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %273 = call i32 @fclose(%struct._IO_FILE* %fi255), !llfi_index !693
  %fi256 = call i32 @injectFault5(i64 692, i32 %273, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #6, !llfi_index !694
  unreachable, !llfi_index !695

; <label>:274                                     ; preds = %263
  store i32 0, i32* %fi42, align 4, !llfi_index !696
  br label %275, !llfi_index !697

; <label>:275                                     ; preds = %296, %274
  %276 = load i32* %fi42, align 4, !llfi_index !698
  %fi257 = call i32 @injectFault5(i64 697, i32 %276, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %277 = load i32* @numOptions, align 4, !llfi_index !699
  %fi258 = call i32 @injectFault5(i64 698, i32 %277, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %278 = icmp slt i32 %fi257, %fi258, !llfi_index !700
  %fi259 = call i1 @injectFault4(i64 699, i1 %278, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi259, label %279, label %299, !llfi_index !701

; <label>:279                                     ; preds = %275
  %280 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !702
  %fi260 = call %struct._IO_FILE* @injectFault8(i64 701, %struct._IO_FILE* %280, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %281 = load i32* %fi42, align 4, !llfi_index !703
  %fi261 = call i32 @injectFault5(i64 702, i32 %281, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %282 = sext i32 %fi261 to i64, !llfi_index !704
  %fi262 = call i64 @injectFault9(i64 703, i64 %282, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %283 = load float** @prices, align 8, !llfi_index !705
  %fi263 = call float* @injectFault0(i64 704, float* %283, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %284 = getelementptr float* %fi263, i64 %fi262, !llfi_index !706
  %fi264 = call float* @injectFault0(i64 705, float* %284, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %285 = load float* %fi264, align 4, !llfi_index !707
  %fi265 = call float @injectFault1(i64 706, float %285, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %286 = fpext float %fi265 to double, !llfi_index !708
  %fi266 = call double @injectFault3(i64 707, double %286, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %287 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %fi260, i8* getelementptr inbounds ([7 x i8]* @.str16, i32 0, i32 0), double %fi266), !llfi_index !709
  %fi267 = call i32 @injectFault5(i64 708, i32 %287, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi267, i32* %fi46, align 4, !llfi_index !710
  %288 = load i32* %fi46, align 4, !llfi_index !711
  %fi268 = call i32 @injectFault5(i64 710, i32 %288, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %289 = icmp slt i32 %fi268, 0, !llfi_index !712
  %fi269 = call i1 @injectFault4(i64 711, i1 %289, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi269, label %290, label %295, !llfi_index !713

; <label>:290                                     ; preds = %279
  %291 = load i8** %fi48, align 8, !llfi_index !714
  %fi270 = call i8* @injectFault7(i64 713, i8* %291, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %292 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str15, i32 0, i32 0), i8* %fi270), !llfi_index !715
  %fi271 = call i32 @injectFault5(i64 714, i32 %292, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %293 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !716
  %fi272 = call %struct._IO_FILE* @injectFault8(i64 715, %struct._IO_FILE* %293, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %294 = call i32 @fclose(%struct._IO_FILE* %fi272), !llfi_index !717
  %fi273 = call i32 @injectFault5(i64 716, i32 %294, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #6, !llfi_index !718
  unreachable, !llfi_index !719

; <label>:295                                     ; preds = %279
  br label %296, !llfi_index !720

; <label>:296                                     ; preds = %295
  %297 = load i32* %fi42, align 4, !llfi_index !721
  %fi274 = call i32 @injectFault5(i64 720, i32 %297, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %298 = add nsw i32 %fi274, 1, !llfi_index !722
  %fi275 = call i32 @injectFault5(i64 721, i32 %298, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi275, i32* %fi42, align 4, !llfi_index !723
  br label %275, !llfi_index !724

; <label>:299                                     ; preds = %275
  %300 = load %struct._IO_FILE** %fi41, align 8, !llfi_index !725
  %fi276 = call %struct._IO_FILE* @injectFault8(i64 724, %struct._IO_FILE* %300, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %301 = call i32 @fclose(%struct._IO_FILE* %fi276), !llfi_index !726
  %fi277 = call i32 @injectFault5(i64 725, i32 %301, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi277, i32* %fi46, align 4, !llfi_index !727
  %302 = load i32* %fi46, align 4, !llfi_index !728
  %fi278 = call i32 @injectFault5(i64 727, i32 %302, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %303 = icmp ne i32 %fi278, 0, !llfi_index !729
  %fi279 = call i1 @injectFault4(i64 728, i1 %303, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi279, label %304, label %307, !llfi_index !730

; <label>:304                                     ; preds = %299
  %305 = load i8** %fi48, align 8, !llfi_index !731
  %fi280 = call i8* @injectFault7(i64 730, i8* %305, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %306 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str9, i32 0, i32 0), i8* %fi280), !llfi_index !732
  %fi281 = call i32 @injectFault5(i64 731, i32 %306, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #6, !llfi_index !733
  unreachable, !llfi_index !734

; <label>:307                                     ; preds = %299
  %308 = load %struct.OptionData_** @data, align 8, !llfi_index !735
  %fi282 = call %struct.OptionData_* @injectFault14(i64 734, %struct.OptionData_* %308, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %309 = bitcast %struct.OptionData_* %fi282 to i8*, !llfi_index !736
  %fi283 = call i8* @injectFault7(i64 735, i8* %309, i32 44, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @bitcast_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @free(i8* %fi283) #5, !llfi_index !737
  %310 = load float** @prices, align 8, !llfi_index !738
  %fi284 = call float* @injectFault0(i64 737, float* %310, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %311 = bitcast float* %fi284 to i8*, !llfi_index !739
  %fi285 = call i8* @injectFault7(i64 738, i8* %311, i32 44, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @bitcast_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @free(i8* %fi285) #5, !llfi_index !740
  call void @postInjections()
  ret i32 0, !llfi_index !741
}

declare i32 @printf(i8*, ...) #2

declare i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare void @free(i8*) #1

define float* @injectFault0(i64, float*, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca float*
  store float* %1, float** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast float** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load float** %tmploc
  ret float* %updateval
}

define float @injectFault1(i64, float, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca float
  store float %1, float* %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast float* %tmploc to i8*
  call void @injectFunc(i64 %0, i32 32, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load float* %tmploc
  ret float %updateval
}

define i32* @injectFault2(i64, i32*, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca i32*
  store i32* %1, i32** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast i32** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load i32** %tmploc
  ret i32* %updateval
}

define double @injectFault3(i64, double, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca double
  store double %1, double* %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast double* %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load double* %tmploc
  ret double %updateval
}

define i1 @injectFault4(i64, i1, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca i1
  store i1 %1, i1* %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast i1* %tmploc to i8*
  call void @injectFunc(i64 %0, i32 1, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load i1* %tmploc
  ret i1 %updateval
}

define i32 @injectFault5(i64, i32, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca i32
  store i32 %1, i32* %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast i32* %tmploc to i8*
  call void @injectFunc(i64 %0, i32 32, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load i32* %tmploc
  ret i32 %updateval
}

define i8** @injectFault6(i64, i8**, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca i8**
  store i8** %1, i8*** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast i8*** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load i8*** %tmploc
  ret i8** %updateval
}

define i8* @injectFault7(i64, i8*, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca i8*
  store i8* %1, i8** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast i8** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load i8** %tmploc
  ret i8* %updateval
}

define %struct._IO_FILE* @injectFault8(i64, %struct._IO_FILE*, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca %struct._IO_FILE*
  store %struct._IO_FILE* %1, %struct._IO_FILE** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast %struct._IO_FILE** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load %struct._IO_FILE** %tmploc
  ret %struct._IO_FILE* %updateval
}

define i64 @injectFault9(i64, i64, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca i64
  store i64 %1, i64* %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast i64* %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load i64* %tmploc
  ret i64 %updateval
}

define i8*** @injectFault10(i64, i8***, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca i8***
  store i8*** %1, i8**** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast i8**** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load i8**** %tmploc
  ret i8*** %updateval
}

define %struct._IO_FILE** @injectFault11(i64, %struct._IO_FILE**, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca %struct._IO_FILE**
  store %struct._IO_FILE** %1, %struct._IO_FILE*** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast %struct._IO_FILE*** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load %struct._IO_FILE*** %tmploc
  ret %struct._IO_FILE** %updateval
}

define float** @injectFault12(i64, float**, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca float**
  store float** %1, float*** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast float*** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load float*** %tmploc
  ret float** %updateval
}

define i32** @injectFault13(i64, i32**, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca i32**
  store i32** %1, i32*** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast i32*** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load i32*** %tmploc
  ret i32** %updateval
}

define %struct.OptionData_* @injectFault14(i64, %struct.OptionData_*, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca %struct.OptionData_*
  store %struct.OptionData_* %1, %struct.OptionData_** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast %struct.OptionData_** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load %struct.OptionData_** %tmploc
  ret %struct.OptionData_* %updateval
}

define i8 @injectFault15(i64, i8, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca i8
  store i8 %1, i8* %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast i8* %tmploc to i8*
  call void @injectFunc(i64 %0, i32 8, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load i8* %tmploc
  ret i8 %updateval
}

declare void @initInjections()

declare void @postInjections()

declare i1 @preFunc(i64, i32, i32, i32)

declare void @injectFunc(i64, i32, i8*, i32, i32, i8*)

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
!1 = metadata !{i64 1}
!2 = metadata !{metadata !"after"}
!3 = metadata !{i64 2}
!4 = metadata !{i64 3}
!5 = metadata !{i64 4}
!6 = metadata !{i64 5}
!7 = metadata !{i64 6}
!8 = metadata !{i64 7}
!9 = metadata !{i64 8}
!10 = metadata !{i64 9}
!11 = metadata !{i64 10}
!12 = metadata !{i64 11}
!13 = metadata !{i64 12}
!14 = metadata !{i64 13}
!15 = metadata !{i64 14}
!16 = metadata !{i64 15}
!17 = metadata !{i64 16}
!18 = metadata !{i64 17}
!19 = metadata !{i64 18}
!20 = metadata !{i64 19}
!21 = metadata !{i64 20}
!22 = metadata !{i64 21}
!23 = metadata !{i64 22}
!24 = metadata !{i64 23}
!25 = metadata !{i64 24}
!26 = metadata !{i64 25}
!27 = metadata !{i64 26}
!28 = metadata !{i64 27}
!29 = metadata !{i64 28}
!30 = metadata !{i64 29}
!31 = metadata !{i64 30}
!32 = metadata !{i64 31}
!33 = metadata !{i64 32}
!34 = metadata !{i64 33}
!35 = metadata !{i64 34}
!36 = metadata !{i64 35}
!37 = metadata !{i64 36}
!38 = metadata !{i64 37}
!39 = metadata !{i64 38}
!40 = metadata !{i64 39}
!41 = metadata !{i64 40}
!42 = metadata !{i64 41}
!43 = metadata !{i64 42}
!44 = metadata !{i64 43}
!45 = metadata !{i64 44}
!46 = metadata !{i64 45}
!47 = metadata !{i64 46}
!48 = metadata !{i64 47}
!49 = metadata !{i64 48}
!50 = metadata !{i64 49}
!51 = metadata !{i64 50}
!52 = metadata !{i64 51}
!53 = metadata !{i64 52}
!54 = metadata !{i64 53}
!55 = metadata !{i64 54}
!56 = metadata !{i64 55}
!57 = metadata !{i64 56}
!58 = metadata !{i64 57}
!59 = metadata !{i64 58}
!60 = metadata !{i64 59}
!61 = metadata !{i64 60}
!62 = metadata !{i64 61}
!63 = metadata !{i64 62}
!64 = metadata !{i64 63}
!65 = metadata !{i64 64}
!66 = metadata !{i64 65}
!67 = metadata !{i64 66}
!68 = metadata !{i64 67}
!69 = metadata !{i64 68}
!70 = metadata !{i64 69}
!71 = metadata !{i64 70}
!72 = metadata !{i64 71}
!73 = metadata !{i64 72}
!74 = metadata !{i64 73}
!75 = metadata !{i64 74}
!76 = metadata !{i64 75}
!77 = metadata !{i64 76}
!78 = metadata !{i64 77}
!79 = metadata !{i64 78}
!80 = metadata !{i64 79}
!81 = metadata !{i64 80}
!82 = metadata !{i64 81}
!83 = metadata !{i64 82}
!84 = metadata !{i64 83}
!85 = metadata !{i64 84}
!86 = metadata !{i64 85}
!87 = metadata !{i64 86}
!88 = metadata !{i64 87}
!89 = metadata !{i64 88}
!90 = metadata !{i64 89}
!91 = metadata !{i64 90}
!92 = metadata !{i64 91}
!93 = metadata !{i64 92}
!94 = metadata !{i64 93}
!95 = metadata !{i64 94}
!96 = metadata !{i64 95}
!97 = metadata !{i64 96}
!98 = metadata !{i64 97}
!99 = metadata !{i64 98}
!100 = metadata !{i64 99}
!101 = metadata !{i64 100}
!102 = metadata !{i64 101}
!103 = metadata !{i64 102}
!104 = metadata !{i64 103}
!105 = metadata !{i64 104}
!106 = metadata !{i64 105}
!107 = metadata !{i64 106}
!108 = metadata !{i64 107}
!109 = metadata !{i64 108}
!110 = metadata !{i64 109}
!111 = metadata !{i64 110}
!112 = metadata !{i64 111}
!113 = metadata !{i64 112}
!114 = metadata !{i64 113}
!115 = metadata !{i64 114}
!116 = metadata !{i64 115}
!117 = metadata !{i64 116}
!118 = metadata !{i64 117}
!119 = metadata !{i64 118}
!120 = metadata !{i64 119}
!121 = metadata !{i64 120}
!122 = metadata !{i64 121}
!123 = metadata !{i64 122}
!124 = metadata !{i64 123}
!125 = metadata !{i64 124}
!126 = metadata !{i64 125}
!127 = metadata !{i64 126}
!128 = metadata !{i64 127}
!129 = metadata !{i64 128}
!130 = metadata !{i64 129}
!131 = metadata !{i64 130}
!132 = metadata !{i64 131}
!133 = metadata !{i64 132}
!134 = metadata !{i64 133}
!135 = metadata !{i64 134}
!136 = metadata !{i64 135}
!137 = metadata !{i64 136}
!138 = metadata !{i64 137}
!139 = metadata !{i64 138}
!140 = metadata !{i64 139}
!141 = metadata !{i64 140}
!142 = metadata !{i64 141}
!143 = metadata !{i64 142}
!144 = metadata !{i64 143}
!145 = metadata !{i64 144}
!146 = metadata !{i64 145}
!147 = metadata !{i64 146}
!148 = metadata !{i64 147}
!149 = metadata !{i64 148}
!150 = metadata !{i64 149}
!151 = metadata !{i64 150}
!152 = metadata !{i64 151}
!153 = metadata !{i64 152}
!154 = metadata !{i64 153}
!155 = metadata !{i64 154}
!156 = metadata !{i64 155}
!157 = metadata !{i64 156}
!158 = metadata !{i64 157}
!159 = metadata !{i64 158}
!160 = metadata !{i64 159}
!161 = metadata !{i64 160}
!162 = metadata !{i64 161}
!163 = metadata !{i64 162}
!164 = metadata !{i64 163}
!165 = metadata !{i64 164}
!166 = metadata !{i64 165}
!167 = metadata !{i64 166}
!168 = metadata !{i64 167}
!169 = metadata !{i64 168}
!170 = metadata !{i64 169}
!171 = metadata !{i64 170}
!172 = metadata !{i64 171}
!173 = metadata !{i64 172}
!174 = metadata !{i64 173}
!175 = metadata !{i64 174}
!176 = metadata !{i64 175}
!177 = metadata !{i64 176}
!178 = metadata !{i64 177}
!179 = metadata !{i64 178}
!180 = metadata !{i64 179}
!181 = metadata !{i64 180}
!182 = metadata !{i64 181}
!183 = metadata !{i64 182}
!184 = metadata !{i64 183}
!185 = metadata !{i64 184}
!186 = metadata !{i64 185}
!187 = metadata !{i64 186}
!188 = metadata !{i64 187}
!189 = metadata !{i64 188}
!190 = metadata !{i64 189}
!191 = metadata !{i64 190}
!192 = metadata !{i64 191}
!193 = metadata !{i64 192}
!194 = metadata !{i64 193}
!195 = metadata !{i64 194}
!196 = metadata !{i64 195}
!197 = metadata !{i64 196}
!198 = metadata !{i64 197}
!199 = metadata !{i64 198}
!200 = metadata !{i64 199}
!201 = metadata !{i64 200}
!202 = metadata !{i64 201}
!203 = metadata !{i64 202}
!204 = metadata !{i64 203}
!205 = metadata !{i64 204}
!206 = metadata !{i64 205}
!207 = metadata !{i64 206}
!208 = metadata !{i64 207}
!209 = metadata !{i64 208}
!210 = metadata !{i64 209}
!211 = metadata !{i64 210}
!212 = metadata !{i64 211}
!213 = metadata !{i64 212}
!214 = metadata !{i64 213}
!215 = metadata !{i64 214}
!216 = metadata !{i64 215}
!217 = metadata !{i64 216}
!218 = metadata !{i64 217}
!219 = metadata !{i64 218}
!220 = metadata !{i64 219}
!221 = metadata !{i64 220}
!222 = metadata !{i64 221}
!223 = metadata !{i64 222}
!224 = metadata !{i64 223}
!225 = metadata !{i64 224}
!226 = metadata !{i64 225}
!227 = metadata !{i64 226}
!228 = metadata !{i64 227}
!229 = metadata !{i64 228}
!230 = metadata !{i64 229}
!231 = metadata !{i64 230}
!232 = metadata !{i64 231}
!233 = metadata !{i64 232}
!234 = metadata !{i64 233}
!235 = metadata !{i64 234}
!236 = metadata !{i64 235}
!237 = metadata !{i64 236}
!238 = metadata !{i64 237}
!239 = metadata !{i64 238}
!240 = metadata !{i64 239}
!241 = metadata !{i64 240}
!242 = metadata !{i64 241}
!243 = metadata !{i64 242}
!244 = metadata !{i64 243}
!245 = metadata !{i64 244}
!246 = metadata !{i64 245}
!247 = metadata !{i64 246}
!248 = metadata !{i64 247}
!249 = metadata !{i64 248}
!250 = metadata !{i64 249}
!251 = metadata !{i64 250}
!252 = metadata !{i64 251}
!253 = metadata !{i64 252}
!254 = metadata !{i64 253}
!255 = metadata !{i64 254}
!256 = metadata !{i64 255}
!257 = metadata !{i64 256}
!258 = metadata !{i64 257}
!259 = metadata !{i64 258}
!260 = metadata !{i64 259}
!261 = metadata !{i64 260}
!262 = metadata !{i64 261}
!263 = metadata !{i64 262}
!264 = metadata !{i64 263}
!265 = metadata !{i64 264}
!266 = metadata !{i64 265}
!267 = metadata !{i64 266}
!268 = metadata !{i64 267}
!269 = metadata !{i64 268}
!270 = metadata !{i64 269}
!271 = metadata !{i64 270}
!272 = metadata !{i64 271}
!273 = metadata !{i64 272}
!274 = metadata !{i64 273}
!275 = metadata !{i64 274}
!276 = metadata !{i64 275}
!277 = metadata !{i64 276}
!278 = metadata !{i64 277}
!279 = metadata !{i64 278}
!280 = metadata !{i64 279}
!281 = metadata !{i64 280}
!282 = metadata !{i64 281}
!283 = metadata !{i64 282}
!284 = metadata !{i64 283}
!285 = metadata !{i64 284}
!286 = metadata !{i64 285}
!287 = metadata !{i64 286}
!288 = metadata !{i64 287}
!289 = metadata !{i64 288}
!290 = metadata !{i64 289}
!291 = metadata !{i64 290}
!292 = metadata !{i64 291}
!293 = metadata !{i64 292}
!294 = metadata !{i64 293}
!295 = metadata !{i64 294}
!296 = metadata !{i64 295}
!297 = metadata !{i64 296}
!298 = metadata !{i64 297}
!299 = metadata !{i64 298}
!300 = metadata !{i64 299}
!301 = metadata !{i64 300}
!302 = metadata !{i64 301}
!303 = metadata !{i64 302}
!304 = metadata !{i64 303}
!305 = metadata !{i64 304}
!306 = metadata !{i64 305}
!307 = metadata !{i64 306}
!308 = metadata !{i64 307}
!309 = metadata !{i64 308}
!310 = metadata !{i64 309}
!311 = metadata !{i64 310}
!312 = metadata !{i64 311}
!313 = metadata !{i64 312}
!314 = metadata !{i64 313}
!315 = metadata !{i64 314}
!316 = metadata !{i64 315}
!317 = metadata !{i64 316}
!318 = metadata !{i64 317}
!319 = metadata !{i64 318}
!320 = metadata !{i64 319}
!321 = metadata !{i64 320}
!322 = metadata !{i64 321}
!323 = metadata !{i64 322}
!324 = metadata !{i64 323}
!325 = metadata !{i64 324}
!326 = metadata !{i64 325}
!327 = metadata !{i64 326}
!328 = metadata !{i64 327}
!329 = metadata !{i64 328}
!330 = metadata !{i64 329}
!331 = metadata !{i64 330}
!332 = metadata !{i64 331}
!333 = metadata !{i64 332}
!334 = metadata !{i64 333}
!335 = metadata !{i64 334}
!336 = metadata !{i64 335}
!337 = metadata !{i64 336}
!338 = metadata !{i64 337}
!339 = metadata !{i64 338}
!340 = metadata !{i64 339}
!341 = metadata !{i64 340}
!342 = metadata !{i64 341}
!343 = metadata !{i64 342}
!344 = metadata !{i64 343}
!345 = metadata !{i64 344}
!346 = metadata !{i64 345}
!347 = metadata !{i64 346}
!348 = metadata !{i64 347}
!349 = metadata !{i64 348}
!350 = metadata !{i64 349}
!351 = metadata !{i64 350}
!352 = metadata !{i64 351}
!353 = metadata !{i64 352}
!354 = metadata !{i64 353}
!355 = metadata !{i64 354}
!356 = metadata !{i64 355}
!357 = metadata !{i64 356}
!358 = metadata !{i64 357}
!359 = metadata !{i64 358}
!360 = metadata !{i64 359}
!361 = metadata !{i64 360}
!362 = metadata !{i64 361}
!363 = metadata !{i64 362}
!364 = metadata !{i64 363}
!365 = metadata !{i64 364}
!366 = metadata !{i64 365}
!367 = metadata !{i64 366}
!368 = metadata !{i64 367}
!369 = metadata !{i64 368}
!370 = metadata !{i64 369}
!371 = metadata !{i64 370}
!372 = metadata !{i64 371}
!373 = metadata !{i64 372}
!374 = metadata !{i64 373}
!375 = metadata !{i64 374}
!376 = metadata !{i64 375}
!377 = metadata !{i64 376}
!378 = metadata !{i64 377}
!379 = metadata !{i64 378}
!380 = metadata !{i64 379}
!381 = metadata !{i64 380}
!382 = metadata !{i64 381}
!383 = metadata !{i64 382}
!384 = metadata !{i64 383}
!385 = metadata !{i64 384}
!386 = metadata !{i64 385}
!387 = metadata !{i64 386}
!388 = metadata !{i64 387}
!389 = metadata !{i64 388}
!390 = metadata !{i64 389}
!391 = metadata !{i64 390}
!392 = metadata !{i64 391}
!393 = metadata !{i64 392}
!394 = metadata !{i64 393}
!395 = metadata !{i64 394}
!396 = metadata !{i64 395}
!397 = metadata !{i64 396}
!398 = metadata !{i64 397}
!399 = metadata !{i64 398}
!400 = metadata !{i64 399}
!401 = metadata !{i64 400}
!402 = metadata !{i64 401}
!403 = metadata !{i64 402}
!404 = metadata !{i64 403}
!405 = metadata !{i64 404}
!406 = metadata !{i64 405}
!407 = metadata !{i64 406}
!408 = metadata !{i64 407}
!409 = metadata !{i64 408}
!410 = metadata !{i64 409}
!411 = metadata !{i64 410}
!412 = metadata !{i64 411}
!413 = metadata !{i64 412}
!414 = metadata !{i64 413}
!415 = metadata !{i64 414}
!416 = metadata !{i64 415}
!417 = metadata !{i64 416}
!418 = metadata !{i64 417}
!419 = metadata !{i64 418}
!420 = metadata !{i64 419}
!421 = metadata !{i64 420}
!422 = metadata !{i64 421}
!423 = metadata !{i64 422}
!424 = metadata !{i64 423}
!425 = metadata !{i64 424}
!426 = metadata !{i64 425}
!427 = metadata !{i64 426}
!428 = metadata !{i64 427}
!429 = metadata !{i64 428}
!430 = metadata !{i64 429}
!431 = metadata !{i64 430}
!432 = metadata !{i64 431}
!433 = metadata !{i64 432}
!434 = metadata !{i64 433}
!435 = metadata !{i64 434}
!436 = metadata !{i64 435}
!437 = metadata !{i64 436}
!438 = metadata !{i64 437}
!439 = metadata !{i64 438}
!440 = metadata !{i64 439}
!441 = metadata !{i64 440}
!442 = metadata !{i64 441}
!443 = metadata !{i64 442}
!444 = metadata !{i64 443}
!445 = metadata !{i64 444}
!446 = metadata !{i64 445}
!447 = metadata !{i64 446}
!448 = metadata !{i64 447}
!449 = metadata !{i64 448}
!450 = metadata !{i64 449}
!451 = metadata !{i64 450}
!452 = metadata !{i64 451}
!453 = metadata !{i64 452}
!454 = metadata !{i64 453}
!455 = metadata !{i64 454}
!456 = metadata !{i64 455}
!457 = metadata !{i64 456}
!458 = metadata !{i64 457}
!459 = metadata !{i64 458}
!460 = metadata !{i64 459}
!461 = metadata !{i64 460}
!462 = metadata !{i64 461}
!463 = metadata !{i64 462}
!464 = metadata !{i64 463}
!465 = metadata !{i64 464}
!466 = metadata !{i64 465}
!467 = metadata !{i64 466}
!468 = metadata !{i64 467}
!469 = metadata !{i64 468}
!470 = metadata !{i64 469}
!471 = metadata !{i64 470}
!472 = metadata !{i64 471}
!473 = metadata !{i64 472}
!474 = metadata !{i64 473}
!475 = metadata !{i64 474}
!476 = metadata !{i64 475}
!477 = metadata !{i64 476}
!478 = metadata !{i64 477}
!479 = metadata !{i64 478}
!480 = metadata !{i64 479}
!481 = metadata !{i64 480}
!482 = metadata !{i64 481}
!483 = metadata !{i64 482}
!484 = metadata !{i64 483}
!485 = metadata !{i64 484}
!486 = metadata !{i64 485}
!487 = metadata !{i64 486}
!488 = metadata !{i64 487}
!489 = metadata !{i64 488}
!490 = metadata !{i64 489}
!491 = metadata !{i64 490}
!492 = metadata !{i64 491}
!493 = metadata !{i64 492}
!494 = metadata !{i64 493}
!495 = metadata !{i64 494}
!496 = metadata !{i64 495}
!497 = metadata !{i64 496}
!498 = metadata !{i64 497}
!499 = metadata !{i64 498}
!500 = metadata !{i64 499}
!501 = metadata !{i64 500}
!502 = metadata !{i64 501}
!503 = metadata !{i64 502}
!504 = metadata !{i64 503}
!505 = metadata !{i64 504}
!506 = metadata !{i64 505}
!507 = metadata !{i64 506}
!508 = metadata !{i64 507}
!509 = metadata !{i64 508}
!510 = metadata !{i64 509}
!511 = metadata !{i64 510}
!512 = metadata !{i64 511}
!513 = metadata !{i64 512}
!514 = metadata !{i64 513}
!515 = metadata !{i64 514}
!516 = metadata !{i64 515}
!517 = metadata !{i64 516}
!518 = metadata !{i64 517}
!519 = metadata !{i64 518}
!520 = metadata !{i64 519}
!521 = metadata !{i64 520}
!522 = metadata !{i64 521}
!523 = metadata !{i64 522}
!524 = metadata !{i64 523}
!525 = metadata !{i64 524}
!526 = metadata !{i64 525}
!527 = metadata !{i64 526}
!528 = metadata !{i64 527}
!529 = metadata !{i64 528}
!530 = metadata !{i64 529}
!531 = metadata !{i64 530}
!532 = metadata !{i64 531}
!533 = metadata !{i64 532}
!534 = metadata !{i64 533}
!535 = metadata !{i64 534}
!536 = metadata !{i64 535}
!537 = metadata !{i64 536}
!538 = metadata !{i64 537}
!539 = metadata !{i64 538}
!540 = metadata !{i64 539}
!541 = metadata !{i64 540}
!542 = metadata !{i64 541}
!543 = metadata !{i64 542}
!544 = metadata !{i64 543}
!545 = metadata !{i64 544}
!546 = metadata !{i64 545}
!547 = metadata !{i64 546}
!548 = metadata !{i64 547}
!549 = metadata !{i64 548}
!550 = metadata !{i64 549}
!551 = metadata !{i64 550}
!552 = metadata !{i64 551}
!553 = metadata !{i64 552}
!554 = metadata !{i64 553}
!555 = metadata !{i64 554}
!556 = metadata !{i64 555}
!557 = metadata !{i64 556}
!558 = metadata !{i64 557}
!559 = metadata !{i64 558}
!560 = metadata !{i64 559}
!561 = metadata !{i64 560}
!562 = metadata !{i64 561}
!563 = metadata !{i64 562}
!564 = metadata !{i64 563}
!565 = metadata !{i64 564}
!566 = metadata !{i64 565}
!567 = metadata !{i64 566}
!568 = metadata !{i64 567}
!569 = metadata !{i64 568}
!570 = metadata !{i64 569}
!571 = metadata !{i64 570}
!572 = metadata !{i64 571}
!573 = metadata !{i64 572}
!574 = metadata !{i64 573}
!575 = metadata !{i64 574}
!576 = metadata !{i64 575}
!577 = metadata !{i64 576}
!578 = metadata !{i64 577}
!579 = metadata !{i64 578}
!580 = metadata !{i64 579}
!581 = metadata !{i64 580}
!582 = metadata !{i64 581}
!583 = metadata !{i64 582}
!584 = metadata !{i64 583}
!585 = metadata !{i64 584}
!586 = metadata !{i64 585}
!587 = metadata !{i64 586}
!588 = metadata !{i64 587}
!589 = metadata !{i64 588}
!590 = metadata !{i64 589}
!591 = metadata !{i64 590}
!592 = metadata !{i64 591}
!593 = metadata !{i64 592}
!594 = metadata !{i64 593}
!595 = metadata !{i64 594}
!596 = metadata !{i64 595}
!597 = metadata !{i64 596}
!598 = metadata !{i64 597}
!599 = metadata !{i64 598}
!600 = metadata !{i64 599}
!601 = metadata !{i64 600}
!602 = metadata !{i64 601}
!603 = metadata !{i64 602}
!604 = metadata !{i64 603}
!605 = metadata !{i64 604}
!606 = metadata !{i64 605}
!607 = metadata !{i64 606}
!608 = metadata !{i64 607}
!609 = metadata !{i64 608}
!610 = metadata !{i64 609}
!611 = metadata !{i64 610}
!612 = metadata !{i64 611}
!613 = metadata !{i64 612}
!614 = metadata !{i64 613}
!615 = metadata !{i64 614}
!616 = metadata !{i64 615}
!617 = metadata !{i64 616}
!618 = metadata !{i64 617}
!619 = metadata !{i64 618}
!620 = metadata !{i64 619}
!621 = metadata !{i64 620}
!622 = metadata !{i64 621}
!623 = metadata !{i64 622}
!624 = metadata !{i64 623}
!625 = metadata !{i64 624}
!626 = metadata !{i64 625}
!627 = metadata !{i64 626}
!628 = metadata !{i64 627}
!629 = metadata !{i64 628}
!630 = metadata !{i64 629}
!631 = metadata !{i64 630}
!632 = metadata !{i64 631}
!633 = metadata !{i64 632}
!634 = metadata !{i64 633}
!635 = metadata !{i64 634}
!636 = metadata !{i64 635}
!637 = metadata !{i64 636}
!638 = metadata !{i64 637}
!639 = metadata !{i64 638}
!640 = metadata !{i64 639}
!641 = metadata !{i64 640}
!642 = metadata !{i64 641}
!643 = metadata !{i64 642}
!644 = metadata !{i64 643}
!645 = metadata !{i64 644}
!646 = metadata !{i64 645}
!647 = metadata !{i64 646}
!648 = metadata !{i64 647}
!649 = metadata !{i64 648}
!650 = metadata !{i64 649}
!651 = metadata !{i64 650}
!652 = metadata !{i64 651}
!653 = metadata !{i64 652}
!654 = metadata !{i64 653}
!655 = metadata !{i64 654}
!656 = metadata !{i64 655}
!657 = metadata !{i64 656}
!658 = metadata !{i64 657}
!659 = metadata !{i64 658}
!660 = metadata !{i64 659}
!661 = metadata !{i64 660}
!662 = metadata !{i64 661}
!663 = metadata !{i64 662}
!664 = metadata !{i64 663}
!665 = metadata !{i64 664}
!666 = metadata !{i64 665}
!667 = metadata !{i64 666}
!668 = metadata !{i64 667}
!669 = metadata !{i64 668}
!670 = metadata !{i64 669}
!671 = metadata !{i64 670}
!672 = metadata !{i64 671}
!673 = metadata !{i64 672}
!674 = metadata !{i64 673}
!675 = metadata !{i64 674}
!676 = metadata !{i64 675}
!677 = metadata !{i64 676}
!678 = metadata !{i64 677}
!679 = metadata !{i64 678}
!680 = metadata !{i64 679}
!681 = metadata !{i64 680}
!682 = metadata !{i64 681}
!683 = metadata !{i64 682}
!684 = metadata !{i64 683}
!685 = metadata !{i64 684}
!686 = metadata !{i64 685}
!687 = metadata !{i64 686}
!688 = metadata !{i64 687}
!689 = metadata !{i64 688}
!690 = metadata !{i64 689}
!691 = metadata !{i64 690}
!692 = metadata !{i64 691}
!693 = metadata !{i64 692}
!694 = metadata !{i64 693}
!695 = metadata !{i64 694}
!696 = metadata !{i64 695}
!697 = metadata !{i64 696}
!698 = metadata !{i64 697}
!699 = metadata !{i64 698}
!700 = metadata !{i64 699}
!701 = metadata !{i64 700}
!702 = metadata !{i64 701}
!703 = metadata !{i64 702}
!704 = metadata !{i64 703}
!705 = metadata !{i64 704}
!706 = metadata !{i64 705}
!707 = metadata !{i64 706}
!708 = metadata !{i64 707}
!709 = metadata !{i64 708}
!710 = metadata !{i64 709}
!711 = metadata !{i64 710}
!712 = metadata !{i64 711}
!713 = metadata !{i64 712}
!714 = metadata !{i64 713}
!715 = metadata !{i64 714}
!716 = metadata !{i64 715}
!717 = metadata !{i64 716}
!718 = metadata !{i64 717}
!719 = metadata !{i64 718}
!720 = metadata !{i64 719}
!721 = metadata !{i64 720}
!722 = metadata !{i64 721}
!723 = metadata !{i64 722}
!724 = metadata !{i64 723}
!725 = metadata !{i64 724}
!726 = metadata !{i64 725}
!727 = metadata !{i64 726}
!728 = metadata !{i64 727}
!729 = metadata !{i64 728}
!730 = metadata !{i64 729}
!731 = metadata !{i64 730}
!732 = metadata !{i64 731}
!733 = metadata !{i64 732}
!734 = metadata !{i64 733}
!735 = metadata !{i64 734}
!736 = metadata !{i64 735}
!737 = metadata !{i64 736}
!738 = metadata !{i64 737}
!739 = metadata !{i64 738}
!740 = metadata !{i64 739}
!741 = metadata !{i64 740}
