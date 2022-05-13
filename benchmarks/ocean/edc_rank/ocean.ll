; ModuleID = 'jacobcalc.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Global_Private = type { [4096 x i8], double, double, [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64], [9 x i64] }
%struct.global_struct = type { i64, i64, i64, double, double }
%struct.fields_struct = type { [2 x [258 x [258 x double]]], [2 x [258 x [258 x double]]] }
%struct.fields2_struct = type { [258 x [258 x double]], [258 x [258 x double]] }
%struct.wrk1_struct = type { [258 x [258 x double]], [258 x [258 x double]], [258 x [258 x double]] }
%struct.wrk3_struct = type { [2 x [258 x [258 x double]]], [258 x [258 x double]] }
%struct.wrk2_struct = type { [258 x [258 x double]], [258 x double] }
%struct.wrk4_struct = type { [2 x [258 x [258 x double]]], [2 x [258 x [258 x double]]] }
%struct.wrk6_struct = type { [258 x [258 x double]] }
%struct.wrk5_struct = type { [2 x [258 x [258 x double]]], [2 x [258 x [258 x double]]] }
%struct.frcng_struct = type { [258 x [258 x double]] }
%struct.iter_struct = type { i64, [258 x [258 x double]], [258 x [258 x double]] }
%struct.guess_struct = type { [258 x [258 x double]], [258 x [258 x double]] }
%struct.multi_struct = type { [9 x [258 x [258 x double]]], [9 x [258 x [258 x double]]], double, i64, [16 x i64] }
%struct.locks_struct = type { %union.pthread_mutex_t, %union.pthread_mutex_t, %union.pthread_mutex_t, %union.pthread_mutex_t, %union.pthread_mutex_t, %union.pthread_mutex_t }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%struct.bars_struct = type { %struct.anon }
%struct.anon = type { %union.pthread_mutex_t, %union.pthread_cond_t, i64, i64 }
%union.pthread_cond_t = type { %struct.anon.0 }
%struct.anon.0 = type { i32, i32, i64, i64, i64, i8*, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%union.pthread_mutexattr_t = type { i32 }
%union.pthread_condattr_t = type { i32 }
%union.pthread_attr_t = type { i64, [48 x i8] }

@nprocs = global i64 1, align 8
@h1 = global double 1.000000e+03, align 8
@h3 = global double 4.000000e+03, align 8
@h = global double 5.000000e+03, align 8
@lf = global double -5.120000e+11, align 8
@eps = global double 0.000000e+00, align 8
@res = global double 2.000000e+04, align 8
@dtau = global double 2.880000e+04, align 8
@f0 = global double 8.300000e-05, align 8
@beta = global double 2.000000e-11, align 8
@gpr = global double 2.000000e-02, align 8
@im = global i64 258, align 8
@tolerance = global double 1.000000e-07, align 8
@t0 = global double 5.000000e-05, align 8
@outday0 = global double 1.000000e+00, align 8
@outday1 = global double 2.000000e+00, align 8
@outday2 = global double 2.000000e+00, align 8
@outday3 = global double 2.000000e+00, align 8
@maxwork = global double 1.000000e+04, align 8
@do_stats = global i64 0, align 8
@do_output = global i64 0, align 8
@.str = private unnamed_addr constant [14 x i8] c"n:p:e:r:t:soh\00", align 1
@optarg = external global i8*
@.str1 = private unnamed_addr constant [24 x i8] c"Max grid size exceeded\0A\00", align 1
@.str2 = private unnamed_addr constant [49 x i8] c"Grid must be ((power of 2)+2) in each dimension\0A\00", align 1
@.str3 = private unnamed_addr constant [16 x i8] c"P must be >= 1\0A\00", align 1
@.str4 = private unnamed_addr constant [24 x i8] c"P must be a power of 2\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"Usage: OCEAN <options>\0A\0A\00", align 1
@.str6 = private unnamed_addr constant [10 x i8] c"options:\0A\00", align 1
@.str7 = private unnamed_addr constant [56 x i8] c"  -nN : Simulate NxN ocean.  N must be (power of 2)+2.\0A\00", align 1
@.str8 = private unnamed_addr constant [58 x i8] c"  -pP : P = number of processors.  P must be power of 2.\0A\00", align 1
@.str9 = private unnamed_addr constant [55 x i8] c"  -eE : E = error tolerance for iterative relaxation.\0A\00", align 1
@.str10 = private unnamed_addr constant [53 x i8] c"  -rR : R = distance between grid points in meters.\0A\00", align 1
@.str11 = private unnamed_addr constant [34 x i8] c"  -tT : T = timestep in seconds.\0A\00", align 1
@.str12 = private unnamed_addr constant [34 x i8] c"  -s  : Print timing statistics.\0A\00", align 1
@.str13 = private unnamed_addr constant [47 x i8] c"  -o  : Print out relaxation residual values.\0A\00", align 1
@.str14 = private unnamed_addr constant [42 x i8] c"  -h  : Print out command line options.\0A\0A\00", align 1
@.str15 = private unnamed_addr constant [46 x i8] c"Default: OCEAN -n%1d -p%1d -e%1g -r%1g -t%1g\0A\00", align 1
@numlev = common global i64 0, align 8
@.str16 = private unnamed_addr constant [45 x i8] c"Cannot determine number of multigrid levels\0A\00", align 1
@.str17 = private unnamed_addr constant [40 x i8] c"Max grid levels exceeded for multigrid\0A\00", align 1
@jm = common global i64 0, align 8
@.str18 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str19 = private unnamed_addr constant [48 x i8] c"Ocean simulation with W-cycle multigrid solver\0A\00", align 1
@.str20 = private unnamed_addr constant [47 x i8] c"    Processors                         : %1ld\0A\00", align 1
@.str21 = private unnamed_addr constant [54 x i8] c"    Grid size                          : %1ld x %1ld\0A\00", align 1
@.str22 = private unnamed_addr constant [48 x i8] c"    Grid resolution (meters)           : %0.2f\0A\00", align 1
@.str23 = private unnamed_addr constant [48 x i8] c"    Time between relaxations (seconds) : %0.0f\0A\00", align 1
@.str24 = private unnamed_addr constant [48 x i8] c"    Error tolerance                    : %0.7g\0A\00", align 1
@gp = common global %struct.Global_Private* null, align 8
@global = common global %struct.global_struct* null, align 8
@fields = common global %struct.fields_struct* null, align 8
@fields2 = common global %struct.fields2_struct* null, align 8
@wrk1 = common global %struct.wrk1_struct* null, align 8
@wrk3 = common global %struct.wrk3_struct* null, align 8
@wrk2 = common global %struct.wrk2_struct* null, align 8
@wrk4 = common global %struct.wrk4_struct* null, align 8
@wrk6 = common global %struct.wrk6_struct* null, align 8
@wrk5 = common global %struct.wrk5_struct* null, align 8
@frcng = common global %struct.frcng_struct* null, align 8
@iter = common global %struct.iter_struct* null, align 8
@guess = common global %struct.guess_struct* null, align 8
@multi = common global %struct.multi_struct* null, align 8
@locks = common global %struct.locks_struct* null, align 8
@bars = common global %struct.bars_struct* null, align 8
@.str25 = private unnamed_addr constant [35 x i8] c"Error while initializing barrier.\0A\00", align 1
@imx = common global [9 x i64] zeroinitializer, align 16
@jmx = common global [9 x i64] zeroinitializer, align 16
@lev_res = common global [9 x double] zeroinitializer, align 16
@lev_tol = common global [9 x double] zeroinitializer, align 16
@xprocs = common global i64 0, align 8
@yprocs = common global i64 0, align 8
@.str26 = private unnamed_addr constant [40 x i8] c"Could not find factors for subblocking\0A\00", align 1
@i_int_coeff = common global [9 x double] zeroinitializer, align 16
@j_int_coeff = common global [9 x double] zeroinitializer, align 16
@pi = common global double 0.000000e+00, align 8
@factjacob = common global double 0.000000e+00, align 8
@factlap = common global double 0.000000e+00, align 8
@eig2 = common global double 0.000000e+00, align 8
@jmm1 = common global i64 0, align 8
@ysca = common global double 0.000000e+00, align 8
@.str27 = private unnamed_addr constant [42 x i8] c"                       MULTIGRID OUTPUTS\0A\00", align 1
@PThreadTable = common global [32 x i64] zeroinitializer, align 16
@.str28 = private unnamed_addr constant [28 x i8] c"Error in pthread_create().\0A\00", align 1
@.str29 = private unnamed_addr constant [26 x i8] c"Error in pthread_join().\0A\00", align 1
@.str30 = private unnamed_addr constant [41 x i8] c"  %3ld   %15.0f    %15.0f        %10.3f\0A\00", align 1
@.str31 = private unnamed_addr constant [40 x i8] c"  Avg   %15.0f    %15.0f        %10.3f\0A\00", align 1
@.str32 = private unnamed_addr constant [40 x i8] c"  Min   %15.0f    %15.0f        %10.3f\0A\00", align 1
@.str33 = private unnamed_addr constant [40 x i8] c"  Max   %15.0f    %15.0f        %10.3f\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str34 = private unnamed_addr constant [11 x i8] c"ERROR: %s\0A\00", align 1
@startcol = common global [2 x [16 x i64]] zeroinitializer, align 16
@startrow = common global [2 x [16 x i64]] zeroinitializer, align 16
@minlev = common global i64 0, align 8
@.str35 = private unnamed_addr constant [44 x i8] c"Error while trying to get lock in barrier.\0A\00", align 1
@.str136 = private unnamed_addr constant [42 x i8] c"ERROR: Maximum work limit %0.5f exceeded\0A\00", align 1
@.str237 = private unnamed_addr constant [57 x i8] c"iter %ld, level %ld, residual norm %12.8e, work = %7.3f\0A\00", align 1
@.str38 = private unnamed_addr constant [44 x i8] c"Error while trying to get lock in barrier.\0A\00", align 1
@.str41 = private unnamed_addr constant [44 x i8] c"Error while trying to get lock in barrier.\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @jacobcalc([258 x double]* %x, [258 x double]* %y, [258 x double]* %z, i64 %pid, i64 %firstrow, i64 %lastrow, i64 %firstcol, i64 %lastcol, i64 %numrows, i64 %numcols) #0 {
  %1 = alloca [258 x double]*, align 8
  %2 = alloca [258 x double]*, align 8
  %3 = alloca [258 x double]*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %f1 = alloca double, align 8
  %f2 = alloca double, align 8
  %f3 = alloca double, align 8
  %f4 = alloca double, align 8
  %f5 = alloca double, align 8
  %f6 = alloca double, align 8
  %f7 = alloca double, align 8
  %f8 = alloca double, align 8
  %iindex = alloca i64, align 8
  %indexp1 = alloca i64, align 8
  %indexm1 = alloca i64, align 8
  %im1 = alloca i64, align 8
  %ip1 = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store [258 x double]* %x, [258 x double]** %1, align 8
  store [258 x double]* %y, [258 x double]** %2, align 8
  store [258 x double]* %z, [258 x double]** %3, align 8
  store i64 %pid, i64* %4, align 8
  store i64 %firstrow, i64* %5, align 8
  store i64 %lastrow, i64* %6, align 8
  store i64 %firstcol, i64* %7, align 8
  store i64 %lastcol, i64* %8, align 8
  store i64 %numrows, i64* %9, align 8
  store i64 %numcols, i64* %10, align 8
  %11 = load i64* %4, align 8
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %17

; <label>:13                                      ; preds = %0
  %14 = load [258 x double]** %3, align 8
  %15 = getelementptr inbounds [258 x double]* %14, i64 0
  %16 = getelementptr inbounds [258 x double]* %15, i32 0, i64 0
  store double 0.000000e+00, double* %16, align 8
  br label %17

; <label>:17                                      ; preds = %13, %0
  %18 = load i64* %4, align 8
  %19 = load i64* @nprocs, align 8
  %20 = load i64* @xprocs, align 8
  %21 = sub nsw i64 %19, %20
  %22 = icmp eq i64 %18, %21
  br i1 %22, label %23, label %29

; <label>:23                                      ; preds = %17
  %24 = load i64* @im, align 8
  %25 = sub nsw i64 %24, 1
  %26 = load [258 x double]** %3, align 8
  %27 = getelementptr inbounds [258 x double]* %26, i64 %25
  %28 = getelementptr inbounds [258 x double]* %27, i32 0, i64 0
  store double 0.000000e+00, double* %28, align 8
  br label %29

; <label>:29                                      ; preds = %23, %17
  %30 = load i64* %4, align 8
  %31 = load i64* @xprocs, align 8
  %32 = sub nsw i64 %31, 1
  %33 = icmp eq i64 %30, %32
  br i1 %33, label %34, label %40

; <label>:34                                      ; preds = %29
  %35 = load i64* @jm, align 8
  %36 = sub nsw i64 %35, 1
  %37 = load [258 x double]** %3, align 8
  %38 = getelementptr inbounds [258 x double]* %37, i64 0
  %39 = getelementptr inbounds [258 x double]* %38, i32 0, i64 %36
  store double 0.000000e+00, double* %39, align 8
  br label %40

; <label>:40                                      ; preds = %34, %29
  %41 = load i64* %4, align 8
  %42 = load i64* @nprocs, align 8
  %43 = sub nsw i64 %42, 1
  %44 = icmp eq i64 %41, %43
  br i1 %44, label %45, label %53

; <label>:45                                      ; preds = %40
  %46 = load i64* @jm, align 8
  %47 = sub nsw i64 %46, 1
  %48 = load i64* @im, align 8
  %49 = sub nsw i64 %48, 1
  %50 = load [258 x double]** %3, align 8
  %51 = getelementptr inbounds [258 x double]* %50, i64 %49
  %52 = getelementptr inbounds [258 x double]* %51, i32 0, i64 %47
  store double 0.000000e+00, double* %52, align 8
  br label %53

; <label>:53                                      ; preds = %45, %40
  %54 = load i64* %7, align 8
  store i64 %54, i64* %iindex, align 8
  br label %55

; <label>:55                                      ; preds = %372, %53
  %56 = load i64* %iindex, align 8
  %57 = load i64* %8, align 8
  %58 = icmp sle i64 %56, %57
  br i1 %58, label %59, label %375

; <label>:59                                      ; preds = %55
  %60 = load i64* %iindex, align 8
  %61 = add nsw i64 %60, 1
  store i64 %61, i64* %indexp1, align 8
  %62 = load i64* %iindex, align 8
  %63 = sub nsw i64 %62, 1
  store i64 %63, i64* %indexm1, align 8
  %64 = load i64* %5, align 8
  store i64 %64, i64* %i, align 8
  br label %65

; <label>:65                                      ; preds = %368, %59
  %66 = load i64* %i, align 8
  %67 = load i64* %6, align 8
  %68 = icmp sle i64 %66, %67
  br i1 %68, label %69, label %371

; <label>:69                                      ; preds = %65
  %70 = load i64* %i, align 8
  %71 = add nsw i64 %70, 1
  store i64 %71, i64* %ip1, align 8
  %72 = load i64* %i, align 8
  %73 = sub nsw i64 %72, 1
  store i64 %73, i64* %im1, align 8
  %74 = load i64* %indexm1, align 8
  %75 = load i64* %i, align 8
  %76 = load [258 x double]** %2, align 8
  %77 = getelementptr inbounds [258 x double]* %76, i64 %75
  %78 = getelementptr inbounds [258 x double]* %77, i32 0, i64 %74
  %79 = load double* %78, align 8
  %80 = load i64* %indexm1, align 8
  %81 = load i64* %ip1, align 8
  %82 = load [258 x double]** %2, align 8
  %83 = getelementptr inbounds [258 x double]* %82, i64 %81
  %84 = getelementptr inbounds [258 x double]* %83, i32 0, i64 %80
  %85 = load double* %84, align 8
  %86 = fadd double %79, %85
  %87 = load i64* %indexp1, align 8
  %88 = load i64* %i, align 8
  %89 = load [258 x double]** %2, align 8
  %90 = getelementptr inbounds [258 x double]* %89, i64 %88
  %91 = getelementptr inbounds [258 x double]* %90, i32 0, i64 %87
  %92 = load double* %91, align 8
  %93 = fsub double %86, %92
  %94 = load i64* %indexp1, align 8
  %95 = load i64* %ip1, align 8
  %96 = load [258 x double]** %2, align 8
  %97 = getelementptr inbounds [258 x double]* %96, i64 %95
  %98 = getelementptr inbounds [258 x double]* %97, i32 0, i64 %94
  %99 = load double* %98, align 8
  %100 = fsub double %93, %99
  %101 = load i64* %iindex, align 8
  %102 = load i64* %ip1, align 8
  %103 = load [258 x double]** %1, align 8
  %104 = getelementptr inbounds [258 x double]* %103, i64 %102
  %105 = getelementptr inbounds [258 x double]* %104, i32 0, i64 %101
  %106 = load double* %105, align 8
  %107 = load i64* %iindex, align 8
  %108 = load i64* %i, align 8
  %109 = load [258 x double]** %1, align 8
  %110 = getelementptr inbounds [258 x double]* %109, i64 %108
  %111 = getelementptr inbounds [258 x double]* %110, i32 0, i64 %107
  %112 = load double* %111, align 8
  %113 = fsub double %106, %112
  %114 = fmul double %100, %113
  store double %114, double* %f1, align 8
  %115 = load i64* %indexm1, align 8
  %116 = load i64* %im1, align 8
  %117 = load [258 x double]** %2, align 8
  %118 = getelementptr inbounds [258 x double]* %117, i64 %116
  %119 = getelementptr inbounds [258 x double]* %118, i32 0, i64 %115
  %120 = load double* %119, align 8
  %121 = load i64* %indexm1, align 8
  %122 = load i64* %i, align 8
  %123 = load [258 x double]** %2, align 8
  %124 = getelementptr inbounds [258 x double]* %123, i64 %122
  %125 = getelementptr inbounds [258 x double]* %124, i32 0, i64 %121
  %126 = load double* %125, align 8
  %127 = fadd double %120, %126
  %128 = load i64* %indexp1, align 8
  %129 = load i64* %im1, align 8
  %130 = load [258 x double]** %2, align 8
  %131 = getelementptr inbounds [258 x double]* %130, i64 %129
  %132 = getelementptr inbounds [258 x double]* %131, i32 0, i64 %128
  %133 = load double* %132, align 8
  %134 = fsub double %127, %133
  %135 = load i64* %indexp1, align 8
  %136 = load i64* %i, align 8
  %137 = load [258 x double]** %2, align 8
  %138 = getelementptr inbounds [258 x double]* %137, i64 %136
  %139 = getelementptr inbounds [258 x double]* %138, i32 0, i64 %135
  %140 = load double* %139, align 8
  %141 = fsub double %134, %140
  %142 = load i64* %iindex, align 8
  %143 = load i64* %i, align 8
  %144 = load [258 x double]** %1, align 8
  %145 = getelementptr inbounds [258 x double]* %144, i64 %143
  %146 = getelementptr inbounds [258 x double]* %145, i32 0, i64 %142
  %147 = load double* %146, align 8
  %148 = load i64* %iindex, align 8
  %149 = load i64* %im1, align 8
  %150 = load [258 x double]** %1, align 8
  %151 = getelementptr inbounds [258 x double]* %150, i64 %149
  %152 = getelementptr inbounds [258 x double]* %151, i32 0, i64 %148
  %153 = load double* %152, align 8
  %154 = fsub double %147, %153
  %155 = fmul double %141, %154
  store double %155, double* %f2, align 8
  %156 = load i64* %iindex, align 8
  %157 = load i64* %ip1, align 8
  %158 = load [258 x double]** %2, align 8
  %159 = getelementptr inbounds [258 x double]* %158, i64 %157
  %160 = getelementptr inbounds [258 x double]* %159, i32 0, i64 %156
  %161 = load double* %160, align 8
  %162 = load i64* %indexp1, align 8
  %163 = load i64* %ip1, align 8
  %164 = load [258 x double]** %2, align 8
  %165 = getelementptr inbounds [258 x double]* %164, i64 %163
  %166 = getelementptr inbounds [258 x double]* %165, i32 0, i64 %162
  %167 = load double* %166, align 8
  %168 = fadd double %161, %167
  %169 = load i64* %iindex, align 8
  %170 = load i64* %im1, align 8
  %171 = load [258 x double]** %2, align 8
  %172 = getelementptr inbounds [258 x double]* %171, i64 %170
  %173 = getelementptr inbounds [258 x double]* %172, i32 0, i64 %169
  %174 = load double* %173, align 8
  %175 = fsub double %168, %174
  %176 = load i64* %indexp1, align 8
  %177 = load i64* %im1, align 8
  %178 = load [258 x double]** %2, align 8
  %179 = getelementptr inbounds [258 x double]* %178, i64 %177
  %180 = getelementptr inbounds [258 x double]* %179, i32 0, i64 %176
  %181 = load double* %180, align 8
  %182 = fsub double %175, %181
  %183 = load i64* %indexp1, align 8
  %184 = load i64* %i, align 8
  %185 = load [258 x double]** %1, align 8
  %186 = getelementptr inbounds [258 x double]* %185, i64 %184
  %187 = getelementptr inbounds [258 x double]* %186, i32 0, i64 %183
  %188 = load double* %187, align 8
  %189 = load i64* %iindex, align 8
  %190 = load i64* %i, align 8
  %191 = load [258 x double]** %1, align 8
  %192 = getelementptr inbounds [258 x double]* %191, i64 %190
  %193 = getelementptr inbounds [258 x double]* %192, i32 0, i64 %189
  %194 = load double* %193, align 8
  %195 = fsub double %188, %194
  %196 = fmul double %182, %195
  store double %196, double* %f3, align 8
  %197 = load i64* %indexm1, align 8
  %198 = load i64* %ip1, align 8
  %199 = load [258 x double]** %2, align 8
  %200 = getelementptr inbounds [258 x double]* %199, i64 %198
  %201 = getelementptr inbounds [258 x double]* %200, i32 0, i64 %197
  %202 = load double* %201, align 8
  %203 = load i64* %iindex, align 8
  %204 = load i64* %ip1, align 8
  %205 = load [258 x double]** %2, align 8
  %206 = getelementptr inbounds [258 x double]* %205, i64 %204
  %207 = getelementptr inbounds [258 x double]* %206, i32 0, i64 %203
  %208 = load double* %207, align 8
  %209 = fadd double %202, %208
  %210 = load i64* %indexm1, align 8
  %211 = load i64* %im1, align 8
  %212 = load [258 x double]** %2, align 8
  %213 = getelementptr inbounds [258 x double]* %212, i64 %211
  %214 = getelementptr inbounds [258 x double]* %213, i32 0, i64 %210
  %215 = load double* %214, align 8
  %216 = fsub double %209, %215
  %217 = load i64* %iindex, align 8
  %218 = load i64* %im1, align 8
  %219 = load [258 x double]** %2, align 8
  %220 = getelementptr inbounds [258 x double]* %219, i64 %218
  %221 = getelementptr inbounds [258 x double]* %220, i32 0, i64 %217
  %222 = load double* %221, align 8
  %223 = fsub double %216, %222
  %224 = load i64* %iindex, align 8
  %225 = load i64* %i, align 8
  %226 = load [258 x double]** %1, align 8
  %227 = getelementptr inbounds [258 x double]* %226, i64 %225
  %228 = getelementptr inbounds [258 x double]* %227, i32 0, i64 %224
  %229 = load double* %228, align 8
  %230 = load i64* %indexm1, align 8
  %231 = load i64* %i, align 8
  %232 = load [258 x double]** %1, align 8
  %233 = getelementptr inbounds [258 x double]* %232, i64 %231
  %234 = getelementptr inbounds [258 x double]* %233, i32 0, i64 %230
  %235 = load double* %234, align 8
  %236 = fsub double %229, %235
  %237 = fmul double %223, %236
  store double %237, double* %f4, align 8
  %238 = load i64* %iindex, align 8
  %239 = load i64* %ip1, align 8
  %240 = load [258 x double]** %2, align 8
  %241 = getelementptr inbounds [258 x double]* %240, i64 %239
  %242 = getelementptr inbounds [258 x double]* %241, i32 0, i64 %238
  %243 = load double* %242, align 8
  %244 = load i64* %indexp1, align 8
  %245 = load i64* %i, align 8
  %246 = load [258 x double]** %2, align 8
  %247 = getelementptr inbounds [258 x double]* %246, i64 %245
  %248 = getelementptr inbounds [258 x double]* %247, i32 0, i64 %244
  %249 = load double* %248, align 8
  %250 = fsub double %243, %249
  %251 = load i64* %indexp1, align 8
  %252 = load i64* %ip1, align 8
  %253 = load [258 x double]** %1, align 8
  %254 = getelementptr inbounds [258 x double]* %253, i64 %252
  %255 = getelementptr inbounds [258 x double]* %254, i32 0, i64 %251
  %256 = load double* %255, align 8
  %257 = load i64* %iindex, align 8
  %258 = load i64* %i, align 8
  %259 = load [258 x double]** %1, align 8
  %260 = getelementptr inbounds [258 x double]* %259, i64 %258
  %261 = getelementptr inbounds [258 x double]* %260, i32 0, i64 %257
  %262 = load double* %261, align 8
  %263 = fsub double %256, %262
  %264 = fmul double %250, %263
  store double %264, double* %f5, align 8
  %265 = load i64* %indexm1, align 8
  %266 = load i64* %i, align 8
  %267 = load [258 x double]** %2, align 8
  %268 = getelementptr inbounds [258 x double]* %267, i64 %266
  %269 = getelementptr inbounds [258 x double]* %268, i32 0, i64 %265
  %270 = load double* %269, align 8
  %271 = load i64* %iindex, align 8
  %272 = load i64* %im1, align 8
  %273 = load [258 x double]** %2, align 8
  %274 = getelementptr inbounds [258 x double]* %273, i64 %272
  %275 = getelementptr inbounds [258 x double]* %274, i32 0, i64 %271
  %276 = load double* %275, align 8
  %277 = fsub double %270, %276
  %278 = load i64* %iindex, align 8
  %279 = load i64* %i, align 8
  %280 = load [258 x double]** %1, align 8
  %281 = getelementptr inbounds [258 x double]* %280, i64 %279
  %282 = getelementptr inbounds [258 x double]* %281, i32 0, i64 %278
  %283 = load double* %282, align 8
  %284 = load i64* %indexm1, align 8
  %285 = load i64* %im1, align 8
  %286 = load [258 x double]** %1, align 8
  %287 = getelementptr inbounds [258 x double]* %286, i64 %285
  %288 = getelementptr inbounds [258 x double]* %287, i32 0, i64 %284
  %289 = load double* %288, align 8
  %290 = fsub double %283, %289
  %291 = fmul double %277, %290
  store double %291, double* %f6, align 8
  %292 = load i64* %indexp1, align 8
  %293 = load i64* %i, align 8
  %294 = load [258 x double]** %2, align 8
  %295 = getelementptr inbounds [258 x double]* %294, i64 %293
  %296 = getelementptr inbounds [258 x double]* %295, i32 0, i64 %292
  %297 = load double* %296, align 8
  %298 = load i64* %iindex, align 8
  %299 = load i64* %im1, align 8
  %300 = load [258 x double]** %2, align 8
  %301 = getelementptr inbounds [258 x double]* %300, i64 %299
  %302 = getelementptr inbounds [258 x double]* %301, i32 0, i64 %298
  %303 = load double* %302, align 8
  %304 = fsub double %297, %303
  %305 = load i64* %indexp1, align 8
  %306 = load i64* %im1, align 8
  %307 = load [258 x double]** %1, align 8
  %308 = getelementptr inbounds [258 x double]* %307, i64 %306
  %309 = getelementptr inbounds [258 x double]* %308, i32 0, i64 %305
  %310 = load double* %309, align 8
  %311 = load i64* %iindex, align 8
  %312 = load i64* %i, align 8
  %313 = load [258 x double]** %1, align 8
  %314 = getelementptr inbounds [258 x double]* %313, i64 %312
  %315 = getelementptr inbounds [258 x double]* %314, i32 0, i64 %311
  %316 = load double* %315, align 8
  %317 = fsub double %310, %316
  %318 = fmul double %304, %317
  store double %318, double* %f7, align 8
  %319 = load i64* %iindex, align 8
  %320 = load i64* %ip1, align 8
  %321 = load [258 x double]** %2, align 8
  %322 = getelementptr inbounds [258 x double]* %321, i64 %320
  %323 = getelementptr inbounds [258 x double]* %322, i32 0, i64 %319
  %324 = load double* %323, align 8
  %325 = load i64* %indexm1, align 8
  %326 = load i64* %i, align 8
  %327 = load [258 x double]** %2, align 8
  %328 = getelementptr inbounds [258 x double]* %327, i64 %326
  %329 = getelementptr inbounds [258 x double]* %328, i32 0, i64 %325
  %330 = load double* %329, align 8
  %331 = fsub double %324, %330
  %332 = load i64* %iindex, align 8
  %333 = load i64* %i, align 8
  %334 = load [258 x double]** %1, align 8
  %335 = getelementptr inbounds [258 x double]* %334, i64 %333
  %336 = getelementptr inbounds [258 x double]* %335, i32 0, i64 %332
  %337 = load double* %336, align 8
  %338 = load i64* %indexm1, align 8
  %339 = load i64* %ip1, align 8
  %340 = load [258 x double]** %1, align 8
  %341 = getelementptr inbounds [258 x double]* %340, i64 %339
  %342 = getelementptr inbounds [258 x double]* %341, i32 0, i64 %338
  %343 = load double* %342, align 8
  %344 = fsub double %337, %343
  %345 = fmul double %331, %344
  store double %345, double* %f8, align 8
  %346 = load double* @factjacob, align 8
  %347 = load double* %f1, align 8
  %348 = load double* %f2, align 8
  %349 = fadd double %347, %348
  %350 = load double* %f3, align 8
  %351 = fadd double %349, %350
  %352 = load double* %f4, align 8
  %353 = fadd double %351, %352
  %354 = load double* %f5, align 8
  %355 = fadd double %353, %354
  %356 = load double* %f6, align 8
  %357 = fadd double %355, %356
  %358 = load double* %f7, align 8
  %359 = fadd double %357, %358
  %360 = load double* %f8, align 8
  %361 = fadd double %359, %360
  %362 = fmul double %346, %361
  %363 = load i64* %iindex, align 8
  %364 = load i64* %i, align 8
  %365 = load [258 x double]** %3, align 8
  %366 = getelementptr inbounds [258 x double]* %365, i64 %364
  %367 = getelementptr inbounds [258 x double]* %366, i32 0, i64 %363
  store double %362, double* %367, align 8
  br label %368

; <label>:368                                     ; preds = %69
  %369 = load i64* %i, align 8
  %370 = add nsw i64 %369, 1
  store i64 %370, i64* %i, align 8
  br label %65

; <label>:371                                     ; preds = %65
  br label %372

; <label>:372                                     ; preds = %371
  %373 = load i64* %iindex, align 8
  %374 = add nsw i64 %373, 1
  store i64 %374, i64* %iindex, align 8
  br label %55

; <label>:375                                     ; preds = %55
  %376 = load i64* %5, align 8
  %377 = icmp eq i64 %376, 1
  br i1 %377, label %378, label %393

; <label>:378                                     ; preds = %375
  %379 = load i64* %7, align 8
  store i64 %379, i64* %j, align 8
  br label %380

; <label>:380                                     ; preds = %389, %378
  %381 = load i64* %j, align 8
  %382 = load i64* %8, align 8
  %383 = icmp sle i64 %381, %382
  br i1 %383, label %384, label %392

; <label>:384                                     ; preds = %380
  %385 = load i64* %j, align 8
  %386 = load [258 x double]** %3, align 8
  %387 = getelementptr inbounds [258 x double]* %386, i64 0
  %388 = getelementptr inbounds [258 x double]* %387, i32 0, i64 %385
  store double 0.000000e+00, double* %388, align 8
  br label %389

; <label>:389                                     ; preds = %384
  %390 = load i64* %j, align 8
  %391 = add nsw i64 %390, 1
  store i64 %391, i64* %j, align 8
  br label %380

; <label>:392                                     ; preds = %380
  br label %393

; <label>:393                                     ; preds = %392, %375
  %394 = load i64* %5, align 8
  %395 = load i64* %9, align 8
  %396 = add nsw i64 %394, %395
  %397 = load i64* @im, align 8
  %398 = sub nsw i64 %397, 1
  %399 = icmp eq i64 %396, %398
  br i1 %399, label %400, label %417

; <label>:400                                     ; preds = %393
  %401 = load i64* %7, align 8
  store i64 %401, i64* %j, align 8
  br label %402

; <label>:402                                     ; preds = %413, %400
  %403 = load i64* %j, align 8
  %404 = load i64* %8, align 8
  %405 = icmp sle i64 %403, %404
  br i1 %405, label %406, label %416

; <label>:406                                     ; preds = %402
  %407 = load i64* %j, align 8
  %408 = load i64* @im, align 8
  %409 = sub nsw i64 %408, 1
  %410 = load [258 x double]** %3, align 8
  %411 = getelementptr inbounds [258 x double]* %410, i64 %409
  %412 = getelementptr inbounds [258 x double]* %411, i32 0, i64 %407
  store double 0.000000e+00, double* %412, align 8
  br label %413

; <label>:413                                     ; preds = %406
  %414 = load i64* %j, align 8
  %415 = add nsw i64 %414, 1
  store i64 %415, i64* %j, align 8
  br label %402

; <label>:416                                     ; preds = %402
  br label %417

; <label>:417                                     ; preds = %416, %393
  %418 = load i64* %7, align 8
  %419 = icmp eq i64 %418, 1
  br i1 %419, label %420, label %435

; <label>:420                                     ; preds = %417
  %421 = load i64* %5, align 8
  store i64 %421, i64* %j, align 8
  br label %422

; <label>:422                                     ; preds = %431, %420
  %423 = load i64* %j, align 8
  %424 = load i64* %6, align 8
  %425 = icmp sle i64 %423, %424
  br i1 %425, label %426, label %434

; <label>:426                                     ; preds = %422
  %427 = load i64* %j, align 8
  %428 = load [258 x double]** %3, align 8
  %429 = getelementptr inbounds [258 x double]* %428, i64 %427
  %430 = getelementptr inbounds [258 x double]* %429, i32 0, i64 0
  store double 0.000000e+00, double* %430, align 8
  br label %431

; <label>:431                                     ; preds = %426
  %432 = load i64* %j, align 8
  %433 = add nsw i64 %432, 1
  store i64 %433, i64* %j, align 8
  br label %422

; <label>:434                                     ; preds = %422
  br label %435

; <label>:435                                     ; preds = %434, %417
  %436 = load i64* %7, align 8
  %437 = load i64* %10, align 8
  %438 = add nsw i64 %436, %437
  %439 = load i64* @jm, align 8
  %440 = sub nsw i64 %439, 1
  %441 = icmp eq i64 %438, %440
  br i1 %441, label %442, label %459

; <label>:442                                     ; preds = %435
  %443 = load i64* %5, align 8
  store i64 %443, i64* %j, align 8
  br label %444

; <label>:444                                     ; preds = %455, %442
  %445 = load i64* %j, align 8
  %446 = load i64* %6, align 8
  %447 = icmp sle i64 %445, %446
  br i1 %447, label %448, label %458

; <label>:448                                     ; preds = %444
  %449 = load i64* @jm, align 8
  %450 = sub nsw i64 %449, 1
  %451 = load i64* %j, align 8
  %452 = load [258 x double]** %3, align 8
  %453 = getelementptr inbounds [258 x double]* %452, i64 %451
  %454 = getelementptr inbounds [258 x double]* %453, i32 0, i64 %450
  store double 0.000000e+00, double* %454, align 8
  br label %455

; <label>:455                                     ; preds = %448
  %456 = load i64* %j, align 8
  %457 = add nsw i64 %456, 1
  store i64 %457, i64* %j, align 8
  br label %444

; <label>:458                                     ; preds = %444
  br label %459

; <label>:459                                     ; preds = %458, %435
  ret void
}

; Function Attrs: nounwind uwtable
define void @laplacalc([258 x double]* %x, [258 x double]* %z, i64 %firstrow, i64 %lastrow, i64 %firstcol, i64 %lastcol, i64 %numrows, i64 %numcols) #0 {
  %1 = alloca [258 x double]*, align 8
  %2 = alloca [258 x double]*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %iindex = alloca i64, align 8
  %indexp1 = alloca i64, align 8
  %indexm1 = alloca i64, align 8
  %ip1 = alloca i64, align 8
  %im1 = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store [258 x double]* %x, [258 x double]** %1, align 8
  store [258 x double]* %z, [258 x double]** %2, align 8
  store i64 %firstrow, i64* %3, align 8
  store i64 %lastrow, i64* %4, align 8
  store i64 %firstcol, i64* %5, align 8
  store i64 %lastcol, i64* %6, align 8
  store i64 %numrows, i64* %7, align 8
  store i64 %numcols, i64* %8, align 8
  %9 = load i64* %5, align 8
  store i64 %9, i64* %iindex, align 8
  br label %10

; <label>:10                                      ; preds = %75, %0
  %11 = load i64* %iindex, align 8
  %12 = load i64* %6, align 8
  %13 = icmp sle i64 %11, %12
  br i1 %13, label %14, label %78

; <label>:14                                      ; preds = %10
  %15 = load i64* %iindex, align 8
  %16 = add nsw i64 %15, 1
  store i64 %16, i64* %indexp1, align 8
  %17 = load i64* %iindex, align 8
  %18 = sub nsw i64 %17, 1
  store i64 %18, i64* %indexm1, align 8
  %19 = load i64* %3, align 8
  store i64 %19, i64* %i, align 8
  br label %20

; <label>:20                                      ; preds = %71, %14
  %21 = load i64* %i, align 8
  %22 = load i64* %4, align 8
  %23 = icmp sle i64 %21, %22
  br i1 %23, label %24, label %74

; <label>:24                                      ; preds = %20
  %25 = load i64* %i, align 8
  %26 = add nsw i64 %25, 1
  store i64 %26, i64* %ip1, align 8
  %27 = load i64* %i, align 8
  %28 = sub nsw i64 %27, 1
  store i64 %28, i64* %im1, align 8
  %29 = load double* @factlap, align 8
  %30 = load i64* %iindex, align 8
  %31 = load i64* %ip1, align 8
  %32 = load [258 x double]** %1, align 8
  %33 = getelementptr inbounds [258 x double]* %32, i64 %31
  %34 = getelementptr inbounds [258 x double]* %33, i32 0, i64 %30
  %35 = load double* %34, align 8
  %36 = load i64* %iindex, align 8
  %37 = load i64* %im1, align 8
  %38 = load [258 x double]** %1, align 8
  %39 = getelementptr inbounds [258 x double]* %38, i64 %37
  %40 = getelementptr inbounds [258 x double]* %39, i32 0, i64 %36
  %41 = load double* %40, align 8
  %42 = fadd double %35, %41
  %43 = load i64* %indexp1, align 8
  %44 = load i64* %i, align 8
  %45 = load [258 x double]** %1, align 8
  %46 = getelementptr inbounds [258 x double]* %45, i64 %44
  %47 = getelementptr inbounds [258 x double]* %46, i32 0, i64 %43
  %48 = load double* %47, align 8
  %49 = fadd double %42, %48
  %50 = load i64* %indexm1, align 8
  %51 = load i64* %i, align 8
  %52 = load [258 x double]** %1, align 8
  %53 = getelementptr inbounds [258 x double]* %52, i64 %51
  %54 = getelementptr inbounds [258 x double]* %53, i32 0, i64 %50
  %55 = load double* %54, align 8
  %56 = fadd double %49, %55
  %57 = load i64* %iindex, align 8
  %58 = load i64* %i, align 8
  %59 = load [258 x double]** %1, align 8
  %60 = getelementptr inbounds [258 x double]* %59, i64 %58
  %61 = getelementptr inbounds [258 x double]* %60, i32 0, i64 %57
  %62 = load double* %61, align 8
  %63 = fmul double 4.000000e+00, %62
  %64 = fsub double %56, %63
  %65 = fmul double %29, %64
  %66 = load i64* %iindex, align 8
  %67 = load i64* %i, align 8
  %68 = load [258 x double]** %2, align 8
  %69 = getelementptr inbounds [258 x double]* %68, i64 %67
  %70 = getelementptr inbounds [258 x double]* %69, i32 0, i64 %66
  store double %65, double* %70, align 8
  br label %71

; <label>:71                                      ; preds = %24
  %72 = load i64* %i, align 8
  %73 = add nsw i64 %72, 1
  store i64 %73, i64* %i, align 8
  br label %20

; <label>:74                                      ; preds = %20
  br label %75

; <label>:75                                      ; preds = %74
  %76 = load i64* %iindex, align 8
  %77 = add nsw i64 %76, 1
  store i64 %77, i64* %iindex, align 8
  br label %10

; <label>:78                                      ; preds = %10
  %79 = load i64* %3, align 8
  %80 = icmp eq i64 %79, 1
  br i1 %80, label %81, label %96

; <label>:81                                      ; preds = %78
  %82 = load i64* %5, align 8
  store i64 %82, i64* %j, align 8
  br label %83

; <label>:83                                      ; preds = %92, %81
  %84 = load i64* %j, align 8
  %85 = load i64* %6, align 8
  %86 = icmp sle i64 %84, %85
  br i1 %86, label %87, label %95

; <label>:87                                      ; preds = %83
  %88 = load i64* %j, align 8
  %89 = load [258 x double]** %2, align 8
  %90 = getelementptr inbounds [258 x double]* %89, i64 0
  %91 = getelementptr inbounds [258 x double]* %90, i32 0, i64 %88
  store double 0.000000e+00, double* %91, align 8
  br label %92

; <label>:92                                      ; preds = %87
  %93 = load i64* %j, align 8
  %94 = add nsw i64 %93, 1
  store i64 %94, i64* %j, align 8
  br label %83

; <label>:95                                      ; preds = %83
  br label %96

; <label>:96                                      ; preds = %95, %78
  %97 = load i64* %3, align 8
  %98 = load i64* %7, align 8
  %99 = add nsw i64 %97, %98
  %100 = load i64* @im, align 8
  %101 = sub nsw i64 %100, 1
  %102 = icmp eq i64 %99, %101
  br i1 %102, label %103, label %120

; <label>:103                                     ; preds = %96
  %104 = load i64* %5, align 8
  store i64 %104, i64* %j, align 8
  br label %105

; <label>:105                                     ; preds = %116, %103
  %106 = load i64* %j, align 8
  %107 = load i64* %6, align 8
  %108 = icmp sle i64 %106, %107
  br i1 %108, label %109, label %119

; <label>:109                                     ; preds = %105
  %110 = load i64* %j, align 8
  %111 = load i64* @im, align 8
  %112 = sub nsw i64 %111, 1
  %113 = load [258 x double]** %2, align 8
  %114 = getelementptr inbounds [258 x double]* %113, i64 %112
  %115 = getelementptr inbounds [258 x double]* %114, i32 0, i64 %110
  store double 0.000000e+00, double* %115, align 8
  br label %116

; <label>:116                                     ; preds = %109
  %117 = load i64* %j, align 8
  %118 = add nsw i64 %117, 1
  store i64 %118, i64* %j, align 8
  br label %105

; <label>:119                                     ; preds = %105
  br label %120

; <label>:120                                     ; preds = %119, %96
  %121 = load i64* %5, align 8
  %122 = icmp eq i64 %121, 1
  br i1 %122, label %123, label %138

; <label>:123                                     ; preds = %120
  %124 = load i64* %3, align 8
  store i64 %124, i64* %j, align 8
  br label %125

; <label>:125                                     ; preds = %134, %123
  %126 = load i64* %j, align 8
  %127 = load i64* %4, align 8
  %128 = icmp sle i64 %126, %127
  br i1 %128, label %129, label %137

; <label>:129                                     ; preds = %125
  %130 = load i64* %j, align 8
  %131 = load [258 x double]** %2, align 8
  %132 = getelementptr inbounds [258 x double]* %131, i64 %130
  %133 = getelementptr inbounds [258 x double]* %132, i32 0, i64 0
  store double 0.000000e+00, double* %133, align 8
  br label %134

; <label>:134                                     ; preds = %129
  %135 = load i64* %j, align 8
  %136 = add nsw i64 %135, 1
  store i64 %136, i64* %j, align 8
  br label %125

; <label>:137                                     ; preds = %125
  br label %138

; <label>:138                                     ; preds = %137, %120
  %139 = load i64* %5, align 8
  %140 = load i64* %8, align 8
  %141 = add nsw i64 %139, %140
  %142 = load i64* @jm, align 8
  %143 = sub nsw i64 %142, 1
  %144 = icmp eq i64 %141, %143
  br i1 %144, label %145, label %162

; <label>:145                                     ; preds = %138
  %146 = load i64* %3, align 8
  store i64 %146, i64* %j, align 8
  br label %147

; <label>:147                                     ; preds = %158, %145
  %148 = load i64* %j, align 8
  %149 = load i64* %4, align 8
  %150 = icmp sle i64 %148, %149
  br i1 %150, label %151, label %161

; <label>:151                                     ; preds = %147
  %152 = load i64* @jm, align 8
  %153 = sub nsw i64 %152, 1
  %154 = load i64* %j, align 8
  %155 = load [258 x double]** %2, align 8
  %156 = getelementptr inbounds [258 x double]* %155, i64 %154
  %157 = getelementptr inbounds [258 x double]* %156, i32 0, i64 %153
  store double 0.000000e+00, double* %157, align 8
  br label %158

; <label>:158                                     ; preds = %151
  %159 = load i64* %j, align 8
  %160 = add nsw i64 %159, 1
  store i64 %160, i64* %j, align 8
  br label %147

; <label>:161                                     ; preds = %147
  br label %162

; <label>:162                                     ; preds = %161, %138
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %xextra = alloca i64, align 8
  %xportion = alloca i64, align 8
  %yextra = alloca i64, align 8
  %yportion = alloca i64, align 8
  %lower = alloca i64, align 8
  %procsqrt = alloca double, align 8
  %k = alloca i64, align 8
  %logtest = alloca i64, align 8
  %my_num = alloca i64, align 8
  %computeend = alloca i64, align 8
  %min_total = alloca double, align 8
  %max_total = alloca double, align 8
  %avg_total = alloca double, align 8
  %min_multi = alloca double, align 8
  %max_multi = alloca double, align 8
  %avg_multi = alloca double, align 8
  %min_frac = alloca double, align 8
  %max_frac = alloca double, align 8
  %avg_frac = alloca double, align 8
  %ch = alloca i64, align 8
  %start = alloca i64, align 8
  %FullTime = alloca %struct.timeval, align 8
  %Error = alloca i64, align 8
  %i1 = alloca i64, align 8
  %Error2 = alloca i64, align 8
  %i3 = alloca i64, align 8
  %Error4 = alloca i64, align 8
  %FullTime5 = alloca %struct.timeval, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @gettimeofday(%struct.timeval* %FullTime, %struct.timezone* null) #6
  %5 = getelementptr inbounds %struct.timeval* %FullTime, i32 0, i32 1
  %6 = load i64* %5, align 8
  %7 = getelementptr inbounds %struct.timeval* %FullTime, i32 0, i32 0
  %8 = load i64* %7, align 8
  %9 = mul nsw i64 %8, 1000000
  %10 = add nsw i64 %6, %9
  store i64 %10, i64* %start, align 8
  br label %11

; <label>:11                                      ; preds = %79, %0
  %12 = load i32* %2, align 4
  %13 = load i8*** %3, align 8
  %14 = call i32 @getopt(i32 %12, i8** %13, i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0)) #6
  %15 = sext i32 %14 to i64
  store i64 %15, i64* %ch, align 8
  %16 = icmp ne i64 %15, -1
  br i1 %16, label %17, label %80

; <label>:17                                      ; preds = %11
  %18 = load i64* %ch, align 8
  switch i64 %18, label %79 [
    i64 110, label %19
    i64 112, label %33
    i64 101, label %46
    i64 114, label %49
    i64 116, label %52
    i64 115, label %55
    i64 111, label %61
    i64 104, label %67
  ]

; <label>:19                                      ; preds = %17
  %20 = load i8** @optarg, align 8
  %21 = call i32 @atoi(i8* %20) #7
  %22 = sext i32 %21 to i64
  store i64 %22, i64* @im, align 8
  %23 = load i64* @im, align 8
  %24 = icmp sgt i64 %23, 258
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %19
  call void @printerr(i8* getelementptr inbounds ([24 x i8]* @.str1, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:26                                      ; preds = %19
  %27 = load i64* @im, align 8
  %28 = sub nsw i64 %27, 2
  %29 = call i64 @log_2(i64 %28)
  %30 = icmp eq i64 %29, -1
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %26
  call void @printerr(i8* getelementptr inbounds ([49 x i8]* @.str2, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:32                                      ; preds = %26
  br label %79

; <label>:33                                      ; preds = %17
  %34 = load i8** @optarg, align 8
  %35 = call i32 @atoi(i8* %34) #7
  %36 = sext i32 %35 to i64
  store i64 %36, i64* @nprocs, align 8
  %37 = load i64* @nprocs, align 8
  %38 = icmp slt i64 %37, 1
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %33
  call void @printerr(i8* getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:40                                      ; preds = %33
  %41 = load i64* @nprocs, align 8
  %42 = call i64 @log_2(i64 %41)
  %43 = icmp eq i64 %42, -1
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %40
  call void @printerr(i8* getelementptr inbounds ([24 x i8]* @.str4, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:45                                      ; preds = %40
  br label %79

; <label>:46                                      ; preds = %17
  %47 = load i8** @optarg, align 8
  %48 = call double @atof(i8* %47) #7
  store double %48, double* @tolerance, align 8
  br label %79

; <label>:49                                      ; preds = %17
  %50 = load i8** @optarg, align 8
  %51 = call double @atof(i8* %50) #7
  store double %51, double* @res, align 8
  br label %79

; <label>:52                                      ; preds = %17
  %53 = load i8** @optarg, align 8
  %54 = call double @atof(i8* %53) #7
  store double %54, double* @dtau, align 8
  br label %79

; <label>:55                                      ; preds = %17
  %56 = load i64* @do_stats, align 8
  %57 = icmp ne i64 %56, 0
  %58 = xor i1 %57, true
  %59 = zext i1 %58 to i32
  %60 = sext i32 %59 to i64
  store i64 %60, i64* @do_stats, align 8
  br label %79

; <label>:61                                      ; preds = %17
  %62 = load i64* @do_output, align 8
  %63 = icmp ne i64 %62, 0
  %64 = xor i1 %63, true
  %65 = zext i1 %64 to i32
  %66 = sext i32 %65 to i64
  store i64 %66, i64* @do_output, align 8
  br label %79

; <label>:67                                      ; preds = %17
  %68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0))
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str6, i32 0, i32 0))
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([56 x i8]* @.str7, i32 0, i32 0))
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str8, i32 0, i32 0))
  %72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([55 x i8]* @.str9, i32 0, i32 0))
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([53 x i8]* @.str10, i32 0, i32 0))
  %74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str11, i32 0, i32 0))
  %75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str12, i32 0, i32 0))
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str13, i32 0, i32 0))
  %77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str14, i32 0, i32 0))
  %78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str15, i32 0, i32 0), i32 258, i32 1, double 1.000000e-07, double 2.000000e+04, double 2.880000e+04)
  call void @exit(i32 0) #8
  unreachable

; <label>:79                                      ; preds = %61, %55, %52, %49, %46, %45, %32, %17
  br label %11

; <label>:80                                      ; preds = %11
  %81 = load i64* @im, align 8
  %82 = sub nsw i64 %81, 2
  store i64 %82, i64* %logtest, align 8
  store i64 1, i64* @numlev, align 8
  br label %83

; <label>:83                                      ; preds = %91, %80
  %84 = load i64* %logtest, align 8
  %85 = icmp ne i64 %84, 1
  br i1 %85, label %86, label %96

; <label>:86                                      ; preds = %83
  %87 = load i64* %logtest, align 8
  %88 = srem i64 %87, 2
  %89 = icmp ne i64 %88, 0
  br i1 %89, label %90, label %91

; <label>:90                                      ; preds = %86
  call void @printerr(i8* getelementptr inbounds ([45 x i8]* @.str16, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:91                                      ; preds = %86
  %92 = load i64* %logtest, align 8
  %93 = sdiv i64 %92, 2
  store i64 %93, i64* %logtest, align 8
  %94 = load i64* @numlev, align 8
  %95 = add nsw i64 %94, 1
  store i64 %95, i64* @numlev, align 8
  br label %83

; <label>:96                                      ; preds = %83
  %97 = load i64* @numlev, align 8
  %98 = icmp sgt i64 %97, 9
  br i1 %98, label %99, label %100

; <label>:99                                      ; preds = %96
  call void @printerr(i8* getelementptr inbounds ([40 x i8]* @.str17, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:100                                     ; preds = %96
  %101 = load i64* @im, align 8
  store i64 %101, i64* @jm, align 8
  %102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0))
  %103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str19, i32 0, i32 0))
  %104 = load i64* @nprocs, align 8
  %105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str20, i32 0, i32 0), i64 %104)
  %106 = load i64* @im, align 8
  %107 = load i64* @jm, align 8
  %108 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str21, i32 0, i32 0), i64 %106, i64 %107)
  %109 = load double* @res, align 8
  %110 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str22, i32 0, i32 0), double %109)
  %111 = load double* @dtau, align 8
  %112 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str23, i32 0, i32 0), double %111)
  %113 = load double* @tolerance, align 8
  %114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str24, i32 0, i32 0), double %113)
  %115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0))
  %116 = load i64* @nprocs, align 8
  %117 = add nsw i64 %116, 1
  %118 = mul i64 %117, 5840
  %119 = call noalias i8* @malloc(i64 %118) #6
  %120 = bitcast i8* %119 to %struct.Global_Private*
  store %struct.Global_Private* %120, %struct.Global_Private** @gp, align 8
  store i64 0, i64* %i, align 8
  br label %121

; <label>:121                                     ; preds = %134, %100
  %122 = load i64* %i, align 8
  %123 = load i64* @nprocs, align 8
  %124 = icmp slt i64 %122, %123
  br i1 %124, label %125, label %137

; <label>:125                                     ; preds = %121
  %126 = load i64* %i, align 8
  %127 = load %struct.Global_Private** @gp, align 8
  %128 = getelementptr inbounds %struct.Global_Private* %127, i64 %126
  %129 = getelementptr inbounds %struct.Global_Private* %128, i32 0, i32 1
  store double 0.000000e+00, double* %129, align 8
  %130 = load i64* %i, align 8
  %131 = load %struct.Global_Private** @gp, align 8
  %132 = getelementptr inbounds %struct.Global_Private* %131, i64 %130
  %133 = getelementptr inbounds %struct.Global_Private* %132, i32 0, i32 2
  store double 0.000000e+00, double* %133, align 8
  br label %134

; <label>:134                                     ; preds = %125
  %135 = load i64* %i, align 8
  %136 = add nsw i64 %135, 1
  store i64 %136, i64* %i, align 8
  br label %121

; <label>:137                                     ; preds = %121
  %138 = call noalias i8* @malloc(i64 40) #6
  %139 = bitcast i8* %138 to %struct.global_struct*
  store %struct.global_struct* %139, %struct.global_struct** @global, align 8
  %140 = call noalias i8* @malloc(i64 2130048) #6
  %141 = bitcast i8* %140 to %struct.fields_struct*
  store %struct.fields_struct* %141, %struct.fields_struct** @fields, align 8
  %142 = call noalias i8* @malloc(i64 1065024) #6
  %143 = bitcast i8* %142 to %struct.fields2_struct*
  store %struct.fields2_struct* %143, %struct.fields2_struct** @fields2, align 8
  %144 = call noalias i8* @malloc(i64 1597536) #6
  %145 = bitcast i8* %144 to %struct.wrk1_struct*
  store %struct.wrk1_struct* %145, %struct.wrk1_struct** @wrk1, align 8
  %146 = call noalias i8* @malloc(i64 1597536) #6
  %147 = bitcast i8* %146 to %struct.wrk3_struct*
  store %struct.wrk3_struct* %147, %struct.wrk3_struct** @wrk3, align 8
  %148 = call noalias i8* @malloc(i64 534576) #6
  %149 = bitcast i8* %148 to %struct.wrk2_struct*
  store %struct.wrk2_struct* %149, %struct.wrk2_struct** @wrk2, align 8
  %150 = call noalias i8* @malloc(i64 2130048) #6
  %151 = bitcast i8* %150 to %struct.wrk4_struct*
  store %struct.wrk4_struct* %151, %struct.wrk4_struct** @wrk4, align 8
  %152 = call noalias i8* @malloc(i64 532512) #6
  %153 = bitcast i8* %152 to %struct.wrk6_struct*
  store %struct.wrk6_struct* %153, %struct.wrk6_struct** @wrk6, align 8
  %154 = call noalias i8* @malloc(i64 2130048) #6
  %155 = bitcast i8* %154 to %struct.wrk5_struct*
  store %struct.wrk5_struct* %155, %struct.wrk5_struct** @wrk5, align 8
  %156 = call noalias i8* @malloc(i64 532512) #6
  %157 = bitcast i8* %156 to %struct.frcng_struct*
  store %struct.frcng_struct* %157, %struct.frcng_struct** @frcng, align 8
  %158 = call noalias i8* @malloc(i64 1065032) #6
  %159 = bitcast i8* %158 to %struct.iter_struct*
  store %struct.iter_struct* %159, %struct.iter_struct** @iter, align 8
  %160 = call noalias i8* @malloc(i64 1065024) #6
  %161 = bitcast i8* %160 to %struct.guess_struct*
  store %struct.guess_struct* %161, %struct.guess_struct** @guess, align 8
  %162 = call noalias i8* @malloc(i64 9585360) #6
  %163 = bitcast i8* %162 to %struct.multi_struct*
  store %struct.multi_struct* %163, %struct.multi_struct** @multi, align 8
  %164 = call noalias i8* @malloc(i64 240) #6
  %165 = bitcast i8* %164 to %struct.locks_struct*
  store %struct.locks_struct* %165, %struct.locks_struct** @locks, align 8
  %166 = call noalias i8* @malloc(i64 104) #6
  %167 = bitcast i8* %166 to %struct.bars_struct*
  store %struct.bars_struct* %167, %struct.bars_struct** @bars, align 8
  %168 = load %struct.locks_struct** @locks, align 8
  %169 = getelementptr inbounds %struct.locks_struct* %168, i32 0, i32 0
  %170 = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %169, %union.pthread_mutexattr_t* null) #6
  %171 = load %struct.locks_struct** @locks, align 8
  %172 = getelementptr inbounds %struct.locks_struct* %171, i32 0, i32 1
  %173 = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %172, %union.pthread_mutexattr_t* null) #6
  %174 = load %struct.locks_struct** @locks, align 8
  %175 = getelementptr inbounds %struct.locks_struct* %174, i32 0, i32 2
  %176 = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %175, %union.pthread_mutexattr_t* null) #6
  %177 = load %struct.locks_struct** @locks, align 8
  %178 = getelementptr inbounds %struct.locks_struct* %177, i32 0, i32 3
  %179 = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %178, %union.pthread_mutexattr_t* null) #6
  %180 = load %struct.locks_struct** @locks, align 8
  %181 = getelementptr inbounds %struct.locks_struct* %180, i32 0, i32 4
  %182 = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %181, %union.pthread_mutexattr_t* null) #6
  %183 = load %struct.locks_struct** @locks, align 8
  %184 = getelementptr inbounds %struct.locks_struct* %183, i32 0, i32 5
  %185 = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %184, %union.pthread_mutexattr_t* null) #6
  %186 = load %struct.bars_struct** @bars, align 8
  %187 = getelementptr inbounds %struct.bars_struct* %186, i32 0, i32 0
  %188 = getelementptr inbounds %struct.anon* %187, i32 0, i32 0
  %189 = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %188, %union.pthread_mutexattr_t* null) #6
  %190 = sext i32 %189 to i64
  store i64 %190, i64* %Error, align 8
  %191 = load i64* %Error, align 8
  %192 = icmp ne i64 %191, 0
  br i1 %192, label %193, label %195

; <label>:193                                     ; preds = %137
  %194 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str25, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:195                                     ; preds = %137
  %196 = load %struct.bars_struct** @bars, align 8
  %197 = getelementptr inbounds %struct.bars_struct* %196, i32 0, i32 0
  %198 = getelementptr inbounds %struct.anon* %197, i32 0, i32 1
  %199 = call i32 @pthread_cond_init(%union.pthread_cond_t* %198, %union.pthread_condattr_t* null) #6
  %200 = sext i32 %199 to i64
  store i64 %200, i64* %Error, align 8
  %201 = load i64* %Error, align 8
  %202 = icmp ne i64 %201, 0
  br i1 %202, label %203, label %209

; <label>:203                                     ; preds = %195
  %204 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str25, i32 0, i32 0))
  %205 = load %struct.bars_struct** @bars, align 8
  %206 = getelementptr inbounds %struct.bars_struct* %205, i32 0, i32 0
  %207 = getelementptr inbounds %struct.anon* %206, i32 0, i32 0
  %208 = call i32 @pthread_mutex_destroy(%union.pthread_mutex_t* %207) #6
  call void @exit(i32 -1) #8
  unreachable

; <label>:209                                     ; preds = %195
  %210 = load %struct.bars_struct** @bars, align 8
  %211 = getelementptr inbounds %struct.bars_struct* %210, i32 0, i32 0
  %212 = getelementptr inbounds %struct.anon* %211, i32 0, i32 2
  store i64 0, i64* %212, align 8
  %213 = load %struct.bars_struct** @bars, align 8
  %214 = getelementptr inbounds %struct.bars_struct* %213, i32 0, i32 0
  %215 = getelementptr inbounds %struct.anon* %214, i32 0, i32 3
  store i64 0, i64* %215, align 8
  %216 = load i64* @im, align 8
  %217 = load i64* @numlev, align 8
  %218 = sub nsw i64 %217, 1
  %219 = getelementptr inbounds [9 x i64]* @imx, i32 0, i64 %218
  store i64 %216, i64* %219, align 8
  %220 = load i64* @jm, align 8
  %221 = load i64* @numlev, align 8
  %222 = sub nsw i64 %221, 1
  %223 = getelementptr inbounds [9 x i64]* @jmx, i32 0, i64 %222
  store i64 %220, i64* %223, align 8
  %224 = load double* @res, align 8
  %225 = load i64* @numlev, align 8
  %226 = sub nsw i64 %225, 1
  %227 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %226
  store double %224, double* %227, align 8
  %228 = load double* @tolerance, align 8
  %229 = load i64* @numlev, align 8
  %230 = sub nsw i64 %229, 1
  %231 = getelementptr inbounds [9 x double]* @lev_tol, i32 0, i64 %230
  store double %228, double* %231, align 8
  %232 = load %struct.multi_struct** @multi, align 8
  %233 = getelementptr inbounds %struct.multi_struct* %232, i32 0, i32 2
  store double 0.000000e+00, double* %233, align 8
  %234 = load %struct.multi_struct** @multi, align 8
  %235 = getelementptr inbounds %struct.multi_struct* %234, i32 0, i32 3
  store i64 0, i64* %235, align 8
  store i64 0, i64* %i, align 8
  br label %236

; <label>:236                                     ; preds = %245, %209
  %237 = load i64* %i, align 8
  %238 = load i64* @nprocs, align 8
  %239 = icmp slt i64 %237, %238
  br i1 %239, label %240, label %248

; <label>:240                                     ; preds = %236
  %241 = load i64* %i, align 8
  %242 = load %struct.multi_struct** @multi, align 8
  %243 = getelementptr inbounds %struct.multi_struct* %242, i32 0, i32 4
  %244 = getelementptr inbounds [16 x i64]* %243, i32 0, i64 %241
  store i64 0, i64* %244, align 8
  br label %245

; <label>:245                                     ; preds = %240
  %246 = load i64* %i, align 8
  %247 = add nsw i64 %246, 1
  store i64 %247, i64* %i, align 8
  br label %236

; <label>:248                                     ; preds = %236
  %249 = load i64* @numlev, align 8
  %250 = sub nsw i64 %249, 2
  store i64 %250, i64* %i, align 8
  br label %251

; <label>:251                                     ; preds = %280, %248
  %252 = load i64* %i, align 8
  %253 = icmp sge i64 %252, 0
  br i1 %253, label %254, label %283

; <label>:254                                     ; preds = %251
  %255 = load i64* %i, align 8
  %256 = add nsw i64 %255, 1
  %257 = getelementptr inbounds [9 x i64]* @imx, i32 0, i64 %256
  %258 = load i64* %257, align 8
  %259 = sub nsw i64 %258, 2
  %260 = sdiv i64 %259, 2
  %261 = add nsw i64 %260, 2
  %262 = load i64* %i, align 8
  %263 = getelementptr inbounds [9 x i64]* @imx, i32 0, i64 %262
  store i64 %261, i64* %263, align 8
  %264 = load i64* %i, align 8
  %265 = add nsw i64 %264, 1
  %266 = getelementptr inbounds [9 x i64]* @jmx, i32 0, i64 %265
  %267 = load i64* %266, align 8
  %268 = sub nsw i64 %267, 2
  %269 = sdiv i64 %268, 2
  %270 = add nsw i64 %269, 2
  %271 = load i64* %i, align 8
  %272 = getelementptr inbounds [9 x i64]* @jmx, i32 0, i64 %271
  store i64 %270, i64* %272, align 8
  %273 = load i64* %i, align 8
  %274 = add nsw i64 %273, 1
  %275 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %274
  %276 = load double* %275, align 8
  %277 = fmul double %276, 2.000000e+00
  %278 = load i64* %i, align 8
  %279 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %278
  store double %277, double* %279, align 8
  br label %280

; <label>:280                                     ; preds = %254
  %281 = load i64* %i, align 8
  %282 = add nsw i64 %281, -1
  store i64 %282, i64* %i, align 8
  br label %251

; <label>:283                                     ; preds = %251
  store i64 0, i64* @xprocs, align 8
  store i64 0, i64* @yprocs, align 8
  %284 = load i64* @nprocs, align 8
  %285 = sitofp i64 %284 to double
  %286 = call double @sqrt(double %285) #6
  store double %286, double* %procsqrt, align 8
  %287 = load double* %procsqrt, align 8
  %288 = fptosi double %287 to i64
  store i64 %288, i64* %j, align 8
  br label %289

; <label>:289                                     ; preds = %317, %283
  %290 = load i64* @xprocs, align 8
  %291 = icmp eq i64 %290, 0
  br i1 %291, label %292, label %295

; <label>:292                                     ; preds = %289
  %293 = load i64* %j, align 8
  %294 = icmp sgt i64 %293, 0
  br label %295

; <label>:295                                     ; preds = %292, %289
  %296 = phi i1 [ false, %289 ], [ %294, %292 ]
  br i1 %296, label %297, label %320

; <label>:297                                     ; preds = %295
  %298 = load i64* @nprocs, align 8
  %299 = load i64* %j, align 8
  %300 = sdiv i64 %298, %299
  store i64 %300, i64* %k, align 8
  %301 = load i64* %k, align 8
  %302 = load i64* %j, align 8
  %303 = mul nsw i64 %301, %302
  %304 = load i64* @nprocs, align 8
  %305 = icmp eq i64 %303, %304
  br i1 %305, label %306, label %317

; <label>:306                                     ; preds = %297
  %307 = load i64* %k, align 8
  %308 = load i64* %j, align 8
  %309 = icmp sgt i64 %307, %308
  br i1 %309, label %310, label %313

; <label>:310                                     ; preds = %306
  %311 = load i64* %j, align 8
  store i64 %311, i64* @xprocs, align 8
  %312 = load i64* %k, align 8
  store i64 %312, i64* @yprocs, align 8
  br label %316

; <label>:313                                     ; preds = %306
  %314 = load i64* %k, align 8
  store i64 %314, i64* @xprocs, align 8
  %315 = load i64* %j, align 8
  store i64 %315, i64* @yprocs, align 8
  br label %316

; <label>:316                                     ; preds = %313, %310
  br label %317

; <label>:317                                     ; preds = %316, %297
  %318 = load i64* %j, align 8
  %319 = add nsw i64 %318, -1
  store i64 %319, i64* %j, align 8
  br label %289

; <label>:320                                     ; preds = %295
  %321 = load i64* @xprocs, align 8
  %322 = icmp eq i64 %321, 0
  br i1 %322, label %323, label %324

; <label>:323                                     ; preds = %320
  call void @printerr(i8* getelementptr inbounds ([40 x i8]* @.str26, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:324                                     ; preds = %320
  store i64 0, i64* %i, align 8
  br label %325

; <label>:325                                     ; preds = %620, %324
  %326 = load i64* %i, align 8
  %327 = load i64* @numlev, align 8
  %328 = icmp slt i64 %326, %327
  br i1 %328, label %329, label %623

; <label>:329                                     ; preds = %325
  %330 = load i64* %i, align 8
  %331 = getelementptr inbounds [9 x i64]* @jmx, i32 0, i64 %330
  %332 = load i64* %331, align 8
  %333 = sub nsw i64 %332, 2
  %334 = load i64* @xprocs, align 8
  %335 = sdiv i64 %333, %334
  store i64 %335, i64* %xportion, align 8
  %336 = load i64* %i, align 8
  %337 = getelementptr inbounds [9 x i64]* @jmx, i32 0, i64 %336
  %338 = load i64* %337, align 8
  %339 = sub nsw i64 %338, 2
  %340 = load i64* @xprocs, align 8
  %341 = srem i64 %339, %340
  store i64 %341, i64* %xextra, align 8
  store i64 0, i64* %j, align 8
  br label %342

; <label>:342                                     ; preds = %471, %329
  %343 = load i64* %j, align 8
  %344 = load i64* @xprocs, align 8
  %345 = icmp slt i64 %343, %344
  br i1 %345, label %346, label %474

; <label>:346                                     ; preds = %342
  %347 = load i64* %xextra, align 8
  %348 = icmp eq i64 %347, 0
  br i1 %348, label %349, label %384

; <label>:349                                     ; preds = %346
  store i64 0, i64* %k, align 8
  br label %350

; <label>:350                                     ; preds = %380, %349
  %351 = load i64* %k, align 8
  %352 = load i64* @yprocs, align 8
  %353 = icmp slt i64 %351, %352
  br i1 %353, label %354, label %383

; <label>:354                                     ; preds = %350
  %355 = load i64* %j, align 8
  %356 = load i64* %xportion, align 8
  %357 = mul nsw i64 %355, %356
  %358 = add nsw i64 %357, 1
  %359 = load i64* %i, align 8
  %360 = load i64* %k, align 8
  %361 = load i64* @xprocs, align 8
  %362 = mul nsw i64 %360, %361
  %363 = load i64* %j, align 8
  %364 = add nsw i64 %362, %363
  %365 = load %struct.Global_Private** @gp, align 8
  %366 = getelementptr inbounds %struct.Global_Private* %365, i64 %364
  %367 = getelementptr inbounds %struct.Global_Private* %366, i32 0, i32 3
  %368 = getelementptr inbounds [9 x i64]* %367, i32 0, i64 %359
  store i64 %358, i64* %368, align 8
  %369 = load i64* %xportion, align 8
  %370 = load i64* %i, align 8
  %371 = load i64* %k, align 8
  %372 = load i64* @xprocs, align 8
  %373 = mul nsw i64 %371, %372
  %374 = load i64* %j, align 8
  %375 = add nsw i64 %373, %374
  %376 = load %struct.Global_Private** @gp, align 8
  %377 = getelementptr inbounds %struct.Global_Private* %376, i64 %375
  %378 = getelementptr inbounds %struct.Global_Private* %377, i32 0, i32 5
  %379 = getelementptr inbounds [9 x i64]* %378, i32 0, i64 %370
  store i64 %369, i64* %379, align 8
  br label %380

; <label>:380                                     ; preds = %354
  %381 = load i64* %k, align 8
  %382 = add nsw i64 %381, 1
  store i64 %382, i64* %k, align 8
  br label %350

; <label>:383                                     ; preds = %350
  br label %470

; <label>:384                                     ; preds = %346
  %385 = load i64* %j, align 8
  %386 = add nsw i64 %385, 1
  %387 = load i64* %xextra, align 8
  %388 = icmp sgt i64 %386, %387
  br i1 %388, label %389, label %432

; <label>:389                                     ; preds = %384
  store i64 0, i64* %k, align 8
  br label %390

; <label>:390                                     ; preds = %428, %389
  %391 = load i64* %k, align 8
  %392 = load i64* @yprocs, align 8
  %393 = icmp slt i64 %391, %392
  br i1 %393, label %394, label %431

; <label>:394                                     ; preds = %390
  %395 = load i64* %xextra, align 8
  %396 = load i64* %xportion, align 8
  %397 = add nsw i64 %396, 1
  %398 = mul nsw i64 %395, %397
  store i64 %398, i64* %lower, align 8
  %399 = load i64* %lower, align 8
  %400 = load i64* %j, align 8
  %401 = load i64* %xextra, align 8
  %402 = sub nsw i64 %400, %401
  %403 = load i64* %xportion, align 8
  %404 = mul nsw i64 %402, %403
  %405 = add nsw i64 %399, %404
  %406 = add nsw i64 %405, 1
  %407 = load i64* %i, align 8
  %408 = load i64* %k, align 8
  %409 = load i64* @xprocs, align 8
  %410 = mul nsw i64 %408, %409
  %411 = load i64* %j, align 8
  %412 = add nsw i64 %410, %411
  %413 = load %struct.Global_Private** @gp, align 8
  %414 = getelementptr inbounds %struct.Global_Private* %413, i64 %412
  %415 = getelementptr inbounds %struct.Global_Private* %414, i32 0, i32 3
  %416 = getelementptr inbounds [9 x i64]* %415, i32 0, i64 %407
  store i64 %406, i64* %416, align 8
  %417 = load i64* %xportion, align 8
  %418 = load i64* %i, align 8
  %419 = load i64* %k, align 8
  %420 = load i64* @xprocs, align 8
  %421 = mul nsw i64 %419, %420
  %422 = load i64* %j, align 8
  %423 = add nsw i64 %421, %422
  %424 = load %struct.Global_Private** @gp, align 8
  %425 = getelementptr inbounds %struct.Global_Private* %424, i64 %423
  %426 = getelementptr inbounds %struct.Global_Private* %425, i32 0, i32 5
  %427 = getelementptr inbounds [9 x i64]* %426, i32 0, i64 %418
  store i64 %417, i64* %427, align 8
  br label %428

; <label>:428                                     ; preds = %394
  %429 = load i64* %k, align 8
  %430 = add nsw i64 %429, 1
  store i64 %430, i64* %k, align 8
  br label %390

; <label>:431                                     ; preds = %390
  br label %469

; <label>:432                                     ; preds = %384
  store i64 0, i64* %k, align 8
  br label %433

; <label>:433                                     ; preds = %465, %432
  %434 = load i64* %k, align 8
  %435 = load i64* @yprocs, align 8
  %436 = icmp slt i64 %434, %435
  br i1 %436, label %437, label %468

; <label>:437                                     ; preds = %433
  %438 = load i64* %j, align 8
  %439 = load i64* %xportion, align 8
  %440 = add nsw i64 %439, 1
  %441 = mul nsw i64 %438, %440
  %442 = add nsw i64 %441, 1
  %443 = load i64* %i, align 8
  %444 = load i64* %k, align 8
  %445 = load i64* @xprocs, align 8
  %446 = mul nsw i64 %444, %445
  %447 = load i64* %j, align 8
  %448 = add nsw i64 %446, %447
  %449 = load %struct.Global_Private** @gp, align 8
  %450 = getelementptr inbounds %struct.Global_Private* %449, i64 %448
  %451 = getelementptr inbounds %struct.Global_Private* %450, i32 0, i32 3
  %452 = getelementptr inbounds [9 x i64]* %451, i32 0, i64 %443
  store i64 %442, i64* %452, align 8
  %453 = load i64* %xportion, align 8
  %454 = add nsw i64 %453, 1
  %455 = load i64* %i, align 8
  %456 = load i64* %k, align 8
  %457 = load i64* @xprocs, align 8
  %458 = mul nsw i64 %456, %457
  %459 = load i64* %j, align 8
  %460 = add nsw i64 %458, %459
  %461 = load %struct.Global_Private** @gp, align 8
  %462 = getelementptr inbounds %struct.Global_Private* %461, i64 %460
  %463 = getelementptr inbounds %struct.Global_Private* %462, i32 0, i32 5
  %464 = getelementptr inbounds [9 x i64]* %463, i32 0, i64 %455
  store i64 %454, i64* %464, align 8
  br label %465

; <label>:465                                     ; preds = %437
  %466 = load i64* %k, align 8
  %467 = add nsw i64 %466, 1
  store i64 %467, i64* %k, align 8
  br label %433

; <label>:468                                     ; preds = %433
  br label %469

; <label>:469                                     ; preds = %468, %431
  br label %470

; <label>:470                                     ; preds = %469, %383
  br label %471

; <label>:471                                     ; preds = %470
  %472 = load i64* %j, align 8
  %473 = add nsw i64 %472, 1
  store i64 %473, i64* %j, align 8
  br label %342

; <label>:474                                     ; preds = %342
  %475 = load i64* %i, align 8
  %476 = getelementptr inbounds [9 x i64]* @imx, i32 0, i64 %475
  %477 = load i64* %476, align 8
  %478 = sub nsw i64 %477, 2
  %479 = load i64* @yprocs, align 8
  %480 = sdiv i64 %478, %479
  store i64 %480, i64* %yportion, align 8
  %481 = load i64* %i, align 8
  %482 = getelementptr inbounds [9 x i64]* @imx, i32 0, i64 %481
  %483 = load i64* %482, align 8
  %484 = sub nsw i64 %483, 2
  %485 = load i64* @yprocs, align 8
  %486 = srem i64 %484, %485
  store i64 %486, i64* %yextra, align 8
  store i64 0, i64* %j, align 8
  br label %487

; <label>:487                                     ; preds = %616, %474
  %488 = load i64* %j, align 8
  %489 = load i64* @yprocs, align 8
  %490 = icmp slt i64 %488, %489
  br i1 %490, label %491, label %619

; <label>:491                                     ; preds = %487
  %492 = load i64* %yextra, align 8
  %493 = icmp eq i64 %492, 0
  br i1 %493, label %494, label %529

; <label>:494                                     ; preds = %491
  store i64 0, i64* %k, align 8
  br label %495

; <label>:495                                     ; preds = %525, %494
  %496 = load i64* %k, align 8
  %497 = load i64* @xprocs, align 8
  %498 = icmp slt i64 %496, %497
  br i1 %498, label %499, label %528

; <label>:499                                     ; preds = %495
  %500 = load i64* %j, align 8
  %501 = load i64* %yportion, align 8
  %502 = mul nsw i64 %500, %501
  %503 = add nsw i64 %502, 1
  %504 = load i64* %i, align 8
  %505 = load i64* %j, align 8
  %506 = load i64* @xprocs, align 8
  %507 = mul nsw i64 %505, %506
  %508 = load i64* %k, align 8
  %509 = add nsw i64 %507, %508
  %510 = load %struct.Global_Private** @gp, align 8
  %511 = getelementptr inbounds %struct.Global_Private* %510, i64 %509
  %512 = getelementptr inbounds %struct.Global_Private* %511, i32 0, i32 4
  %513 = getelementptr inbounds [9 x i64]* %512, i32 0, i64 %504
  store i64 %503, i64* %513, align 8
  %514 = load i64* %yportion, align 8
  %515 = load i64* %i, align 8
  %516 = load i64* %j, align 8
  %517 = load i64* @xprocs, align 8
  %518 = mul nsw i64 %516, %517
  %519 = load i64* %k, align 8
  %520 = add nsw i64 %518, %519
  %521 = load %struct.Global_Private** @gp, align 8
  %522 = getelementptr inbounds %struct.Global_Private* %521, i64 %520
  %523 = getelementptr inbounds %struct.Global_Private* %522, i32 0, i32 6
  %524 = getelementptr inbounds [9 x i64]* %523, i32 0, i64 %515
  store i64 %514, i64* %524, align 8
  br label %525

; <label>:525                                     ; preds = %499
  %526 = load i64* %k, align 8
  %527 = add nsw i64 %526, 1
  store i64 %527, i64* %k, align 8
  br label %495

; <label>:528                                     ; preds = %495
  br label %615

; <label>:529                                     ; preds = %491
  %530 = load i64* %j, align 8
  %531 = add nsw i64 %530, 1
  %532 = load i64* %yextra, align 8
  %533 = icmp sgt i64 %531, %532
  br i1 %533, label %534, label %577

; <label>:534                                     ; preds = %529
  store i64 0, i64* %k, align 8
  br label %535

; <label>:535                                     ; preds = %573, %534
  %536 = load i64* %k, align 8
  %537 = load i64* @xprocs, align 8
  %538 = icmp slt i64 %536, %537
  br i1 %538, label %539, label %576

; <label>:539                                     ; preds = %535
  %540 = load i64* %yextra, align 8
  %541 = load i64* %yportion, align 8
  %542 = add nsw i64 %541, 1
  %543 = mul nsw i64 %540, %542
  store i64 %543, i64* %lower, align 8
  %544 = load i64* %lower, align 8
  %545 = load i64* %j, align 8
  %546 = load i64* %yextra, align 8
  %547 = sub nsw i64 %545, %546
  %548 = load i64* %yportion, align 8
  %549 = mul nsw i64 %547, %548
  %550 = add nsw i64 %544, %549
  %551 = add nsw i64 %550, 1
  %552 = load i64* %i, align 8
  %553 = load i64* %j, align 8
  %554 = load i64* @xprocs, align 8
  %555 = mul nsw i64 %553, %554
  %556 = load i64* %k, align 8
  %557 = add nsw i64 %555, %556
  %558 = load %struct.Global_Private** @gp, align 8
  %559 = getelementptr inbounds %struct.Global_Private* %558, i64 %557
  %560 = getelementptr inbounds %struct.Global_Private* %559, i32 0, i32 4
  %561 = getelementptr inbounds [9 x i64]* %560, i32 0, i64 %552
  store i64 %551, i64* %561, align 8
  %562 = load i64* %yportion, align 8
  %563 = load i64* %i, align 8
  %564 = load i64* %j, align 8
  %565 = load i64* @xprocs, align 8
  %566 = mul nsw i64 %564, %565
  %567 = load i64* %k, align 8
  %568 = add nsw i64 %566, %567
  %569 = load %struct.Global_Private** @gp, align 8
  %570 = getelementptr inbounds %struct.Global_Private* %569, i64 %568
  %571 = getelementptr inbounds %struct.Global_Private* %570, i32 0, i32 6
  %572 = getelementptr inbounds [9 x i64]* %571, i32 0, i64 %563
  store i64 %562, i64* %572, align 8
  br label %573

; <label>:573                                     ; preds = %539
  %574 = load i64* %k, align 8
  %575 = add nsw i64 %574, 1
  store i64 %575, i64* %k, align 8
  br label %535

; <label>:576                                     ; preds = %535
  br label %614

; <label>:577                                     ; preds = %529
  store i64 0, i64* %k, align 8
  br label %578

; <label>:578                                     ; preds = %610, %577
  %579 = load i64* %k, align 8
  %580 = load i64* @xprocs, align 8
  %581 = icmp slt i64 %579, %580
  br i1 %581, label %582, label %613

; <label>:582                                     ; preds = %578
  %583 = load i64* %j, align 8
  %584 = load i64* %yportion, align 8
  %585 = add nsw i64 %584, 1
  %586 = mul nsw i64 %583, %585
  %587 = add nsw i64 %586, 1
  %588 = load i64* %i, align 8
  %589 = load i64* %j, align 8
  %590 = load i64* @xprocs, align 8
  %591 = mul nsw i64 %589, %590
  %592 = load i64* %k, align 8
  %593 = add nsw i64 %591, %592
  %594 = load %struct.Global_Private** @gp, align 8
  %595 = getelementptr inbounds %struct.Global_Private* %594, i64 %593
  %596 = getelementptr inbounds %struct.Global_Private* %595, i32 0, i32 4
  %597 = getelementptr inbounds [9 x i64]* %596, i32 0, i64 %588
  store i64 %587, i64* %597, align 8
  %598 = load i64* %yportion, align 8
  %599 = add nsw i64 %598, 1
  %600 = load i64* %i, align 8
  %601 = load i64* %j, align 8
  %602 = load i64* @xprocs, align 8
  %603 = mul nsw i64 %601, %602
  %604 = load i64* %k, align 8
  %605 = add nsw i64 %603, %604
  %606 = load %struct.Global_Private** @gp, align 8
  %607 = getelementptr inbounds %struct.Global_Private* %606, i64 %605
  %608 = getelementptr inbounds %struct.Global_Private* %607, i32 0, i32 6
  %609 = getelementptr inbounds [9 x i64]* %608, i32 0, i64 %600
  store i64 %599, i64* %609, align 8
  br label %610

; <label>:610                                     ; preds = %582
  %611 = load i64* %k, align 8
  %612 = add nsw i64 %611, 1
  store i64 %612, i64* %k, align 8
  br label %578

; <label>:613                                     ; preds = %578
  br label %614

; <label>:614                                     ; preds = %613, %576
  br label %615

; <label>:615                                     ; preds = %614, %528
  br label %616

; <label>:616                                     ; preds = %615
  %617 = load i64* %j, align 8
  %618 = add nsw i64 %617, 1
  store i64 %618, i64* %j, align 8
  br label %487

; <label>:619                                     ; preds = %487
  br label %620

; <label>:620                                     ; preds = %619
  %621 = load i64* %i, align 8
  %622 = add nsw i64 %621, 1
  store i64 %622, i64* %i, align 8
  br label %325

; <label>:623                                     ; preds = %325
  store double 0.000000e+00, double* getelementptr inbounds ([9 x double]* @i_int_coeff, i32 0, i64 0), align 8
  store double 0.000000e+00, double* getelementptr inbounds ([9 x double]* @j_int_coeff, i32 0, i64 0), align 8
  store i64 0, i64* %i, align 8
  br label %624

; <label>:624                                     ; preds = %645, %623
  %625 = load i64* %i, align 8
  %626 = load i64* @numlev, align 8
  %627 = icmp slt i64 %625, %626
  br i1 %627, label %628, label %648

; <label>:628                                     ; preds = %624
  %629 = load i64* %i, align 8
  %630 = getelementptr inbounds [9 x i64]* @imx, i32 0, i64 %629
  %631 = load i64* %630, align 8
  %632 = sub nsw i64 %631, 1
  %633 = sitofp i64 %632 to double
  %634 = fdiv double 1.000000e+00, %633
  %635 = load i64* %i, align 8
  %636 = getelementptr inbounds [9 x double]* @i_int_coeff, i32 0, i64 %635
  store double %634, double* %636, align 8
  %637 = load i64* %i, align 8
  %638 = getelementptr inbounds [9 x i64]* @jmx, i32 0, i64 %637
  %639 = load i64* %638, align 8
  %640 = sub nsw i64 %639, 1
  %641 = sitofp i64 %640 to double
  %642 = fdiv double 1.000000e+00, %641
  %643 = load i64* %i, align 8
  %644 = getelementptr inbounds [9 x double]* @j_int_coeff, i32 0, i64 %643
  store double %642, double* %644, align 8
  br label %645

; <label>:645                                     ; preds = %628
  %646 = load i64* %i, align 8
  %647 = add nsw i64 %646, 1
  store i64 %647, i64* %i, align 8
  br label %624

; <label>:648                                     ; preds = %624
  store i64 0, i64* %my_num, align 8
  br label %649

; <label>:649                                     ; preds = %1269, %648
  %650 = load i64* %my_num, align 8
  %651 = load i64* @nprocs, align 8
  %652 = icmp slt i64 %650, %651
  br i1 %652, label %653, label %1272

; <label>:653                                     ; preds = %649
  store i64 0, i64* %i, align 8
  br label %654

; <label>:654                                     ; preds = %1265, %653
  %655 = load i64* %i, align 8
  %656 = load i64* @numlev, align 8
  %657 = icmp slt i64 %655, %656
  br i1 %657, label %658, label %1268

; <label>:658                                     ; preds = %654
  %659 = load i64* %i, align 8
  %660 = load i64* %my_num, align 8
  %661 = load %struct.Global_Private** @gp, align 8
  %662 = getelementptr inbounds %struct.Global_Private* %661, i64 %660
  %663 = getelementptr inbounds %struct.Global_Private* %662, i32 0, i32 4
  %664 = getelementptr inbounds [9 x i64]* %663, i32 0, i64 %659
  %665 = load i64* %664, align 8
  %666 = load i64* %i, align 8
  %667 = load i64* %my_num, align 8
  %668 = load %struct.Global_Private** @gp, align 8
  %669 = getelementptr inbounds %struct.Global_Private* %668, i64 %667
  %670 = getelementptr inbounds %struct.Global_Private* %669, i32 0, i32 15
  %671 = getelementptr inbounds [9 x i64]* %670, i32 0, i64 %666
  store i64 %665, i64* %671, align 8
  %672 = load i64* %i, align 8
  %673 = load i64* %my_num, align 8
  %674 = load %struct.Global_Private** @gp, align 8
  %675 = getelementptr inbounds %struct.Global_Private* %674, i64 %673
  %676 = getelementptr inbounds %struct.Global_Private* %675, i32 0, i32 3
  %677 = getelementptr inbounds [9 x i64]* %676, i32 0, i64 %672
  %678 = load i64* %677, align 8
  %679 = load i64* %i, align 8
  %680 = load i64* %my_num, align 8
  %681 = load %struct.Global_Private** @gp, align 8
  %682 = getelementptr inbounds %struct.Global_Private* %681, i64 %680
  %683 = getelementptr inbounds %struct.Global_Private* %682, i32 0, i32 16
  %684 = getelementptr inbounds [9 x i64]* %683, i32 0, i64 %679
  store i64 %678, i64* %684, align 8
  %685 = load i64* %i, align 8
  %686 = load i64* %my_num, align 8
  %687 = load %struct.Global_Private** @gp, align 8
  %688 = getelementptr inbounds %struct.Global_Private* %687, i64 %686
  %689 = getelementptr inbounds %struct.Global_Private* %688, i32 0, i32 15
  %690 = getelementptr inbounds [9 x i64]* %689, i32 0, i64 %685
  %691 = load i64* %690, align 8
  %692 = load i64* %i, align 8
  %693 = load i64* %my_num, align 8
  %694 = load %struct.Global_Private** @gp, align 8
  %695 = getelementptr inbounds %struct.Global_Private* %694, i64 %693
  %696 = getelementptr inbounds %struct.Global_Private* %695, i32 0, i32 6
  %697 = getelementptr inbounds [9 x i64]* %696, i32 0, i64 %692
  %698 = load i64* %697, align 8
  %699 = add nsw i64 %691, %698
  %700 = sub nsw i64 %699, 1
  %701 = load i64* %i, align 8
  %702 = load i64* %my_num, align 8
  %703 = load %struct.Global_Private** @gp, align 8
  %704 = getelementptr inbounds %struct.Global_Private* %703, i64 %702
  %705 = getelementptr inbounds %struct.Global_Private* %704, i32 0, i32 17
  %706 = getelementptr inbounds [9 x i64]* %705, i32 0, i64 %701
  store i64 %700, i64* %706, align 8
  %707 = load i64* %i, align 8
  %708 = load i64* %my_num, align 8
  %709 = load %struct.Global_Private** @gp, align 8
  %710 = getelementptr inbounds %struct.Global_Private* %709, i64 %708
  %711 = getelementptr inbounds %struct.Global_Private* %710, i32 0, i32 16
  %712 = getelementptr inbounds [9 x i64]* %711, i32 0, i64 %707
  %713 = load i64* %712, align 8
  %714 = load i64* %i, align 8
  %715 = load i64* %my_num, align 8
  %716 = load %struct.Global_Private** @gp, align 8
  %717 = getelementptr inbounds %struct.Global_Private* %716, i64 %715
  %718 = getelementptr inbounds %struct.Global_Private* %717, i32 0, i32 5
  %719 = getelementptr inbounds [9 x i64]* %718, i32 0, i64 %714
  %720 = load i64* %719, align 8
  %721 = add nsw i64 %713, %720
  %722 = sub nsw i64 %721, 1
  %723 = load i64* %i, align 8
  %724 = load i64* %my_num, align 8
  %725 = load %struct.Global_Private** @gp, align 8
  %726 = getelementptr inbounds %struct.Global_Private* %725, i64 %724
  %727 = getelementptr inbounds %struct.Global_Private* %726, i32 0, i32 18
  %728 = getelementptr inbounds [9 x i64]* %727, i32 0, i64 %723
  store i64 %722, i64* %728, align 8
  %729 = load i64* %i, align 8
  %730 = load i64* %my_num, align 8
  %731 = load %struct.Global_Private** @gp, align 8
  %732 = getelementptr inbounds %struct.Global_Private* %731, i64 %730
  %733 = getelementptr inbounds %struct.Global_Private* %732, i32 0, i32 4
  %734 = getelementptr inbounds [9 x i64]* %733, i32 0, i64 %729
  %735 = load i64* %734, align 8
  %736 = load i64* %i, align 8
  %737 = load i64* %my_num, align 8
  %738 = load %struct.Global_Private** @gp, align 8
  %739 = getelementptr inbounds %struct.Global_Private* %738, i64 %737
  %740 = getelementptr inbounds %struct.Global_Private* %739, i32 0, i32 19
  %741 = getelementptr inbounds [9 x i64]* %740, i32 0, i64 %736
  store i64 %735, i64* %741, align 8
  %742 = load i64* %i, align 8
  %743 = load i64* %my_num, align 8
  %744 = load %struct.Global_Private** @gp, align 8
  %745 = getelementptr inbounds %struct.Global_Private* %744, i64 %743
  %746 = getelementptr inbounds %struct.Global_Private* %745, i32 0, i32 3
  %747 = getelementptr inbounds [9 x i64]* %746, i32 0, i64 %742
  %748 = load i64* %747, align 8
  %749 = load i64* %i, align 8
  %750 = load i64* %my_num, align 8
  %751 = load %struct.Global_Private** @gp, align 8
  %752 = getelementptr inbounds %struct.Global_Private* %751, i64 %750
  %753 = getelementptr inbounds %struct.Global_Private* %752, i32 0, i32 20
  %754 = getelementptr inbounds [9 x i64]* %753, i32 0, i64 %749
  store i64 %748, i64* %754, align 8
  %755 = load i64* %i, align 8
  %756 = load i64* %my_num, align 8
  %757 = load %struct.Global_Private** @gp, align 8
  %758 = getelementptr inbounds %struct.Global_Private* %757, i64 %756
  %759 = getelementptr inbounds %struct.Global_Private* %758, i32 0, i32 19
  %760 = getelementptr inbounds [9 x i64]* %759, i32 0, i64 %755
  %761 = load i64* %760, align 8
  %762 = load i64* %i, align 8
  %763 = load i64* %my_num, align 8
  %764 = load %struct.Global_Private** @gp, align 8
  %765 = getelementptr inbounds %struct.Global_Private* %764, i64 %763
  %766 = getelementptr inbounds %struct.Global_Private* %765, i32 0, i32 6
  %767 = getelementptr inbounds [9 x i64]* %766, i32 0, i64 %762
  %768 = load i64* %767, align 8
  %769 = add nsw i64 %761, %768
  %770 = sub nsw i64 %769, 1
  %771 = load i64* %i, align 8
  %772 = load i64* %my_num, align 8
  %773 = load %struct.Global_Private** @gp, align 8
  %774 = getelementptr inbounds %struct.Global_Private* %773, i64 %772
  %775 = getelementptr inbounds %struct.Global_Private* %774, i32 0, i32 21
  %776 = getelementptr inbounds [9 x i64]* %775, i32 0, i64 %771
  store i64 %770, i64* %776, align 8
  %777 = load i64* %i, align 8
  %778 = load i64* %my_num, align 8
  %779 = load %struct.Global_Private** @gp, align 8
  %780 = getelementptr inbounds %struct.Global_Private* %779, i64 %778
  %781 = getelementptr inbounds %struct.Global_Private* %780, i32 0, i32 20
  %782 = getelementptr inbounds [9 x i64]* %781, i32 0, i64 %777
  %783 = load i64* %782, align 8
  %784 = load i64* %i, align 8
  %785 = load i64* %my_num, align 8
  %786 = load %struct.Global_Private** @gp, align 8
  %787 = getelementptr inbounds %struct.Global_Private* %786, i64 %785
  %788 = getelementptr inbounds %struct.Global_Private* %787, i32 0, i32 5
  %789 = getelementptr inbounds [9 x i64]* %788, i32 0, i64 %784
  %790 = load i64* %789, align 8
  %791 = add nsw i64 %783, %790
  %792 = sub nsw i64 %791, 1
  %793 = load i64* %i, align 8
  %794 = load i64* %my_num, align 8
  %795 = load %struct.Global_Private** @gp, align 8
  %796 = getelementptr inbounds %struct.Global_Private* %795, i64 %794
  %797 = getelementptr inbounds %struct.Global_Private* %796, i32 0, i32 22
  %798 = getelementptr inbounds [9 x i64]* %797, i32 0, i64 %793
  store i64 %792, i64* %798, align 8
  %799 = load i64* %i, align 8
  %800 = load i64* %my_num, align 8
  %801 = load %struct.Global_Private** @gp, align 8
  %802 = getelementptr inbounds %struct.Global_Private* %801, i64 %800
  %803 = getelementptr inbounds %struct.Global_Private* %802, i32 0, i32 4
  %804 = getelementptr inbounds [9 x i64]* %803, i32 0, i64 %799
  %805 = load i64* %804, align 8
  %806 = load i64* %i, align 8
  %807 = load i64* %my_num, align 8
  %808 = load %struct.Global_Private** @gp, align 8
  %809 = getelementptr inbounds %struct.Global_Private* %808, i64 %807
  %810 = getelementptr inbounds %struct.Global_Private* %809, i32 0, i32 23
  %811 = getelementptr inbounds [9 x i64]* %810, i32 0, i64 %806
  store i64 %805, i64* %811, align 8
  %812 = load i64* %i, align 8
  %813 = load i64* %my_num, align 8
  %814 = load %struct.Global_Private** @gp, align 8
  %815 = getelementptr inbounds %struct.Global_Private* %814, i64 %813
  %816 = getelementptr inbounds %struct.Global_Private* %815, i32 0, i32 3
  %817 = getelementptr inbounds [9 x i64]* %816, i32 0, i64 %812
  %818 = load i64* %817, align 8
  %819 = load i64* %i, align 8
  %820 = load i64* %my_num, align 8
  %821 = load %struct.Global_Private** @gp, align 8
  %822 = getelementptr inbounds %struct.Global_Private* %821, i64 %820
  %823 = getelementptr inbounds %struct.Global_Private* %822, i32 0, i32 24
  %824 = getelementptr inbounds [9 x i64]* %823, i32 0, i64 %819
  store i64 %818, i64* %824, align 8
  %825 = load i64* %i, align 8
  %826 = load i64* %my_num, align 8
  %827 = load %struct.Global_Private** @gp, align 8
  %828 = getelementptr inbounds %struct.Global_Private* %827, i64 %826
  %829 = getelementptr inbounds %struct.Global_Private* %828, i32 0, i32 23
  %830 = getelementptr inbounds [9 x i64]* %829, i32 0, i64 %825
  %831 = load i64* %830, align 8
  %832 = load i64* %i, align 8
  %833 = load i64* %my_num, align 8
  %834 = load %struct.Global_Private** @gp, align 8
  %835 = getelementptr inbounds %struct.Global_Private* %834, i64 %833
  %836 = getelementptr inbounds %struct.Global_Private* %835, i32 0, i32 6
  %837 = getelementptr inbounds [9 x i64]* %836, i32 0, i64 %832
  %838 = load i64* %837, align 8
  %839 = add nsw i64 %831, %838
  %840 = sub nsw i64 %839, 1
  %841 = load i64* %i, align 8
  %842 = load i64* %my_num, align 8
  %843 = load %struct.Global_Private** @gp, align 8
  %844 = getelementptr inbounds %struct.Global_Private* %843, i64 %842
  %845 = getelementptr inbounds %struct.Global_Private* %844, i32 0, i32 25
  %846 = getelementptr inbounds [9 x i64]* %845, i32 0, i64 %841
  store i64 %840, i64* %846, align 8
  %847 = load i64* %i, align 8
  %848 = load i64* %my_num, align 8
  %849 = load %struct.Global_Private** @gp, align 8
  %850 = getelementptr inbounds %struct.Global_Private* %849, i64 %848
  %851 = getelementptr inbounds %struct.Global_Private* %850, i32 0, i32 24
  %852 = getelementptr inbounds [9 x i64]* %851, i32 0, i64 %847
  %853 = load i64* %852, align 8
  %854 = load i64* %i, align 8
  %855 = load i64* %my_num, align 8
  %856 = load %struct.Global_Private** @gp, align 8
  %857 = getelementptr inbounds %struct.Global_Private* %856, i64 %855
  %858 = getelementptr inbounds %struct.Global_Private* %857, i32 0, i32 5
  %859 = getelementptr inbounds [9 x i64]* %858, i32 0, i64 %854
  %860 = load i64* %859, align 8
  %861 = add nsw i64 %853, %860
  %862 = sub nsw i64 %861, 1
  %863 = load i64* %i, align 8
  %864 = load i64* %my_num, align 8
  %865 = load %struct.Global_Private** @gp, align 8
  %866 = getelementptr inbounds %struct.Global_Private* %865, i64 %864
  %867 = getelementptr inbounds %struct.Global_Private* %866, i32 0, i32 26
  %868 = getelementptr inbounds [9 x i64]* %867, i32 0, i64 %863
  store i64 %862, i64* %868, align 8
  %869 = load i64* %i, align 8
  %870 = load i64* %my_num, align 8
  %871 = load %struct.Global_Private** @gp, align 8
  %872 = getelementptr inbounds %struct.Global_Private* %871, i64 %870
  %873 = getelementptr inbounds %struct.Global_Private* %872, i32 0, i32 23
  %874 = getelementptr inbounds [9 x i64]* %873, i32 0, i64 %869
  %875 = load i64* %874, align 8
  %876 = icmp eq i64 %875, 1
  br i1 %876, label %877, label %884

; <label>:877                                     ; preds = %658
  %878 = load i64* %i, align 8
  %879 = load i64* %my_num, align 8
  %880 = load %struct.Global_Private** @gp, align 8
  %881 = getelementptr inbounds %struct.Global_Private* %880, i64 %879
  %882 = getelementptr inbounds %struct.Global_Private* %881, i32 0, i32 23
  %883 = getelementptr inbounds [9 x i64]* %882, i32 0, i64 %878
  store i64 0, i64* %883, align 8
  br label %884

; <label>:884                                     ; preds = %877, %658
  %885 = load i64* %i, align 8
  %886 = load i64* %my_num, align 8
  %887 = load %struct.Global_Private** @gp, align 8
  %888 = getelementptr inbounds %struct.Global_Private* %887, i64 %886
  %889 = getelementptr inbounds %struct.Global_Private* %888, i32 0, i32 24
  %890 = getelementptr inbounds [9 x i64]* %889, i32 0, i64 %885
  %891 = load i64* %890, align 8
  %892 = icmp eq i64 %891, 1
  br i1 %892, label %893, label %900

; <label>:893                                     ; preds = %884
  %894 = load i64* %i, align 8
  %895 = load i64* %my_num, align 8
  %896 = load %struct.Global_Private** @gp, align 8
  %897 = getelementptr inbounds %struct.Global_Private* %896, i64 %895
  %898 = getelementptr inbounds %struct.Global_Private* %897, i32 0, i32 24
  %899 = getelementptr inbounds [9 x i64]* %898, i32 0, i64 %894
  store i64 0, i64* %899, align 8
  br label %900

; <label>:900                                     ; preds = %893, %884
  %901 = load i64* %i, align 8
  %902 = load i64* %my_num, align 8
  %903 = load %struct.Global_Private** @gp, align 8
  %904 = getelementptr inbounds %struct.Global_Private* %903, i64 %902
  %905 = getelementptr inbounds %struct.Global_Private* %904, i32 0, i32 25
  %906 = getelementptr inbounds [9 x i64]* %905, i32 0, i64 %901
  %907 = load i64* %906, align 8
  %908 = load i64* %i, align 8
  %909 = getelementptr inbounds [9 x i64]* @imx, i32 0, i64 %908
  %910 = load i64* %909, align 8
  %911 = sub nsw i64 %910, 2
  %912 = icmp eq i64 %907, %911
  br i1 %912, label %913, label %924

; <label>:913                                     ; preds = %900
  %914 = load i64* %i, align 8
  %915 = getelementptr inbounds [9 x i64]* @imx, i32 0, i64 %914
  %916 = load i64* %915, align 8
  %917 = sub nsw i64 %916, 1
  %918 = load i64* %i, align 8
  %919 = load i64* %my_num, align 8
  %920 = load %struct.Global_Private** @gp, align 8
  %921 = getelementptr inbounds %struct.Global_Private* %920, i64 %919
  %922 = getelementptr inbounds %struct.Global_Private* %921, i32 0, i32 25
  %923 = getelementptr inbounds [9 x i64]* %922, i32 0, i64 %918
  store i64 %917, i64* %923, align 8
  br label %924

; <label>:924                                     ; preds = %913, %900
  %925 = load i64* %i, align 8
  %926 = load i64* %my_num, align 8
  %927 = load %struct.Global_Private** @gp, align 8
  %928 = getelementptr inbounds %struct.Global_Private* %927, i64 %926
  %929 = getelementptr inbounds %struct.Global_Private* %928, i32 0, i32 26
  %930 = getelementptr inbounds [9 x i64]* %929, i32 0, i64 %925
  %931 = load i64* %930, align 8
  %932 = load i64* %i, align 8
  %933 = getelementptr inbounds [9 x i64]* @jmx, i32 0, i64 %932
  %934 = load i64* %933, align 8
  %935 = sub nsw i64 %934, 2
  %936 = icmp eq i64 %931, %935
  br i1 %936, label %937, label %948

; <label>:937                                     ; preds = %924
  %938 = load i64* %i, align 8
  %939 = getelementptr inbounds [9 x i64]* @jmx, i32 0, i64 %938
  %940 = load i64* %939, align 8
  %941 = sub nsw i64 %940, 1
  %942 = load i64* %i, align 8
  %943 = load i64* %my_num, align 8
  %944 = load %struct.Global_Private** @gp, align 8
  %945 = getelementptr inbounds %struct.Global_Private* %944, i64 %943
  %946 = getelementptr inbounds %struct.Global_Private* %945, i32 0, i32 26
  %947 = getelementptr inbounds [9 x i64]* %946, i32 0, i64 %942
  store i64 %941, i64* %947, align 8
  br label %948

; <label>:948                                     ; preds = %937, %924
  %949 = load i64* %i, align 8
  %950 = load i64* %my_num, align 8
  %951 = load %struct.Global_Private** @gp, align 8
  %952 = getelementptr inbounds %struct.Global_Private* %951, i64 %950
  %953 = getelementptr inbounds %struct.Global_Private* %952, i32 0, i32 15
  %954 = getelementptr inbounds [9 x i64]* %953, i32 0, i64 %949
  %955 = load i64* %954, align 8
  %956 = srem i64 %955, 2
  %957 = icmp eq i64 %956, 0
  br i1 %957, label %958, label %986

; <label>:958                                     ; preds = %948
  %959 = load i64* %i, align 8
  %960 = load i64* %my_num, align 8
  %961 = load %struct.Global_Private** @gp, align 8
  %962 = getelementptr inbounds %struct.Global_Private* %961, i64 %960
  %963 = getelementptr inbounds %struct.Global_Private* %962, i32 0, i32 15
  %964 = getelementptr inbounds [9 x i64]* %963, i32 0, i64 %959
  %965 = load i64* %964, align 8
  %966 = load i64* %i, align 8
  %967 = load i64* %my_num, align 8
  %968 = load %struct.Global_Private** @gp, align 8
  %969 = getelementptr inbounds %struct.Global_Private* %968, i64 %967
  %970 = getelementptr inbounds %struct.Global_Private* %969, i32 0, i32 7
  %971 = getelementptr inbounds [9 x i64]* %970, i32 0, i64 %966
  store i64 %965, i64* %971, align 8
  %972 = load i64* %i, align 8
  %973 = load i64* %my_num, align 8
  %974 = load %struct.Global_Private** @gp, align 8
  %975 = getelementptr inbounds %struct.Global_Private* %974, i64 %973
  %976 = getelementptr inbounds %struct.Global_Private* %975, i32 0, i32 15
  %977 = getelementptr inbounds [9 x i64]* %976, i32 0, i64 %972
  %978 = load i64* %977, align 8
  %979 = add nsw i64 %978, 1
  %980 = load i64* %i, align 8
  %981 = load i64* %my_num, align 8
  %982 = load %struct.Global_Private** @gp, align 8
  %983 = getelementptr inbounds %struct.Global_Private* %982, i64 %981
  %984 = getelementptr inbounds %struct.Global_Private* %983, i32 0, i32 9
  %985 = getelementptr inbounds [9 x i64]* %984, i32 0, i64 %980
  store i64 %979, i64* %985, align 8
  br label %1014

; <label>:986                                     ; preds = %948
  %987 = load i64* %i, align 8
  %988 = load i64* %my_num, align 8
  %989 = load %struct.Global_Private** @gp, align 8
  %990 = getelementptr inbounds %struct.Global_Private* %989, i64 %988
  %991 = getelementptr inbounds %struct.Global_Private* %990, i32 0, i32 15
  %992 = getelementptr inbounds [9 x i64]* %991, i32 0, i64 %987
  %993 = load i64* %992, align 8
  %994 = add nsw i64 %993, 1
  %995 = load i64* %i, align 8
  %996 = load i64* %my_num, align 8
  %997 = load %struct.Global_Private** @gp, align 8
  %998 = getelementptr inbounds %struct.Global_Private* %997, i64 %996
  %999 = getelementptr inbounds %struct.Global_Private* %998, i32 0, i32 7
  %1000 = getelementptr inbounds [9 x i64]* %999, i32 0, i64 %995
  store i64 %994, i64* %1000, align 8
  %1001 = load i64* %i, align 8
  %1002 = load i64* %my_num, align 8
  %1003 = load %struct.Global_Private** @gp, align 8
  %1004 = getelementptr inbounds %struct.Global_Private* %1003, i64 %1002
  %1005 = getelementptr inbounds %struct.Global_Private* %1004, i32 0, i32 15
  %1006 = getelementptr inbounds [9 x i64]* %1005, i32 0, i64 %1001
  %1007 = load i64* %1006, align 8
  %1008 = load i64* %i, align 8
  %1009 = load i64* %my_num, align 8
  %1010 = load %struct.Global_Private** @gp, align 8
  %1011 = getelementptr inbounds %struct.Global_Private* %1010, i64 %1009
  %1012 = getelementptr inbounds %struct.Global_Private* %1011, i32 0, i32 9
  %1013 = getelementptr inbounds [9 x i64]* %1012, i32 0, i64 %1008
  store i64 %1007, i64* %1013, align 8
  br label %1014

; <label>:1014                                    ; preds = %986, %958
  %1015 = load i64* %i, align 8
  %1016 = load i64* %my_num, align 8
  %1017 = load %struct.Global_Private** @gp, align 8
  %1018 = getelementptr inbounds %struct.Global_Private* %1017, i64 %1016
  %1019 = getelementptr inbounds %struct.Global_Private* %1018, i32 0, i32 16
  %1020 = getelementptr inbounds [9 x i64]* %1019, i32 0, i64 %1015
  %1021 = load i64* %1020, align 8
  %1022 = srem i64 %1021, 2
  %1023 = icmp eq i64 %1022, 0
  br i1 %1023, label %1024, label %1052

; <label>:1024                                    ; preds = %1014
  %1025 = load i64* %i, align 8
  %1026 = load i64* %my_num, align 8
  %1027 = load %struct.Global_Private** @gp, align 8
  %1028 = getelementptr inbounds %struct.Global_Private* %1027, i64 %1026
  %1029 = getelementptr inbounds %struct.Global_Private* %1028, i32 0, i32 16
  %1030 = getelementptr inbounds [9 x i64]* %1029, i32 0, i64 %1025
  %1031 = load i64* %1030, align 8
  %1032 = load i64* %i, align 8
  %1033 = load i64* %my_num, align 8
  %1034 = load %struct.Global_Private** @gp, align 8
  %1035 = getelementptr inbounds %struct.Global_Private* %1034, i64 %1033
  %1036 = getelementptr inbounds %struct.Global_Private* %1035, i32 0, i32 8
  %1037 = getelementptr inbounds [9 x i64]* %1036, i32 0, i64 %1032
  store i64 %1031, i64* %1037, align 8
  %1038 = load i64* %i, align 8
  %1039 = load i64* %my_num, align 8
  %1040 = load %struct.Global_Private** @gp, align 8
  %1041 = getelementptr inbounds %struct.Global_Private* %1040, i64 %1039
  %1042 = getelementptr inbounds %struct.Global_Private* %1041, i32 0, i32 16
  %1043 = getelementptr inbounds [9 x i64]* %1042, i32 0, i64 %1038
  %1044 = load i64* %1043, align 8
  %1045 = add nsw i64 %1044, 1
  %1046 = load i64* %i, align 8
  %1047 = load i64* %my_num, align 8
  %1048 = load %struct.Global_Private** @gp, align 8
  %1049 = getelementptr inbounds %struct.Global_Private* %1048, i64 %1047
  %1050 = getelementptr inbounds %struct.Global_Private* %1049, i32 0, i32 10
  %1051 = getelementptr inbounds [9 x i64]* %1050, i32 0, i64 %1046
  store i64 %1045, i64* %1051, align 8
  br label %1080

; <label>:1052                                    ; preds = %1014
  %1053 = load i64* %i, align 8
  %1054 = load i64* %my_num, align 8
  %1055 = load %struct.Global_Private** @gp, align 8
  %1056 = getelementptr inbounds %struct.Global_Private* %1055, i64 %1054
  %1057 = getelementptr inbounds %struct.Global_Private* %1056, i32 0, i32 16
  %1058 = getelementptr inbounds [9 x i64]* %1057, i32 0, i64 %1053
  %1059 = load i64* %1058, align 8
  %1060 = add nsw i64 %1059, 1
  %1061 = load i64* %i, align 8
  %1062 = load i64* %my_num, align 8
  %1063 = load %struct.Global_Private** @gp, align 8
  %1064 = getelementptr inbounds %struct.Global_Private* %1063, i64 %1062
  %1065 = getelementptr inbounds %struct.Global_Private* %1064, i32 0, i32 8
  %1066 = getelementptr inbounds [9 x i64]* %1065, i32 0, i64 %1061
  store i64 %1060, i64* %1066, align 8
  %1067 = load i64* %i, align 8
  %1068 = load i64* %my_num, align 8
  %1069 = load %struct.Global_Private** @gp, align 8
  %1070 = getelementptr inbounds %struct.Global_Private* %1069, i64 %1068
  %1071 = getelementptr inbounds %struct.Global_Private* %1070, i32 0, i32 16
  %1072 = getelementptr inbounds [9 x i64]* %1071, i32 0, i64 %1067
  %1073 = load i64* %1072, align 8
  %1074 = load i64* %i, align 8
  %1075 = load i64* %my_num, align 8
  %1076 = load %struct.Global_Private** @gp, align 8
  %1077 = getelementptr inbounds %struct.Global_Private* %1076, i64 %1075
  %1078 = getelementptr inbounds %struct.Global_Private* %1077, i32 0, i32 10
  %1079 = getelementptr inbounds [9 x i64]* %1078, i32 0, i64 %1074
  store i64 %1073, i64* %1079, align 8
  br label %1080

; <label>:1080                                    ; preds = %1052, %1024
  %1081 = load i64* %i, align 8
  %1082 = load i64* %my_num, align 8
  %1083 = load %struct.Global_Private** @gp, align 8
  %1084 = getelementptr inbounds %struct.Global_Private* %1083, i64 %1082
  %1085 = getelementptr inbounds %struct.Global_Private* %1084, i32 0, i32 17
  %1086 = getelementptr inbounds [9 x i64]* %1085, i32 0, i64 %1081
  %1087 = load i64* %1086, align 8
  %1088 = load i64* %i, align 8
  %1089 = getelementptr inbounds [9 x i64]* @imx, i32 0, i64 %1088
  %1090 = load i64* %1089, align 8
  %1091 = sub nsw i64 %1090, 2
  %1092 = icmp eq i64 %1087, %1091
  br i1 %1092, label %1093, label %1172

; <label>:1093                                    ; preds = %1080
  %1094 = load i64* %i, align 8
  %1095 = load i64* %my_num, align 8
  %1096 = load %struct.Global_Private** @gp, align 8
  %1097 = getelementptr inbounds %struct.Global_Private* %1096, i64 %1095
  %1098 = getelementptr inbounds %struct.Global_Private* %1097, i32 0, i32 17
  %1099 = getelementptr inbounds [9 x i64]* %1098, i32 0, i64 %1094
  %1100 = load i64* %1099, align 8
  %1101 = sub nsw i64 %1100, 1
  %1102 = load i64* %i, align 8
  %1103 = load i64* %my_num, align 8
  %1104 = load %struct.Global_Private** @gp, align 8
  %1105 = getelementptr inbounds %struct.Global_Private* %1104, i64 %1103
  %1106 = getelementptr inbounds %struct.Global_Private* %1105, i32 0, i32 17
  %1107 = getelementptr inbounds [9 x i64]* %1106, i32 0, i64 %1102
  store i64 %1101, i64* %1107, align 8
  %1108 = load i64* %i, align 8
  %1109 = load i64* %my_num, align 8
  %1110 = load %struct.Global_Private** @gp, align 8
  %1111 = getelementptr inbounds %struct.Global_Private* %1110, i64 %1109
  %1112 = getelementptr inbounds %struct.Global_Private* %1111, i32 0, i32 17
  %1113 = getelementptr inbounds [9 x i64]* %1112, i32 0, i64 %1108
  %1114 = load i64* %1113, align 8
  %1115 = srem i64 %1114, 2
  %1116 = icmp eq i64 %1115, 0
  br i1 %1116, label %1117, label %1144

; <label>:1117                                    ; preds = %1093
  %1118 = load i64* %i, align 8
  %1119 = load i64* %my_num, align 8
  %1120 = load %struct.Global_Private** @gp, align 8
  %1121 = getelementptr inbounds %struct.Global_Private* %1120, i64 %1119
  %1122 = getelementptr inbounds %struct.Global_Private* %1121, i32 0, i32 10
  %1123 = getelementptr inbounds [9 x i64]* %1122, i32 0, i64 %1118
  %1124 = load i64* %1123, align 8
  %1125 = load i64* %i, align 8
  %1126 = load i64* %my_num, align 8
  %1127 = load %struct.Global_Private** @gp, align 8
  %1128 = getelementptr inbounds %struct.Global_Private* %1127, i64 %1126
  %1129 = getelementptr inbounds %struct.Global_Private* %1128, i32 0, i32 14
  %1130 = getelementptr inbounds [9 x i64]* %1129, i32 0, i64 %1125
  store i64 %1124, i64* %1130, align 8
  %1131 = load i64* %i, align 8
  %1132 = load i64* %my_num, align 8
  %1133 = load %struct.Global_Private** @gp, align 8
  %1134 = getelementptr inbounds %struct.Global_Private* %1133, i64 %1132
  %1135 = getelementptr inbounds %struct.Global_Private* %1134, i32 0, i32 8
  %1136 = getelementptr inbounds [9 x i64]* %1135, i32 0, i64 %1131
  %1137 = load i64* %1136, align 8
  %1138 = load i64* %i, align 8
  %1139 = load i64* %my_num, align 8
  %1140 = load %struct.Global_Private** @gp, align 8
  %1141 = getelementptr inbounds %struct.Global_Private* %1140, i64 %1139
  %1142 = getelementptr inbounds %struct.Global_Private* %1141, i32 0, i32 12
  %1143 = getelementptr inbounds [9 x i64]* %1142, i32 0, i64 %1138
  store i64 %1137, i64* %1143, align 8
  br label %1171

; <label>:1144                                    ; preds = %1093
  %1145 = load i64* %i, align 8
  %1146 = load i64* %my_num, align 8
  %1147 = load %struct.Global_Private** @gp, align 8
  %1148 = getelementptr inbounds %struct.Global_Private* %1147, i64 %1146
  %1149 = getelementptr inbounds %struct.Global_Private* %1148, i32 0, i32 8
  %1150 = getelementptr inbounds [9 x i64]* %1149, i32 0, i64 %1145
  %1151 = load i64* %1150, align 8
  %1152 = load i64* %i, align 8
  %1153 = load i64* %my_num, align 8
  %1154 = load %struct.Global_Private** @gp, align 8
  %1155 = getelementptr inbounds %struct.Global_Private* %1154, i64 %1153
  %1156 = getelementptr inbounds %struct.Global_Private* %1155, i32 0, i32 14
  %1157 = getelementptr inbounds [9 x i64]* %1156, i32 0, i64 %1152
  store i64 %1151, i64* %1157, align 8
  %1158 = load i64* %i, align 8
  %1159 = load i64* %my_num, align 8
  %1160 = load %struct.Global_Private** @gp, align 8
  %1161 = getelementptr inbounds %struct.Global_Private* %1160, i64 %1159
  %1162 = getelementptr inbounds %struct.Global_Private* %1161, i32 0, i32 10
  %1163 = getelementptr inbounds [9 x i64]* %1162, i32 0, i64 %1158
  %1164 = load i64* %1163, align 8
  %1165 = load i64* %i, align 8
  %1166 = load i64* %my_num, align 8
  %1167 = load %struct.Global_Private** @gp, align 8
  %1168 = getelementptr inbounds %struct.Global_Private* %1167, i64 %1166
  %1169 = getelementptr inbounds %struct.Global_Private* %1168, i32 0, i32 12
  %1170 = getelementptr inbounds [9 x i64]* %1169, i32 0, i64 %1165
  store i64 %1164, i64* %1170, align 8
  br label %1171

; <label>:1171                                    ; preds = %1144, %1117
  br label %1172

; <label>:1172                                    ; preds = %1171, %1080
  %1173 = load i64* %i, align 8
  %1174 = load i64* %my_num, align 8
  %1175 = load %struct.Global_Private** @gp, align 8
  %1176 = getelementptr inbounds %struct.Global_Private* %1175, i64 %1174
  %1177 = getelementptr inbounds %struct.Global_Private* %1176, i32 0, i32 18
  %1178 = getelementptr inbounds [9 x i64]* %1177, i32 0, i64 %1173
  %1179 = load i64* %1178, align 8
  %1180 = load i64* %i, align 8
  %1181 = getelementptr inbounds [9 x i64]* @jmx, i32 0, i64 %1180
  %1182 = load i64* %1181, align 8
  %1183 = sub nsw i64 %1182, 2
  %1184 = icmp eq i64 %1179, %1183
  br i1 %1184, label %1185, label %1264

; <label>:1185                                    ; preds = %1172
  %1186 = load i64* %i, align 8
  %1187 = load i64* %my_num, align 8
  %1188 = load %struct.Global_Private** @gp, align 8
  %1189 = getelementptr inbounds %struct.Global_Private* %1188, i64 %1187
  %1190 = getelementptr inbounds %struct.Global_Private* %1189, i32 0, i32 18
  %1191 = getelementptr inbounds [9 x i64]* %1190, i32 0, i64 %1186
  %1192 = load i64* %1191, align 8
  %1193 = sub nsw i64 %1192, 1
  %1194 = load i64* %i, align 8
  %1195 = load i64* %my_num, align 8
  %1196 = load %struct.Global_Private** @gp, align 8
  %1197 = getelementptr inbounds %struct.Global_Private* %1196, i64 %1195
  %1198 = getelementptr inbounds %struct.Global_Private* %1197, i32 0, i32 18
  %1199 = getelementptr inbounds [9 x i64]* %1198, i32 0, i64 %1194
  store i64 %1193, i64* %1199, align 8
  %1200 = load i64* %i, align 8
  %1201 = load i64* %my_num, align 8
  %1202 = load %struct.Global_Private** @gp, align 8
  %1203 = getelementptr inbounds %struct.Global_Private* %1202, i64 %1201
  %1204 = getelementptr inbounds %struct.Global_Private* %1203, i32 0, i32 18
  %1205 = getelementptr inbounds [9 x i64]* %1204, i32 0, i64 %1200
  %1206 = load i64* %1205, align 8
  %1207 = srem i64 %1206, 2
  %1208 = icmp eq i64 %1207, 0
  br i1 %1208, label %1209, label %1236

; <label>:1209                                    ; preds = %1185
  %1210 = load i64* %i, align 8
  %1211 = load i64* %my_num, align 8
  %1212 = load %struct.Global_Private** @gp, align 8
  %1213 = getelementptr inbounds %struct.Global_Private* %1212, i64 %1211
  %1214 = getelementptr inbounds %struct.Global_Private* %1213, i32 0, i32 9
  %1215 = getelementptr inbounds [9 x i64]* %1214, i32 0, i64 %1210
  %1216 = load i64* %1215, align 8
  %1217 = load i64* %i, align 8
  %1218 = load i64* %my_num, align 8
  %1219 = load %struct.Global_Private** @gp, align 8
  %1220 = getelementptr inbounds %struct.Global_Private* %1219, i64 %1218
  %1221 = getelementptr inbounds %struct.Global_Private* %1220, i32 0, i32 13
  %1222 = getelementptr inbounds [9 x i64]* %1221, i32 0, i64 %1217
  store i64 %1216, i64* %1222, align 8
  %1223 = load i64* %i, align 8
  %1224 = load i64* %my_num, align 8
  %1225 = load %struct.Global_Private** @gp, align 8
  %1226 = getelementptr inbounds %struct.Global_Private* %1225, i64 %1224
  %1227 = getelementptr inbounds %struct.Global_Private* %1226, i32 0, i32 7
  %1228 = getelementptr inbounds [9 x i64]* %1227, i32 0, i64 %1223
  %1229 = load i64* %1228, align 8
  %1230 = load i64* %i, align 8
  %1231 = load i64* %my_num, align 8
  %1232 = load %struct.Global_Private** @gp, align 8
  %1233 = getelementptr inbounds %struct.Global_Private* %1232, i64 %1231
  %1234 = getelementptr inbounds %struct.Global_Private* %1233, i32 0, i32 11
  %1235 = getelementptr inbounds [9 x i64]* %1234, i32 0, i64 %1230
  store i64 %1229, i64* %1235, align 8
  br label %1263

; <label>:1236                                    ; preds = %1185
  %1237 = load i64* %i, align 8
  %1238 = load i64* %my_num, align 8
  %1239 = load %struct.Global_Private** @gp, align 8
  %1240 = getelementptr inbounds %struct.Global_Private* %1239, i64 %1238
  %1241 = getelementptr inbounds %struct.Global_Private* %1240, i32 0, i32 7
  %1242 = getelementptr inbounds [9 x i64]* %1241, i32 0, i64 %1237
  %1243 = load i64* %1242, align 8
  %1244 = load i64* %i, align 8
  %1245 = load i64* %my_num, align 8
  %1246 = load %struct.Global_Private** @gp, align 8
  %1247 = getelementptr inbounds %struct.Global_Private* %1246, i64 %1245
  %1248 = getelementptr inbounds %struct.Global_Private* %1247, i32 0, i32 13
  %1249 = getelementptr inbounds [9 x i64]* %1248, i32 0, i64 %1244
  store i64 %1243, i64* %1249, align 8
  %1250 = load i64* %i, align 8
  %1251 = load i64* %my_num, align 8
  %1252 = load %struct.Global_Private** @gp, align 8
  %1253 = getelementptr inbounds %struct.Global_Private* %1252, i64 %1251
  %1254 = getelementptr inbounds %struct.Global_Private* %1253, i32 0, i32 9
  %1255 = getelementptr inbounds [9 x i64]* %1254, i32 0, i64 %1250
  %1256 = load i64* %1255, align 8
  %1257 = load i64* %i, align 8
  %1258 = load i64* %my_num, align 8
  %1259 = load %struct.Global_Private** @gp, align 8
  %1260 = getelementptr inbounds %struct.Global_Private* %1259, i64 %1258
  %1261 = getelementptr inbounds %struct.Global_Private* %1260, i32 0, i32 11
  %1262 = getelementptr inbounds [9 x i64]* %1261, i32 0, i64 %1257
  store i64 %1256, i64* %1262, align 8
  br label %1263

; <label>:1263                                    ; preds = %1236, %1209
  br label %1264

; <label>:1264                                    ; preds = %1263, %1172
  br label %1265

; <label>:1265                                    ; preds = %1264
  %1266 = load i64* %i, align 8
  %1267 = add nsw i64 %1266, 1
  store i64 %1267, i64* %i, align 8
  br label %654

; <label>:1268                                    ; preds = %654
  br label %1269

; <label>:1269                                    ; preds = %1268
  %1270 = load i64* %my_num, align 8
  %1271 = add nsw i64 %1270, 1
  store i64 %1271, i64* %my_num, align 8
  br label %649

; <label>:1272                                    ; preds = %649
  %1273 = load %struct.global_struct** @global, align 8
  %1274 = getelementptr inbounds %struct.global_struct* %1273, i32 0, i32 0
  store i64 0, i64* %1274, align 8
  %1275 = load %struct.global_struct** @global, align 8
  %1276 = getelementptr inbounds %struct.global_struct* %1275, i32 0, i32 4
  store double 0.000000e+00, double* %1276, align 8
  %1277 = call double @atan(double 1.000000e+00) #6
  store double %1277, double* @pi, align 8
  %1278 = load double* @pi, align 8
  %1279 = fmul double 4.000000e+00, %1278
  store double %1279, double* @pi, align 8
  %1280 = load double* @res, align 8
  %1281 = fmul double 1.200000e+01, %1280
  %1282 = load double* @res, align 8
  %1283 = fmul double %1281, %1282
  %1284 = fdiv double -1.000000e+00, %1283
  store double %1284, double* @factjacob, align 8
  %1285 = load double* @res, align 8
  %1286 = load double* @res, align 8
  %1287 = fmul double %1285, %1286
  %1288 = fdiv double 1.000000e+00, %1287
  store double %1288, double* @factlap, align 8
  %1289 = load double* @h, align 8
  %1290 = fsub double -0.000000e+00, %1289
  %1291 = load double* @f0, align 8
  %1292 = fmul double %1290, %1291
  %1293 = load double* @f0, align 8
  %1294 = fmul double %1292, %1293
  %1295 = load double* @h1, align 8
  %1296 = load double* @h3, align 8
  %1297 = fmul double %1295, %1296
  %1298 = load double* @gpr, align 8
  %1299 = fmul double %1297, %1298
  %1300 = fdiv double %1294, %1299
  store double %1300, double* @eig2, align 8
  %1301 = load i64* @jm, align 8
  %1302 = sub nsw i64 %1301, 1
  store i64 %1302, i64* @jmm1, align 8
  %1303 = load i64* @jmm1, align 8
  %1304 = sitofp i64 %1303 to double
  %1305 = load double* @res, align 8
  %1306 = fmul double %1304, %1305
  store double %1306, double* @ysca, align 8
  store i64 0, i64* %i, align 8
  br label %1307

; <label>:1307                                    ; preds = %1333, %1272
  %1308 = load i64* %i, align 8
  %1309 = load i64* @im, align 8
  %1310 = icmp slt i64 %1308, %1309
  br i1 %1310, label %1311, label %1336

; <label>:1311                                    ; preds = %1307
  store i64 0, i64* %j, align 8
  br label %1312

; <label>:1312                                    ; preds = %1329, %1311
  %1313 = load i64* %j, align 8
  %1314 = load i64* @jm, align 8
  %1315 = icmp slt i64 %1313, %1314
  br i1 %1315, label %1316, label %1332

; <label>:1316                                    ; preds = %1312
  %1317 = load i64* %j, align 8
  %1318 = load i64* %i, align 8
  %1319 = load %struct.guess_struct** @guess, align 8
  %1320 = getelementptr inbounds %struct.guess_struct* %1319, i32 0, i32 0
  %1321 = getelementptr inbounds [258 x [258 x double]]* %1320, i32 0, i64 %1318
  %1322 = getelementptr inbounds [258 x double]* %1321, i32 0, i64 %1317
  store double 0.000000e+00, double* %1322, align 8
  %1323 = load i64* %j, align 8
  %1324 = load i64* %i, align 8
  %1325 = load %struct.guess_struct** @guess, align 8
  %1326 = getelementptr inbounds %struct.guess_struct* %1325, i32 0, i32 1
  %1327 = getelementptr inbounds [258 x [258 x double]]* %1326, i32 0, i64 %1324
  %1328 = getelementptr inbounds [258 x double]* %1327, i32 0, i64 %1323
  store double 0.000000e+00, double* %1328, align 8
  br label %1329

; <label>:1329                                    ; preds = %1316
  %1330 = load i64* %j, align 8
  %1331 = add nsw i64 %1330, 1
  store i64 %1331, i64* %j, align 8
  br label %1312

; <label>:1332                                    ; preds = %1312
  br label %1333

; <label>:1333                                    ; preds = %1332
  %1334 = load i64* %i, align 8
  %1335 = add nsw i64 %1334, 1
  store i64 %1335, i64* %i, align 8
  br label %1307

; <label>:1336                                    ; preds = %1307
  %1337 = load i64* @do_output, align 8
  %1338 = icmp ne i64 %1337, 0
  br i1 %1338, label %1339, label %1341

; <label>:1339                                    ; preds = %1336
  %1340 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str27, i32 0, i32 0))
  br label %1341

; <label>:1341                                    ; preds = %1339, %1336
  store i64 0, i64* %i1, align 8
  br label %1342

; <label>:1342                                    ; preds = %1357, %1341
  %1343 = load i64* %i1, align 8
  %1344 = load i64* @nprocs, align 8
  %1345 = sub nsw i64 %1344, 1
  %1346 = icmp slt i64 %1343, %1345
  br i1 %1346, label %1347, label %1360

; <label>:1347                                    ; preds = %1342
  %1348 = load i64* %i1, align 8
  %1349 = getelementptr inbounds [32 x i64]* @PThreadTable, i32 0, i64 %1348
  %1350 = call i32 @pthread_create(i64* %1349, %union.pthread_attr_t* null, i8* (i8*)* bitcast (void ()* @slave to i8* (i8*)*), i8* null) #6
  %1351 = sext i32 %1350 to i64
  store i64 %1351, i64* %Error2, align 8
  %1352 = load i64* %Error2, align 8
  %1353 = icmp ne i64 %1352, 0
  br i1 %1353, label %1354, label %1356

; <label>:1354                                    ; preds = %1347
  %1355 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str28, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:1356                                    ; preds = %1347
  br label %1357

; <label>:1357                                    ; preds = %1356
  %1358 = load i64* %i1, align 8
  %1359 = add nsw i64 %1358, 1
  store i64 %1359, i64* %i1, align 8
  br label %1342

; <label>:1360                                    ; preds = %1342
  call void @slave()
  store i64 0, i64* %i3, align 8
  br label %1361

; <label>:1361                                    ; preds = %1377, %1360
  %1362 = load i64* %i3, align 8
  %1363 = load i64* @nprocs, align 8
  %1364 = sub nsw i64 %1363, 1
  %1365 = icmp ult i64 %1362, %1364
  br i1 %1365, label %1366, label %1380

; <label>:1366                                    ; preds = %1361
  %1367 = load i64* %i3, align 8
  %1368 = getelementptr inbounds [32 x i64]* @PThreadTable, i32 0, i64 %1367
  %1369 = load i64* %1368, align 8
  %1370 = call i32 @pthread_join(i64 %1369, i8** null)
  %1371 = sext i32 %1370 to i64
  store i64 %1371, i64* %Error4, align 8
  %1372 = load i64* %Error4, align 8
  %1373 = icmp ne i64 %1372, 0
  br i1 %1373, label %1374, label %1376

; <label>:1374                                    ; preds = %1366
  %1375 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str29, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:1376                                    ; preds = %1366
  br label %1377

; <label>:1377                                    ; preds = %1376
  %1378 = load i64* %i3, align 8
  %1379 = add i64 %1378, 1
  store i64 %1379, i64* %i3, align 8
  br label %1361

; <label>:1380                                    ; preds = %1361
  %1381 = call i32 @gettimeofday(%struct.timeval* %FullTime5, %struct.timezone* null) #6
  %1382 = getelementptr inbounds %struct.timeval* %FullTime5, i32 0, i32 1
  %1383 = load i64* %1382, align 8
  %1384 = getelementptr inbounds %struct.timeval* %FullTime5, i32 0, i32 0
  %1385 = load i64* %1384, align 8
  %1386 = mul nsw i64 %1385, 1000000
  %1387 = add nsw i64 %1383, %1386
  store i64 %1387, i64* %computeend, align 8
  %1388 = load i64* @do_stats, align 8
  %1389 = icmp ne i64 %1388, 0
  br i1 %1389, label %1390, label %1608

; <label>:1390                                    ; preds = %1380
  %1391 = load %struct.Global_Private** @gp, align 8
  %1392 = getelementptr inbounds %struct.Global_Private* %1391, i64 0
  %1393 = getelementptr inbounds %struct.Global_Private* %1392, i32 0, i32 2
  %1394 = load double* %1393, align 8
  store double %1394, double* %avg_total, align 8
  store double %1394, double* %max_total, align 8
  store double %1394, double* %min_total, align 8
  %1395 = load %struct.Global_Private** @gp, align 8
  %1396 = getelementptr inbounds %struct.Global_Private* %1395, i64 0
  %1397 = getelementptr inbounds %struct.Global_Private* %1396, i32 0, i32 1
  %1398 = load double* %1397, align 8
  store double %1398, double* %avg_multi, align 8
  store double %1398, double* %max_multi, align 8
  store double %1398, double* %min_multi, align 8
  %1399 = load %struct.Global_Private** @gp, align 8
  %1400 = getelementptr inbounds %struct.Global_Private* %1399, i64 0
  %1401 = getelementptr inbounds %struct.Global_Private* %1400, i32 0, i32 1
  %1402 = load double* %1401, align 8
  %1403 = load %struct.Global_Private** @gp, align 8
  %1404 = getelementptr inbounds %struct.Global_Private* %1403, i64 0
  %1405 = getelementptr inbounds %struct.Global_Private* %1404, i32 0, i32 2
  %1406 = load double* %1405, align 8
  %1407 = fdiv double %1402, %1406
  store double %1407, double* %avg_frac, align 8
  store double %1407, double* %max_frac, align 8
  store double %1407, double* %min_frac, align 8
  store i64 1, i64* %i, align 8
  br label %1408

; <label>:1408                                    ; preds = %1548, %1390
  %1409 = load i64* %i, align 8
  %1410 = load i64* @nprocs, align 8
  %1411 = icmp slt i64 %1409, %1410
  br i1 %1411, label %1412, label %1551

; <label>:1412                                    ; preds = %1408
  %1413 = load i64* %i, align 8
  %1414 = load %struct.Global_Private** @gp, align 8
  %1415 = getelementptr inbounds %struct.Global_Private* %1414, i64 %1413
  %1416 = getelementptr inbounds %struct.Global_Private* %1415, i32 0, i32 2
  %1417 = load double* %1416, align 8
  %1418 = load double* %max_total, align 8
  %1419 = fcmp ogt double %1417, %1418
  br i1 %1419, label %1420, label %1426

; <label>:1420                                    ; preds = %1412
  %1421 = load i64* %i, align 8
  %1422 = load %struct.Global_Private** @gp, align 8
  %1423 = getelementptr inbounds %struct.Global_Private* %1422, i64 %1421
  %1424 = getelementptr inbounds %struct.Global_Private* %1423, i32 0, i32 2
  %1425 = load double* %1424, align 8
  store double %1425, double* %max_total, align 8
  br label %1426

; <label>:1426                                    ; preds = %1420, %1412
  %1427 = load i64* %i, align 8
  %1428 = load %struct.Global_Private** @gp, align 8
  %1429 = getelementptr inbounds %struct.Global_Private* %1428, i64 %1427
  %1430 = getelementptr inbounds %struct.Global_Private* %1429, i32 0, i32 2
  %1431 = load double* %1430, align 8
  %1432 = load double* %min_total, align 8
  %1433 = fcmp olt double %1431, %1432
  br i1 %1433, label %1434, label %1440

; <label>:1434                                    ; preds = %1426
  %1435 = load i64* %i, align 8
  %1436 = load %struct.Global_Private** @gp, align 8
  %1437 = getelementptr inbounds %struct.Global_Private* %1436, i64 %1435
  %1438 = getelementptr inbounds %struct.Global_Private* %1437, i32 0, i32 2
  %1439 = load double* %1438, align 8
  store double %1439, double* %min_total, align 8
  br label %1440

; <label>:1440                                    ; preds = %1434, %1426
  %1441 = load i64* %i, align 8
  %1442 = load %struct.Global_Private** @gp, align 8
  %1443 = getelementptr inbounds %struct.Global_Private* %1442, i64 %1441
  %1444 = getelementptr inbounds %struct.Global_Private* %1443, i32 0, i32 1
  %1445 = load double* %1444, align 8
  %1446 = load double* %max_multi, align 8
  %1447 = fcmp ogt double %1445, %1446
  br i1 %1447, label %1448, label %1454

; <label>:1448                                    ; preds = %1440
  %1449 = load i64* %i, align 8
  %1450 = load %struct.Global_Private** @gp, align 8
  %1451 = getelementptr inbounds %struct.Global_Private* %1450, i64 %1449
  %1452 = getelementptr inbounds %struct.Global_Private* %1451, i32 0, i32 1
  %1453 = load double* %1452, align 8
  store double %1453, double* %max_multi, align 8
  br label %1454

; <label>:1454                                    ; preds = %1448, %1440
  %1455 = load i64* %i, align 8
  %1456 = load %struct.Global_Private** @gp, align 8
  %1457 = getelementptr inbounds %struct.Global_Private* %1456, i64 %1455
  %1458 = getelementptr inbounds %struct.Global_Private* %1457, i32 0, i32 1
  %1459 = load double* %1458, align 8
  %1460 = load double* %min_multi, align 8
  %1461 = fcmp olt double %1459, %1460
  br i1 %1461, label %1462, label %1468

; <label>:1462                                    ; preds = %1454
  %1463 = load i64* %i, align 8
  %1464 = load %struct.Global_Private** @gp, align 8
  %1465 = getelementptr inbounds %struct.Global_Private* %1464, i64 %1463
  %1466 = getelementptr inbounds %struct.Global_Private* %1465, i32 0, i32 1
  %1467 = load double* %1466, align 8
  store double %1467, double* %min_multi, align 8
  br label %1468

; <label>:1468                                    ; preds = %1462, %1454
  %1469 = load i64* %i, align 8
  %1470 = load %struct.Global_Private** @gp, align 8
  %1471 = getelementptr inbounds %struct.Global_Private* %1470, i64 %1469
  %1472 = getelementptr inbounds %struct.Global_Private* %1471, i32 0, i32 1
  %1473 = load double* %1472, align 8
  %1474 = load i64* %i, align 8
  %1475 = load %struct.Global_Private** @gp, align 8
  %1476 = getelementptr inbounds %struct.Global_Private* %1475, i64 %1474
  %1477 = getelementptr inbounds %struct.Global_Private* %1476, i32 0, i32 2
  %1478 = load double* %1477, align 8
  %1479 = fdiv double %1473, %1478
  %1480 = load double* %max_frac, align 8
  %1481 = fcmp ogt double %1479, %1480
  br i1 %1481, label %1482, label %1494

; <label>:1482                                    ; preds = %1468
  %1483 = load i64* %i, align 8
  %1484 = load %struct.Global_Private** @gp, align 8
  %1485 = getelementptr inbounds %struct.Global_Private* %1484, i64 %1483
  %1486 = getelementptr inbounds %struct.Global_Private* %1485, i32 0, i32 1
  %1487 = load double* %1486, align 8
  %1488 = load i64* %i, align 8
  %1489 = load %struct.Global_Private** @gp, align 8
  %1490 = getelementptr inbounds %struct.Global_Private* %1489, i64 %1488
  %1491 = getelementptr inbounds %struct.Global_Private* %1490, i32 0, i32 2
  %1492 = load double* %1491, align 8
  %1493 = fdiv double %1487, %1492
  store double %1493, double* %max_frac, align 8
  br label %1494

; <label>:1494                                    ; preds = %1482, %1468
  %1495 = load i64* %i, align 8
  %1496 = load %struct.Global_Private** @gp, align 8
  %1497 = getelementptr inbounds %struct.Global_Private* %1496, i64 %1495
  %1498 = getelementptr inbounds %struct.Global_Private* %1497, i32 0, i32 1
  %1499 = load double* %1498, align 8
  %1500 = load i64* %i, align 8
  %1501 = load %struct.Global_Private** @gp, align 8
  %1502 = getelementptr inbounds %struct.Global_Private* %1501, i64 %1500
  %1503 = getelementptr inbounds %struct.Global_Private* %1502, i32 0, i32 2
  %1504 = load double* %1503, align 8
  %1505 = fdiv double %1499, %1504
  %1506 = load double* %min_frac, align 8
  %1507 = fcmp olt double %1505, %1506
  br i1 %1507, label %1508, label %1520

; <label>:1508                                    ; preds = %1494
  %1509 = load i64* %i, align 8
  %1510 = load %struct.Global_Private** @gp, align 8
  %1511 = getelementptr inbounds %struct.Global_Private* %1510, i64 %1509
  %1512 = getelementptr inbounds %struct.Global_Private* %1511, i32 0, i32 1
  %1513 = load double* %1512, align 8
  %1514 = load i64* %i, align 8
  %1515 = load %struct.Global_Private** @gp, align 8
  %1516 = getelementptr inbounds %struct.Global_Private* %1515, i64 %1514
  %1517 = getelementptr inbounds %struct.Global_Private* %1516, i32 0, i32 2
  %1518 = load double* %1517, align 8
  %1519 = fdiv double %1513, %1518
  store double %1519, double* %min_frac, align 8
  br label %1520

; <label>:1520                                    ; preds = %1508, %1494
  %1521 = load i64* %i, align 8
  %1522 = load %struct.Global_Private** @gp, align 8
  %1523 = getelementptr inbounds %struct.Global_Private* %1522, i64 %1521
  %1524 = getelementptr inbounds %struct.Global_Private* %1523, i32 0, i32 2
  %1525 = load double* %1524, align 8
  %1526 = load double* %avg_total, align 8
  %1527 = fadd double %1526, %1525
  store double %1527, double* %avg_total, align 8
  %1528 = load i64* %i, align 8
  %1529 = load %struct.Global_Private** @gp, align 8
  %1530 = getelementptr inbounds %struct.Global_Private* %1529, i64 %1528
  %1531 = getelementptr inbounds %struct.Global_Private* %1530, i32 0, i32 1
  %1532 = load double* %1531, align 8
  %1533 = load double* %avg_multi, align 8
  %1534 = fadd double %1533, %1532
  store double %1534, double* %avg_multi, align 8
  %1535 = load i64* %i, align 8
  %1536 = load %struct.Global_Private** @gp, align 8
  %1537 = getelementptr inbounds %struct.Global_Private* %1536, i64 %1535
  %1538 = getelementptr inbounds %struct.Global_Private* %1537, i32 0, i32 1
  %1539 = load double* %1538, align 8
  %1540 = load i64* %i, align 8
  %1541 = load %struct.Global_Private** @gp, align 8
  %1542 = getelementptr inbounds %struct.Global_Private* %1541, i64 %1540
  %1543 = getelementptr inbounds %struct.Global_Private* %1542, i32 0, i32 2
  %1544 = load double* %1543, align 8
  %1545 = fdiv double %1539, %1544
  %1546 = load double* %avg_frac, align 8
  %1547 = fadd double %1546, %1545
  store double %1547, double* %avg_frac, align 8
  br label %1548

; <label>:1548                                    ; preds = %1520
  %1549 = load i64* %i, align 8
  %1550 = add nsw i64 %1549, 1
  store i64 %1550, i64* %i, align 8
  br label %1408

; <label>:1551                                    ; preds = %1408
  %1552 = load double* %avg_total, align 8
  %1553 = load i64* @nprocs, align 8
  %1554 = sitofp i64 %1553 to double
  %1555 = fdiv double %1552, %1554
  store double %1555, double* %avg_total, align 8
  %1556 = load double* %avg_multi, align 8
  %1557 = load i64* @nprocs, align 8
  %1558 = sitofp i64 %1557 to double
  %1559 = fdiv double %1556, %1558
  store double %1559, double* %avg_multi, align 8
  %1560 = load double* %avg_frac, align 8
  %1561 = load i64* @nprocs, align 8
  %1562 = sitofp i64 %1561 to double
  %1563 = fdiv double %1560, %1562
  store double %1563, double* %avg_frac, align 8
  store i64 1, i64* %i, align 8
  br label %1564

; <label>:1564                                    ; preds = %1592, %1551
  %1565 = load i64* %i, align 8
  %1566 = load i64* @nprocs, align 8
  %1567 = icmp slt i64 %1565, %1566
  br i1 %1567, label %1568, label %1595

; <label>:1568                                    ; preds = %1564
  %1569 = load i64* %i, align 8
  %1570 = load i64* %i, align 8
  %1571 = load %struct.Global_Private** @gp, align 8
  %1572 = getelementptr inbounds %struct.Global_Private* %1571, i64 %1570
  %1573 = getelementptr inbounds %struct.Global_Private* %1572, i32 0, i32 2
  %1574 = load double* %1573, align 8
  %1575 = load i64* %i, align 8
  %1576 = load %struct.Global_Private** @gp, align 8
  %1577 = getelementptr inbounds %struct.Global_Private* %1576, i64 %1575
  %1578 = getelementptr inbounds %struct.Global_Private* %1577, i32 0, i32 1
  %1579 = load double* %1578, align 8
  %1580 = load i64* %i, align 8
  %1581 = load %struct.Global_Private** @gp, align 8
  %1582 = getelementptr inbounds %struct.Global_Private* %1581, i64 %1580
  %1583 = getelementptr inbounds %struct.Global_Private* %1582, i32 0, i32 1
  %1584 = load double* %1583, align 8
  %1585 = load i64* %i, align 8
  %1586 = load %struct.Global_Private** @gp, align 8
  %1587 = getelementptr inbounds %struct.Global_Private* %1586, i64 %1585
  %1588 = getelementptr inbounds %struct.Global_Private* %1587, i32 0, i32 2
  %1589 = load double* %1588, align 8
  %1590 = fdiv double %1584, %1589
  %1591 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str30, i32 0, i32 0), i64 %1569, double %1574, double %1579, double %1590)
  br label %1592

; <label>:1592                                    ; preds = %1568
  %1593 = load i64* %i, align 8
  %1594 = add nsw i64 %1593, 1
  store i64 %1594, i64* %i, align 8
  br label %1564

; <label>:1595                                    ; preds = %1564
  %1596 = load double* %avg_total, align 8
  %1597 = load double* %avg_multi, align 8
  %1598 = load double* %avg_frac, align 8
  %1599 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str31, i32 0, i32 0), double %1596, double %1597, double %1598)
  %1600 = load double* %min_total, align 8
  %1601 = load double* %min_multi, align 8
  %1602 = load double* %min_frac, align 8
  %1603 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str32, i32 0, i32 0), double %1600, double %1601, double %1602)
  %1604 = load double* %max_total, align 8
  %1605 = load double* %max_multi, align 8
  %1606 = load double* %max_frac, align 8
  %1607 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str33, i32 0, i32 0), double %1604, double %1605, double %1606)
  br label %1608

; <label>:1608                                    ; preds = %1595, %1380
  %1609 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0))
  call void @exit(i32 0) #8
  unreachable
                                                  ; No predecessors!
  %1611 = load i32* %1
  ret i32 %1611
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #1

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

; Function Attrs: nounwind uwtable
define void @printerr(i8* %s) #0 {
  %1 = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  %2 = load %struct._IO_FILE** @stderr, align 8
  %3 = load i8** %1, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([11 x i8]* @.str34, i32 0, i32 0), i8* %3)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define i64 @log_2(i64 %number) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %cumulative = alloca i64, align 8
  %out = alloca i64, align 8
  %done = alloca i64, align 8
  store i64 %number, i64* %2, align 8
  store i64 1, i64* %cumulative, align 8
  store i64 0, i64* %out, align 8
  store i64 0, i64* %done, align 8
  br label %3

; <label>:3                                       ; preds = %25, %0
  %4 = load i64* %cumulative, align 8
  %5 = load i64* %2, align 8
  %6 = icmp slt i64 %4, %5
  br i1 %6, label %7, label %13

; <label>:7                                       ; preds = %3
  %8 = load i64* %done, align 8
  %9 = icmp ne i64 %8, 0
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %7
  %11 = load i64* %out, align 8
  %12 = icmp slt i64 %11, 50
  br label %13

; <label>:13                                      ; preds = %10, %7, %3
  %14 = phi i1 [ false, %7 ], [ false, %3 ], [ %12, %10 ]
  br i1 %14, label %15, label %26

; <label>:15                                      ; preds = %13
  %16 = load i64* %cumulative, align 8
  %17 = load i64* %2, align 8
  %18 = icmp eq i64 %16, %17
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %15
  store i64 1, i64* %done, align 8
  br label %25

; <label>:20                                      ; preds = %15
  %21 = load i64* %cumulative, align 8
  %22 = mul nsw i64 %21, 2
  store i64 %22, i64* %cumulative, align 8
  %23 = load i64* %out, align 8
  %24 = add nsw i64 %23, 1
  store i64 %24, i64* %out, align 8
  br label %25

; <label>:25                                      ; preds = %20, %19
  br label %3

; <label>:26                                      ; preds = %13
  %27 = load i64* %cumulative, align 8
  %28 = load i64* %2, align 8
  %29 = icmp eq i64 %27, %28
  br i1 %29, label %30, label %32

; <label>:30                                      ; preds = %26
  %31 = load i64* %out, align 8
  store i64 %31, i64* %1
  br label %33

; <label>:32                                      ; preds = %26
  store i64 -1, i64* %1
  br label %33

; <label>:33                                      ; preds = %32, %30
  %34 = load i64* %1
  ret i64 %34
}

; Function Attrs: nounwind readonly
declare double @atof(i8*) #2

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) #1

; Function Attrs: nounwind
declare i32 @pthread_cond_init(%union.pthread_cond_t*, %union.pthread_condattr_t*) #1

; Function Attrs: nounwind
declare i32 @pthread_mutex_destroy(%union.pthread_mutex_t*) #1

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind
declare double @atan(double) #1

; Function Attrs: nounwind
declare i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #1

declare i32 @pthread_join(i64, i8**) #4

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: nounwind uwtable
define void @multig(i64 %my_id) #0 {
  %1 = alloca i64, align 8
  %iter = alloca i64, align 8
  %wu = alloca double, align 8
  %errp = alloca double, align 8
  %m = alloca i64, align 8
  %minlevel = alloca i64, align 8
  %flag1 = alloca i64, align 8
  %flag2 = alloca i64, align 8
  %k = alloca i64, align 8
  %my_num = alloca i64, align 8
  %wmax = alloca double, align 8
  %local_err = alloca double, align 8
  %red_local_err = alloca double, align 8
  %black_local_err = alloca double, align 8
  %g_error = alloca double, align 8
  %Error = alloca i64, align 8
  %Cycle = alloca i64, align 8
  %Cancel = alloca i64, align 8
  %Temp = alloca i64, align 8
  %Error1 = alloca i64, align 8
  %Cycle2 = alloca i64, align 8
  %Cancel3 = alloca i64, align 8
  %Temp4 = alloca i64, align 8
  %Error5 = alloca i64, align 8
  %Cycle6 = alloca i64, align 8
  %Cancel7 = alloca i64, align 8
  %Temp8 = alloca i64, align 8
  %Error9 = alloca i64, align 8
  %Cycle10 = alloca i64, align 8
  %Cancel11 = alloca i64, align 8
  %Temp12 = alloca i64, align 8
  store i64 %my_id, i64* %1, align 8
  store i64 0, i64* %flag1, align 8
  store i64 0, i64* %flag2, align 8
  store i64 0, i64* %iter, align 8
  %2 = load i64* @numlev, align 8
  %3 = sub nsw i64 %2, 1
  store i64 %3, i64* %m, align 8
  %4 = load double* @maxwork, align 8
  store double %4, double* %wmax, align 8
  %5 = load i64* @minlev, align 8
  store i64 %5, i64* %minlevel, align 8
  %6 = load i64* %1, align 8
  store i64 %6, i64* %my_num, align 8
  store double 0.000000e+00, double* %wu, align 8
  %7 = load i64* %m, align 8
  store i64 %7, i64* %k, align 8
  store double 1.000000e+30, double* %g_error, align 8
  br label %8

; <label>:8                                       ; preds = %412, %0
  %9 = load i64* %flag1, align 8
  %10 = icmp ne i64 %9, 0
  br i1 %10, label %15, label %11

; <label>:11                                      ; preds = %8
  %12 = load i64* %flag2, align 8
  %13 = icmp ne i64 %12, 0
  %14 = xor i1 %13, true
  br label %15

; <label>:15                                      ; preds = %11, %8
  %16 = phi i1 [ false, %8 ], [ %14, %11 ]
  br i1 %16, label %17, label %413

; <label>:17                                      ; preds = %15
  %18 = load double* %g_error, align 8
  store double %18, double* %errp, align 8
  %19 = load i64* %iter, align 8
  %20 = add nsw i64 %19, 1
  store i64 %20, i64* %iter, align 8
  %21 = load i64* %my_num, align 8
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %17
  %24 = load %struct.multi_struct** @multi, align 8
  %25 = getelementptr inbounds %struct.multi_struct* %24, i32 0, i32 2
  store double 0.000000e+00, double* %25, align 8
  br label %26

; <label>:26                                      ; preds = %23, %17
  %27 = load %struct.bars_struct** @bars, align 8
  %28 = getelementptr inbounds %struct.bars_struct* %27, i32 0, i32 0
  %29 = getelementptr inbounds %struct.anon* %28, i32 0, i32 0
  %30 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %29) #6
  %31 = sext i32 %30 to i64
  store i64 %31, i64* %Error, align 8
  %32 = load i64* %Error, align 8
  %33 = icmp ne i64 %32, 0
  br i1 %33, label %34, label %36

; <label>:34                                      ; preds = %26
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str35, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:36                                      ; preds = %26
  %37 = load %struct.bars_struct** @bars, align 8
  %38 = getelementptr inbounds %struct.bars_struct* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.anon* %38, i32 0, i32 3
  %40 = load i64* %39, align 8
  store i64 %40, i64* %Cycle, align 8
  %41 = load %struct.bars_struct** @bars, align 8
  %42 = getelementptr inbounds %struct.bars_struct* %41, i32 0, i32 0
  %43 = getelementptr inbounds %struct.anon* %42, i32 0, i32 2
  %44 = load i64* %43, align 8
  %45 = add i64 %44, 1
  store i64 %45, i64* %43, align 8
  %46 = load i64* @nprocs, align 8
  %47 = icmp ne i64 %45, %46
  br i1 %47, label %48, label %76

; <label>:48                                      ; preds = %36
  %49 = bitcast i64* %Cancel to i32*
  %50 = call i32 @pthread_setcancelstate(i32 1, i32* %49)
  br label %51

; <label>:51                                      ; preds = %70, %48
  %52 = load i64* %Cycle, align 8
  %53 = load %struct.bars_struct** @bars, align 8
  %54 = getelementptr inbounds %struct.bars_struct* %53, i32 0, i32 0
  %55 = getelementptr inbounds %struct.anon* %54, i32 0, i32 3
  %56 = load i64* %55, align 8
  %57 = icmp eq i64 %52, %56
  br i1 %57, label %58, label %71

; <label>:58                                      ; preds = %51
  %59 = load %struct.bars_struct** @bars, align 8
  %60 = getelementptr inbounds %struct.bars_struct* %59, i32 0, i32 0
  %61 = getelementptr inbounds %struct.anon* %60, i32 0, i32 1
  %62 = load %struct.bars_struct** @bars, align 8
  %63 = getelementptr inbounds %struct.bars_struct* %62, i32 0, i32 0
  %64 = getelementptr inbounds %struct.anon* %63, i32 0, i32 0
  %65 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %61, %union.pthread_mutex_t* %64)
  %66 = sext i32 %65 to i64
  store i64 %66, i64* %Error, align 8
  %67 = load i64* %Error, align 8
  %68 = icmp ne i64 %67, 0
  br i1 %68, label %69, label %70

; <label>:69                                      ; preds = %58
  br label %71

; <label>:70                                      ; preds = %58
  br label %51

; <label>:71                                      ; preds = %69, %51
  %72 = load i64* %Cancel, align 8
  %73 = trunc i64 %72 to i32
  %74 = bitcast i64* %Temp to i32*
  %75 = call i32 @pthread_setcancelstate(i32 %73, i32* %74)
  br label %96

; <label>:76                                      ; preds = %36
  %77 = load %struct.bars_struct** @bars, align 8
  %78 = getelementptr inbounds %struct.bars_struct* %77, i32 0, i32 0
  %79 = getelementptr inbounds %struct.anon* %78, i32 0, i32 3
  %80 = load i64* %79, align 8
  %81 = icmp ne i64 %80, 0
  %82 = xor i1 %81, true
  %83 = zext i1 %82 to i32
  %84 = sext i32 %83 to i64
  %85 = load %struct.bars_struct** @bars, align 8
  %86 = getelementptr inbounds %struct.bars_struct* %85, i32 0, i32 0
  %87 = getelementptr inbounds %struct.anon* %86, i32 0, i32 3
  store i64 %84, i64* %87, align 8
  %88 = load %struct.bars_struct** @bars, align 8
  %89 = getelementptr inbounds %struct.bars_struct* %88, i32 0, i32 0
  %90 = getelementptr inbounds %struct.anon* %89, i32 0, i32 2
  store i64 0, i64* %90, align 8
  %91 = load %struct.bars_struct** @bars, align 8
  %92 = getelementptr inbounds %struct.bars_struct* %91, i32 0, i32 0
  %93 = getelementptr inbounds %struct.anon* %92, i32 0, i32 1
  %94 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %93) #6
  %95 = sext i32 %94 to i64
  store i64 %95, i64* %Error, align 8
  br label %96

; <label>:96                                      ; preds = %76, %71
  %97 = load %struct.bars_struct** @bars, align 8
  %98 = getelementptr inbounds %struct.bars_struct* %97, i32 0, i32 0
  %99 = getelementptr inbounds %struct.anon* %98, i32 0, i32 0
  %100 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %99) #6
  %101 = load i64* %k, align 8
  %102 = load i64* %my_num, align 8
  call void @relax(i64 %101, double* %red_local_err, i64 0, i64 %102)
  %103 = load %struct.bars_struct** @bars, align 8
  %104 = getelementptr inbounds %struct.bars_struct* %103, i32 0, i32 0
  %105 = getelementptr inbounds %struct.anon* %104, i32 0, i32 0
  %106 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %105) #6
  %107 = sext i32 %106 to i64
  store i64 %107, i64* %Error1, align 8
  %108 = load i64* %Error1, align 8
  %109 = icmp ne i64 %108, 0
  br i1 %109, label %110, label %112

; <label>:110                                     ; preds = %96
  %111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str35, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:112                                     ; preds = %96
  %113 = load %struct.bars_struct** @bars, align 8
  %114 = getelementptr inbounds %struct.bars_struct* %113, i32 0, i32 0
  %115 = getelementptr inbounds %struct.anon* %114, i32 0, i32 3
  %116 = load i64* %115, align 8
  store i64 %116, i64* %Cycle2, align 8
  %117 = load %struct.bars_struct** @bars, align 8
  %118 = getelementptr inbounds %struct.bars_struct* %117, i32 0, i32 0
  %119 = getelementptr inbounds %struct.anon* %118, i32 0, i32 2
  %120 = load i64* %119, align 8
  %121 = add i64 %120, 1
  store i64 %121, i64* %119, align 8
  %122 = load i64* @nprocs, align 8
  %123 = icmp ne i64 %121, %122
  br i1 %123, label %124, label %152

; <label>:124                                     ; preds = %112
  %125 = bitcast i64* %Cancel3 to i32*
  %126 = call i32 @pthread_setcancelstate(i32 1, i32* %125)
  br label %127

; <label>:127                                     ; preds = %146, %124
  %128 = load i64* %Cycle2, align 8
  %129 = load %struct.bars_struct** @bars, align 8
  %130 = getelementptr inbounds %struct.bars_struct* %129, i32 0, i32 0
  %131 = getelementptr inbounds %struct.anon* %130, i32 0, i32 3
  %132 = load i64* %131, align 8
  %133 = icmp eq i64 %128, %132
  br i1 %133, label %134, label %147

; <label>:134                                     ; preds = %127
  %135 = load %struct.bars_struct** @bars, align 8
  %136 = getelementptr inbounds %struct.bars_struct* %135, i32 0, i32 0
  %137 = getelementptr inbounds %struct.anon* %136, i32 0, i32 1
  %138 = load %struct.bars_struct** @bars, align 8
  %139 = getelementptr inbounds %struct.bars_struct* %138, i32 0, i32 0
  %140 = getelementptr inbounds %struct.anon* %139, i32 0, i32 0
  %141 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %137, %union.pthread_mutex_t* %140)
  %142 = sext i32 %141 to i64
  store i64 %142, i64* %Error1, align 8
  %143 = load i64* %Error1, align 8
  %144 = icmp ne i64 %143, 0
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %134
  br label %147

; <label>:146                                     ; preds = %134
  br label %127

; <label>:147                                     ; preds = %145, %127
  %148 = load i64* %Cancel3, align 8
  %149 = trunc i64 %148 to i32
  %150 = bitcast i64* %Temp4 to i32*
  %151 = call i32 @pthread_setcancelstate(i32 %149, i32* %150)
  br label %172

; <label>:152                                     ; preds = %112
  %153 = load %struct.bars_struct** @bars, align 8
  %154 = getelementptr inbounds %struct.bars_struct* %153, i32 0, i32 0
  %155 = getelementptr inbounds %struct.anon* %154, i32 0, i32 3
  %156 = load i64* %155, align 8
  %157 = icmp ne i64 %156, 0
  %158 = xor i1 %157, true
  %159 = zext i1 %158 to i32
  %160 = sext i32 %159 to i64
  %161 = load %struct.bars_struct** @bars, align 8
  %162 = getelementptr inbounds %struct.bars_struct* %161, i32 0, i32 0
  %163 = getelementptr inbounds %struct.anon* %162, i32 0, i32 3
  store i64 %160, i64* %163, align 8
  %164 = load %struct.bars_struct** @bars, align 8
  %165 = getelementptr inbounds %struct.bars_struct* %164, i32 0, i32 0
  %166 = getelementptr inbounds %struct.anon* %165, i32 0, i32 2
  store i64 0, i64* %166, align 8
  %167 = load %struct.bars_struct** @bars, align 8
  %168 = getelementptr inbounds %struct.bars_struct* %167, i32 0, i32 0
  %169 = getelementptr inbounds %struct.anon* %168, i32 0, i32 1
  %170 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %169) #6
  %171 = sext i32 %170 to i64
  store i64 %171, i64* %Error1, align 8
  br label %172

; <label>:172                                     ; preds = %152, %147
  %173 = load %struct.bars_struct** @bars, align 8
  %174 = getelementptr inbounds %struct.bars_struct* %173, i32 0, i32 0
  %175 = getelementptr inbounds %struct.anon* %174, i32 0, i32 0
  %176 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %175) #6
  %177 = load i64* %k, align 8
  %178 = load i64* %my_num, align 8
  call void @relax(i64 %177, double* %black_local_err, i64 1, i64 %178)
  %179 = load double* %red_local_err, align 8
  %180 = load double* %black_local_err, align 8
  %181 = fcmp ogt double %179, %180
  br i1 %181, label %182, label %184

; <label>:182                                     ; preds = %172
  %183 = load double* %red_local_err, align 8
  store double %183, double* %local_err, align 8
  br label %186

; <label>:184                                     ; preds = %172
  %185 = load double* %black_local_err, align 8
  store double %185, double* %local_err, align 8
  br label %186

; <label>:186                                     ; preds = %184, %182
  %187 = load %struct.locks_struct** @locks, align 8
  %188 = getelementptr inbounds %struct.locks_struct* %187, i32 0, i32 4
  %189 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %188) #6
  %190 = load double* %local_err, align 8
  %191 = load %struct.multi_struct** @multi, align 8
  %192 = getelementptr inbounds %struct.multi_struct* %191, i32 0, i32 2
  %193 = load double* %192, align 8
  %194 = fcmp ogt double %190, %193
  br i1 %194, label %195, label %199

; <label>:195                                     ; preds = %186
  %196 = load double* %local_err, align 8
  %197 = load %struct.multi_struct** @multi, align 8
  %198 = getelementptr inbounds %struct.multi_struct* %197, i32 0, i32 2
  store double %196, double* %198, align 8
  br label %199

; <label>:199                                     ; preds = %195, %186
  %200 = load %struct.locks_struct** @locks, align 8
  %201 = getelementptr inbounds %struct.locks_struct* %200, i32 0, i32 4
  %202 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %201) #6
  %203 = load i64* %k, align 8
  %204 = sitofp i64 %203 to double
  %205 = load i64* %m, align 8
  %206 = sitofp i64 %205 to double
  %207 = fsub double %204, %206
  %208 = call double @pow(double 4.000000e+00, double %207) #6
  %209 = load double* %wu, align 8
  %210 = fadd double %209, %208
  store double %210, double* %wu, align 8
  %211 = load %struct.bars_struct** @bars, align 8
  %212 = getelementptr inbounds %struct.bars_struct* %211, i32 0, i32 0
  %213 = getelementptr inbounds %struct.anon* %212, i32 0, i32 0
  %214 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %213) #6
  %215 = sext i32 %214 to i64
  store i64 %215, i64* %Error5, align 8
  %216 = load i64* %Error5, align 8
  %217 = icmp ne i64 %216, 0
  br i1 %217, label %218, label %220

; <label>:218                                     ; preds = %199
  %219 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str35, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:220                                     ; preds = %199
  %221 = load %struct.bars_struct** @bars, align 8
  %222 = getelementptr inbounds %struct.bars_struct* %221, i32 0, i32 0
  %223 = getelementptr inbounds %struct.anon* %222, i32 0, i32 3
  %224 = load i64* %223, align 8
  store i64 %224, i64* %Cycle6, align 8
  %225 = load %struct.bars_struct** @bars, align 8
  %226 = getelementptr inbounds %struct.bars_struct* %225, i32 0, i32 0
  %227 = getelementptr inbounds %struct.anon* %226, i32 0, i32 2
  %228 = load i64* %227, align 8
  %229 = add i64 %228, 1
  store i64 %229, i64* %227, align 8
  %230 = load i64* @nprocs, align 8
  %231 = icmp ne i64 %229, %230
  br i1 %231, label %232, label %260

; <label>:232                                     ; preds = %220
  %233 = bitcast i64* %Cancel7 to i32*
  %234 = call i32 @pthread_setcancelstate(i32 1, i32* %233)
  br label %235

; <label>:235                                     ; preds = %254, %232
  %236 = load i64* %Cycle6, align 8
  %237 = load %struct.bars_struct** @bars, align 8
  %238 = getelementptr inbounds %struct.bars_struct* %237, i32 0, i32 0
  %239 = getelementptr inbounds %struct.anon* %238, i32 0, i32 3
  %240 = load i64* %239, align 8
  %241 = icmp eq i64 %236, %240
  br i1 %241, label %242, label %255

; <label>:242                                     ; preds = %235
  %243 = load %struct.bars_struct** @bars, align 8
  %244 = getelementptr inbounds %struct.bars_struct* %243, i32 0, i32 0
  %245 = getelementptr inbounds %struct.anon* %244, i32 0, i32 1
  %246 = load %struct.bars_struct** @bars, align 8
  %247 = getelementptr inbounds %struct.bars_struct* %246, i32 0, i32 0
  %248 = getelementptr inbounds %struct.anon* %247, i32 0, i32 0
  %249 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %245, %union.pthread_mutex_t* %248)
  %250 = sext i32 %249 to i64
  store i64 %250, i64* %Error5, align 8
  %251 = load i64* %Error5, align 8
  %252 = icmp ne i64 %251, 0
  br i1 %252, label %253, label %254

; <label>:253                                     ; preds = %242
  br label %255

; <label>:254                                     ; preds = %242
  br label %235

; <label>:255                                     ; preds = %253, %235
  %256 = load i64* %Cancel7, align 8
  %257 = trunc i64 %256 to i32
  %258 = bitcast i64* %Temp8 to i32*
  %259 = call i32 @pthread_setcancelstate(i32 %257, i32* %258)
  br label %280

; <label>:260                                     ; preds = %220
  %261 = load %struct.bars_struct** @bars, align 8
  %262 = getelementptr inbounds %struct.bars_struct* %261, i32 0, i32 0
  %263 = getelementptr inbounds %struct.anon* %262, i32 0, i32 3
  %264 = load i64* %263, align 8
  %265 = icmp ne i64 %264, 0
  %266 = xor i1 %265, true
  %267 = zext i1 %266 to i32
  %268 = sext i32 %267 to i64
  %269 = load %struct.bars_struct** @bars, align 8
  %270 = getelementptr inbounds %struct.bars_struct* %269, i32 0, i32 0
  %271 = getelementptr inbounds %struct.anon* %270, i32 0, i32 3
  store i64 %268, i64* %271, align 8
  %272 = load %struct.bars_struct** @bars, align 8
  %273 = getelementptr inbounds %struct.bars_struct* %272, i32 0, i32 0
  %274 = getelementptr inbounds %struct.anon* %273, i32 0, i32 2
  store i64 0, i64* %274, align 8
  %275 = load %struct.bars_struct** @bars, align 8
  %276 = getelementptr inbounds %struct.bars_struct* %275, i32 0, i32 0
  %277 = getelementptr inbounds %struct.anon* %276, i32 0, i32 1
  %278 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %277) #6
  %279 = sext i32 %278 to i64
  store i64 %279, i64* %Error5, align 8
  br label %280

; <label>:280                                     ; preds = %260, %255
  %281 = load %struct.bars_struct** @bars, align 8
  %282 = getelementptr inbounds %struct.bars_struct* %281, i32 0, i32 0
  %283 = getelementptr inbounds %struct.anon* %282, i32 0, i32 0
  %284 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %283) #6
  %285 = load %struct.multi_struct** @multi, align 8
  %286 = getelementptr inbounds %struct.multi_struct* %285, i32 0, i32 2
  %287 = load double* %286, align 8
  store double %287, double* %g_error, align 8
  %288 = load %struct.bars_struct** @bars, align 8
  %289 = getelementptr inbounds %struct.bars_struct* %288, i32 0, i32 0
  %290 = getelementptr inbounds %struct.anon* %289, i32 0, i32 0
  %291 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %290) #6
  %292 = sext i32 %291 to i64
  store i64 %292, i64* %Error9, align 8
  %293 = load i64* %Error9, align 8
  %294 = icmp ne i64 %293, 0
  br i1 %294, label %295, label %297

; <label>:295                                     ; preds = %280
  %296 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str35, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:297                                     ; preds = %280
  %298 = load %struct.bars_struct** @bars, align 8
  %299 = getelementptr inbounds %struct.bars_struct* %298, i32 0, i32 0
  %300 = getelementptr inbounds %struct.anon* %299, i32 0, i32 3
  %301 = load i64* %300, align 8
  store i64 %301, i64* %Cycle10, align 8
  %302 = load %struct.bars_struct** @bars, align 8
  %303 = getelementptr inbounds %struct.bars_struct* %302, i32 0, i32 0
  %304 = getelementptr inbounds %struct.anon* %303, i32 0, i32 2
  %305 = load i64* %304, align 8
  %306 = add i64 %305, 1
  store i64 %306, i64* %304, align 8
  %307 = load i64* @nprocs, align 8
  %308 = icmp ne i64 %306, %307
  br i1 %308, label %309, label %337

; <label>:309                                     ; preds = %297
  %310 = bitcast i64* %Cancel11 to i32*
  %311 = call i32 @pthread_setcancelstate(i32 1, i32* %310)
  br label %312

; <label>:312                                     ; preds = %331, %309
  %313 = load i64* %Cycle10, align 8
  %314 = load %struct.bars_struct** @bars, align 8
  %315 = getelementptr inbounds %struct.bars_struct* %314, i32 0, i32 0
  %316 = getelementptr inbounds %struct.anon* %315, i32 0, i32 3
  %317 = load i64* %316, align 8
  %318 = icmp eq i64 %313, %317
  br i1 %318, label %319, label %332

; <label>:319                                     ; preds = %312
  %320 = load %struct.bars_struct** @bars, align 8
  %321 = getelementptr inbounds %struct.bars_struct* %320, i32 0, i32 0
  %322 = getelementptr inbounds %struct.anon* %321, i32 0, i32 1
  %323 = load %struct.bars_struct** @bars, align 8
  %324 = getelementptr inbounds %struct.bars_struct* %323, i32 0, i32 0
  %325 = getelementptr inbounds %struct.anon* %324, i32 0, i32 0
  %326 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %322, %union.pthread_mutex_t* %325)
  %327 = sext i32 %326 to i64
  store i64 %327, i64* %Error9, align 8
  %328 = load i64* %Error9, align 8
  %329 = icmp ne i64 %328, 0
  br i1 %329, label %330, label %331

; <label>:330                                     ; preds = %319
  br label %332

; <label>:331                                     ; preds = %319
  br label %312

; <label>:332                                     ; preds = %330, %312
  %333 = load i64* %Cancel11, align 8
  %334 = trunc i64 %333 to i32
  %335 = bitcast i64* %Temp12 to i32*
  %336 = call i32 @pthread_setcancelstate(i32 %334, i32* %335)
  br label %357

; <label>:337                                     ; preds = %297
  %338 = load %struct.bars_struct** @bars, align 8
  %339 = getelementptr inbounds %struct.bars_struct* %338, i32 0, i32 0
  %340 = getelementptr inbounds %struct.anon* %339, i32 0, i32 3
  %341 = load i64* %340, align 8
  %342 = icmp ne i64 %341, 0
  %343 = xor i1 %342, true
  %344 = zext i1 %343 to i32
  %345 = sext i32 %344 to i64
  %346 = load %struct.bars_struct** @bars, align 8
  %347 = getelementptr inbounds %struct.bars_struct* %346, i32 0, i32 0
  %348 = getelementptr inbounds %struct.anon* %347, i32 0, i32 3
  store i64 %345, i64* %348, align 8
  %349 = load %struct.bars_struct** @bars, align 8
  %350 = getelementptr inbounds %struct.bars_struct* %349, i32 0, i32 0
  %351 = getelementptr inbounds %struct.anon* %350, i32 0, i32 2
  store i64 0, i64* %351, align 8
  %352 = load %struct.bars_struct** @bars, align 8
  %353 = getelementptr inbounds %struct.bars_struct* %352, i32 0, i32 0
  %354 = getelementptr inbounds %struct.anon* %353, i32 0, i32 1
  %355 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %354) #6
  %356 = sext i32 %355 to i64
  store i64 %356, i64* %Error9, align 8
  br label %357

; <label>:357                                     ; preds = %337, %332
  %358 = load %struct.bars_struct** @bars, align 8
  %359 = getelementptr inbounds %struct.bars_struct* %358, i32 0, i32 0
  %360 = getelementptr inbounds %struct.anon* %359, i32 0, i32 0
  %361 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %360) #6
  %362 = load double* %g_error, align 8
  %363 = load i64* %k, align 8
  %364 = getelementptr inbounds [9 x double]* @lev_tol, i32 0, i64 %363
  %365 = load double* %364, align 8
  %366 = fcmp oge double %362, %365
  br i1 %366, label %367, label %401

; <label>:367                                     ; preds = %357
  %368 = load double* %wu, align 8
  %369 = load double* %wmax, align 8
  %370 = fcmp ogt double %368, %369
  br i1 %370, label %371, label %375

; <label>:371                                     ; preds = %367
  store i64 1, i64* %flag1, align 8
  %372 = load %struct._IO_FILE** @stderr, align 8
  %373 = load double* %wmax, align 8
  %374 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %372, i8* getelementptr inbounds ([42 x i8]* @.str136, i32 0, i32 0), double %373)
  call void @exit(i32 -1) #8
  unreachable

; <label>:375                                     ; preds = %367
  %376 = load i64* %k, align 8
  %377 = icmp ne i64 %376, 1
  br i1 %377, label %378, label %399

; <label>:378                                     ; preds = %375
  %379 = load double* %g_error, align 8
  %380 = load double* %errp, align 8
  %381 = fdiv double %379, %380
  %382 = fcmp oge double %381, 6.000000e-01
  br i1 %382, label %383, label %399

; <label>:383                                     ; preds = %378
  %384 = load i64* %k, align 8
  %385 = load i64* %minlevel, align 8
  %386 = icmp sgt i64 %384, %385
  br i1 %386, label %387, label %399

; <label>:387                                     ; preds = %383
  %388 = load i64* %k, align 8
  %389 = load i64* %my_num, align 8
  call void @rescal(i64 %388, i64 %389)
  %390 = load double* %g_error, align 8
  %391 = fmul double 3.000000e-01, %390
  %392 = load i64* %k, align 8
  %393 = sub nsw i64 %392, 1
  %394 = getelementptr inbounds [9 x double]* @lev_tol, i32 0, i64 %393
  store double %391, double* %394, align 8
  %395 = load i64* %k, align 8
  %396 = sub nsw i64 %395, 1
  store i64 %396, i64* %k, align 8
  %397 = load i64* %k, align 8
  %398 = load i64* %my_num, align 8
  call void @putz(i64 %397, i64 %398)
  store double 1.000000e+30, double* %g_error, align 8
  br label %399

; <label>:399                                     ; preds = %387, %383, %378, %375
  br label %400

; <label>:400                                     ; preds = %399
  br label %412

; <label>:401                                     ; preds = %357
  %402 = load i64* %k, align 8
  %403 = load i64* %m, align 8
  %404 = icmp eq i64 %402, %403
  br i1 %404, label %405, label %406

; <label>:405                                     ; preds = %401
  store i64 1, i64* %flag2, align 8
  br label %411

; <label>:406                                     ; preds = %401
  %407 = load i64* %k, align 8
  %408 = load i64* %my_num, align 8
  call void @intadd(i64 %407, i64 %408)
  %409 = load i64* %k, align 8
  %410 = add nsw i64 %409, 1
  store i64 %410, i64* %k, align 8
  store double 1.000000e+30, double* %g_error, align 8
  br label %411

; <label>:411                                     ; preds = %406, %405
  br label %412

; <label>:412                                     ; preds = %411, %400
  br label %8

; <label>:413                                     ; preds = %15
  %414 = load i64* @do_output, align 8
  %415 = icmp ne i64 %414, 0
  br i1 %415, label %416, label %428

; <label>:416                                     ; preds = %413
  %417 = load i64* %my_num, align 8
  %418 = icmp eq i64 %417, 0
  br i1 %418, label %419, label %427

; <label>:419                                     ; preds = %416
  %420 = load i64* %iter, align 8
  %421 = load i64* %k, align 8
  %422 = load %struct.multi_struct** @multi, align 8
  %423 = getelementptr inbounds %struct.multi_struct* %422, i32 0, i32 2
  %424 = load double* %423, align 8
  %425 = load double* %wu, align 8
  %426 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([57 x i8]* @.str237, i32 0, i32 0), i64 %420, i64 %421, double %424, double %425)
  br label %427

; <label>:427                                     ; preds = %419, %416
  br label %428

; <label>:428                                     ; preds = %427, %413
  ret void
}

; Function Attrs: nounwind
declare i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #1

declare i32 @pthread_setcancelstate(i32, i32*) #4

declare i32 @pthread_cond_wait(%union.pthread_cond_t*, %union.pthread_mutex_t*) #4

; Function Attrs: nounwind
declare i32 @pthread_cond_broadcast(%union.pthread_cond_t*) #1

; Function Attrs: nounwind
declare i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #1

; Function Attrs: nounwind uwtable
define void @relax(i64 %k, double* %err, i64 %color, i64 %my_num) #0 {
  %1 = alloca i64, align 8
  %2 = alloca double*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %iend = alloca i64, align 8
  %jend = alloca i64, align 8
  %oddistart = alloca i64, align 8
  %oddjstart = alloca i64, align 8
  %evenistart = alloca i64, align 8
  %evenjstart = alloca i64, align 8
  %oddiendst = alloca i64, align 8
  %eveniendst = alloca i64, align 8
  %oddjendst = alloca i64, align 8
  %evenjendst = alloca i64, align 8
  %a = alloca double, align 8
  %h = alloca double, align 8
  %factor = alloca double, align 8
  %maxerr = alloca double, align 8
  %newerr = alloca double, align 8
  %oldval = alloca double, align 8
  %newval = alloca double, align 8
  store i64 %k, i64* %1, align 8
  store double* %err, double** %2, align 8
  store i64 %color, i64* %3, align 8
  store i64 %my_num, i64* %4, align 8
  store i64 0, i64* %i, align 8
  store i64 0, i64* %j, align 8
  %5 = load double** %2, align 8
  store double 0.000000e+00, double* %5, align 8
  %6 = load i64* %1, align 8
  %7 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %6
  %8 = load double* %7, align 8
  store double %8, double* %h, align 8
  %9 = load i64* %1, align 8
  %10 = load i64* %4, align 8
  %11 = load %struct.Global_Private** @gp, align 8
  %12 = getelementptr inbounds %struct.Global_Private* %11, i64 %10
  %13 = getelementptr inbounds %struct.Global_Private* %12, i32 0, i32 7
  %14 = getelementptr inbounds [9 x i64]* %13, i32 0, i64 %9
  %15 = load i64* %14, align 8
  store i64 %15, i64* %evenistart, align 8
  %16 = load i64* %1, align 8
  %17 = load i64* %4, align 8
  %18 = load %struct.Global_Private** @gp, align 8
  %19 = getelementptr inbounds %struct.Global_Private* %18, i64 %17
  %20 = getelementptr inbounds %struct.Global_Private* %19, i32 0, i32 8
  %21 = getelementptr inbounds [9 x i64]* %20, i32 0, i64 %16
  %22 = load i64* %21, align 8
  store i64 %22, i64* %evenjstart, align 8
  %23 = load i64* %1, align 8
  %24 = load i64* %4, align 8
  %25 = load %struct.Global_Private** @gp, align 8
  %26 = getelementptr inbounds %struct.Global_Private* %25, i64 %24
  %27 = getelementptr inbounds %struct.Global_Private* %26, i32 0, i32 9
  %28 = getelementptr inbounds [9 x i64]* %27, i32 0, i64 %23
  %29 = load i64* %28, align 8
  store i64 %29, i64* %oddistart, align 8
  %30 = load i64* %1, align 8
  %31 = load i64* %4, align 8
  %32 = load %struct.Global_Private** @gp, align 8
  %33 = getelementptr inbounds %struct.Global_Private* %32, i64 %31
  %34 = getelementptr inbounds %struct.Global_Private* %33, i32 0, i32 10
  %35 = getelementptr inbounds [9 x i64]* %34, i32 0, i64 %30
  %36 = load i64* %35, align 8
  store i64 %36, i64* %oddjstart, align 8
  %37 = load i64* %1, align 8
  %38 = load i64* %4, align 8
  %39 = load %struct.Global_Private** @gp, align 8
  %40 = getelementptr inbounds %struct.Global_Private* %39, i64 %38
  %41 = getelementptr inbounds %struct.Global_Private* %40, i32 0, i32 11
  %42 = getelementptr inbounds [9 x i64]* %41, i32 0, i64 %37
  %43 = load i64* %42, align 8
  store i64 %43, i64* %eveniendst, align 8
  %44 = load i64* %1, align 8
  %45 = load i64* %4, align 8
  %46 = load %struct.Global_Private** @gp, align 8
  %47 = getelementptr inbounds %struct.Global_Private* %46, i64 %45
  %48 = getelementptr inbounds %struct.Global_Private* %47, i32 0, i32 12
  %49 = getelementptr inbounds [9 x i64]* %48, i32 0, i64 %44
  %50 = load i64* %49, align 8
  store i64 %50, i64* %evenjendst, align 8
  %51 = load i64* %1, align 8
  %52 = load i64* %4, align 8
  %53 = load %struct.Global_Private** @gp, align 8
  %54 = getelementptr inbounds %struct.Global_Private* %53, i64 %52
  %55 = getelementptr inbounds %struct.Global_Private* %54, i32 0, i32 13
  %56 = getelementptr inbounds [9 x i64]* %55, i32 0, i64 %51
  %57 = load i64* %56, align 8
  store i64 %57, i64* %oddiendst, align 8
  %58 = load i64* %1, align 8
  %59 = load i64* %4, align 8
  %60 = load %struct.Global_Private** @gp, align 8
  %61 = getelementptr inbounds %struct.Global_Private* %60, i64 %59
  %62 = getelementptr inbounds %struct.Global_Private* %61, i32 0, i32 14
  %63 = getelementptr inbounds [9 x i64]* %62, i32 0, i64 %58
  %64 = load i64* %63, align 8
  store i64 %64, i64* %oddjendst, align 8
  %65 = load i64* %1, align 8
  %66 = load i64* %4, align 8
  %67 = load %struct.Global_Private** @gp, align 8
  %68 = getelementptr inbounds %struct.Global_Private* %67, i64 %66
  %69 = getelementptr inbounds %struct.Global_Private* %68, i32 0, i32 4
  %70 = getelementptr inbounds [9 x i64]* %69, i32 0, i64 %65
  %71 = load i64* %70, align 8
  %72 = load i64* %1, align 8
  %73 = load i64* %4, align 8
  %74 = load %struct.Global_Private** @gp, align 8
  %75 = getelementptr inbounds %struct.Global_Private* %74, i64 %73
  %76 = getelementptr inbounds %struct.Global_Private* %75, i32 0, i32 6
  %77 = getelementptr inbounds [9 x i64]* %76, i32 0, i64 %72
  %78 = load i64* %77, align 8
  %79 = add nsw i64 %71, %78
  store i64 %79, i64* %iend, align 8
  %80 = load i64* %1, align 8
  %81 = load i64* %4, align 8
  %82 = load %struct.Global_Private** @gp, align 8
  %83 = getelementptr inbounds %struct.Global_Private* %82, i64 %81
  %84 = getelementptr inbounds %struct.Global_Private* %83, i32 0, i32 3
  %85 = getelementptr inbounds [9 x i64]* %84, i32 0, i64 %80
  %86 = load i64* %85, align 8
  %87 = load i64* %1, align 8
  %88 = load i64* %4, align 8
  %89 = load %struct.Global_Private** @gp, align 8
  %90 = getelementptr inbounds %struct.Global_Private* %89, i64 %88
  %91 = getelementptr inbounds %struct.Global_Private* %90, i32 0, i32 5
  %92 = getelementptr inbounds [9 x i64]* %91, i32 0, i64 %87
  %93 = load i64* %92, align 8
  %94 = add nsw i64 %86, %93
  store i64 %94, i64* %jend, align 8
  %95 = load double* @eig2, align 8
  %96 = load double* %h, align 8
  %97 = fmul double %95, %96
  %98 = load double* %h, align 8
  %99 = fmul double %97, %98
  %100 = fsub double 4.000000e+00, %99
  store double %100, double* %factor, align 8
  store double 0.000000e+00, double* %maxerr, align 8
  %101 = load i64* %3, align 8
  %102 = icmp eq i64 %101, 0
  br i1 %102, label %103, label %314

; <label>:103                                     ; preds = %0
  %104 = load i64* %evenistart, align 8
  store i64 %104, i64* %i, align 8
  br label %105

; <label>:105                                     ; preds = %205, %103
  %106 = load i64* %i, align 8
  %107 = load i64* %iend, align 8
  %108 = icmp slt i64 %106, %107
  br i1 %108, label %109, label %208

; <label>:109                                     ; preds = %105
  %110 = load i64* %evenjstart, align 8
  store i64 %110, i64* %j, align 8
  br label %111

; <label>:111                                     ; preds = %201, %109
  %112 = load i64* %j, align 8
  %113 = load i64* %jend, align 8
  %114 = icmp slt i64 %112, %113
  br i1 %114, label %115, label %204

; <label>:115                                     ; preds = %111
  %116 = load i64* %j, align 8
  %117 = add nsw i64 %116, 1
  %118 = load i64* %i, align 8
  %119 = load i64* %1, align 8
  %120 = load %struct.multi_struct** @multi, align 8
  %121 = getelementptr inbounds %struct.multi_struct* %120, i32 0, i32 0
  %122 = getelementptr inbounds [9 x [258 x [258 x double]]]* %121, i32 0, i64 %119
  %123 = getelementptr inbounds [258 x [258 x double]]* %122, i32 0, i64 %118
  %124 = getelementptr inbounds [258 x double]* %123, i32 0, i64 %117
  %125 = load double* %124, align 8
  %126 = load i64* %j, align 8
  %127 = sub nsw i64 %126, 1
  %128 = load i64* %i, align 8
  %129 = load i64* %1, align 8
  %130 = load %struct.multi_struct** @multi, align 8
  %131 = getelementptr inbounds %struct.multi_struct* %130, i32 0, i32 0
  %132 = getelementptr inbounds [9 x [258 x [258 x double]]]* %131, i32 0, i64 %129
  %133 = getelementptr inbounds [258 x [258 x double]]* %132, i32 0, i64 %128
  %134 = getelementptr inbounds [258 x double]* %133, i32 0, i64 %127
  %135 = load double* %134, align 8
  %136 = fadd double %125, %135
  %137 = load i64* %j, align 8
  %138 = load i64* %i, align 8
  %139 = sub nsw i64 %138, 1
  %140 = load i64* %1, align 8
  %141 = load %struct.multi_struct** @multi, align 8
  %142 = getelementptr inbounds %struct.multi_struct* %141, i32 0, i32 0
  %143 = getelementptr inbounds [9 x [258 x [258 x double]]]* %142, i32 0, i64 %140
  %144 = getelementptr inbounds [258 x [258 x double]]* %143, i32 0, i64 %139
  %145 = getelementptr inbounds [258 x double]* %144, i32 0, i64 %137
  %146 = load double* %145, align 8
  %147 = fadd double %136, %146
  %148 = load i64* %j, align 8
  %149 = load i64* %i, align 8
  %150 = add nsw i64 %149, 1
  %151 = load i64* %1, align 8
  %152 = load %struct.multi_struct** @multi, align 8
  %153 = getelementptr inbounds %struct.multi_struct* %152, i32 0, i32 0
  %154 = getelementptr inbounds [9 x [258 x [258 x double]]]* %153, i32 0, i64 %151
  %155 = getelementptr inbounds [258 x [258 x double]]* %154, i32 0, i64 %150
  %156 = getelementptr inbounds [258 x double]* %155, i32 0, i64 %148
  %157 = load double* %156, align 8
  %158 = fadd double %147, %157
  %159 = load i64* %j, align 8
  %160 = load i64* %i, align 8
  %161 = load i64* %1, align 8
  %162 = load %struct.multi_struct** @multi, align 8
  %163 = getelementptr inbounds %struct.multi_struct* %162, i32 0, i32 1
  %164 = getelementptr inbounds [9 x [258 x [258 x double]]]* %163, i32 0, i64 %161
  %165 = getelementptr inbounds [258 x [258 x double]]* %164, i32 0, i64 %160
  %166 = getelementptr inbounds [258 x double]* %165, i32 0, i64 %159
  %167 = load double* %166, align 8
  %168 = fsub double %158, %167
  store double %168, double* %a, align 8
  %169 = load i64* %j, align 8
  %170 = load i64* %i, align 8
  %171 = load i64* %1, align 8
  %172 = load %struct.multi_struct** @multi, align 8
  %173 = getelementptr inbounds %struct.multi_struct* %172, i32 0, i32 0
  %174 = getelementptr inbounds [9 x [258 x [258 x double]]]* %173, i32 0, i64 %171
  %175 = getelementptr inbounds [258 x [258 x double]]* %174, i32 0, i64 %170
  %176 = getelementptr inbounds [258 x double]* %175, i32 0, i64 %169
  %177 = load double* %176, align 8
  store double %177, double* %oldval, align 8
  %178 = load double* %a, align 8
  %179 = load double* %factor, align 8
  %180 = fdiv double %178, %179
  store double %180, double* %newval, align 8
  %181 = load double* %oldval, align 8
  %182 = load double* %newval, align 8
  %183 = fsub double %181, %182
  store double %183, double* %newerr, align 8
  %184 = load double* %newval, align 8
  %185 = load i64* %j, align 8
  %186 = load i64* %i, align 8
  %187 = load i64* %1, align 8
  %188 = load %struct.multi_struct** @multi, align 8
  %189 = getelementptr inbounds %struct.multi_struct* %188, i32 0, i32 0
  %190 = getelementptr inbounds [9 x [258 x [258 x double]]]* %189, i32 0, i64 %187
  %191 = getelementptr inbounds [258 x [258 x double]]* %190, i32 0, i64 %186
  %192 = getelementptr inbounds [258 x double]* %191, i32 0, i64 %185
  store double %184, double* %192, align 8
  %193 = load double* %newerr, align 8
  %194 = call double @fabs(double %193) #9
  %195 = load double* %maxerr, align 8
  %196 = fcmp ogt double %194, %195
  br i1 %196, label %197, label %200

; <label>:197                                     ; preds = %115
  %198 = load double* %newerr, align 8
  %199 = call double @fabs(double %198) #9
  store double %199, double* %maxerr, align 8
  br label %200

; <label>:200                                     ; preds = %197, %115
  br label %201

; <label>:201                                     ; preds = %200
  %202 = load i64* %j, align 8
  %203 = add nsw i64 %202, 2
  store i64 %203, i64* %j, align 8
  br label %111

; <label>:204                                     ; preds = %111
  br label %205

; <label>:205                                     ; preds = %204
  %206 = load i64* %i, align 8
  %207 = add nsw i64 %206, 2
  store i64 %207, i64* %i, align 8
  br label %105

; <label>:208                                     ; preds = %105
  %209 = load i64* %oddistart, align 8
  store i64 %209, i64* %i, align 8
  br label %210

; <label>:210                                     ; preds = %310, %208
  %211 = load i64* %i, align 8
  %212 = load i64* %iend, align 8
  %213 = icmp slt i64 %211, %212
  br i1 %213, label %214, label %313

; <label>:214                                     ; preds = %210
  %215 = load i64* %oddjstart, align 8
  store i64 %215, i64* %j, align 8
  br label %216

; <label>:216                                     ; preds = %306, %214
  %217 = load i64* %j, align 8
  %218 = load i64* %jend, align 8
  %219 = icmp slt i64 %217, %218
  br i1 %219, label %220, label %309

; <label>:220                                     ; preds = %216
  %221 = load i64* %j, align 8
  %222 = add nsw i64 %221, 1
  %223 = load i64* %i, align 8
  %224 = load i64* %1, align 8
  %225 = load %struct.multi_struct** @multi, align 8
  %226 = getelementptr inbounds %struct.multi_struct* %225, i32 0, i32 0
  %227 = getelementptr inbounds [9 x [258 x [258 x double]]]* %226, i32 0, i64 %224
  %228 = getelementptr inbounds [258 x [258 x double]]* %227, i32 0, i64 %223
  %229 = getelementptr inbounds [258 x double]* %228, i32 0, i64 %222
  %230 = load double* %229, align 8
  %231 = load i64* %j, align 8
  %232 = sub nsw i64 %231, 1
  %233 = load i64* %i, align 8
  %234 = load i64* %1, align 8
  %235 = load %struct.multi_struct** @multi, align 8
  %236 = getelementptr inbounds %struct.multi_struct* %235, i32 0, i32 0
  %237 = getelementptr inbounds [9 x [258 x [258 x double]]]* %236, i32 0, i64 %234
  %238 = getelementptr inbounds [258 x [258 x double]]* %237, i32 0, i64 %233
  %239 = getelementptr inbounds [258 x double]* %238, i32 0, i64 %232
  %240 = load double* %239, align 8
  %241 = fadd double %230, %240
  %242 = load i64* %j, align 8
  %243 = load i64* %i, align 8
  %244 = sub nsw i64 %243, 1
  %245 = load i64* %1, align 8
  %246 = load %struct.multi_struct** @multi, align 8
  %247 = getelementptr inbounds %struct.multi_struct* %246, i32 0, i32 0
  %248 = getelementptr inbounds [9 x [258 x [258 x double]]]* %247, i32 0, i64 %245
  %249 = getelementptr inbounds [258 x [258 x double]]* %248, i32 0, i64 %244
  %250 = getelementptr inbounds [258 x double]* %249, i32 0, i64 %242
  %251 = load double* %250, align 8
  %252 = fadd double %241, %251
  %253 = load i64* %j, align 8
  %254 = load i64* %i, align 8
  %255 = add nsw i64 %254, 1
  %256 = load i64* %1, align 8
  %257 = load %struct.multi_struct** @multi, align 8
  %258 = getelementptr inbounds %struct.multi_struct* %257, i32 0, i32 0
  %259 = getelementptr inbounds [9 x [258 x [258 x double]]]* %258, i32 0, i64 %256
  %260 = getelementptr inbounds [258 x [258 x double]]* %259, i32 0, i64 %255
  %261 = getelementptr inbounds [258 x double]* %260, i32 0, i64 %253
  %262 = load double* %261, align 8
  %263 = fadd double %252, %262
  %264 = load i64* %j, align 8
  %265 = load i64* %i, align 8
  %266 = load i64* %1, align 8
  %267 = load %struct.multi_struct** @multi, align 8
  %268 = getelementptr inbounds %struct.multi_struct* %267, i32 0, i32 1
  %269 = getelementptr inbounds [9 x [258 x [258 x double]]]* %268, i32 0, i64 %266
  %270 = getelementptr inbounds [258 x [258 x double]]* %269, i32 0, i64 %265
  %271 = getelementptr inbounds [258 x double]* %270, i32 0, i64 %264
  %272 = load double* %271, align 8
  %273 = fsub double %263, %272
  store double %273, double* %a, align 8
  %274 = load i64* %j, align 8
  %275 = load i64* %i, align 8
  %276 = load i64* %1, align 8
  %277 = load %struct.multi_struct** @multi, align 8
  %278 = getelementptr inbounds %struct.multi_struct* %277, i32 0, i32 0
  %279 = getelementptr inbounds [9 x [258 x [258 x double]]]* %278, i32 0, i64 %276
  %280 = getelementptr inbounds [258 x [258 x double]]* %279, i32 0, i64 %275
  %281 = getelementptr inbounds [258 x double]* %280, i32 0, i64 %274
  %282 = load double* %281, align 8
  store double %282, double* %oldval, align 8
  %283 = load double* %a, align 8
  %284 = load double* %factor, align 8
  %285 = fdiv double %283, %284
  store double %285, double* %newval, align 8
  %286 = load double* %oldval, align 8
  %287 = load double* %newval, align 8
  %288 = fsub double %286, %287
  store double %288, double* %newerr, align 8
  %289 = load double* %newval, align 8
  %290 = load i64* %j, align 8
  %291 = load i64* %i, align 8
  %292 = load i64* %1, align 8
  %293 = load %struct.multi_struct** @multi, align 8
  %294 = getelementptr inbounds %struct.multi_struct* %293, i32 0, i32 0
  %295 = getelementptr inbounds [9 x [258 x [258 x double]]]* %294, i32 0, i64 %292
  %296 = getelementptr inbounds [258 x [258 x double]]* %295, i32 0, i64 %291
  %297 = getelementptr inbounds [258 x double]* %296, i32 0, i64 %290
  store double %289, double* %297, align 8
  %298 = load double* %newerr, align 8
  %299 = call double @fabs(double %298) #9
  %300 = load double* %maxerr, align 8
  %301 = fcmp ogt double %299, %300
  br i1 %301, label %302, label %305

; <label>:302                                     ; preds = %220
  %303 = load double* %newerr, align 8
  %304 = call double @fabs(double %303) #9
  store double %304, double* %maxerr, align 8
  br label %305

; <label>:305                                     ; preds = %302, %220
  br label %306

; <label>:306                                     ; preds = %305
  %307 = load i64* %j, align 8
  %308 = add nsw i64 %307, 2
  store i64 %308, i64* %j, align 8
  br label %216

; <label>:309                                     ; preds = %216
  br label %310

; <label>:310                                     ; preds = %309
  %311 = load i64* %i, align 8
  %312 = add nsw i64 %311, 2
  store i64 %312, i64* %i, align 8
  br label %210

; <label>:313                                     ; preds = %210
  br label %529

; <label>:314                                     ; preds = %0
  %315 = load i64* %3, align 8
  %316 = icmp eq i64 %315, 1
  br i1 %316, label %317, label %528

; <label>:317                                     ; preds = %314
  %318 = load i64* %evenistart, align 8
  store i64 %318, i64* %i, align 8
  br label %319

; <label>:319                                     ; preds = %419, %317
  %320 = load i64* %i, align 8
  %321 = load i64* %iend, align 8
  %322 = icmp slt i64 %320, %321
  br i1 %322, label %323, label %422

; <label>:323                                     ; preds = %319
  %324 = load i64* %oddjstart, align 8
  store i64 %324, i64* %j, align 8
  br label %325

; <label>:325                                     ; preds = %415, %323
  %326 = load i64* %j, align 8
  %327 = load i64* %jend, align 8
  %328 = icmp slt i64 %326, %327
  br i1 %328, label %329, label %418

; <label>:329                                     ; preds = %325
  %330 = load i64* %j, align 8
  %331 = add nsw i64 %330, 1
  %332 = load i64* %i, align 8
  %333 = load i64* %1, align 8
  %334 = load %struct.multi_struct** @multi, align 8
  %335 = getelementptr inbounds %struct.multi_struct* %334, i32 0, i32 0
  %336 = getelementptr inbounds [9 x [258 x [258 x double]]]* %335, i32 0, i64 %333
  %337 = getelementptr inbounds [258 x [258 x double]]* %336, i32 0, i64 %332
  %338 = getelementptr inbounds [258 x double]* %337, i32 0, i64 %331
  %339 = load double* %338, align 8
  %340 = load i64* %j, align 8
  %341 = sub nsw i64 %340, 1
  %342 = load i64* %i, align 8
  %343 = load i64* %1, align 8
  %344 = load %struct.multi_struct** @multi, align 8
  %345 = getelementptr inbounds %struct.multi_struct* %344, i32 0, i32 0
  %346 = getelementptr inbounds [9 x [258 x [258 x double]]]* %345, i32 0, i64 %343
  %347 = getelementptr inbounds [258 x [258 x double]]* %346, i32 0, i64 %342
  %348 = getelementptr inbounds [258 x double]* %347, i32 0, i64 %341
  %349 = load double* %348, align 8
  %350 = fadd double %339, %349
  %351 = load i64* %j, align 8
  %352 = load i64* %i, align 8
  %353 = sub nsw i64 %352, 1
  %354 = load i64* %1, align 8
  %355 = load %struct.multi_struct** @multi, align 8
  %356 = getelementptr inbounds %struct.multi_struct* %355, i32 0, i32 0
  %357 = getelementptr inbounds [9 x [258 x [258 x double]]]* %356, i32 0, i64 %354
  %358 = getelementptr inbounds [258 x [258 x double]]* %357, i32 0, i64 %353
  %359 = getelementptr inbounds [258 x double]* %358, i32 0, i64 %351
  %360 = load double* %359, align 8
  %361 = fadd double %350, %360
  %362 = load i64* %j, align 8
  %363 = load i64* %i, align 8
  %364 = add nsw i64 %363, 1
  %365 = load i64* %1, align 8
  %366 = load %struct.multi_struct** @multi, align 8
  %367 = getelementptr inbounds %struct.multi_struct* %366, i32 0, i32 0
  %368 = getelementptr inbounds [9 x [258 x [258 x double]]]* %367, i32 0, i64 %365
  %369 = getelementptr inbounds [258 x [258 x double]]* %368, i32 0, i64 %364
  %370 = getelementptr inbounds [258 x double]* %369, i32 0, i64 %362
  %371 = load double* %370, align 8
  %372 = fadd double %361, %371
  %373 = load i64* %j, align 8
  %374 = load i64* %i, align 8
  %375 = load i64* %1, align 8
  %376 = load %struct.multi_struct** @multi, align 8
  %377 = getelementptr inbounds %struct.multi_struct* %376, i32 0, i32 1
  %378 = getelementptr inbounds [9 x [258 x [258 x double]]]* %377, i32 0, i64 %375
  %379 = getelementptr inbounds [258 x [258 x double]]* %378, i32 0, i64 %374
  %380 = getelementptr inbounds [258 x double]* %379, i32 0, i64 %373
  %381 = load double* %380, align 8
  %382 = fsub double %372, %381
  store double %382, double* %a, align 8
  %383 = load i64* %j, align 8
  %384 = load i64* %i, align 8
  %385 = load i64* %1, align 8
  %386 = load %struct.multi_struct** @multi, align 8
  %387 = getelementptr inbounds %struct.multi_struct* %386, i32 0, i32 0
  %388 = getelementptr inbounds [9 x [258 x [258 x double]]]* %387, i32 0, i64 %385
  %389 = getelementptr inbounds [258 x [258 x double]]* %388, i32 0, i64 %384
  %390 = getelementptr inbounds [258 x double]* %389, i32 0, i64 %383
  %391 = load double* %390, align 8
  store double %391, double* %oldval, align 8
  %392 = load double* %a, align 8
  %393 = load double* %factor, align 8
  %394 = fdiv double %392, %393
  store double %394, double* %newval, align 8
  %395 = load double* %oldval, align 8
  %396 = load double* %newval, align 8
  %397 = fsub double %395, %396
  store double %397, double* %newerr, align 8
  %398 = load double* %newval, align 8
  %399 = load i64* %j, align 8
  %400 = load i64* %i, align 8
  %401 = load i64* %1, align 8
  %402 = load %struct.multi_struct** @multi, align 8
  %403 = getelementptr inbounds %struct.multi_struct* %402, i32 0, i32 0
  %404 = getelementptr inbounds [9 x [258 x [258 x double]]]* %403, i32 0, i64 %401
  %405 = getelementptr inbounds [258 x [258 x double]]* %404, i32 0, i64 %400
  %406 = getelementptr inbounds [258 x double]* %405, i32 0, i64 %399
  store double %398, double* %406, align 8
  %407 = load double* %newerr, align 8
  %408 = call double @fabs(double %407) #9
  %409 = load double* %maxerr, align 8
  %410 = fcmp ogt double %408, %409
  br i1 %410, label %411, label %414

; <label>:411                                     ; preds = %329
  %412 = load double* %newerr, align 8
  %413 = call double @fabs(double %412) #9
  store double %413, double* %maxerr, align 8
  br label %414

; <label>:414                                     ; preds = %411, %329
  br label %415

; <label>:415                                     ; preds = %414
  %416 = load i64* %j, align 8
  %417 = add nsw i64 %416, 2
  store i64 %417, i64* %j, align 8
  br label %325

; <label>:418                                     ; preds = %325
  br label %419

; <label>:419                                     ; preds = %418
  %420 = load i64* %i, align 8
  %421 = add nsw i64 %420, 2
  store i64 %421, i64* %i, align 8
  br label %319

; <label>:422                                     ; preds = %319
  %423 = load i64* %oddistart, align 8
  store i64 %423, i64* %i, align 8
  br label %424

; <label>:424                                     ; preds = %524, %422
  %425 = load i64* %i, align 8
  %426 = load i64* %iend, align 8
  %427 = icmp slt i64 %425, %426
  br i1 %427, label %428, label %527

; <label>:428                                     ; preds = %424
  %429 = load i64* %evenjstart, align 8
  store i64 %429, i64* %j, align 8
  br label %430

; <label>:430                                     ; preds = %520, %428
  %431 = load i64* %j, align 8
  %432 = load i64* %jend, align 8
  %433 = icmp slt i64 %431, %432
  br i1 %433, label %434, label %523

; <label>:434                                     ; preds = %430
  %435 = load i64* %j, align 8
  %436 = add nsw i64 %435, 1
  %437 = load i64* %i, align 8
  %438 = load i64* %1, align 8
  %439 = load %struct.multi_struct** @multi, align 8
  %440 = getelementptr inbounds %struct.multi_struct* %439, i32 0, i32 0
  %441 = getelementptr inbounds [9 x [258 x [258 x double]]]* %440, i32 0, i64 %438
  %442 = getelementptr inbounds [258 x [258 x double]]* %441, i32 0, i64 %437
  %443 = getelementptr inbounds [258 x double]* %442, i32 0, i64 %436
  %444 = load double* %443, align 8
  %445 = load i64* %j, align 8
  %446 = sub nsw i64 %445, 1
  %447 = load i64* %i, align 8
  %448 = load i64* %1, align 8
  %449 = load %struct.multi_struct** @multi, align 8
  %450 = getelementptr inbounds %struct.multi_struct* %449, i32 0, i32 0
  %451 = getelementptr inbounds [9 x [258 x [258 x double]]]* %450, i32 0, i64 %448
  %452 = getelementptr inbounds [258 x [258 x double]]* %451, i32 0, i64 %447
  %453 = getelementptr inbounds [258 x double]* %452, i32 0, i64 %446
  %454 = load double* %453, align 8
  %455 = fadd double %444, %454
  %456 = load i64* %j, align 8
  %457 = load i64* %i, align 8
  %458 = sub nsw i64 %457, 1
  %459 = load i64* %1, align 8
  %460 = load %struct.multi_struct** @multi, align 8
  %461 = getelementptr inbounds %struct.multi_struct* %460, i32 0, i32 0
  %462 = getelementptr inbounds [9 x [258 x [258 x double]]]* %461, i32 0, i64 %459
  %463 = getelementptr inbounds [258 x [258 x double]]* %462, i32 0, i64 %458
  %464 = getelementptr inbounds [258 x double]* %463, i32 0, i64 %456
  %465 = load double* %464, align 8
  %466 = fadd double %455, %465
  %467 = load i64* %j, align 8
  %468 = load i64* %i, align 8
  %469 = add nsw i64 %468, 1
  %470 = load i64* %1, align 8
  %471 = load %struct.multi_struct** @multi, align 8
  %472 = getelementptr inbounds %struct.multi_struct* %471, i32 0, i32 0
  %473 = getelementptr inbounds [9 x [258 x [258 x double]]]* %472, i32 0, i64 %470
  %474 = getelementptr inbounds [258 x [258 x double]]* %473, i32 0, i64 %469
  %475 = getelementptr inbounds [258 x double]* %474, i32 0, i64 %467
  %476 = load double* %475, align 8
  %477 = fadd double %466, %476
  %478 = load i64* %j, align 8
  %479 = load i64* %i, align 8
  %480 = load i64* %1, align 8
  %481 = load %struct.multi_struct** @multi, align 8
  %482 = getelementptr inbounds %struct.multi_struct* %481, i32 0, i32 1
  %483 = getelementptr inbounds [9 x [258 x [258 x double]]]* %482, i32 0, i64 %480
  %484 = getelementptr inbounds [258 x [258 x double]]* %483, i32 0, i64 %479
  %485 = getelementptr inbounds [258 x double]* %484, i32 0, i64 %478
  %486 = load double* %485, align 8
  %487 = fsub double %477, %486
  store double %487, double* %a, align 8
  %488 = load i64* %j, align 8
  %489 = load i64* %i, align 8
  %490 = load i64* %1, align 8
  %491 = load %struct.multi_struct** @multi, align 8
  %492 = getelementptr inbounds %struct.multi_struct* %491, i32 0, i32 0
  %493 = getelementptr inbounds [9 x [258 x [258 x double]]]* %492, i32 0, i64 %490
  %494 = getelementptr inbounds [258 x [258 x double]]* %493, i32 0, i64 %489
  %495 = getelementptr inbounds [258 x double]* %494, i32 0, i64 %488
  %496 = load double* %495, align 8
  store double %496, double* %oldval, align 8
  %497 = load double* %a, align 8
  %498 = load double* %factor, align 8
  %499 = fdiv double %497, %498
  store double %499, double* %newval, align 8
  %500 = load double* %oldval, align 8
  %501 = load double* %newval, align 8
  %502 = fsub double %500, %501
  store double %502, double* %newerr, align 8
  %503 = load double* %newval, align 8
  %504 = load i64* %j, align 8
  %505 = load i64* %i, align 8
  %506 = load i64* %1, align 8
  %507 = load %struct.multi_struct** @multi, align 8
  %508 = getelementptr inbounds %struct.multi_struct* %507, i32 0, i32 0
  %509 = getelementptr inbounds [9 x [258 x [258 x double]]]* %508, i32 0, i64 %506
  %510 = getelementptr inbounds [258 x [258 x double]]* %509, i32 0, i64 %505
  %511 = getelementptr inbounds [258 x double]* %510, i32 0, i64 %504
  store double %503, double* %511, align 8
  %512 = load double* %newerr, align 8
  %513 = call double @fabs(double %512) #9
  %514 = load double* %maxerr, align 8
  %515 = fcmp ogt double %513, %514
  br i1 %515, label %516, label %519

; <label>:516                                     ; preds = %434
  %517 = load double* %newerr, align 8
  %518 = call double @fabs(double %517) #9
  store double %518, double* %maxerr, align 8
  br label %519

; <label>:519                                     ; preds = %516, %434
  br label %520

; <label>:520                                     ; preds = %519
  %521 = load i64* %j, align 8
  %522 = add nsw i64 %521, 2
  store i64 %522, i64* %j, align 8
  br label %430

; <label>:523                                     ; preds = %430
  br label %524

; <label>:524                                     ; preds = %523
  %525 = load i64* %i, align 8
  %526 = add nsw i64 %525, 2
  store i64 %526, i64* %i, align 8
  br label %424

; <label>:527                                     ; preds = %424
  br label %528

; <label>:528                                     ; preds = %527, %314
  br label %529

; <label>:529                                     ; preds = %528, %313
  %530 = load double* %maxerr, align 8
  %531 = load double** %2, align 8
  store double %530, double* %531, align 8
  ret void
}

; Function Attrs: nounwind
declare double @pow(double, double) #1

; Function Attrs: nounwind uwtable
define void @rescal(i64 %kf, i64 %my_num) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %ic = alloca i64, align 8
  %if17 = alloca i64, align 8
  %jf = alloca i64, align 8
  %jc = alloca i64, align 8
  %krc = alloca i64, align 8
  %istart = alloca i64, align 8
  %iend = alloca i64, align 8
  %jstart = alloca i64, align 8
  %jend = alloca i64, align 8
  %hf = alloca double, align 8
  %hc = alloca double, align 8
  %s = alloca double, align 8
  %s1 = alloca double, align 8
  %s2 = alloca double, align 8
  %s3 = alloca double, align 8
  %s4 = alloca double, align 8
  %factor = alloca double, align 8
  %int1 = alloca double, align 8
  %int2 = alloca double, align 8
  %i_int_factor = alloca double, align 8
  %j_int_factor = alloca double, align 8
  %int_val = alloca double, align 8
  store i64 %kf, i64* %1, align 8
  store i64 %my_num, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = sub nsw i64 %3, 1
  store i64 %4, i64* %krc, align 8
  %5 = load i64* %krc, align 8
  %6 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %5
  %7 = load double* %6, align 8
  store double %7, double* %hc, align 8
  %8 = load i64* %1, align 8
  %9 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %8
  %10 = load double* %9, align 8
  store double %10, double* %hf, align 8
  %11 = load i64* %krc, align 8
  %12 = load i64* %2, align 8
  %13 = load %struct.Global_Private** @gp, align 8
  %14 = getelementptr inbounds %struct.Global_Private* %13, i64 %12
  %15 = getelementptr inbounds %struct.Global_Private* %14, i32 0, i32 15
  %16 = getelementptr inbounds [9 x i64]* %15, i32 0, i64 %11
  %17 = load i64* %16, align 8
  store i64 %17, i64* %istart, align 8
  %18 = load i64* %krc, align 8
  %19 = load i64* %2, align 8
  %20 = load %struct.Global_Private** @gp, align 8
  %21 = getelementptr inbounds %struct.Global_Private* %20, i64 %19
  %22 = getelementptr inbounds %struct.Global_Private* %21, i32 0, i32 16
  %23 = getelementptr inbounds [9 x i64]* %22, i32 0, i64 %18
  %24 = load i64* %23, align 8
  store i64 %24, i64* %jstart, align 8
  %25 = load i64* %krc, align 8
  %26 = load i64* %2, align 8
  %27 = load %struct.Global_Private** @gp, align 8
  %28 = getelementptr inbounds %struct.Global_Private* %27, i64 %26
  %29 = getelementptr inbounds %struct.Global_Private* %28, i32 0, i32 17
  %30 = getelementptr inbounds [9 x i64]* %29, i32 0, i64 %25
  %31 = load i64* %30, align 8
  store i64 %31, i64* %iend, align 8
  %32 = load i64* %krc, align 8
  %33 = load i64* %2, align 8
  %34 = load %struct.Global_Private** @gp, align 8
  %35 = getelementptr inbounds %struct.Global_Private* %34, i64 %33
  %36 = getelementptr inbounds %struct.Global_Private* %35, i32 0, i32 18
  %37 = getelementptr inbounds [9 x i64]* %36, i32 0, i64 %32
  %38 = load i64* %37, align 8
  store i64 %38, i64* %jend, align 8
  %39 = load i64* %krc, align 8
  %40 = load i64* %2, align 8
  %41 = load %struct.Global_Private** @gp, align 8
  %42 = getelementptr inbounds %struct.Global_Private* %41, i64 %40
  %43 = getelementptr inbounds %struct.Global_Private* %42, i32 0, i32 4
  %44 = getelementptr inbounds [9 x i64]* %43, i32 0, i64 %39
  %45 = load i64* %44, align 8
  %46 = load i64* %krc, align 8
  %47 = load i64* %2, align 8
  %48 = load %struct.Global_Private** @gp, align 8
  %49 = getelementptr inbounds %struct.Global_Private* %48, i64 %47
  %50 = getelementptr inbounds %struct.Global_Private* %49, i32 0, i32 6
  %51 = getelementptr inbounds [9 x i64]* %50, i32 0, i64 %46
  %52 = load i64* %51, align 8
  %53 = add nsw i64 %45, %52
  %54 = sub nsw i64 %53, 1
  store i64 %54, i64* %iend, align 8
  %55 = load i64* %krc, align 8
  %56 = load i64* %2, align 8
  %57 = load %struct.Global_Private** @gp, align 8
  %58 = getelementptr inbounds %struct.Global_Private* %57, i64 %56
  %59 = getelementptr inbounds %struct.Global_Private* %58, i32 0, i32 3
  %60 = getelementptr inbounds [9 x i64]* %59, i32 0, i64 %55
  %61 = load i64* %60, align 8
  %62 = load i64* %krc, align 8
  %63 = load i64* %2, align 8
  %64 = load %struct.Global_Private** @gp, align 8
  %65 = getelementptr inbounds %struct.Global_Private* %64, i64 %63
  %66 = getelementptr inbounds %struct.Global_Private* %65, i32 0, i32 5
  %67 = getelementptr inbounds [9 x i64]* %66, i32 0, i64 %62
  %68 = load i64* %67, align 8
  %69 = add nsw i64 %61, %68
  %70 = sub nsw i64 %69, 1
  store i64 %70, i64* %jend, align 8
  %71 = load double* @eig2, align 8
  %72 = load double* %hf, align 8
  %73 = fmul double %71, %72
  %74 = load double* %hf, align 8
  %75 = fmul double %73, %74
  %76 = fsub double 4.000000e+00, %75
  store double %76, double* %factor, align 8
  %77 = load i64* %istart, align 8
  %78 = sub nsw i64 %77, 1
  %79 = mul nsw i64 2, %78
  store i64 %79, i64* %if17, align 8
  %80 = load i64* %istart, align 8
  store i64 %80, i64* %ic, align 8
  br label %81

; <label>:81                                      ; preds = %465, %0
  %82 = load i64* %ic, align 8
  %83 = load i64* %iend, align 8
  %84 = icmp sle i64 %82, %83
  br i1 %84, label %85, label %468

; <label>:85                                      ; preds = %81
  %86 = load i64* %if17, align 8
  %87 = add nsw i64 %86, 2
  store i64 %87, i64* %if17, align 8
  %88 = load i64* %ic, align 8
  %89 = sitofp i64 %88 to double
  %90 = load i64* %krc, align 8
  %91 = getelementptr inbounds [9 x double]* @i_int_coeff, i32 0, i64 %90
  %92 = load double* %91, align 8
  %93 = fmul double %89, %92
  %94 = fmul double %93, 5.000000e-01
  store double %94, double* %i_int_factor, align 8
  %95 = load i64* %jstart, align 8
  %96 = sub nsw i64 %95, 1
  %97 = mul nsw i64 2, %96
  store i64 %97, i64* %jf, align 8
  %98 = load i64* %jstart, align 8
  store i64 %98, i64* %jc, align 8
  br label %99

; <label>:99                                      ; preds = %461, %85
  %100 = load i64* %jc, align 8
  %101 = load i64* %jend, align 8
  %102 = icmp sle i64 %100, %101
  br i1 %102, label %103, label %464

; <label>:103                                     ; preds = %99
  %104 = load i64* %jf, align 8
  %105 = add nsw i64 %104, 2
  store i64 %105, i64* %jf, align 8
  %106 = load i64* %jc, align 8
  %107 = sitofp i64 %106 to double
  %108 = load i64* %krc, align 8
  %109 = getelementptr inbounds [9 x double]* @j_int_coeff, i32 0, i64 %108
  %110 = load double* %109, align 8
  %111 = fmul double %107, %110
  %112 = fmul double %111, 5.000000e-01
  store double %112, double* %j_int_factor, align 8
  %113 = load i64* %jf, align 8
  %114 = add nsw i64 %113, 1
  %115 = load i64* %if17, align 8
  %116 = load i64* %1, align 8
  %117 = load %struct.multi_struct** @multi, align 8
  %118 = getelementptr inbounds %struct.multi_struct* %117, i32 0, i32 0
  %119 = getelementptr inbounds [9 x [258 x [258 x double]]]* %118, i32 0, i64 %116
  %120 = getelementptr inbounds [258 x [258 x double]]* %119, i32 0, i64 %115
  %121 = getelementptr inbounds [258 x double]* %120, i32 0, i64 %114
  %122 = load double* %121, align 8
  %123 = load i64* %jf, align 8
  %124 = sub nsw i64 %123, 1
  %125 = load i64* %if17, align 8
  %126 = load i64* %1, align 8
  %127 = load %struct.multi_struct** @multi, align 8
  %128 = getelementptr inbounds %struct.multi_struct* %127, i32 0, i32 0
  %129 = getelementptr inbounds [9 x [258 x [258 x double]]]* %128, i32 0, i64 %126
  %130 = getelementptr inbounds [258 x [258 x double]]* %129, i32 0, i64 %125
  %131 = getelementptr inbounds [258 x double]* %130, i32 0, i64 %124
  %132 = load double* %131, align 8
  %133 = fadd double %122, %132
  %134 = load i64* %jf, align 8
  %135 = load i64* %if17, align 8
  %136 = sub nsw i64 %135, 1
  %137 = load i64* %1, align 8
  %138 = load %struct.multi_struct** @multi, align 8
  %139 = getelementptr inbounds %struct.multi_struct* %138, i32 0, i32 0
  %140 = getelementptr inbounds [9 x [258 x [258 x double]]]* %139, i32 0, i64 %137
  %141 = getelementptr inbounds [258 x [258 x double]]* %140, i32 0, i64 %136
  %142 = getelementptr inbounds [258 x double]* %141, i32 0, i64 %134
  %143 = load double* %142, align 8
  %144 = fadd double %133, %143
  %145 = load i64* %jf, align 8
  %146 = load i64* %if17, align 8
  %147 = add nsw i64 %146, 1
  %148 = load i64* %1, align 8
  %149 = load %struct.multi_struct** @multi, align 8
  %150 = getelementptr inbounds %struct.multi_struct* %149, i32 0, i32 0
  %151 = getelementptr inbounds [9 x [258 x [258 x double]]]* %150, i32 0, i64 %148
  %152 = getelementptr inbounds [258 x [258 x double]]* %151, i32 0, i64 %147
  %153 = getelementptr inbounds [258 x double]* %152, i32 0, i64 %145
  %154 = load double* %153, align 8
  %155 = fadd double %144, %154
  store double %155, double* %s, align 8
  %156 = load i64* %jf, align 8
  %157 = load i64* %if17, align 8
  %158 = load i64* %1, align 8
  %159 = load %struct.multi_struct** @multi, align 8
  %160 = getelementptr inbounds %struct.multi_struct* %159, i32 0, i32 1
  %161 = getelementptr inbounds [9 x [258 x [258 x double]]]* %160, i32 0, i64 %158
  %162 = getelementptr inbounds [258 x [258 x double]]* %161, i32 0, i64 %157
  %163 = getelementptr inbounds [258 x double]* %162, i32 0, i64 %156
  %164 = load double* %163, align 8
  %165 = load double* %s, align 8
  %166 = fsub double %164, %165
  %167 = load double* %factor, align 8
  %168 = load i64* %jf, align 8
  %169 = load i64* %if17, align 8
  %170 = load i64* %1, align 8
  %171 = load %struct.multi_struct** @multi, align 8
  %172 = getelementptr inbounds %struct.multi_struct* %171, i32 0, i32 0
  %173 = getelementptr inbounds [9 x [258 x [258 x double]]]* %172, i32 0, i64 %170
  %174 = getelementptr inbounds [258 x [258 x double]]* %173, i32 0, i64 %169
  %175 = getelementptr inbounds [258 x double]* %174, i32 0, i64 %168
  %176 = load double* %175, align 8
  %177 = fmul double %167, %176
  %178 = fadd double %166, %177
  %179 = fmul double 2.000000e+00, %178
  store double %179, double* %s1, align 8
  %180 = load i64* %if17, align 8
  %181 = icmp eq i64 %180, 2
  br i1 %181, label %185, label %182

; <label>:182                                     ; preds = %103
  %183 = load i64* %jf, align 8
  %184 = icmp eq i64 %183, 2
  br i1 %184, label %185, label %186

; <label>:185                                     ; preds = %182, %103
  store double 0.000000e+00, double* %s2, align 8
  br label %258

; <label>:186                                     ; preds = %182
  %187 = load i64* %jf, align 8
  %188 = sub nsw i64 %187, 1
  %189 = load i64* %if17, align 8
  %190 = load i64* %1, align 8
  %191 = load %struct.multi_struct** @multi, align 8
  %192 = getelementptr inbounds %struct.multi_struct* %191, i32 0, i32 0
  %193 = getelementptr inbounds [9 x [258 x [258 x double]]]* %192, i32 0, i64 %190
  %194 = getelementptr inbounds [258 x [258 x double]]* %193, i32 0, i64 %189
  %195 = getelementptr inbounds [258 x double]* %194, i32 0, i64 %188
  %196 = load double* %195, align 8
  %197 = load i64* %jf, align 8
  %198 = sub nsw i64 %197, 3
  %199 = load i64* %if17, align 8
  %200 = load i64* %1, align 8
  %201 = load %struct.multi_struct** @multi, align 8
  %202 = getelementptr inbounds %struct.multi_struct* %201, i32 0, i32 0
  %203 = getelementptr inbounds [9 x [258 x [258 x double]]]* %202, i32 0, i64 %200
  %204 = getelementptr inbounds [258 x [258 x double]]* %203, i32 0, i64 %199
  %205 = getelementptr inbounds [258 x double]* %204, i32 0, i64 %198
  %206 = load double* %205, align 8
  %207 = fadd double %196, %206
  %208 = load i64* %jf, align 8
  %209 = sub nsw i64 %208, 2
  %210 = load i64* %if17, align 8
  %211 = sub nsw i64 %210, 1
  %212 = load i64* %1, align 8
  %213 = load %struct.multi_struct** @multi, align 8
  %214 = getelementptr inbounds %struct.multi_struct* %213, i32 0, i32 0
  %215 = getelementptr inbounds [9 x [258 x [258 x double]]]* %214, i32 0, i64 %212
  %216 = getelementptr inbounds [258 x [258 x double]]* %215, i32 0, i64 %211
  %217 = getelementptr inbounds [258 x double]* %216, i32 0, i64 %209
  %218 = load double* %217, align 8
  %219 = fadd double %207, %218
  %220 = load i64* %jf, align 8
  %221 = sub nsw i64 %220, 2
  %222 = load i64* %if17, align 8
  %223 = add nsw i64 %222, 1
  %224 = load i64* %1, align 8
  %225 = load %struct.multi_struct** @multi, align 8
  %226 = getelementptr inbounds %struct.multi_struct* %225, i32 0, i32 0
  %227 = getelementptr inbounds [9 x [258 x [258 x double]]]* %226, i32 0, i64 %224
  %228 = getelementptr inbounds [258 x [258 x double]]* %227, i32 0, i64 %223
  %229 = getelementptr inbounds [258 x double]* %228, i32 0, i64 %221
  %230 = load double* %229, align 8
  %231 = fadd double %219, %230
  store double %231, double* %s, align 8
  %232 = load i64* %jf, align 8
  %233 = sub nsw i64 %232, 2
  %234 = load i64* %if17, align 8
  %235 = load i64* %1, align 8
  %236 = load %struct.multi_struct** @multi, align 8
  %237 = getelementptr inbounds %struct.multi_struct* %236, i32 0, i32 1
  %238 = getelementptr inbounds [9 x [258 x [258 x double]]]* %237, i32 0, i64 %235
  %239 = getelementptr inbounds [258 x [258 x double]]* %238, i32 0, i64 %234
  %240 = getelementptr inbounds [258 x double]* %239, i32 0, i64 %233
  %241 = load double* %240, align 8
  %242 = load double* %s, align 8
  %243 = fsub double %241, %242
  %244 = load double* %factor, align 8
  %245 = load i64* %jf, align 8
  %246 = sub nsw i64 %245, 2
  %247 = load i64* %if17, align 8
  %248 = load i64* %1, align 8
  %249 = load %struct.multi_struct** @multi, align 8
  %250 = getelementptr inbounds %struct.multi_struct* %249, i32 0, i32 0
  %251 = getelementptr inbounds [9 x [258 x [258 x double]]]* %250, i32 0, i64 %248
  %252 = getelementptr inbounds [258 x [258 x double]]* %251, i32 0, i64 %247
  %253 = getelementptr inbounds [258 x double]* %252, i32 0, i64 %246
  %254 = load double* %253, align 8
  %255 = fmul double %244, %254
  %256 = fadd double %243, %255
  %257 = fmul double 2.000000e+00, %256
  store double %257, double* %s2, align 8
  br label %258

; <label>:258                                     ; preds = %186, %185
  %259 = load i64* %if17, align 8
  %260 = icmp eq i64 %259, 2
  br i1 %260, label %264, label %261

; <label>:261                                     ; preds = %258
  %262 = load i64* %jf, align 8
  %263 = icmp eq i64 %262, 2
  br i1 %263, label %264, label %265

; <label>:264                                     ; preds = %261, %258
  store double 0.000000e+00, double* %s3, align 8
  br label %337

; <label>:265                                     ; preds = %261
  %266 = load i64* %jf, align 8
  %267 = add nsw i64 %266, 1
  %268 = load i64* %if17, align 8
  %269 = sub nsw i64 %268, 2
  %270 = load i64* %1, align 8
  %271 = load %struct.multi_struct** @multi, align 8
  %272 = getelementptr inbounds %struct.multi_struct* %271, i32 0, i32 0
  %273 = getelementptr inbounds [9 x [258 x [258 x double]]]* %272, i32 0, i64 %270
  %274 = getelementptr inbounds [258 x [258 x double]]* %273, i32 0, i64 %269
  %275 = getelementptr inbounds [258 x double]* %274, i32 0, i64 %267
  %276 = load double* %275, align 8
  %277 = load i64* %jf, align 8
  %278 = sub nsw i64 %277, 1
  %279 = load i64* %if17, align 8
  %280 = sub nsw i64 %279, 2
  %281 = load i64* %1, align 8
  %282 = load %struct.multi_struct** @multi, align 8
  %283 = getelementptr inbounds %struct.multi_struct* %282, i32 0, i32 0
  %284 = getelementptr inbounds [9 x [258 x [258 x double]]]* %283, i32 0, i64 %281
  %285 = getelementptr inbounds [258 x [258 x double]]* %284, i32 0, i64 %280
  %286 = getelementptr inbounds [258 x double]* %285, i32 0, i64 %278
  %287 = load double* %286, align 8
  %288 = fadd double %276, %287
  %289 = load i64* %jf, align 8
  %290 = load i64* %if17, align 8
  %291 = sub nsw i64 %290, 3
  %292 = load i64* %1, align 8
  %293 = load %struct.multi_struct** @multi, align 8
  %294 = getelementptr inbounds %struct.multi_struct* %293, i32 0, i32 0
  %295 = getelementptr inbounds [9 x [258 x [258 x double]]]* %294, i32 0, i64 %292
  %296 = getelementptr inbounds [258 x [258 x double]]* %295, i32 0, i64 %291
  %297 = getelementptr inbounds [258 x double]* %296, i32 0, i64 %289
  %298 = load double* %297, align 8
  %299 = fadd double %288, %298
  %300 = load i64* %jf, align 8
  %301 = load i64* %if17, align 8
  %302 = sub nsw i64 %301, 1
  %303 = load i64* %1, align 8
  %304 = load %struct.multi_struct** @multi, align 8
  %305 = getelementptr inbounds %struct.multi_struct* %304, i32 0, i32 0
  %306 = getelementptr inbounds [9 x [258 x [258 x double]]]* %305, i32 0, i64 %303
  %307 = getelementptr inbounds [258 x [258 x double]]* %306, i32 0, i64 %302
  %308 = getelementptr inbounds [258 x double]* %307, i32 0, i64 %300
  %309 = load double* %308, align 8
  %310 = fadd double %299, %309
  store double %310, double* %s, align 8
  %311 = load i64* %jf, align 8
  %312 = load i64* %if17, align 8
  %313 = sub nsw i64 %312, 2
  %314 = load i64* %1, align 8
  %315 = load %struct.multi_struct** @multi, align 8
  %316 = getelementptr inbounds %struct.multi_struct* %315, i32 0, i32 1
  %317 = getelementptr inbounds [9 x [258 x [258 x double]]]* %316, i32 0, i64 %314
  %318 = getelementptr inbounds [258 x [258 x double]]* %317, i32 0, i64 %313
  %319 = getelementptr inbounds [258 x double]* %318, i32 0, i64 %311
  %320 = load double* %319, align 8
  %321 = load double* %s, align 8
  %322 = fsub double %320, %321
  %323 = load double* %factor, align 8
  %324 = load i64* %jf, align 8
  %325 = load i64* %if17, align 8
  %326 = sub nsw i64 %325, 2
  %327 = load i64* %1, align 8
  %328 = load %struct.multi_struct** @multi, align 8
  %329 = getelementptr inbounds %struct.multi_struct* %328, i32 0, i32 0
  %330 = getelementptr inbounds [9 x [258 x [258 x double]]]* %329, i32 0, i64 %327
  %331 = getelementptr inbounds [258 x [258 x double]]* %330, i32 0, i64 %326
  %332 = getelementptr inbounds [258 x double]* %331, i32 0, i64 %324
  %333 = load double* %332, align 8
  %334 = fmul double %323, %333
  %335 = fadd double %322, %334
  %336 = fmul double 2.000000e+00, %335
  store double %336, double* %s3, align 8
  br label %337

; <label>:337                                     ; preds = %265, %264
  %338 = load i64* %if17, align 8
  %339 = icmp eq i64 %338, 2
  br i1 %339, label %343, label %340

; <label>:340                                     ; preds = %337
  %341 = load i64* %jf, align 8
  %342 = icmp eq i64 %341, 2
  br i1 %342, label %343, label %344

; <label>:343                                     ; preds = %340, %337
  store double 0.000000e+00, double* %s4, align 8
  br label %420

; <label>:344                                     ; preds = %340
  %345 = load i64* %jf, align 8
  %346 = sub nsw i64 %345, 1
  %347 = load i64* %if17, align 8
  %348 = sub nsw i64 %347, 2
  %349 = load i64* %1, align 8
  %350 = load %struct.multi_struct** @multi, align 8
  %351 = getelementptr inbounds %struct.multi_struct* %350, i32 0, i32 0
  %352 = getelementptr inbounds [9 x [258 x [258 x double]]]* %351, i32 0, i64 %349
  %353 = getelementptr inbounds [258 x [258 x double]]* %352, i32 0, i64 %348
  %354 = getelementptr inbounds [258 x double]* %353, i32 0, i64 %346
  %355 = load double* %354, align 8
  %356 = load i64* %jf, align 8
  %357 = sub nsw i64 %356, 3
  %358 = load i64* %if17, align 8
  %359 = sub nsw i64 %358, 2
  %360 = load i64* %1, align 8
  %361 = load %struct.multi_struct** @multi, align 8
  %362 = getelementptr inbounds %struct.multi_struct* %361, i32 0, i32 0
  %363 = getelementptr inbounds [9 x [258 x [258 x double]]]* %362, i32 0, i64 %360
  %364 = getelementptr inbounds [258 x [258 x double]]* %363, i32 0, i64 %359
  %365 = getelementptr inbounds [258 x double]* %364, i32 0, i64 %357
  %366 = load double* %365, align 8
  %367 = fadd double %355, %366
  %368 = load i64* %jf, align 8
  %369 = sub nsw i64 %368, 2
  %370 = load i64* %if17, align 8
  %371 = sub nsw i64 %370, 3
  %372 = load i64* %1, align 8
  %373 = load %struct.multi_struct** @multi, align 8
  %374 = getelementptr inbounds %struct.multi_struct* %373, i32 0, i32 0
  %375 = getelementptr inbounds [9 x [258 x [258 x double]]]* %374, i32 0, i64 %372
  %376 = getelementptr inbounds [258 x [258 x double]]* %375, i32 0, i64 %371
  %377 = getelementptr inbounds [258 x double]* %376, i32 0, i64 %369
  %378 = load double* %377, align 8
  %379 = fadd double %367, %378
  %380 = load i64* %jf, align 8
  %381 = sub nsw i64 %380, 2
  %382 = load i64* %if17, align 8
  %383 = sub nsw i64 %382, 1
  %384 = load i64* %1, align 8
  %385 = load %struct.multi_struct** @multi, align 8
  %386 = getelementptr inbounds %struct.multi_struct* %385, i32 0, i32 0
  %387 = getelementptr inbounds [9 x [258 x [258 x double]]]* %386, i32 0, i64 %384
  %388 = getelementptr inbounds [258 x [258 x double]]* %387, i32 0, i64 %383
  %389 = getelementptr inbounds [258 x double]* %388, i32 0, i64 %381
  %390 = load double* %389, align 8
  %391 = fadd double %379, %390
  store double %391, double* %s, align 8
  %392 = load i64* %jf, align 8
  %393 = sub nsw i64 %392, 2
  %394 = load i64* %if17, align 8
  %395 = sub nsw i64 %394, 2
  %396 = load i64* %1, align 8
  %397 = load %struct.multi_struct** @multi, align 8
  %398 = getelementptr inbounds %struct.multi_struct* %397, i32 0, i32 1
  %399 = getelementptr inbounds [9 x [258 x [258 x double]]]* %398, i32 0, i64 %396
  %400 = getelementptr inbounds [258 x [258 x double]]* %399, i32 0, i64 %395
  %401 = getelementptr inbounds [258 x double]* %400, i32 0, i64 %393
  %402 = load double* %401, align 8
  %403 = load double* %s, align 8
  %404 = fsub double %402, %403
  %405 = load double* %factor, align 8
  %406 = load i64* %jf, align 8
  %407 = sub nsw i64 %406, 2
  %408 = load i64* %if17, align 8
  %409 = sub nsw i64 %408, 2
  %410 = load i64* %1, align 8
  %411 = load %struct.multi_struct** @multi, align 8
  %412 = getelementptr inbounds %struct.multi_struct* %411, i32 0, i32 0
  %413 = getelementptr inbounds [9 x [258 x [258 x double]]]* %412, i32 0, i64 %410
  %414 = getelementptr inbounds [258 x [258 x double]]* %413, i32 0, i64 %409
  %415 = getelementptr inbounds [258 x double]* %414, i32 0, i64 %407
  %416 = load double* %415, align 8
  %417 = fmul double %405, %416
  %418 = fadd double %404, %417
  %419 = fmul double 2.000000e+00, %418
  store double %419, double* %s4, align 8
  br label %420

; <label>:420                                     ; preds = %344, %343
  %421 = load double* %j_int_factor, align 8
  %422 = load double* %s4, align 8
  %423 = fmul double %421, %422
  %424 = load double* %j_int_factor, align 8
  %425 = fsub double 1.000000e+00, %424
  %426 = load double* %s3, align 8
  %427 = fmul double %425, %426
  %428 = fadd double %423, %427
  store double %428, double* %int1, align 8
  %429 = load double* %j_int_factor, align 8
  %430 = load double* %s2, align 8
  %431 = fmul double %429, %430
  %432 = load double* %j_int_factor, align 8
  %433 = fsub double 1.000000e+00, %432
  %434 = load double* %s1, align 8
  %435 = fmul double %433, %434
  %436 = fadd double %431, %435
  store double %436, double* %int2, align 8
  %437 = load double* %i_int_factor, align 8
  %438 = load double* %int1, align 8
  %439 = fmul double %437, %438
  %440 = load double* %i_int_factor, align 8
  %441 = fsub double 1.000000e+00, %440
  %442 = load double* %int2, align 8
  %443 = fmul double %441, %442
  %444 = fadd double %439, %443
  store double %444, double* %int_val, align 8
  %445 = load double* %i_int_factor, align 8
  %446 = load double* %int1, align 8
  %447 = fmul double %445, %446
  %448 = load double* %i_int_factor, align 8
  %449 = fsub double 1.000000e+00, %448
  %450 = load double* %int2, align 8
  %451 = fmul double %449, %450
  %452 = fadd double %447, %451
  %453 = load i64* %jc, align 8
  %454 = load i64* %ic, align 8
  %455 = load i64* %krc, align 8
  %456 = load %struct.multi_struct** @multi, align 8
  %457 = getelementptr inbounds %struct.multi_struct* %456, i32 0, i32 1
  %458 = getelementptr inbounds [9 x [258 x [258 x double]]]* %457, i32 0, i64 %455
  %459 = getelementptr inbounds [258 x [258 x double]]* %458, i32 0, i64 %454
  %460 = getelementptr inbounds [258 x double]* %459, i32 0, i64 %453
  store double %452, double* %460, align 8
  br label %461

; <label>:461                                     ; preds = %420
  %462 = load i64* %jc, align 8
  %463 = add nsw i64 %462, 1
  store i64 %463, i64* %jc, align 8
  br label %99

; <label>:464                                     ; preds = %99
  br label %465

; <label>:465                                     ; preds = %464
  %466 = load i64* %ic, align 8
  %467 = add nsw i64 %466, 1
  store i64 %467, i64* %ic, align 8
  br label %81

; <label>:468                                     ; preds = %81
  ret void
}

; Function Attrs: nounwind uwtable
define void @putz(i64 %k, i64 %my_num) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %istart = alloca i64, align 8
  %jstart = alloca i64, align 8
  %iend = alloca i64, align 8
  %jend = alloca i64, align 8
  store i64 %k, i64* %1, align 8
  store i64 %my_num, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = load %struct.Global_Private** @gp, align 8
  %6 = getelementptr inbounds %struct.Global_Private* %5, i64 %4
  %7 = getelementptr inbounds %struct.Global_Private* %6, i32 0, i32 23
  %8 = getelementptr inbounds [9 x i64]* %7, i32 0, i64 %3
  %9 = load i64* %8, align 8
  store i64 %9, i64* %istart, align 8
  %10 = load i64* %1, align 8
  %11 = load i64* %2, align 8
  %12 = load %struct.Global_Private** @gp, align 8
  %13 = getelementptr inbounds %struct.Global_Private* %12, i64 %11
  %14 = getelementptr inbounds %struct.Global_Private* %13, i32 0, i32 24
  %15 = getelementptr inbounds [9 x i64]* %14, i32 0, i64 %10
  %16 = load i64* %15, align 8
  store i64 %16, i64* %jstart, align 8
  %17 = load i64* %1, align 8
  %18 = load i64* %2, align 8
  %19 = load %struct.Global_Private** @gp, align 8
  %20 = getelementptr inbounds %struct.Global_Private* %19, i64 %18
  %21 = getelementptr inbounds %struct.Global_Private* %20, i32 0, i32 25
  %22 = getelementptr inbounds [9 x i64]* %21, i32 0, i64 %17
  %23 = load i64* %22, align 8
  store i64 %23, i64* %iend, align 8
  %24 = load i64* %1, align 8
  %25 = load i64* %2, align 8
  %26 = load %struct.Global_Private** @gp, align 8
  %27 = getelementptr inbounds %struct.Global_Private* %26, i64 %25
  %28 = getelementptr inbounds %struct.Global_Private* %27, i32 0, i32 26
  %29 = getelementptr inbounds [9 x i64]* %28, i32 0, i64 %24
  %30 = load i64* %29, align 8
  store i64 %30, i64* %jend, align 8
  %31 = load i64* %istart, align 8
  store i64 %31, i64* %i, align 8
  br label %32

; <label>:32                                      ; preds = %55, %0
  %33 = load i64* %i, align 8
  %34 = load i64* %iend, align 8
  %35 = icmp sle i64 %33, %34
  br i1 %35, label %36, label %58

; <label>:36                                      ; preds = %32
  %37 = load i64* %jstart, align 8
  store i64 %37, i64* %j, align 8
  br label %38

; <label>:38                                      ; preds = %51, %36
  %39 = load i64* %j, align 8
  %40 = load i64* %jend, align 8
  %41 = icmp sle i64 %39, %40
  br i1 %41, label %42, label %54

; <label>:42                                      ; preds = %38
  %43 = load i64* %j, align 8
  %44 = load i64* %i, align 8
  %45 = load i64* %1, align 8
  %46 = load %struct.multi_struct** @multi, align 8
  %47 = getelementptr inbounds %struct.multi_struct* %46, i32 0, i32 0
  %48 = getelementptr inbounds [9 x [258 x [258 x double]]]* %47, i32 0, i64 %45
  %49 = getelementptr inbounds [258 x [258 x double]]* %48, i32 0, i64 %44
  %50 = getelementptr inbounds [258 x double]* %49, i32 0, i64 %43
  store double 0.000000e+00, double* %50, align 8
  br label %51

; <label>:51                                      ; preds = %42
  %52 = load i64* %j, align 8
  %53 = add nsw i64 %52, 1
  store i64 %53, i64* %j, align 8
  br label %38

; <label>:54                                      ; preds = %38
  br label %55

; <label>:55                                      ; preds = %54
  %56 = load i64* %i, align 8
  %57 = add nsw i64 %56, 1
  store i64 %57, i64* %i, align 8
  br label %32

; <label>:58                                      ; preds = %32
  ret void
}

; Function Attrs: nounwind uwtable
define void @intadd(i64 %kc, i64 %my_num) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %ic = alloca i64, align 8
  %if17 = alloca i64, align 8
  %jf = alloca i64, align 8
  %jc = alloca i64, align 8
  %kf = alloca i64, align 8
  %istart = alloca i64, align 8
  %jstart = alloca i64, align 8
  %iend = alloca i64, align 8
  %jend = alloca i64, align 8
  %hc = alloca double, align 8
  %hf = alloca double, align 8
  %ifine1 = alloca i64, align 8
  %ifine2 = alloca i64, align 8
  %jfine1 = alloca i64, align 8
  %jfine2 = alloca i64, align 8
  %int1 = alloca double, align 8
  %int2 = alloca double, align 8
  %i_int_factor1 = alloca double, align 8
  %j_int_factor1 = alloca double, align 8
  %i_int_factor2 = alloca double, align 8
  %j_int_factor2 = alloca double, align 8
  store i64 %kc, i64* %1, align 8
  store i64 %my_num, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = add nsw i64 %3, 1
  store i64 %4, i64* %kf, align 8
  %5 = load i64* %1, align 8
  %6 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %5
  %7 = load double* %6, align 8
  store double %7, double* %hc, align 8
  %8 = load i64* %kf, align 8
  %9 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %8
  %10 = load double* %9, align 8
  store double %10, double* %hf, align 8
  %11 = load i64* %1, align 8
  %12 = load i64* %2, align 8
  %13 = load %struct.Global_Private** @gp, align 8
  %14 = getelementptr inbounds %struct.Global_Private* %13, i64 %12
  %15 = getelementptr inbounds %struct.Global_Private* %14, i32 0, i32 19
  %16 = getelementptr inbounds [9 x i64]* %15, i32 0, i64 %11
  %17 = load i64* %16, align 8
  store i64 %17, i64* %istart, align 8
  %18 = load i64* %1, align 8
  %19 = load i64* %2, align 8
  %20 = load %struct.Global_Private** @gp, align 8
  %21 = getelementptr inbounds %struct.Global_Private* %20, i64 %19
  %22 = getelementptr inbounds %struct.Global_Private* %21, i32 0, i32 20
  %23 = getelementptr inbounds [9 x i64]* %22, i32 0, i64 %18
  %24 = load i64* %23, align 8
  store i64 %24, i64* %jstart, align 8
  %25 = load i64* %1, align 8
  %26 = load i64* %2, align 8
  %27 = load %struct.Global_Private** @gp, align 8
  %28 = getelementptr inbounds %struct.Global_Private* %27, i64 %26
  %29 = getelementptr inbounds %struct.Global_Private* %28, i32 0, i32 21
  %30 = getelementptr inbounds [9 x i64]* %29, i32 0, i64 %25
  %31 = load i64* %30, align 8
  store i64 %31, i64* %iend, align 8
  %32 = load i64* %1, align 8
  %33 = load i64* %2, align 8
  %34 = load %struct.Global_Private** @gp, align 8
  %35 = getelementptr inbounds %struct.Global_Private* %34, i64 %33
  %36 = getelementptr inbounds %struct.Global_Private* %35, i32 0, i32 22
  %37 = getelementptr inbounds [9 x i64]* %36, i32 0, i64 %32
  %38 = load i64* %37, align 8
  store i64 %38, i64* %jend, align 8
  %39 = load i64* %1, align 8
  %40 = load i64* %2, align 8
  %41 = load %struct.Global_Private** @gp, align 8
  %42 = getelementptr inbounds %struct.Global_Private* %41, i64 %40
  %43 = getelementptr inbounds %struct.Global_Private* %42, i32 0, i32 4
  %44 = getelementptr inbounds [9 x i64]* %43, i32 0, i64 %39
  %45 = load i64* %44, align 8
  store i64 %45, i64* %istart, align 8
  %46 = load i64* %1, align 8
  %47 = load i64* %2, align 8
  %48 = load %struct.Global_Private** @gp, align 8
  %49 = getelementptr inbounds %struct.Global_Private* %48, i64 %47
  %50 = getelementptr inbounds %struct.Global_Private* %49, i32 0, i32 3
  %51 = getelementptr inbounds [9 x i64]* %50, i32 0, i64 %46
  %52 = load i64* %51, align 8
  store i64 %52, i64* %jstart, align 8
  %53 = load i64* %1, align 8
  %54 = load i64* %2, align 8
  %55 = load %struct.Global_Private** @gp, align 8
  %56 = getelementptr inbounds %struct.Global_Private* %55, i64 %54
  %57 = getelementptr inbounds %struct.Global_Private* %56, i32 0, i32 4
  %58 = getelementptr inbounds [9 x i64]* %57, i32 0, i64 %53
  %59 = load i64* %58, align 8
  %60 = load i64* %1, align 8
  %61 = load i64* %2, align 8
  %62 = load %struct.Global_Private** @gp, align 8
  %63 = getelementptr inbounds %struct.Global_Private* %62, i64 %61
  %64 = getelementptr inbounds %struct.Global_Private* %63, i32 0, i32 6
  %65 = getelementptr inbounds [9 x i64]* %64, i32 0, i64 %60
  %66 = load i64* %65, align 8
  %67 = add nsw i64 %59, %66
  %68 = sub nsw i64 %67, 1
  store i64 %68, i64* %iend, align 8
  %69 = load i64* %1, align 8
  %70 = load i64* %2, align 8
  %71 = load %struct.Global_Private** @gp, align 8
  %72 = getelementptr inbounds %struct.Global_Private* %71, i64 %70
  %73 = getelementptr inbounds %struct.Global_Private* %72, i32 0, i32 3
  %74 = getelementptr inbounds [9 x i64]* %73, i32 0, i64 %69
  %75 = load i64* %74, align 8
  %76 = load i64* %1, align 8
  %77 = load i64* %2, align 8
  %78 = load %struct.Global_Private** @gp, align 8
  %79 = getelementptr inbounds %struct.Global_Private* %78, i64 %77
  %80 = getelementptr inbounds %struct.Global_Private* %79, i32 0, i32 5
  %81 = getelementptr inbounds [9 x i64]* %80, i32 0, i64 %76
  %82 = load i64* %81, align 8
  %83 = add nsw i64 %75, %82
  %84 = sub nsw i64 %83, 1
  store i64 %84, i64* %jend, align 8
  %85 = load i64* %istart, align 8
  %86 = sub nsw i64 %85, 1
  %87 = mul nsw i64 2, %86
  store i64 %87, i64* %if17, align 8
  %88 = load i64* %istart, align 8
  store i64 %88, i64* %ic, align 8
  br label %89

; <label>:89                                      ; preds = %387, %0
  %90 = load i64* %ic, align 8
  %91 = load i64* %iend, align 8
  %92 = icmp sle i64 %90, %91
  br i1 %92, label %93, label %390

; <label>:93                                      ; preds = %89
  %94 = load i64* %if17, align 8
  %95 = add nsw i64 %94, 2
  store i64 %95, i64* %if17, align 8
  %96 = load i64* %if17, align 8
  %97 = sub nsw i64 %96, 1
  store i64 %97, i64* %ifine1, align 8
  %98 = load i64* %if17, align 8
  store i64 %98, i64* %ifine2, align 8
  %99 = load i64* %1, align 8
  %100 = getelementptr inbounds [9 x i64]* @imx, i32 0, i64 %99
  %101 = load i64* %100, align 8
  %102 = sub nsw i64 %101, 2
  %103 = load i64* %ic, align 8
  %104 = sub nsw i64 %103, 1
  %105 = sub nsw i64 %102, %104
  %106 = sitofp i64 %105 to double
  %107 = load i64* %kf, align 8
  %108 = getelementptr inbounds [9 x double]* @i_int_coeff, i32 0, i64 %107
  %109 = load double* %108, align 8
  %110 = fmul double %106, %109
  store double %110, double* %i_int_factor1, align 8
  %111 = load i64* %ic, align 8
  %112 = sitofp i64 %111 to double
  %113 = load i64* %kf, align 8
  %114 = getelementptr inbounds [9 x double]* @i_int_coeff, i32 0, i64 %113
  %115 = load double* %114, align 8
  %116 = fmul double %112, %115
  store double %116, double* %i_int_factor2, align 8
  %117 = load i64* %jstart, align 8
  %118 = sub nsw i64 %117, 1
  %119 = mul nsw i64 2, %118
  store i64 %119, i64* %jf, align 8
  %120 = load i64* %jstart, align 8
  store i64 %120, i64* %jc, align 8
  br label %121

; <label>:121                                     ; preds = %383, %93
  %122 = load i64* %jc, align 8
  %123 = load i64* %jend, align 8
  %124 = icmp sle i64 %122, %123
  br i1 %124, label %125, label %386

; <label>:125                                     ; preds = %121
  %126 = load i64* %jf, align 8
  %127 = add nsw i64 %126, 2
  store i64 %127, i64* %jf, align 8
  %128 = load i64* %jf, align 8
  %129 = sub nsw i64 %128, 1
  store i64 %129, i64* %jfine1, align 8
  %130 = load i64* %jf, align 8
  store i64 %130, i64* %jfine2, align 8
  %131 = load i64* %1, align 8
  %132 = getelementptr inbounds [9 x i64]* @jmx, i32 0, i64 %131
  %133 = load i64* %132, align 8
  %134 = sub nsw i64 %133, 2
  %135 = load i64* %jc, align 8
  %136 = sub nsw i64 %135, 1
  %137 = sub nsw i64 %134, %136
  %138 = sitofp i64 %137 to double
  %139 = load i64* %kf, align 8
  %140 = getelementptr inbounds [9 x double]* @j_int_coeff, i32 0, i64 %139
  %141 = load double* %140, align 8
  %142 = fmul double %138, %141
  store double %142, double* %j_int_factor1, align 8
  %143 = load i64* %jc, align 8
  %144 = sitofp i64 %143 to double
  %145 = load i64* %kf, align 8
  %146 = getelementptr inbounds [9 x double]* @j_int_coeff, i32 0, i64 %145
  %147 = load double* %146, align 8
  %148 = fmul double %144, %147
  store double %148, double* %j_int_factor2, align 8
  %149 = load double* %j_int_factor1, align 8
  %150 = load i64* %jc, align 8
  %151 = sub nsw i64 %150, 1
  %152 = load i64* %ic, align 8
  %153 = load i64* %1, align 8
  %154 = load %struct.multi_struct** @multi, align 8
  %155 = getelementptr inbounds %struct.multi_struct* %154, i32 0, i32 0
  %156 = getelementptr inbounds [9 x [258 x [258 x double]]]* %155, i32 0, i64 %153
  %157 = getelementptr inbounds [258 x [258 x double]]* %156, i32 0, i64 %152
  %158 = getelementptr inbounds [258 x double]* %157, i32 0, i64 %151
  %159 = load double* %158, align 8
  %160 = fmul double %149, %159
  %161 = load double* %j_int_factor1, align 8
  %162 = fsub double 1.000000e+00, %161
  %163 = load i64* %jc, align 8
  %164 = load i64* %ic, align 8
  %165 = load i64* %1, align 8
  %166 = load %struct.multi_struct** @multi, align 8
  %167 = getelementptr inbounds %struct.multi_struct* %166, i32 0, i32 0
  %168 = getelementptr inbounds [9 x [258 x [258 x double]]]* %167, i32 0, i64 %165
  %169 = getelementptr inbounds [258 x [258 x double]]* %168, i32 0, i64 %164
  %170 = getelementptr inbounds [258 x double]* %169, i32 0, i64 %163
  %171 = load double* %170, align 8
  %172 = fmul double %162, %171
  %173 = fadd double %160, %172
  store double %173, double* %int1, align 8
  %174 = load double* %j_int_factor1, align 8
  %175 = load i64* %jc, align 8
  %176 = sub nsw i64 %175, 1
  %177 = load i64* %ic, align 8
  %178 = sub nsw i64 %177, 1
  %179 = load i64* %1, align 8
  %180 = load %struct.multi_struct** @multi, align 8
  %181 = getelementptr inbounds %struct.multi_struct* %180, i32 0, i32 0
  %182 = getelementptr inbounds [9 x [258 x [258 x double]]]* %181, i32 0, i64 %179
  %183 = getelementptr inbounds [258 x [258 x double]]* %182, i32 0, i64 %178
  %184 = getelementptr inbounds [258 x double]* %183, i32 0, i64 %176
  %185 = load double* %184, align 8
  %186 = fmul double %174, %185
  %187 = load double* %j_int_factor1, align 8
  %188 = fsub double 1.000000e+00, %187
  %189 = load i64* %jc, align 8
  %190 = load i64* %ic, align 8
  %191 = sub nsw i64 %190, 1
  %192 = load i64* %1, align 8
  %193 = load %struct.multi_struct** @multi, align 8
  %194 = getelementptr inbounds %struct.multi_struct* %193, i32 0, i32 0
  %195 = getelementptr inbounds [9 x [258 x [258 x double]]]* %194, i32 0, i64 %192
  %196 = getelementptr inbounds [258 x [258 x double]]* %195, i32 0, i64 %191
  %197 = getelementptr inbounds [258 x double]* %196, i32 0, i64 %189
  %198 = load double* %197, align 8
  %199 = fmul double %188, %198
  %200 = fadd double %186, %199
  store double %200, double* %int2, align 8
  %201 = load double* %i_int_factor1, align 8
  %202 = load double* %int2, align 8
  %203 = fmul double %201, %202
  %204 = load double* %i_int_factor1, align 8
  %205 = fsub double 1.000000e+00, %204
  %206 = load double* %int1, align 8
  %207 = fmul double %205, %206
  %208 = fadd double %203, %207
  %209 = load i64* %jf, align 8
  %210 = sub nsw i64 %209, 1
  %211 = load i64* %if17, align 8
  %212 = sub nsw i64 %211, 1
  %213 = load i64* %kf, align 8
  %214 = load %struct.multi_struct** @multi, align 8
  %215 = getelementptr inbounds %struct.multi_struct* %214, i32 0, i32 0
  %216 = getelementptr inbounds [9 x [258 x [258 x double]]]* %215, i32 0, i64 %213
  %217 = getelementptr inbounds [258 x [258 x double]]* %216, i32 0, i64 %212
  %218 = getelementptr inbounds [258 x double]* %217, i32 0, i64 %210
  %219 = load double* %218, align 8
  %220 = fadd double %219, %208
  store double %220, double* %218, align 8
  %221 = load double* %j_int_factor1, align 8
  %222 = load i64* %jc, align 8
  %223 = sub nsw i64 %222, 1
  %224 = load i64* %ic, align 8
  %225 = add nsw i64 %224, 1
  %226 = load i64* %1, align 8
  %227 = load %struct.multi_struct** @multi, align 8
  %228 = getelementptr inbounds %struct.multi_struct* %227, i32 0, i32 0
  %229 = getelementptr inbounds [9 x [258 x [258 x double]]]* %228, i32 0, i64 %226
  %230 = getelementptr inbounds [258 x [258 x double]]* %229, i32 0, i64 %225
  %231 = getelementptr inbounds [258 x double]* %230, i32 0, i64 %223
  %232 = load double* %231, align 8
  %233 = fmul double %221, %232
  %234 = load double* %j_int_factor1, align 8
  %235 = fsub double 1.000000e+00, %234
  %236 = load i64* %jc, align 8
  %237 = load i64* %ic, align 8
  %238 = add nsw i64 %237, 1
  %239 = load i64* %1, align 8
  %240 = load %struct.multi_struct** @multi, align 8
  %241 = getelementptr inbounds %struct.multi_struct* %240, i32 0, i32 0
  %242 = getelementptr inbounds [9 x [258 x [258 x double]]]* %241, i32 0, i64 %239
  %243 = getelementptr inbounds [258 x [258 x double]]* %242, i32 0, i64 %238
  %244 = getelementptr inbounds [258 x double]* %243, i32 0, i64 %236
  %245 = load double* %244, align 8
  %246 = fmul double %235, %245
  %247 = fadd double %233, %246
  store double %247, double* %int2, align 8
  %248 = load double* %i_int_factor2, align 8
  %249 = load double* %int2, align 8
  %250 = fmul double %248, %249
  %251 = load double* %i_int_factor2, align 8
  %252 = fsub double 1.000000e+00, %251
  %253 = load double* %int1, align 8
  %254 = fmul double %252, %253
  %255 = fadd double %250, %254
  %256 = load i64* %jf, align 8
  %257 = sub nsw i64 %256, 1
  %258 = load i64* %if17, align 8
  %259 = load i64* %kf, align 8
  %260 = load %struct.multi_struct** @multi, align 8
  %261 = getelementptr inbounds %struct.multi_struct* %260, i32 0, i32 0
  %262 = getelementptr inbounds [9 x [258 x [258 x double]]]* %261, i32 0, i64 %259
  %263 = getelementptr inbounds [258 x [258 x double]]* %262, i32 0, i64 %258
  %264 = getelementptr inbounds [258 x double]* %263, i32 0, i64 %257
  %265 = load double* %264, align 8
  %266 = fadd double %265, %255
  store double %266, double* %264, align 8
  %267 = load double* %j_int_factor2, align 8
  %268 = load i64* %jc, align 8
  %269 = add nsw i64 %268, 1
  %270 = load i64* %ic, align 8
  %271 = load i64* %1, align 8
  %272 = load %struct.multi_struct** @multi, align 8
  %273 = getelementptr inbounds %struct.multi_struct* %272, i32 0, i32 0
  %274 = getelementptr inbounds [9 x [258 x [258 x double]]]* %273, i32 0, i64 %271
  %275 = getelementptr inbounds [258 x [258 x double]]* %274, i32 0, i64 %270
  %276 = getelementptr inbounds [258 x double]* %275, i32 0, i64 %269
  %277 = load double* %276, align 8
  %278 = fmul double %267, %277
  %279 = load double* %j_int_factor2, align 8
  %280 = fsub double 1.000000e+00, %279
  %281 = load i64* %jc, align 8
  %282 = load i64* %ic, align 8
  %283 = load i64* %1, align 8
  %284 = load %struct.multi_struct** @multi, align 8
  %285 = getelementptr inbounds %struct.multi_struct* %284, i32 0, i32 0
  %286 = getelementptr inbounds [9 x [258 x [258 x double]]]* %285, i32 0, i64 %283
  %287 = getelementptr inbounds [258 x [258 x double]]* %286, i32 0, i64 %282
  %288 = getelementptr inbounds [258 x double]* %287, i32 0, i64 %281
  %289 = load double* %288, align 8
  %290 = fmul double %280, %289
  %291 = fadd double %278, %290
  store double %291, double* %int1, align 8
  %292 = load double* %j_int_factor2, align 8
  %293 = load i64* %jc, align 8
  %294 = add nsw i64 %293, 1
  %295 = load i64* %ic, align 8
  %296 = sub nsw i64 %295, 1
  %297 = load i64* %1, align 8
  %298 = load %struct.multi_struct** @multi, align 8
  %299 = getelementptr inbounds %struct.multi_struct* %298, i32 0, i32 0
  %300 = getelementptr inbounds [9 x [258 x [258 x double]]]* %299, i32 0, i64 %297
  %301 = getelementptr inbounds [258 x [258 x double]]* %300, i32 0, i64 %296
  %302 = getelementptr inbounds [258 x double]* %301, i32 0, i64 %294
  %303 = load double* %302, align 8
  %304 = fmul double %292, %303
  %305 = load double* %j_int_factor2, align 8
  %306 = fsub double 1.000000e+00, %305
  %307 = load i64* %jc, align 8
  %308 = load i64* %ic, align 8
  %309 = sub nsw i64 %308, 1
  %310 = load i64* %1, align 8
  %311 = load %struct.multi_struct** @multi, align 8
  %312 = getelementptr inbounds %struct.multi_struct* %311, i32 0, i32 0
  %313 = getelementptr inbounds [9 x [258 x [258 x double]]]* %312, i32 0, i64 %310
  %314 = getelementptr inbounds [258 x [258 x double]]* %313, i32 0, i64 %309
  %315 = getelementptr inbounds [258 x double]* %314, i32 0, i64 %307
  %316 = load double* %315, align 8
  %317 = fmul double %306, %316
  %318 = fadd double %304, %317
  store double %318, double* %int2, align 8
  %319 = load double* %i_int_factor1, align 8
  %320 = load double* %int2, align 8
  %321 = fmul double %319, %320
  %322 = load double* %i_int_factor1, align 8
  %323 = fsub double 1.000000e+00, %322
  %324 = load double* %int1, align 8
  %325 = fmul double %323, %324
  %326 = fadd double %321, %325
  %327 = load i64* %jf, align 8
  %328 = load i64* %if17, align 8
  %329 = sub nsw i64 %328, 1
  %330 = load i64* %kf, align 8
  %331 = load %struct.multi_struct** @multi, align 8
  %332 = getelementptr inbounds %struct.multi_struct* %331, i32 0, i32 0
  %333 = getelementptr inbounds [9 x [258 x [258 x double]]]* %332, i32 0, i64 %330
  %334 = getelementptr inbounds [258 x [258 x double]]* %333, i32 0, i64 %329
  %335 = getelementptr inbounds [258 x double]* %334, i32 0, i64 %327
  %336 = load double* %335, align 8
  %337 = fadd double %336, %326
  store double %337, double* %335, align 8
  %338 = load double* %j_int_factor2, align 8
  %339 = load i64* %jc, align 8
  %340 = add nsw i64 %339, 1
  %341 = load i64* %ic, align 8
  %342 = add nsw i64 %341, 1
  %343 = load i64* %1, align 8
  %344 = load %struct.multi_struct** @multi, align 8
  %345 = getelementptr inbounds %struct.multi_struct* %344, i32 0, i32 0
  %346 = getelementptr inbounds [9 x [258 x [258 x double]]]* %345, i32 0, i64 %343
  %347 = getelementptr inbounds [258 x [258 x double]]* %346, i32 0, i64 %342
  %348 = getelementptr inbounds [258 x double]* %347, i32 0, i64 %340
  %349 = load double* %348, align 8
  %350 = fmul double %338, %349
  %351 = load double* %j_int_factor2, align 8
  %352 = fsub double 1.000000e+00, %351
  %353 = load i64* %jc, align 8
  %354 = load i64* %ic, align 8
  %355 = add nsw i64 %354, 1
  %356 = load i64* %1, align 8
  %357 = load %struct.multi_struct** @multi, align 8
  %358 = getelementptr inbounds %struct.multi_struct* %357, i32 0, i32 0
  %359 = getelementptr inbounds [9 x [258 x [258 x double]]]* %358, i32 0, i64 %356
  %360 = getelementptr inbounds [258 x [258 x double]]* %359, i32 0, i64 %355
  %361 = getelementptr inbounds [258 x double]* %360, i32 0, i64 %353
  %362 = load double* %361, align 8
  %363 = fmul double %352, %362
  %364 = fadd double %350, %363
  store double %364, double* %int2, align 8
  %365 = load double* %i_int_factor2, align 8
  %366 = load double* %int2, align 8
  %367 = fmul double %365, %366
  %368 = load double* %i_int_factor2, align 8
  %369 = fsub double 1.000000e+00, %368
  %370 = load double* %int1, align 8
  %371 = fmul double %369, %370
  %372 = fadd double %367, %371
  %373 = load i64* %jf, align 8
  %374 = load i64* %if17, align 8
  %375 = load i64* %kf, align 8
  %376 = load %struct.multi_struct** @multi, align 8
  %377 = getelementptr inbounds %struct.multi_struct* %376, i32 0, i32 0
  %378 = getelementptr inbounds [9 x [258 x [258 x double]]]* %377, i32 0, i64 %375
  %379 = getelementptr inbounds [258 x [258 x double]]* %378, i32 0, i64 %374
  %380 = getelementptr inbounds [258 x double]* %379, i32 0, i64 %373
  %381 = load double* %380, align 8
  %382 = fadd double %381, %372
  store double %382, double* %380, align 8
  br label %383

; <label>:383                                     ; preds = %125
  %384 = load i64* %jc, align 8
  %385 = add nsw i64 %384, 1
  store i64 %385, i64* %jc, align 8
  br label %121

; <label>:386                                     ; preds = %121
  br label %387

; <label>:387                                     ; preds = %386
  %388 = load i64* %ic, align 8
  %389 = add nsw i64 %388, 1
  store i64 %389, i64* %ic, align 8
  br label %89

; <label>:390                                     ; preds = %89
  ret void
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #5

; Function Attrs: nounwind uwtable
define void @slave() #0 {
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %nstep = alloca i64, align 8
  %iindex = alloca i64, align 8
  %iday = alloca i64, align 8
  %ysca1 = alloca double, align 8
  %y = alloca double, align 8
  %factor = alloca double, align 8
  %sintemp = alloca double, align 8
  %curlt = alloca double, align 8
  %ressqr = alloca double, align 8
  %istart = alloca i64, align 8
  %iend = alloca i64, align 8
  %jstart = alloca i64, align 8
  %jend = alloca i64, align 8
  %ist = alloca i64, align 8
  %ien = alloca i64, align 8
  %jst = alloca i64, align 8
  %jen = alloca i64, align 8
  %fac = alloca double, align 8
  %dayflag = alloca i64, align 8
  %dhourflag = alloca i64, align 8
  %endflag = alloca i64, align 8
  %ttime = alloca double, align 8
  %dhour = alloca double, align 8
  %day = alloca double, align 8
  %firstrow = alloca i64, align 8
  %lastrow = alloca i64, align 8
  %numrows = alloca i64, align 8
  %firstcol = alloca i64, align 8
  %lastcol = alloca i64, align 8
  %numcols = alloca i64, align 8
  %psiindex = alloca i64, align 8
  %psibipriv = alloca double, align 8
  %psinum = alloca i64, align 8
  %procid = alloca i64, align 8
  %t1 = alloca i64, align 8
  %Error = alloca i64, align 8
  %Cycle = alloca i64, align 8
  %Cancel = alloca i64, align 8
  %Temp = alloca i64, align 8
  %Error1 = alloca i64, align 8
  %Cycle2 = alloca i64, align 8
  %Cancel3 = alloca i64, align 8
  %Temp4 = alloca i64, align 8
  %Error5 = alloca i64, align 8
  %Cycle6 = alloca i64, align 8
  %Cancel7 = alloca i64, align 8
  %Temp8 = alloca i64, align 8
  %Error9 = alloca i64, align 8
  %Cycle10 = alloca i64, align 8
  %Cancel11 = alloca i64, align 8
  %Temp12 = alloca i64, align 8
  %FullTime = alloca %struct.timeval, align 8
  %FullTime13 = alloca %struct.timeval, align 8
  %FullTime14 = alloca %struct.timeval, align 8
  store i64 0, i64* %dayflag, align 8
  store i64 0, i64* %dhourflag, align 8
  store i64 0, i64* %endflag, align 8
  %1 = load i64* @numlev, align 8
  %2 = sub nsw i64 %1, 1
  %3 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %2
  %4 = load double* %3, align 8
  %5 = load i64* @numlev, align 8
  %6 = sub nsw i64 %5, 1
  %7 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %6
  %8 = load double* %7, align 8
  %9 = fmul double %4, %8
  store double %9, double* %ressqr, align 8
  %10 = load %struct.locks_struct** @locks, align 8
  %11 = getelementptr inbounds %struct.locks_struct* %10, i32 0, i32 0
  %12 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %11) #6
  %13 = load %struct.global_struct** @global, align 8
  %14 = getelementptr inbounds %struct.global_struct* %13, i32 0, i32 0
  %15 = load i64* %14, align 8
  store i64 %15, i64* %procid, align 8
  %16 = load %struct.global_struct** @global, align 8
  %17 = getelementptr inbounds %struct.global_struct* %16, i32 0, i32 0
  %18 = load i64* %17, align 8
  %19 = add nsw i64 %18, 1
  %20 = load %struct.global_struct** @global, align 8
  %21 = getelementptr inbounds %struct.global_struct* %20, i32 0, i32 0
  store i64 %19, i64* %21, align 8
  %22 = load %struct.locks_struct** @locks, align 8
  %23 = getelementptr inbounds %struct.locks_struct* %22, i32 0, i32 0
  %24 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %23) #6
  %25 = load i64* @numlev, align 8
  %26 = sub nsw i64 %25, 1
  %27 = load i64* %procid, align 8
  %28 = load %struct.Global_Private** @gp, align 8
  %29 = getelementptr inbounds %struct.Global_Private* %28, i64 %27
  %30 = getelementptr inbounds %struct.Global_Private* %29, i32 0, i32 3
  %31 = getelementptr inbounds [9 x i64]* %30, i32 0, i64 %26
  %32 = load i64* %31, align 8
  store i64 %32, i64* %firstcol, align 8
  %33 = load i64* %firstcol, align 8
  %34 = load i64* @numlev, align 8
  %35 = sub nsw i64 %34, 1
  %36 = load i64* %procid, align 8
  %37 = load %struct.Global_Private** @gp, align 8
  %38 = getelementptr inbounds %struct.Global_Private* %37, i64 %36
  %39 = getelementptr inbounds %struct.Global_Private* %38, i32 0, i32 5
  %40 = getelementptr inbounds [9 x i64]* %39, i32 0, i64 %35
  %41 = load i64* %40, align 8
  %42 = add nsw i64 %33, %41
  %43 = sub nsw i64 %42, 1
  store i64 %43, i64* %lastcol, align 8
  %44 = load i64* @numlev, align 8
  %45 = sub nsw i64 %44, 1
  %46 = load i64* %procid, align 8
  %47 = load %struct.Global_Private** @gp, align 8
  %48 = getelementptr inbounds %struct.Global_Private* %47, i64 %46
  %49 = getelementptr inbounds %struct.Global_Private* %48, i32 0, i32 4
  %50 = getelementptr inbounds [9 x i64]* %49, i32 0, i64 %45
  %51 = load i64* %50, align 8
  store i64 %51, i64* %firstrow, align 8
  %52 = load i64* %firstrow, align 8
  %53 = load i64* @numlev, align 8
  %54 = sub nsw i64 %53, 1
  %55 = load i64* %procid, align 8
  %56 = load %struct.Global_Private** @gp, align 8
  %57 = getelementptr inbounds %struct.Global_Private* %56, i64 %55
  %58 = getelementptr inbounds %struct.Global_Private* %57, i32 0, i32 6
  %59 = getelementptr inbounds [9 x i64]* %58, i32 0, i64 %54
  %60 = load i64* %59, align 8
  %61 = add nsw i64 %52, %60
  %62 = sub nsw i64 %61, 1
  store i64 %62, i64* %lastrow, align 8
  %63 = load i64* @numlev, align 8
  %64 = sub nsw i64 %63, 1
  %65 = load i64* %procid, align 8
  %66 = load %struct.Global_Private** @gp, align 8
  %67 = getelementptr inbounds %struct.Global_Private* %66, i64 %65
  %68 = getelementptr inbounds %struct.Global_Private* %67, i32 0, i32 5
  %69 = getelementptr inbounds [9 x i64]* %68, i32 0, i64 %64
  %70 = load i64* %69, align 8
  store i64 %70, i64* %numcols, align 8
  %71 = load i64* @numlev, align 8
  %72 = sub nsw i64 %71, 1
  %73 = load i64* %procid, align 8
  %74 = load %struct.Global_Private** @gp, align 8
  %75 = getelementptr inbounds %struct.Global_Private* %74, i64 %73
  %76 = getelementptr inbounds %struct.Global_Private* %75, i32 0, i32 6
  %77 = getelementptr inbounds [9 x i64]* %76, i32 0, i64 %72
  %78 = load i64* %77, align 8
  store i64 %78, i64* %numrows, align 8
  %79 = load i64* %procid, align 8
  %80 = load i64* @nprocs, align 8
  %81 = sdiv i64 %80, 2
  %82 = icmp sgt i64 %79, %81
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %0
  store i64 2, i64* %psinum, align 8
  br label %85

; <label>:84                                      ; preds = %0
  store i64 1, i64* %psinum, align 8
  br label %85

; <label>:85                                      ; preds = %84, %83
  store double 0.000000e+00, double* %ttime, align 8
  store double 0.000000e+00, double* %dhour, align 8
  store i64 0, i64* %nstep, align 8
  store double 0.000000e+00, double* %day, align 8
  %86 = load double* @ysca, align 8
  %87 = fmul double 5.000000e-01, %86
  store double %87, double* %ysca1, align 8
  %88 = load i64* %procid, align 8
  %89 = icmp eq i64 %88, 0
  br i1 %89, label %90, label %116

; <label>:90                                      ; preds = %85
  store i64 0, i64* %iindex, align 8
  br label %91

; <label>:91                                      ; preds = %112, %90
  %92 = load i64* %iindex, align 8
  %93 = load i64* @jm, align 8
  %94 = sub nsw i64 %93, 1
  %95 = icmp sle i64 %92, %94
  br i1 %95, label %96, label %115

; <label>:96                                      ; preds = %91
  %97 = load i64* %iindex, align 8
  %98 = sitofp i64 %97 to double
  %99 = load double* @res, align 8
  %100 = fmul double %98, %99
  store double %100, double* %y, align 8
  %101 = load double* @f0, align 8
  %102 = load double* @beta, align 8
  %103 = load double* %y, align 8
  %104 = load double* %ysca1, align 8
  %105 = fsub double %103, %104
  %106 = fmul double %102, %105
  %107 = fadd double %101, %106
  %108 = load i64* %iindex, align 8
  %109 = load %struct.wrk2_struct** @wrk2, align 8
  %110 = getelementptr inbounds %struct.wrk2_struct* %109, i32 0, i32 1
  %111 = getelementptr inbounds [258 x double]* %110, i32 0, i64 %108
  store double %107, double* %111, align 8
  br label %112

; <label>:112                                     ; preds = %96
  %113 = load i64* %iindex, align 8
  %114 = add nsw i64 %113, 1
  store i64 %114, i64* %iindex, align 8
  br label %91

; <label>:115                                     ; preds = %91
  br label %116

; <label>:116                                     ; preds = %115, %85
  %117 = load i64* %procid, align 8
  %118 = icmp eq i64 %117, 0
  br i1 %118, label %119, label %124

; <label>:119                                     ; preds = %116
  %120 = load %struct.fields2_struct** @fields2, align 8
  %121 = getelementptr inbounds %struct.fields2_struct* %120, i32 0, i32 0
  %122 = getelementptr inbounds [258 x [258 x double]]* %121, i32 0, i64 0
  %123 = getelementptr inbounds [258 x double]* %122, i32 0, i64 0
  store double 0.000000e+00, double* %123, align 8
  br label %124

; <label>:124                                     ; preds = %119, %116
  %125 = load i64* %procid, align 8
  %126 = load i64* @nprocs, align 8
  %127 = load i64* @xprocs, align 8
  %128 = sub nsw i64 %126, %127
  %129 = icmp eq i64 %125, %128
  br i1 %129, label %130, label %137

; <label>:130                                     ; preds = %124
  %131 = load i64* @im, align 8
  %132 = sub nsw i64 %131, 1
  %133 = load %struct.fields2_struct** @fields2, align 8
  %134 = getelementptr inbounds %struct.fields2_struct* %133, i32 0, i32 0
  %135 = getelementptr inbounds [258 x [258 x double]]* %134, i32 0, i64 %132
  %136 = getelementptr inbounds [258 x double]* %135, i32 0, i64 0
  store double 0.000000e+00, double* %136, align 8
  br label %137

; <label>:137                                     ; preds = %130, %124
  %138 = load i64* %procid, align 8
  %139 = load i64* @xprocs, align 8
  %140 = sub nsw i64 %139, 1
  %141 = icmp eq i64 %138, %140
  br i1 %141, label %142, label %149

; <label>:142                                     ; preds = %137
  %143 = load i64* @jm, align 8
  %144 = sub nsw i64 %143, 1
  %145 = load %struct.fields2_struct** @fields2, align 8
  %146 = getelementptr inbounds %struct.fields2_struct* %145, i32 0, i32 0
  %147 = getelementptr inbounds [258 x [258 x double]]* %146, i32 0, i64 0
  %148 = getelementptr inbounds [258 x double]* %147, i32 0, i64 %144
  store double 0.000000e+00, double* %148, align 8
  br label %149

; <label>:149                                     ; preds = %142, %137
  %150 = load i64* %procid, align 8
  %151 = load i64* @nprocs, align 8
  %152 = sub nsw i64 %151, 1
  %153 = icmp eq i64 %150, %152
  br i1 %153, label %154, label %163

; <label>:154                                     ; preds = %149
  %155 = load i64* @jm, align 8
  %156 = sub nsw i64 %155, 1
  %157 = load i64* @im, align 8
  %158 = sub nsw i64 %157, 1
  %159 = load %struct.fields2_struct** @fields2, align 8
  %160 = getelementptr inbounds %struct.fields2_struct* %159, i32 0, i32 0
  %161 = getelementptr inbounds [258 x [258 x double]]* %160, i32 0, i64 %158
  %162 = getelementptr inbounds [258 x double]* %161, i32 0, i64 %156
  store double 0.000000e+00, double* %162, align 8
  br label %163

; <label>:163                                     ; preds = %154, %149
  %164 = load i64* %firstrow, align 8
  %165 = icmp eq i64 %164, 1
  br i1 %165, label %166, label %182

; <label>:166                                     ; preds = %163
  %167 = load i64* %firstcol, align 8
  store i64 %167, i64* %j, align 8
  br label %168

; <label>:168                                     ; preds = %178, %166
  %169 = load i64* %j, align 8
  %170 = load i64* %lastcol, align 8
  %171 = icmp sle i64 %169, %170
  br i1 %171, label %172, label %181

; <label>:172                                     ; preds = %168
  %173 = load i64* %j, align 8
  %174 = load %struct.fields2_struct** @fields2, align 8
  %175 = getelementptr inbounds %struct.fields2_struct* %174, i32 0, i32 0
  %176 = getelementptr inbounds [258 x [258 x double]]* %175, i32 0, i64 0
  %177 = getelementptr inbounds [258 x double]* %176, i32 0, i64 %173
  store double 0.000000e+00, double* %177, align 8
  br label %178

; <label>:178                                     ; preds = %172
  %179 = load i64* %j, align 8
  %180 = add nsw i64 %179, 1
  store i64 %180, i64* %j, align 8
  br label %168

; <label>:181                                     ; preds = %168
  br label %182

; <label>:182                                     ; preds = %181, %163
  %183 = load i64* %firstrow, align 8
  %184 = load i64* %numrows, align 8
  %185 = add nsw i64 %183, %184
  %186 = load i64* @im, align 8
  %187 = sub nsw i64 %186, 1
  %188 = icmp eq i64 %185, %187
  br i1 %188, label %189, label %207

; <label>:189                                     ; preds = %182
  %190 = load i64* %firstcol, align 8
  store i64 %190, i64* %j, align 8
  br label %191

; <label>:191                                     ; preds = %203, %189
  %192 = load i64* %j, align 8
  %193 = load i64* %lastcol, align 8
  %194 = icmp sle i64 %192, %193
  br i1 %194, label %195, label %206

; <label>:195                                     ; preds = %191
  %196 = load i64* %j, align 8
  %197 = load i64* @im, align 8
  %198 = sub nsw i64 %197, 1
  %199 = load %struct.fields2_struct** @fields2, align 8
  %200 = getelementptr inbounds %struct.fields2_struct* %199, i32 0, i32 0
  %201 = getelementptr inbounds [258 x [258 x double]]* %200, i32 0, i64 %198
  %202 = getelementptr inbounds [258 x double]* %201, i32 0, i64 %196
  store double 0.000000e+00, double* %202, align 8
  br label %203

; <label>:203                                     ; preds = %195
  %204 = load i64* %j, align 8
  %205 = add nsw i64 %204, 1
  store i64 %205, i64* %j, align 8
  br label %191

; <label>:206                                     ; preds = %191
  br label %207

; <label>:207                                     ; preds = %206, %182
  %208 = load i64* %firstcol, align 8
  %209 = icmp eq i64 %208, 1
  br i1 %209, label %210, label %226

; <label>:210                                     ; preds = %207
  %211 = load i64* %firstrow, align 8
  store i64 %211, i64* %j, align 8
  br label %212

; <label>:212                                     ; preds = %222, %210
  %213 = load i64* %j, align 8
  %214 = load i64* %lastrow, align 8
  %215 = icmp sle i64 %213, %214
  br i1 %215, label %216, label %225

; <label>:216                                     ; preds = %212
  %217 = load i64* %j, align 8
  %218 = load %struct.fields2_struct** @fields2, align 8
  %219 = getelementptr inbounds %struct.fields2_struct* %218, i32 0, i32 0
  %220 = getelementptr inbounds [258 x [258 x double]]* %219, i32 0, i64 %217
  %221 = getelementptr inbounds [258 x double]* %220, i32 0, i64 0
  store double 0.000000e+00, double* %221, align 8
  br label %222

; <label>:222                                     ; preds = %216
  %223 = load i64* %j, align 8
  %224 = add nsw i64 %223, 1
  store i64 %224, i64* %j, align 8
  br label %212

; <label>:225                                     ; preds = %212
  br label %226

; <label>:226                                     ; preds = %225, %207
  %227 = load i64* %firstcol, align 8
  %228 = load i64* %numcols, align 8
  %229 = add nsw i64 %227, %228
  %230 = load i64* @jm, align 8
  %231 = sub nsw i64 %230, 1
  %232 = icmp eq i64 %229, %231
  br i1 %232, label %233, label %251

; <label>:233                                     ; preds = %226
  %234 = load i64* %firstrow, align 8
  store i64 %234, i64* %j, align 8
  br label %235

; <label>:235                                     ; preds = %247, %233
  %236 = load i64* %j, align 8
  %237 = load i64* %lastrow, align 8
  %238 = icmp sle i64 %236, %237
  br i1 %238, label %239, label %250

; <label>:239                                     ; preds = %235
  %240 = load i64* @jm, align 8
  %241 = sub nsw i64 %240, 1
  %242 = load i64* %j, align 8
  %243 = load %struct.fields2_struct** @fields2, align 8
  %244 = getelementptr inbounds %struct.fields2_struct* %243, i32 0, i32 0
  %245 = getelementptr inbounds [258 x [258 x double]]* %244, i32 0, i64 %242
  %246 = getelementptr inbounds [258 x double]* %245, i32 0, i64 %241
  store double 0.000000e+00, double* %246, align 8
  br label %247

; <label>:247                                     ; preds = %239
  %248 = load i64* %j, align 8
  %249 = add nsw i64 %248, 1
  store i64 %249, i64* %j, align 8
  br label %235

; <label>:250                                     ; preds = %235
  br label %251

; <label>:251                                     ; preds = %250, %226
  %252 = load i64* %firstrow, align 8
  store i64 %252, i64* %i, align 8
  br label %253

; <label>:253                                     ; preds = %274, %251
  %254 = load i64* %i, align 8
  %255 = load i64* %lastrow, align 8
  %256 = icmp sle i64 %254, %255
  br i1 %256, label %257, label %277

; <label>:257                                     ; preds = %253
  %258 = load i64* %firstcol, align 8
  store i64 %258, i64* %iindex, align 8
  br label %259

; <label>:259                                     ; preds = %270, %257
  %260 = load i64* %iindex, align 8
  %261 = load i64* %lastcol, align 8
  %262 = icmp sle i64 %260, %261
  br i1 %262, label %263, label %273

; <label>:263                                     ; preds = %259
  %264 = load i64* %iindex, align 8
  %265 = load i64* %i, align 8
  %266 = load %struct.fields2_struct** @fields2, align 8
  %267 = getelementptr inbounds %struct.fields2_struct* %266, i32 0, i32 0
  %268 = getelementptr inbounds [258 x [258 x double]]* %267, i32 0, i64 %265
  %269 = getelementptr inbounds [258 x double]* %268, i32 0, i64 %264
  store double 0.000000e+00, double* %269, align 8
  br label %270

; <label>:270                                     ; preds = %263
  %271 = load i64* %iindex, align 8
  %272 = add nsw i64 %271, 1
  store i64 %272, i64* %iindex, align 8
  br label %259

; <label>:273                                     ; preds = %259
  br label %274

; <label>:274                                     ; preds = %273
  %275 = load i64* %i, align 8
  %276 = add nsw i64 %275, 1
  store i64 %276, i64* %i, align 8
  br label %253

; <label>:277                                     ; preds = %253
  %278 = load i64* %procid, align 8
  %279 = icmp eq i64 %278, 0
  br i1 %279, label %280, label %285

; <label>:280                                     ; preds = %277
  %281 = load %struct.fields2_struct** @fields2, align 8
  %282 = getelementptr inbounds %struct.fields2_struct* %281, i32 0, i32 1
  %283 = getelementptr inbounds [258 x [258 x double]]* %282, i32 0, i64 0
  %284 = getelementptr inbounds [258 x double]* %283, i32 0, i64 0
  store double 0.000000e+00, double* %284, align 8
  br label %285

; <label>:285                                     ; preds = %280, %277
  %286 = load i64* %procid, align 8
  %287 = load i64* @nprocs, align 8
  %288 = load i64* @xprocs, align 8
  %289 = sub nsw i64 %287, %288
  %290 = icmp eq i64 %286, %289
  br i1 %290, label %291, label %298

; <label>:291                                     ; preds = %285
  %292 = load i64* @im, align 8
  %293 = sub nsw i64 %292, 1
  %294 = load %struct.fields2_struct** @fields2, align 8
  %295 = getelementptr inbounds %struct.fields2_struct* %294, i32 0, i32 1
  %296 = getelementptr inbounds [258 x [258 x double]]* %295, i32 0, i64 %293
  %297 = getelementptr inbounds [258 x double]* %296, i32 0, i64 0
  store double 0.000000e+00, double* %297, align 8
  br label %298

; <label>:298                                     ; preds = %291, %285
  %299 = load i64* %procid, align 8
  %300 = load i64* @xprocs, align 8
  %301 = sub nsw i64 %300, 1
  %302 = icmp eq i64 %299, %301
  br i1 %302, label %303, label %310

; <label>:303                                     ; preds = %298
  %304 = load i64* @jm, align 8
  %305 = sub nsw i64 %304, 1
  %306 = load %struct.fields2_struct** @fields2, align 8
  %307 = getelementptr inbounds %struct.fields2_struct* %306, i32 0, i32 1
  %308 = getelementptr inbounds [258 x [258 x double]]* %307, i32 0, i64 0
  %309 = getelementptr inbounds [258 x double]* %308, i32 0, i64 %305
  store double 0.000000e+00, double* %309, align 8
  br label %310

; <label>:310                                     ; preds = %303, %298
  %311 = load i64* %procid, align 8
  %312 = load i64* @nprocs, align 8
  %313 = sub nsw i64 %312, 1
  %314 = icmp eq i64 %311, %313
  br i1 %314, label %315, label %324

; <label>:315                                     ; preds = %310
  %316 = load i64* @jm, align 8
  %317 = sub nsw i64 %316, 1
  %318 = load i64* @im, align 8
  %319 = sub nsw i64 %318, 1
  %320 = load %struct.fields2_struct** @fields2, align 8
  %321 = getelementptr inbounds %struct.fields2_struct* %320, i32 0, i32 1
  %322 = getelementptr inbounds [258 x [258 x double]]* %321, i32 0, i64 %319
  %323 = getelementptr inbounds [258 x double]* %322, i32 0, i64 %317
  store double 0.000000e+00, double* %323, align 8
  br label %324

; <label>:324                                     ; preds = %315, %310
  %325 = load i64* %firstrow, align 8
  %326 = icmp eq i64 %325, 1
  br i1 %326, label %327, label %343

; <label>:327                                     ; preds = %324
  %328 = load i64* %firstcol, align 8
  store i64 %328, i64* %j, align 8
  br label %329

; <label>:329                                     ; preds = %339, %327
  %330 = load i64* %j, align 8
  %331 = load i64* %lastcol, align 8
  %332 = icmp sle i64 %330, %331
  br i1 %332, label %333, label %342

; <label>:333                                     ; preds = %329
  %334 = load i64* %j, align 8
  %335 = load %struct.fields2_struct** @fields2, align 8
  %336 = getelementptr inbounds %struct.fields2_struct* %335, i32 0, i32 1
  %337 = getelementptr inbounds [258 x [258 x double]]* %336, i32 0, i64 0
  %338 = getelementptr inbounds [258 x double]* %337, i32 0, i64 %334
  store double 0.000000e+00, double* %338, align 8
  br label %339

; <label>:339                                     ; preds = %333
  %340 = load i64* %j, align 8
  %341 = add nsw i64 %340, 1
  store i64 %341, i64* %j, align 8
  br label %329

; <label>:342                                     ; preds = %329
  br label %343

; <label>:343                                     ; preds = %342, %324
  %344 = load i64* %firstrow, align 8
  %345 = load i64* %numrows, align 8
  %346 = add nsw i64 %344, %345
  %347 = load i64* @im, align 8
  %348 = sub nsw i64 %347, 1
  %349 = icmp eq i64 %346, %348
  br i1 %349, label %350, label %368

; <label>:350                                     ; preds = %343
  %351 = load i64* %firstcol, align 8
  store i64 %351, i64* %j, align 8
  br label %352

; <label>:352                                     ; preds = %364, %350
  %353 = load i64* %j, align 8
  %354 = load i64* %lastcol, align 8
  %355 = icmp sle i64 %353, %354
  br i1 %355, label %356, label %367

; <label>:356                                     ; preds = %352
  %357 = load i64* %j, align 8
  %358 = load i64* @im, align 8
  %359 = sub nsw i64 %358, 1
  %360 = load %struct.fields2_struct** @fields2, align 8
  %361 = getelementptr inbounds %struct.fields2_struct* %360, i32 0, i32 1
  %362 = getelementptr inbounds [258 x [258 x double]]* %361, i32 0, i64 %359
  %363 = getelementptr inbounds [258 x double]* %362, i32 0, i64 %357
  store double 0.000000e+00, double* %363, align 8
  br label %364

; <label>:364                                     ; preds = %356
  %365 = load i64* %j, align 8
  %366 = add nsw i64 %365, 1
  store i64 %366, i64* %j, align 8
  br label %352

; <label>:367                                     ; preds = %352
  br label %368

; <label>:368                                     ; preds = %367, %343
  %369 = load i64* %firstcol, align 8
  %370 = icmp eq i64 %369, 1
  br i1 %370, label %371, label %387

; <label>:371                                     ; preds = %368
  %372 = load i64* %firstrow, align 8
  store i64 %372, i64* %j, align 8
  br label %373

; <label>:373                                     ; preds = %383, %371
  %374 = load i64* %j, align 8
  %375 = load i64* %lastrow, align 8
  %376 = icmp sle i64 %374, %375
  br i1 %376, label %377, label %386

; <label>:377                                     ; preds = %373
  %378 = load i64* %j, align 8
  %379 = load %struct.fields2_struct** @fields2, align 8
  %380 = getelementptr inbounds %struct.fields2_struct* %379, i32 0, i32 1
  %381 = getelementptr inbounds [258 x [258 x double]]* %380, i32 0, i64 %378
  %382 = getelementptr inbounds [258 x double]* %381, i32 0, i64 0
  store double 0.000000e+00, double* %382, align 8
  br label %383

; <label>:383                                     ; preds = %377
  %384 = load i64* %j, align 8
  %385 = add nsw i64 %384, 1
  store i64 %385, i64* %j, align 8
  br label %373

; <label>:386                                     ; preds = %373
  br label %387

; <label>:387                                     ; preds = %386, %368
  %388 = load i64* %firstcol, align 8
  %389 = load i64* %numcols, align 8
  %390 = add nsw i64 %388, %389
  %391 = load i64* @jm, align 8
  %392 = sub nsw i64 %391, 1
  %393 = icmp eq i64 %390, %392
  br i1 %393, label %394, label %412

; <label>:394                                     ; preds = %387
  %395 = load i64* %firstrow, align 8
  store i64 %395, i64* %j, align 8
  br label %396

; <label>:396                                     ; preds = %408, %394
  %397 = load i64* %j, align 8
  %398 = load i64* %lastrow, align 8
  %399 = icmp sle i64 %397, %398
  br i1 %399, label %400, label %411

; <label>:400                                     ; preds = %396
  %401 = load i64* @jm, align 8
  %402 = sub nsw i64 %401, 1
  %403 = load i64* %j, align 8
  %404 = load %struct.fields2_struct** @fields2, align 8
  %405 = getelementptr inbounds %struct.fields2_struct* %404, i32 0, i32 1
  %406 = getelementptr inbounds [258 x [258 x double]]* %405, i32 0, i64 %403
  %407 = getelementptr inbounds [258 x double]* %406, i32 0, i64 %402
  store double 0.000000e+00, double* %407, align 8
  br label %408

; <label>:408                                     ; preds = %400
  %409 = load i64* %j, align 8
  %410 = add nsw i64 %409, 1
  store i64 %410, i64* %j, align 8
  br label %396

; <label>:411                                     ; preds = %396
  br label %412

; <label>:412                                     ; preds = %411, %387
  %413 = load i64* %firstrow, align 8
  store i64 %413, i64* %i, align 8
  br label %414

; <label>:414                                     ; preds = %435, %412
  %415 = load i64* %i, align 8
  %416 = load i64* %lastrow, align 8
  %417 = icmp sle i64 %415, %416
  br i1 %417, label %418, label %438

; <label>:418                                     ; preds = %414
  %419 = load i64* %firstcol, align 8
  store i64 %419, i64* %iindex, align 8
  br label %420

; <label>:420                                     ; preds = %431, %418
  %421 = load i64* %iindex, align 8
  %422 = load i64* %lastcol, align 8
  %423 = icmp sle i64 %421, %422
  br i1 %423, label %424, label %434

; <label>:424                                     ; preds = %420
  %425 = load i64* %iindex, align 8
  %426 = load i64* %i, align 8
  %427 = load %struct.fields2_struct** @fields2, align 8
  %428 = getelementptr inbounds %struct.fields2_struct* %427, i32 0, i32 1
  %429 = getelementptr inbounds [258 x [258 x double]]* %428, i32 0, i64 %426
  %430 = getelementptr inbounds [258 x double]* %429, i32 0, i64 %425
  store double 0.000000e+00, double* %430, align 8
  br label %431

; <label>:431                                     ; preds = %424
  %432 = load i64* %iindex, align 8
  %433 = add nsw i64 %432, 1
  store i64 %433, i64* %iindex, align 8
  br label %420

; <label>:434                                     ; preds = %420
  br label %435

; <label>:435                                     ; preds = %434
  %436 = load i64* %i, align 8
  %437 = add nsw i64 %436, 1
  store i64 %437, i64* %i, align 8
  br label %414

; <label>:438                                     ; preds = %414
  %439 = load i64* %procid, align 8
  %440 = icmp eq i64 %439, 0
  br i1 %440, label %441, label %446

; <label>:441                                     ; preds = %438
  %442 = load %struct.wrk1_struct** @wrk1, align 8
  %443 = getelementptr inbounds %struct.wrk1_struct* %442, i32 0, i32 0
  %444 = getelementptr inbounds [258 x [258 x double]]* %443, i32 0, i64 0
  %445 = getelementptr inbounds [258 x double]* %444, i32 0, i64 0
  store double 1.000000e+00, double* %445, align 8
  br label %446

; <label>:446                                     ; preds = %441, %438
  %447 = load i64* %procid, align 8
  %448 = load i64* @xprocs, align 8
  %449 = sub nsw i64 %448, 1
  %450 = icmp eq i64 %447, %449
  br i1 %450, label %451, label %458

; <label>:451                                     ; preds = %446
  %452 = load i64* @jm, align 8
  %453 = sub nsw i64 %452, 1
  %454 = load %struct.wrk1_struct** @wrk1, align 8
  %455 = getelementptr inbounds %struct.wrk1_struct* %454, i32 0, i32 0
  %456 = getelementptr inbounds [258 x [258 x double]]* %455, i32 0, i64 0
  %457 = getelementptr inbounds [258 x double]* %456, i32 0, i64 %453
  store double 1.000000e+00, double* %457, align 8
  br label %458

; <label>:458                                     ; preds = %451, %446
  %459 = load i64* %procid, align 8
  %460 = load i64* @nprocs, align 8
  %461 = load i64* @xprocs, align 8
  %462 = sub nsw i64 %460, %461
  %463 = icmp eq i64 %459, %462
  br i1 %463, label %464, label %471

; <label>:464                                     ; preds = %458
  %465 = load i64* @im, align 8
  %466 = sub nsw i64 %465, 1
  %467 = load %struct.wrk1_struct** @wrk1, align 8
  %468 = getelementptr inbounds %struct.wrk1_struct* %467, i32 0, i32 0
  %469 = getelementptr inbounds [258 x [258 x double]]* %468, i32 0, i64 %466
  %470 = getelementptr inbounds [258 x double]* %469, i32 0, i64 0
  store double 1.000000e+00, double* %470, align 8
  br label %471

; <label>:471                                     ; preds = %464, %458
  %472 = load i64* %procid, align 8
  %473 = load i64* @nprocs, align 8
  %474 = sub nsw i64 %473, 1
  %475 = icmp eq i64 %472, %474
  br i1 %475, label %476, label %485

; <label>:476                                     ; preds = %471
  %477 = load i64* @jm, align 8
  %478 = sub nsw i64 %477, 1
  %479 = load i64* @im, align 8
  %480 = sub nsw i64 %479, 1
  %481 = load %struct.wrk1_struct** @wrk1, align 8
  %482 = getelementptr inbounds %struct.wrk1_struct* %481, i32 0, i32 0
  %483 = getelementptr inbounds [258 x [258 x double]]* %482, i32 0, i64 %480
  %484 = getelementptr inbounds [258 x double]* %483, i32 0, i64 %478
  store double 1.000000e+00, double* %484, align 8
  br label %485

; <label>:485                                     ; preds = %476, %471
  %486 = load i64* %firstrow, align 8
  %487 = icmp eq i64 %486, 1
  br i1 %487, label %488, label %504

; <label>:488                                     ; preds = %485
  %489 = load i64* %firstcol, align 8
  store i64 %489, i64* %j, align 8
  br label %490

; <label>:490                                     ; preds = %500, %488
  %491 = load i64* %j, align 8
  %492 = load i64* %lastcol, align 8
  %493 = icmp sle i64 %491, %492
  br i1 %493, label %494, label %503

; <label>:494                                     ; preds = %490
  %495 = load i64* %j, align 8
  %496 = load %struct.wrk1_struct** @wrk1, align 8
  %497 = getelementptr inbounds %struct.wrk1_struct* %496, i32 0, i32 0
  %498 = getelementptr inbounds [258 x [258 x double]]* %497, i32 0, i64 0
  %499 = getelementptr inbounds [258 x double]* %498, i32 0, i64 %495
  store double 1.000000e+00, double* %499, align 8
  br label %500

; <label>:500                                     ; preds = %494
  %501 = load i64* %j, align 8
  %502 = add nsw i64 %501, 1
  store i64 %502, i64* %j, align 8
  br label %490

; <label>:503                                     ; preds = %490
  br label %504

; <label>:504                                     ; preds = %503, %485
  %505 = load i64* %firstrow, align 8
  %506 = load i64* %numrows, align 8
  %507 = add nsw i64 %505, %506
  %508 = load i64* @im, align 8
  %509 = sub nsw i64 %508, 1
  %510 = icmp eq i64 %507, %509
  br i1 %510, label %511, label %529

; <label>:511                                     ; preds = %504
  %512 = load i64* %firstcol, align 8
  store i64 %512, i64* %j, align 8
  br label %513

; <label>:513                                     ; preds = %525, %511
  %514 = load i64* %j, align 8
  %515 = load i64* %lastcol, align 8
  %516 = icmp sle i64 %514, %515
  br i1 %516, label %517, label %528

; <label>:517                                     ; preds = %513
  %518 = load i64* %j, align 8
  %519 = load i64* @im, align 8
  %520 = sub nsw i64 %519, 1
  %521 = load %struct.wrk1_struct** @wrk1, align 8
  %522 = getelementptr inbounds %struct.wrk1_struct* %521, i32 0, i32 0
  %523 = getelementptr inbounds [258 x [258 x double]]* %522, i32 0, i64 %520
  %524 = getelementptr inbounds [258 x double]* %523, i32 0, i64 %518
  store double 1.000000e+00, double* %524, align 8
  br label %525

; <label>:525                                     ; preds = %517
  %526 = load i64* %j, align 8
  %527 = add nsw i64 %526, 1
  store i64 %527, i64* %j, align 8
  br label %513

; <label>:528                                     ; preds = %513
  br label %529

; <label>:529                                     ; preds = %528, %504
  %530 = load i64* %firstcol, align 8
  %531 = icmp eq i64 %530, 1
  br i1 %531, label %532, label %548

; <label>:532                                     ; preds = %529
  %533 = load i64* %firstrow, align 8
  store i64 %533, i64* %j, align 8
  br label %534

; <label>:534                                     ; preds = %544, %532
  %535 = load i64* %j, align 8
  %536 = load i64* %lastrow, align 8
  %537 = icmp sle i64 %535, %536
  br i1 %537, label %538, label %547

; <label>:538                                     ; preds = %534
  %539 = load i64* %j, align 8
  %540 = load %struct.wrk1_struct** @wrk1, align 8
  %541 = getelementptr inbounds %struct.wrk1_struct* %540, i32 0, i32 0
  %542 = getelementptr inbounds [258 x [258 x double]]* %541, i32 0, i64 %539
  %543 = getelementptr inbounds [258 x double]* %542, i32 0, i64 0
  store double 1.000000e+00, double* %543, align 8
  br label %544

; <label>:544                                     ; preds = %538
  %545 = load i64* %j, align 8
  %546 = add nsw i64 %545, 1
  store i64 %546, i64* %j, align 8
  br label %534

; <label>:547                                     ; preds = %534
  br label %548

; <label>:548                                     ; preds = %547, %529
  %549 = load i64* %firstcol, align 8
  %550 = load i64* %numcols, align 8
  %551 = add nsw i64 %549, %550
  %552 = load i64* @jm, align 8
  %553 = sub nsw i64 %552, 1
  %554 = icmp eq i64 %551, %553
  br i1 %554, label %555, label %573

; <label>:555                                     ; preds = %548
  %556 = load i64* %firstrow, align 8
  store i64 %556, i64* %j, align 8
  br label %557

; <label>:557                                     ; preds = %569, %555
  %558 = load i64* %j, align 8
  %559 = load i64* %lastrow, align 8
  %560 = icmp sle i64 %558, %559
  br i1 %560, label %561, label %572

; <label>:561                                     ; preds = %557
  %562 = load i64* @jm, align 8
  %563 = sub nsw i64 %562, 1
  %564 = load i64* %j, align 8
  %565 = load %struct.wrk1_struct** @wrk1, align 8
  %566 = getelementptr inbounds %struct.wrk1_struct* %565, i32 0, i32 0
  %567 = getelementptr inbounds [258 x [258 x double]]* %566, i32 0, i64 %564
  %568 = getelementptr inbounds [258 x double]* %567, i32 0, i64 %563
  store double 1.000000e+00, double* %568, align 8
  br label %569

; <label>:569                                     ; preds = %561
  %570 = load i64* %j, align 8
  %571 = add nsw i64 %570, 1
  store i64 %571, i64* %j, align 8
  br label %557

; <label>:572                                     ; preds = %557
  br label %573

; <label>:573                                     ; preds = %572, %548
  %574 = load i64* %firstrow, align 8
  store i64 %574, i64* %i, align 8
  br label %575

; <label>:575                                     ; preds = %596, %573
  %576 = load i64* %i, align 8
  %577 = load i64* %lastrow, align 8
  %578 = icmp sle i64 %576, %577
  br i1 %578, label %579, label %599

; <label>:579                                     ; preds = %575
  %580 = load i64* %firstcol, align 8
  store i64 %580, i64* %iindex, align 8
  br label %581

; <label>:581                                     ; preds = %592, %579
  %582 = load i64* %iindex, align 8
  %583 = load i64* %lastcol, align 8
  %584 = icmp sle i64 %582, %583
  br i1 %584, label %585, label %595

; <label>:585                                     ; preds = %581
  %586 = load i64* %iindex, align 8
  %587 = load i64* %i, align 8
  %588 = load %struct.wrk1_struct** @wrk1, align 8
  %589 = getelementptr inbounds %struct.wrk1_struct* %588, i32 0, i32 0
  %590 = getelementptr inbounds [258 x [258 x double]]* %589, i32 0, i64 %587
  %591 = getelementptr inbounds [258 x double]* %590, i32 0, i64 %586
  store double 0.000000e+00, double* %591, align 8
  br label %592

; <label>:592                                     ; preds = %585
  %593 = load i64* %iindex, align 8
  %594 = add nsw i64 %593, 1
  store i64 %594, i64* %iindex, align 8
  br label %581

; <label>:595                                     ; preds = %581
  br label %596

; <label>:596                                     ; preds = %595
  %597 = load i64* %i, align 8
  %598 = add nsw i64 %597, 1
  store i64 %598, i64* %i, align 8
  br label %575

; <label>:599                                     ; preds = %575
  %600 = load %struct.bars_struct** @bars, align 8
  %601 = getelementptr inbounds %struct.bars_struct* %600, i32 0, i32 0
  %602 = getelementptr inbounds %struct.anon* %601, i32 0, i32 0
  %603 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %602) #6
  %604 = sext i32 %603 to i64
  store i64 %604, i64* %Error, align 8
  %605 = load i64* %Error, align 8
  %606 = icmp ne i64 %605, 0
  br i1 %606, label %607, label %609

; <label>:607                                     ; preds = %599
  %608 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str38, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:609                                     ; preds = %599
  %610 = load %struct.bars_struct** @bars, align 8
  %611 = getelementptr inbounds %struct.bars_struct* %610, i32 0, i32 0
  %612 = getelementptr inbounds %struct.anon* %611, i32 0, i32 3
  %613 = load i64* %612, align 8
  store i64 %613, i64* %Cycle, align 8
  %614 = load %struct.bars_struct** @bars, align 8
  %615 = getelementptr inbounds %struct.bars_struct* %614, i32 0, i32 0
  %616 = getelementptr inbounds %struct.anon* %615, i32 0, i32 2
  %617 = load i64* %616, align 8
  %618 = add i64 %617, 1
  store i64 %618, i64* %616, align 8
  %619 = load i64* @nprocs, align 8
  %620 = icmp ne i64 %618, %619
  br i1 %620, label %621, label %649

; <label>:621                                     ; preds = %609
  %622 = bitcast i64* %Cancel to i32*
  %623 = call i32 @pthread_setcancelstate(i32 1, i32* %622)
  br label %624

; <label>:624                                     ; preds = %643, %621
  %625 = load i64* %Cycle, align 8
  %626 = load %struct.bars_struct** @bars, align 8
  %627 = getelementptr inbounds %struct.bars_struct* %626, i32 0, i32 0
  %628 = getelementptr inbounds %struct.anon* %627, i32 0, i32 3
  %629 = load i64* %628, align 8
  %630 = icmp eq i64 %625, %629
  br i1 %630, label %631, label %644

; <label>:631                                     ; preds = %624
  %632 = load %struct.bars_struct** @bars, align 8
  %633 = getelementptr inbounds %struct.bars_struct* %632, i32 0, i32 0
  %634 = getelementptr inbounds %struct.anon* %633, i32 0, i32 1
  %635 = load %struct.bars_struct** @bars, align 8
  %636 = getelementptr inbounds %struct.bars_struct* %635, i32 0, i32 0
  %637 = getelementptr inbounds %struct.anon* %636, i32 0, i32 0
  %638 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %634, %union.pthread_mutex_t* %637)
  %639 = sext i32 %638 to i64
  store i64 %639, i64* %Error, align 8
  %640 = load i64* %Error, align 8
  %641 = icmp ne i64 %640, 0
  br i1 %641, label %642, label %643

; <label>:642                                     ; preds = %631
  br label %644

; <label>:643                                     ; preds = %631
  br label %624

; <label>:644                                     ; preds = %642, %624
  %645 = load i64* %Cancel, align 8
  %646 = trunc i64 %645 to i32
  %647 = bitcast i64* %Temp to i32*
  %648 = call i32 @pthread_setcancelstate(i32 %646, i32* %647)
  br label %669

; <label>:649                                     ; preds = %609
  %650 = load %struct.bars_struct** @bars, align 8
  %651 = getelementptr inbounds %struct.bars_struct* %650, i32 0, i32 0
  %652 = getelementptr inbounds %struct.anon* %651, i32 0, i32 3
  %653 = load i64* %652, align 8
  %654 = icmp ne i64 %653, 0
  %655 = xor i1 %654, true
  %656 = zext i1 %655 to i32
  %657 = sext i32 %656 to i64
  %658 = load %struct.bars_struct** @bars, align 8
  %659 = getelementptr inbounds %struct.bars_struct* %658, i32 0, i32 0
  %660 = getelementptr inbounds %struct.anon* %659, i32 0, i32 3
  store i64 %657, i64* %660, align 8
  %661 = load %struct.bars_struct** @bars, align 8
  %662 = getelementptr inbounds %struct.bars_struct* %661, i32 0, i32 0
  %663 = getelementptr inbounds %struct.anon* %662, i32 0, i32 2
  store i64 0, i64* %663, align 8
  %664 = load %struct.bars_struct** @bars, align 8
  %665 = getelementptr inbounds %struct.bars_struct* %664, i32 0, i32 0
  %666 = getelementptr inbounds %struct.anon* %665, i32 0, i32 1
  %667 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %666) #6
  %668 = sext i32 %667 to i64
  store i64 %668, i64* %Error, align 8
  br label %669

; <label>:669                                     ; preds = %649, %644
  %670 = load %struct.bars_struct** @bars, align 8
  %671 = getelementptr inbounds %struct.bars_struct* %670, i32 0, i32 0
  %672 = getelementptr inbounds %struct.anon* %671, i32 0, i32 0
  %673 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %672) #6
  %674 = load i64* @numlev, align 8
  %675 = sub nsw i64 %674, 1
  %676 = load i64* %procid, align 8
  %677 = load %struct.Global_Private** @gp, align 8
  %678 = getelementptr inbounds %struct.Global_Private* %677, i64 %676
  %679 = getelementptr inbounds %struct.Global_Private* %678, i32 0, i32 4
  %680 = getelementptr inbounds [9 x i64]* %679, i32 0, i64 %675
  %681 = load i64* %680, align 8
  store i64 %681, i64* %istart, align 8
  %682 = load i64* %istart, align 8
  %683 = load i64* @numlev, align 8
  %684 = sub nsw i64 %683, 1
  %685 = load i64* %procid, align 8
  %686 = load %struct.Global_Private** @gp, align 8
  %687 = getelementptr inbounds %struct.Global_Private* %686, i64 %685
  %688 = getelementptr inbounds %struct.Global_Private* %687, i32 0, i32 6
  %689 = getelementptr inbounds [9 x i64]* %688, i32 0, i64 %684
  %690 = load i64* %689, align 8
  %691 = add nsw i64 %682, %690
  %692 = sub nsw i64 %691, 1
  store i64 %692, i64* %iend, align 8
  %693 = load i64* @numlev, align 8
  %694 = sub nsw i64 %693, 1
  %695 = load i64* %procid, align 8
  %696 = load %struct.Global_Private** @gp, align 8
  %697 = getelementptr inbounds %struct.Global_Private* %696, i64 %695
  %698 = getelementptr inbounds %struct.Global_Private* %697, i32 0, i32 3
  %699 = getelementptr inbounds [9 x i64]* %698, i32 0, i64 %694
  %700 = load i64* %699, align 8
  store i64 %700, i64* %jstart, align 8
  %701 = load i64* %jstart, align 8
  %702 = load i64* @numlev, align 8
  %703 = sub nsw i64 %702, 1
  %704 = load i64* %procid, align 8
  %705 = load %struct.Global_Private** @gp, align 8
  %706 = getelementptr inbounds %struct.Global_Private* %705, i64 %704
  %707 = getelementptr inbounds %struct.Global_Private* %706, i32 0, i32 5
  %708 = getelementptr inbounds [9 x i64]* %707, i32 0, i64 %703
  %709 = load i64* %708, align 8
  %710 = add nsw i64 %701, %709
  %711 = sub nsw i64 %710, 1
  store i64 %711, i64* %jend, align 8
  %712 = load i64* %istart, align 8
  store i64 %712, i64* %ist, align 8
  %713 = load i64* %iend, align 8
  store i64 %713, i64* %ien, align 8
  %714 = load i64* %jstart, align 8
  store i64 %714, i64* %jst, align 8
  %715 = load i64* %jend, align 8
  store i64 %715, i64* %jen, align 8
  %716 = load i64* %istart, align 8
  %717 = icmp eq i64 %716, 1
  br i1 %717, label %718, label %719

; <label>:718                                     ; preds = %669
  store i64 0, i64* %istart, align 8
  br label %719

; <label>:719                                     ; preds = %718, %669
  %720 = load i64* %jstart, align 8
  %721 = icmp eq i64 %720, 1
  br i1 %721, label %722, label %723

; <label>:722                                     ; preds = %719
  store i64 0, i64* %jstart, align 8
  br label %723

; <label>:723                                     ; preds = %722, %719
  %724 = load i64* %iend, align 8
  %725 = load i64* @im, align 8
  %726 = sub nsw i64 %725, 2
  %727 = icmp eq i64 %724, %726
  br i1 %727, label %728, label %731

; <label>:728                                     ; preds = %723
  %729 = load i64* @im, align 8
  %730 = sub nsw i64 %729, 1
  store i64 %730, i64* %iend, align 8
  br label %731

; <label>:731                                     ; preds = %728, %723
  %732 = load i64* %jend, align 8
  %733 = load i64* @jm, align 8
  %734 = sub nsw i64 %733, 2
  %735 = icmp eq i64 %732, %734
  br i1 %735, label %736, label %739

; <label>:736                                     ; preds = %731
  %737 = load i64* @jm, align 8
  %738 = sub nsw i64 %737, 1
  store i64 %738, i64* %jend, align 8
  br label %739

; <label>:739                                     ; preds = %736, %731
  %740 = load i64* %istart, align 8
  store i64 %740, i64* %i, align 8
  br label %741

; <label>:741                                     ; preds = %774, %739
  %742 = load i64* %i, align 8
  %743 = load i64* %iend, align 8
  %744 = icmp sle i64 %742, %743
  br i1 %744, label %745, label %777

; <label>:745                                     ; preds = %741
  %746 = load i64* %jstart, align 8
  store i64 %746, i64* %j, align 8
  br label %747

; <label>:747                                     ; preds = %770, %745
  %748 = load i64* %j, align 8
  %749 = load i64* %jend, align 8
  %750 = icmp sle i64 %748, %749
  br i1 %750, label %751, label %773

; <label>:751                                     ; preds = %747
  %752 = load i64* %j, align 8
  %753 = load i64* %i, align 8
  %754 = load %struct.wrk1_struct** @wrk1, align 8
  %755 = getelementptr inbounds %struct.wrk1_struct* %754, i32 0, i32 0
  %756 = getelementptr inbounds [258 x [258 x double]]* %755, i32 0, i64 %753
  %757 = getelementptr inbounds [258 x double]* %756, i32 0, i64 %752
  %758 = load double* %757, align 8
  %759 = load double* %ressqr, align 8
  %760 = fmul double %758, %759
  %761 = load i64* %j, align 8
  %762 = load i64* %i, align 8
  %763 = load i64* @numlev, align 8
  %764 = sub nsw i64 %763, 1
  %765 = load %struct.multi_struct** @multi, align 8
  %766 = getelementptr inbounds %struct.multi_struct* %765, i32 0, i32 1
  %767 = getelementptr inbounds [9 x [258 x [258 x double]]]* %766, i32 0, i64 %764
  %768 = getelementptr inbounds [258 x [258 x double]]* %767, i32 0, i64 %762
  %769 = getelementptr inbounds [258 x double]* %768, i32 0, i64 %761
  store double %760, double* %769, align 8
  br label %770

; <label>:770                                     ; preds = %751
  %771 = load i64* %j, align 8
  %772 = add nsw i64 %771, 1
  store i64 %772, i64* %j, align 8
  br label %747

; <label>:773                                     ; preds = %747
  br label %774

; <label>:774                                     ; preds = %773
  %775 = load i64* %i, align 8
  %776 = add nsw i64 %775, 1
  store i64 %776, i64* %i, align 8
  br label %741

; <label>:777                                     ; preds = %741
  %778 = load i64* %istart, align 8
  %779 = icmp eq i64 %778, 0
  br i1 %779, label %780, label %805

; <label>:780                                     ; preds = %777
  %781 = load i64* %jstart, align 8
  store i64 %781, i64* %j, align 8
  br label %782

; <label>:782                                     ; preds = %801, %780
  %783 = load i64* %j, align 8
  %784 = load i64* %jend, align 8
  %785 = icmp sle i64 %783, %784
  br i1 %785, label %786, label %804

; <label>:786                                     ; preds = %782
  %787 = load i64* %j, align 8
  %788 = load %struct.wrk1_struct** @wrk1, align 8
  %789 = getelementptr inbounds %struct.wrk1_struct* %788, i32 0, i32 0
  %790 = getelementptr inbounds [258 x [258 x double]]* %789, i32 0, i64 0
  %791 = getelementptr inbounds [258 x double]* %790, i32 0, i64 %787
  %792 = load double* %791, align 8
  %793 = load i64* %j, align 8
  %794 = load i64* @numlev, align 8
  %795 = sub nsw i64 %794, 1
  %796 = load %struct.multi_struct** @multi, align 8
  %797 = getelementptr inbounds %struct.multi_struct* %796, i32 0, i32 0
  %798 = getelementptr inbounds [9 x [258 x [258 x double]]]* %797, i32 0, i64 %795
  %799 = getelementptr inbounds [258 x [258 x double]]* %798, i32 0, i64 0
  %800 = getelementptr inbounds [258 x double]* %799, i32 0, i64 %793
  store double %792, double* %800, align 8
  br label %801

; <label>:801                                     ; preds = %786
  %802 = load i64* %j, align 8
  %803 = add nsw i64 %802, 1
  store i64 %803, i64* %j, align 8
  br label %782

; <label>:804                                     ; preds = %782
  br label %805

; <label>:805                                     ; preds = %804, %777
  %806 = load i64* %iend, align 8
  %807 = load i64* @im, align 8
  %808 = sub nsw i64 %807, 1
  %809 = icmp eq i64 %806, %808
  br i1 %809, label %810, label %839

; <label>:810                                     ; preds = %805
  %811 = load i64* %jstart, align 8
  store i64 %811, i64* %j, align 8
  br label %812

; <label>:812                                     ; preds = %835, %810
  %813 = load i64* %j, align 8
  %814 = load i64* %jend, align 8
  %815 = icmp sle i64 %813, %814
  br i1 %815, label %816, label %838

; <label>:816                                     ; preds = %812
  %817 = load i64* %j, align 8
  %818 = load i64* @im, align 8
  %819 = sub nsw i64 %818, 1
  %820 = load %struct.wrk1_struct** @wrk1, align 8
  %821 = getelementptr inbounds %struct.wrk1_struct* %820, i32 0, i32 0
  %822 = getelementptr inbounds [258 x [258 x double]]* %821, i32 0, i64 %819
  %823 = getelementptr inbounds [258 x double]* %822, i32 0, i64 %817
  %824 = load double* %823, align 8
  %825 = load i64* %j, align 8
  %826 = load i64* @im, align 8
  %827 = sub nsw i64 %826, 1
  %828 = load i64* @numlev, align 8
  %829 = sub nsw i64 %828, 1
  %830 = load %struct.multi_struct** @multi, align 8
  %831 = getelementptr inbounds %struct.multi_struct* %830, i32 0, i32 0
  %832 = getelementptr inbounds [9 x [258 x [258 x double]]]* %831, i32 0, i64 %829
  %833 = getelementptr inbounds [258 x [258 x double]]* %832, i32 0, i64 %827
  %834 = getelementptr inbounds [258 x double]* %833, i32 0, i64 %825
  store double %824, double* %834, align 8
  br label %835

; <label>:835                                     ; preds = %816
  %836 = load i64* %j, align 8
  %837 = add nsw i64 %836, 1
  store i64 %837, i64* %j, align 8
  br label %812

; <label>:838                                     ; preds = %812
  br label %839

; <label>:839                                     ; preds = %838, %805
  %840 = load i64* %jstart, align 8
  %841 = icmp eq i64 %840, 0
  br i1 %841, label %842, label %867

; <label>:842                                     ; preds = %839
  %843 = load i64* %istart, align 8
  store i64 %843, i64* %i, align 8
  br label %844

; <label>:844                                     ; preds = %863, %842
  %845 = load i64* %i, align 8
  %846 = load i64* %iend, align 8
  %847 = icmp sle i64 %845, %846
  br i1 %847, label %848, label %866

; <label>:848                                     ; preds = %844
  %849 = load i64* %i, align 8
  %850 = load %struct.wrk1_struct** @wrk1, align 8
  %851 = getelementptr inbounds %struct.wrk1_struct* %850, i32 0, i32 0
  %852 = getelementptr inbounds [258 x [258 x double]]* %851, i32 0, i64 %849
  %853 = getelementptr inbounds [258 x double]* %852, i32 0, i64 0
  %854 = load double* %853, align 8
  %855 = load i64* %i, align 8
  %856 = load i64* @numlev, align 8
  %857 = sub nsw i64 %856, 1
  %858 = load %struct.multi_struct** @multi, align 8
  %859 = getelementptr inbounds %struct.multi_struct* %858, i32 0, i32 0
  %860 = getelementptr inbounds [9 x [258 x [258 x double]]]* %859, i32 0, i64 %857
  %861 = getelementptr inbounds [258 x [258 x double]]* %860, i32 0, i64 %855
  %862 = getelementptr inbounds [258 x double]* %861, i32 0, i64 0
  store double %854, double* %862, align 8
  br label %863

; <label>:863                                     ; preds = %848
  %864 = load i64* %i, align 8
  %865 = add nsw i64 %864, 1
  store i64 %865, i64* %i, align 8
  br label %844

; <label>:866                                     ; preds = %844
  br label %867

; <label>:867                                     ; preds = %866, %839
  %868 = load i64* %jend, align 8
  %869 = load i64* @jm, align 8
  %870 = sub nsw i64 %869, 1
  %871 = icmp eq i64 %868, %870
  br i1 %871, label %872, label %901

; <label>:872                                     ; preds = %867
  %873 = load i64* %istart, align 8
  store i64 %873, i64* %i, align 8
  br label %874

; <label>:874                                     ; preds = %897, %872
  %875 = load i64* %i, align 8
  %876 = load i64* %iend, align 8
  %877 = icmp sle i64 %875, %876
  br i1 %877, label %878, label %900

; <label>:878                                     ; preds = %874
  %879 = load i64* @jm, align 8
  %880 = sub nsw i64 %879, 1
  %881 = load i64* %i, align 8
  %882 = load %struct.wrk1_struct** @wrk1, align 8
  %883 = getelementptr inbounds %struct.wrk1_struct* %882, i32 0, i32 0
  %884 = getelementptr inbounds [258 x [258 x double]]* %883, i32 0, i64 %881
  %885 = getelementptr inbounds [258 x double]* %884, i32 0, i64 %880
  %886 = load double* %885, align 8
  %887 = load i64* @jm, align 8
  %888 = sub nsw i64 %887, 1
  %889 = load i64* %i, align 8
  %890 = load i64* @numlev, align 8
  %891 = sub nsw i64 %890, 1
  %892 = load %struct.multi_struct** @multi, align 8
  %893 = getelementptr inbounds %struct.multi_struct* %892, i32 0, i32 0
  %894 = getelementptr inbounds [9 x [258 x [258 x double]]]* %893, i32 0, i64 %891
  %895 = getelementptr inbounds [258 x [258 x double]]* %894, i32 0, i64 %889
  %896 = getelementptr inbounds [258 x double]* %895, i32 0, i64 %888
  store double %886, double* %896, align 8
  br label %897

; <label>:897                                     ; preds = %878
  %898 = load i64* %i, align 8
  %899 = add nsw i64 %898, 1
  store i64 %899, i64* %i, align 8
  br label %874

; <label>:900                                     ; preds = %874
  br label %901

; <label>:901                                     ; preds = %900, %867
  %902 = load double* %ressqr, align 8
  %903 = load double* @eig2, align 8
  %904 = fmul double %902, %903
  %905 = fsub double 4.000000e+00, %904
  %906 = fdiv double 1.000000e+00, %905
  store double %906, double* %fac, align 8
  %907 = load i64* %ist, align 8
  store i64 %907, i64* %i, align 8
  br label %908

; <label>:908                                     ; preds = %979, %901
  %909 = load i64* %i, align 8
  %910 = load i64* %ien, align 8
  %911 = icmp sle i64 %909, %910
  br i1 %911, label %912, label %982

; <label>:912                                     ; preds = %908
  %913 = load i64* %jst, align 8
  store i64 %913, i64* %j, align 8
  br label %914

; <label>:914                                     ; preds = %975, %912
  %915 = load i64* %j, align 8
  %916 = load i64* %jen, align 8
  %917 = icmp sle i64 %915, %916
  br i1 %917, label %918, label %978

; <label>:918                                     ; preds = %914
  %919 = load double* %fac, align 8
  %920 = load i64* %j, align 8
  %921 = load i64* %i, align 8
  %922 = add nsw i64 %921, 1
  %923 = load %struct.wrk1_struct** @wrk1, align 8
  %924 = getelementptr inbounds %struct.wrk1_struct* %923, i32 0, i32 0
  %925 = getelementptr inbounds [258 x [258 x double]]* %924, i32 0, i64 %922
  %926 = getelementptr inbounds [258 x double]* %925, i32 0, i64 %920
  %927 = load double* %926, align 8
  %928 = load i64* %j, align 8
  %929 = load i64* %i, align 8
  %930 = sub nsw i64 %929, 1
  %931 = load %struct.wrk1_struct** @wrk1, align 8
  %932 = getelementptr inbounds %struct.wrk1_struct* %931, i32 0, i32 0
  %933 = getelementptr inbounds [258 x [258 x double]]* %932, i32 0, i64 %930
  %934 = getelementptr inbounds [258 x double]* %933, i32 0, i64 %928
  %935 = load double* %934, align 8
  %936 = fadd double %927, %935
  %937 = load i64* %j, align 8
  %938 = add nsw i64 %937, 1
  %939 = load i64* %i, align 8
  %940 = load %struct.wrk1_struct** @wrk1, align 8
  %941 = getelementptr inbounds %struct.wrk1_struct* %940, i32 0, i32 0
  %942 = getelementptr inbounds [258 x [258 x double]]* %941, i32 0, i64 %939
  %943 = getelementptr inbounds [258 x double]* %942, i32 0, i64 %938
  %944 = load double* %943, align 8
  %945 = fadd double %936, %944
  %946 = load i64* %j, align 8
  %947 = sub nsw i64 %946, 1
  %948 = load i64* %i, align 8
  %949 = load %struct.wrk1_struct** @wrk1, align 8
  %950 = getelementptr inbounds %struct.wrk1_struct* %949, i32 0, i32 0
  %951 = getelementptr inbounds [258 x [258 x double]]* %950, i32 0, i64 %948
  %952 = getelementptr inbounds [258 x double]* %951, i32 0, i64 %947
  %953 = load double* %952, align 8
  %954 = fadd double %945, %953
  %955 = load double* %ressqr, align 8
  %956 = load i64* %j, align 8
  %957 = load i64* %i, align 8
  %958 = load %struct.wrk1_struct** @wrk1, align 8
  %959 = getelementptr inbounds %struct.wrk1_struct* %958, i32 0, i32 0
  %960 = getelementptr inbounds [258 x [258 x double]]* %959, i32 0, i64 %957
  %961 = getelementptr inbounds [258 x double]* %960, i32 0, i64 %956
  %962 = load double* %961, align 8
  %963 = fmul double %955, %962
  %964 = fsub double %954, %963
  %965 = fmul double %919, %964
  %966 = load i64* %j, align 8
  %967 = load i64* %i, align 8
  %968 = load i64* @numlev, align 8
  %969 = sub nsw i64 %968, 1
  %970 = load %struct.multi_struct** @multi, align 8
  %971 = getelementptr inbounds %struct.multi_struct* %970, i32 0, i32 0
  %972 = getelementptr inbounds [9 x [258 x [258 x double]]]* %971, i32 0, i64 %969
  %973 = getelementptr inbounds [258 x [258 x double]]* %972, i32 0, i64 %967
  %974 = getelementptr inbounds [258 x double]* %973, i32 0, i64 %966
  store double %965, double* %974, align 8
  br label %975

; <label>:975                                     ; preds = %918
  %976 = load i64* %j, align 8
  %977 = add nsw i64 %976, 1
  store i64 %977, i64* %j, align 8
  br label %914

; <label>:978                                     ; preds = %914
  br label %979

; <label>:979                                     ; preds = %978
  %980 = load i64* %i, align 8
  %981 = add nsw i64 %980, 1
  store i64 %981, i64* %i, align 8
  br label %908

; <label>:982                                     ; preds = %908
  %983 = load %struct.bars_struct** @bars, align 8
  %984 = getelementptr inbounds %struct.bars_struct* %983, i32 0, i32 0
  %985 = getelementptr inbounds %struct.anon* %984, i32 0, i32 0
  %986 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %985) #6
  %987 = sext i32 %986 to i64
  store i64 %987, i64* %Error1, align 8
  %988 = load i64* %Error1, align 8
  %989 = icmp ne i64 %988, 0
  br i1 %989, label %990, label %992

; <label>:990                                     ; preds = %982
  %991 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str38, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:992                                     ; preds = %982
  %993 = load %struct.bars_struct** @bars, align 8
  %994 = getelementptr inbounds %struct.bars_struct* %993, i32 0, i32 0
  %995 = getelementptr inbounds %struct.anon* %994, i32 0, i32 3
  %996 = load i64* %995, align 8
  store i64 %996, i64* %Cycle2, align 8
  %997 = load %struct.bars_struct** @bars, align 8
  %998 = getelementptr inbounds %struct.bars_struct* %997, i32 0, i32 0
  %999 = getelementptr inbounds %struct.anon* %998, i32 0, i32 2
  %1000 = load i64* %999, align 8
  %1001 = add i64 %1000, 1
  store i64 %1001, i64* %999, align 8
  %1002 = load i64* @nprocs, align 8
  %1003 = icmp ne i64 %1001, %1002
  br i1 %1003, label %1004, label %1032

; <label>:1004                                    ; preds = %992
  %1005 = bitcast i64* %Cancel3 to i32*
  %1006 = call i32 @pthread_setcancelstate(i32 1, i32* %1005)
  br label %1007

; <label>:1007                                    ; preds = %1026, %1004
  %1008 = load i64* %Cycle2, align 8
  %1009 = load %struct.bars_struct** @bars, align 8
  %1010 = getelementptr inbounds %struct.bars_struct* %1009, i32 0, i32 0
  %1011 = getelementptr inbounds %struct.anon* %1010, i32 0, i32 3
  %1012 = load i64* %1011, align 8
  %1013 = icmp eq i64 %1008, %1012
  br i1 %1013, label %1014, label %1027

; <label>:1014                                    ; preds = %1007
  %1015 = load %struct.bars_struct** @bars, align 8
  %1016 = getelementptr inbounds %struct.bars_struct* %1015, i32 0, i32 0
  %1017 = getelementptr inbounds %struct.anon* %1016, i32 0, i32 1
  %1018 = load %struct.bars_struct** @bars, align 8
  %1019 = getelementptr inbounds %struct.bars_struct* %1018, i32 0, i32 0
  %1020 = getelementptr inbounds %struct.anon* %1019, i32 0, i32 0
  %1021 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %1017, %union.pthread_mutex_t* %1020)
  %1022 = sext i32 %1021 to i64
  store i64 %1022, i64* %Error1, align 8
  %1023 = load i64* %Error1, align 8
  %1024 = icmp ne i64 %1023, 0
  br i1 %1024, label %1025, label %1026

; <label>:1025                                    ; preds = %1014
  br label %1027

; <label>:1026                                    ; preds = %1014
  br label %1007

; <label>:1027                                    ; preds = %1025, %1007
  %1028 = load i64* %Cancel3, align 8
  %1029 = trunc i64 %1028 to i32
  %1030 = bitcast i64* %Temp4 to i32*
  %1031 = call i32 @pthread_setcancelstate(i32 %1029, i32* %1030)
  br label %1052

; <label>:1032                                    ; preds = %992
  %1033 = load %struct.bars_struct** @bars, align 8
  %1034 = getelementptr inbounds %struct.bars_struct* %1033, i32 0, i32 0
  %1035 = getelementptr inbounds %struct.anon* %1034, i32 0, i32 3
  %1036 = load i64* %1035, align 8
  %1037 = icmp ne i64 %1036, 0
  %1038 = xor i1 %1037, true
  %1039 = zext i1 %1038 to i32
  %1040 = sext i32 %1039 to i64
  %1041 = load %struct.bars_struct** @bars, align 8
  %1042 = getelementptr inbounds %struct.bars_struct* %1041, i32 0, i32 0
  %1043 = getelementptr inbounds %struct.anon* %1042, i32 0, i32 3
  store i64 %1040, i64* %1043, align 8
  %1044 = load %struct.bars_struct** @bars, align 8
  %1045 = getelementptr inbounds %struct.bars_struct* %1044, i32 0, i32 0
  %1046 = getelementptr inbounds %struct.anon* %1045, i32 0, i32 2
  store i64 0, i64* %1046, align 8
  %1047 = load %struct.bars_struct** @bars, align 8
  %1048 = getelementptr inbounds %struct.bars_struct* %1047, i32 0, i32 0
  %1049 = getelementptr inbounds %struct.anon* %1048, i32 0, i32 1
  %1050 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %1049) #6
  %1051 = sext i32 %1050 to i64
  store i64 %1051, i64* %Error1, align 8
  br label %1052

; <label>:1052                                    ; preds = %1032, %1027
  %1053 = load %struct.bars_struct** @bars, align 8
  %1054 = getelementptr inbounds %struct.bars_struct* %1053, i32 0, i32 0
  %1055 = getelementptr inbounds %struct.anon* %1054, i32 0, i32 0
  %1056 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %1055) #6
  %1057 = load i64* %procid, align 8
  call void @multig(i64 %1057)
  %1058 = load i64* %istart, align 8
  store i64 %1058, i64* %i, align 8
  br label %1059

; <label>:1059                                    ; preds = %1090, %1052
  %1060 = load i64* %i, align 8
  %1061 = load i64* %iend, align 8
  %1062 = icmp sle i64 %1060, %1061
  br i1 %1062, label %1063, label %1093

; <label>:1063                                    ; preds = %1059
  %1064 = load i64* %jstart, align 8
  store i64 %1064, i64* %j, align 8
  br label %1065

; <label>:1065                                    ; preds = %1086, %1063
  %1066 = load i64* %j, align 8
  %1067 = load i64* %jend, align 8
  %1068 = icmp sle i64 %1066, %1067
  br i1 %1068, label %1069, label %1089

; <label>:1069                                    ; preds = %1065
  %1070 = load i64* %j, align 8
  %1071 = load i64* %i, align 8
  %1072 = load i64* @numlev, align 8
  %1073 = sub nsw i64 %1072, 1
  %1074 = load %struct.multi_struct** @multi, align 8
  %1075 = getelementptr inbounds %struct.multi_struct* %1074, i32 0, i32 0
  %1076 = getelementptr inbounds [9 x [258 x [258 x double]]]* %1075, i32 0, i64 %1073
  %1077 = getelementptr inbounds [258 x [258 x double]]* %1076, i32 0, i64 %1071
  %1078 = getelementptr inbounds [258 x double]* %1077, i32 0, i64 %1070
  %1079 = load double* %1078, align 8
  %1080 = load i64* %j, align 8
  %1081 = load i64* %i, align 8
  %1082 = load %struct.wrk1_struct** @wrk1, align 8
  %1083 = getelementptr inbounds %struct.wrk1_struct* %1082, i32 0, i32 0
  %1084 = getelementptr inbounds [258 x [258 x double]]* %1083, i32 0, i64 %1081
  %1085 = getelementptr inbounds [258 x double]* %1084, i32 0, i64 %1080
  store double %1079, double* %1085, align 8
  br label %1086

; <label>:1086                                    ; preds = %1069
  %1087 = load i64* %j, align 8
  %1088 = add nsw i64 %1087, 1
  store i64 %1088, i64* %j, align 8
  br label %1065

; <label>:1089                                    ; preds = %1065
  br label %1090

; <label>:1090                                    ; preds = %1089
  %1091 = load i64* %i, align 8
  %1092 = add nsw i64 %1091, 1
  store i64 %1092, i64* %i, align 8
  br label %1059

; <label>:1093                                    ; preds = %1059
  %1094 = load %struct.bars_struct** @bars, align 8
  %1095 = getelementptr inbounds %struct.bars_struct* %1094, i32 0, i32 0
  %1096 = getelementptr inbounds %struct.anon* %1095, i32 0, i32 0
  %1097 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %1096) #6
  %1098 = sext i32 %1097 to i64
  store i64 %1098, i64* %Error5, align 8
  %1099 = load i64* %Error5, align 8
  %1100 = icmp ne i64 %1099, 0
  br i1 %1100, label %1101, label %1103

; <label>:1101                                    ; preds = %1093
  %1102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str38, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:1103                                    ; preds = %1093
  %1104 = load %struct.bars_struct** @bars, align 8
  %1105 = getelementptr inbounds %struct.bars_struct* %1104, i32 0, i32 0
  %1106 = getelementptr inbounds %struct.anon* %1105, i32 0, i32 3
  %1107 = load i64* %1106, align 8
  store i64 %1107, i64* %Cycle6, align 8
  %1108 = load %struct.bars_struct** @bars, align 8
  %1109 = getelementptr inbounds %struct.bars_struct* %1108, i32 0, i32 0
  %1110 = getelementptr inbounds %struct.anon* %1109, i32 0, i32 2
  %1111 = load i64* %1110, align 8
  %1112 = add i64 %1111, 1
  store i64 %1112, i64* %1110, align 8
  %1113 = load i64* @nprocs, align 8
  %1114 = icmp ne i64 %1112, %1113
  br i1 %1114, label %1115, label %1143

; <label>:1115                                    ; preds = %1103
  %1116 = bitcast i64* %Cancel7 to i32*
  %1117 = call i32 @pthread_setcancelstate(i32 1, i32* %1116)
  br label %1118

; <label>:1118                                    ; preds = %1137, %1115
  %1119 = load i64* %Cycle6, align 8
  %1120 = load %struct.bars_struct** @bars, align 8
  %1121 = getelementptr inbounds %struct.bars_struct* %1120, i32 0, i32 0
  %1122 = getelementptr inbounds %struct.anon* %1121, i32 0, i32 3
  %1123 = load i64* %1122, align 8
  %1124 = icmp eq i64 %1119, %1123
  br i1 %1124, label %1125, label %1138

; <label>:1125                                    ; preds = %1118
  %1126 = load %struct.bars_struct** @bars, align 8
  %1127 = getelementptr inbounds %struct.bars_struct* %1126, i32 0, i32 0
  %1128 = getelementptr inbounds %struct.anon* %1127, i32 0, i32 1
  %1129 = load %struct.bars_struct** @bars, align 8
  %1130 = getelementptr inbounds %struct.bars_struct* %1129, i32 0, i32 0
  %1131 = getelementptr inbounds %struct.anon* %1130, i32 0, i32 0
  %1132 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %1128, %union.pthread_mutex_t* %1131)
  %1133 = sext i32 %1132 to i64
  store i64 %1133, i64* %Error5, align 8
  %1134 = load i64* %Error5, align 8
  %1135 = icmp ne i64 %1134, 0
  br i1 %1135, label %1136, label %1137

; <label>:1136                                    ; preds = %1125
  br label %1138

; <label>:1137                                    ; preds = %1125
  br label %1118

; <label>:1138                                    ; preds = %1136, %1118
  %1139 = load i64* %Cancel7, align 8
  %1140 = trunc i64 %1139 to i32
  %1141 = bitcast i64* %Temp8 to i32*
  %1142 = call i32 @pthread_setcancelstate(i32 %1140, i32* %1141)
  br label %1163

; <label>:1143                                    ; preds = %1103
  %1144 = load %struct.bars_struct** @bars, align 8
  %1145 = getelementptr inbounds %struct.bars_struct* %1144, i32 0, i32 0
  %1146 = getelementptr inbounds %struct.anon* %1145, i32 0, i32 3
  %1147 = load i64* %1146, align 8
  %1148 = icmp ne i64 %1147, 0
  %1149 = xor i1 %1148, true
  %1150 = zext i1 %1149 to i32
  %1151 = sext i32 %1150 to i64
  %1152 = load %struct.bars_struct** @bars, align 8
  %1153 = getelementptr inbounds %struct.bars_struct* %1152, i32 0, i32 0
  %1154 = getelementptr inbounds %struct.anon* %1153, i32 0, i32 3
  store i64 %1151, i64* %1154, align 8
  %1155 = load %struct.bars_struct** @bars, align 8
  %1156 = getelementptr inbounds %struct.bars_struct* %1155, i32 0, i32 0
  %1157 = getelementptr inbounds %struct.anon* %1156, i32 0, i32 2
  store i64 0, i64* %1157, align 8
  %1158 = load %struct.bars_struct** @bars, align 8
  %1159 = getelementptr inbounds %struct.bars_struct* %1158, i32 0, i32 0
  %1160 = getelementptr inbounds %struct.anon* %1159, i32 0, i32 1
  %1161 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %1160) #6
  %1162 = sext i32 %1161 to i64
  store i64 %1162, i64* %Error5, align 8
  br label %1163

; <label>:1163                                    ; preds = %1143, %1138
  %1164 = load %struct.bars_struct** @bars, align 8
  %1165 = getelementptr inbounds %struct.bars_struct* %1164, i32 0, i32 0
  %1166 = getelementptr inbounds %struct.anon* %1165, i32 0, i32 0
  %1167 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %1166) #6
  store double 0.000000e+00, double* %psibipriv, align 8
  %1168 = load i64* %procid, align 8
  %1169 = icmp eq i64 %1168, 0
  br i1 %1169, label %1170, label %1179

; <label>:1170                                    ; preds = %1163
  %1171 = load double* %psibipriv, align 8
  %1172 = load %struct.wrk1_struct** @wrk1, align 8
  %1173 = getelementptr inbounds %struct.wrk1_struct* %1172, i32 0, i32 0
  %1174 = getelementptr inbounds [258 x [258 x double]]* %1173, i32 0, i64 0
  %1175 = getelementptr inbounds [258 x double]* %1174, i32 0, i64 0
  %1176 = load double* %1175, align 8
  %1177 = fmul double 2.500000e-01, %1176
  %1178 = fadd double %1171, %1177
  store double %1178, double* %psibipriv, align 8
  br label %1179

; <label>:1179                                    ; preds = %1170, %1163
  %1180 = load i64* %procid, align 8
  %1181 = load i64* @xprocs, align 8
  %1182 = sub nsw i64 %1181, 1
  %1183 = icmp eq i64 %1180, %1182
  br i1 %1183, label %1184, label %1195

; <label>:1184                                    ; preds = %1179
  %1185 = load double* %psibipriv, align 8
  %1186 = load i64* @jm, align 8
  %1187 = sub nsw i64 %1186, 1
  %1188 = load %struct.wrk1_struct** @wrk1, align 8
  %1189 = getelementptr inbounds %struct.wrk1_struct* %1188, i32 0, i32 0
  %1190 = getelementptr inbounds [258 x [258 x double]]* %1189, i32 0, i64 0
  %1191 = getelementptr inbounds [258 x double]* %1190, i32 0, i64 %1187
  %1192 = load double* %1191, align 8
  %1193 = fmul double 2.500000e-01, %1192
  %1194 = fadd double %1185, %1193
  store double %1194, double* %psibipriv, align 8
  br label %1195

; <label>:1195                                    ; preds = %1184, %1179
  %1196 = load i64* %procid, align 8
  %1197 = load i64* @nprocs, align 8
  %1198 = load i64* @xprocs, align 8
  %1199 = sub nsw i64 %1197, %1198
  %1200 = icmp eq i64 %1196, %1199
  br i1 %1200, label %1201, label %1212

; <label>:1201                                    ; preds = %1195
  %1202 = load double* %psibipriv, align 8
  %1203 = load i64* @im, align 8
  %1204 = sub nsw i64 %1203, 1
  %1205 = load %struct.wrk1_struct** @wrk1, align 8
  %1206 = getelementptr inbounds %struct.wrk1_struct* %1205, i32 0, i32 0
  %1207 = getelementptr inbounds [258 x [258 x double]]* %1206, i32 0, i64 %1204
  %1208 = getelementptr inbounds [258 x double]* %1207, i32 0, i64 0
  %1209 = load double* %1208, align 8
  %1210 = fmul double 2.500000e-01, %1209
  %1211 = fadd double %1202, %1210
  store double %1211, double* %psibipriv, align 8
  br label %1212

; <label>:1212                                    ; preds = %1201, %1195
  %1213 = load i64* %procid, align 8
  %1214 = load i64* @nprocs, align 8
  %1215 = sub nsw i64 %1214, 1
  %1216 = icmp eq i64 %1213, %1215
  br i1 %1216, label %1217, label %1230

; <label>:1217                                    ; preds = %1212
  %1218 = load double* %psibipriv, align 8
  %1219 = load i64* @jm, align 8
  %1220 = sub nsw i64 %1219, 1
  %1221 = load i64* @im, align 8
  %1222 = sub nsw i64 %1221, 1
  %1223 = load %struct.wrk1_struct** @wrk1, align 8
  %1224 = getelementptr inbounds %struct.wrk1_struct* %1223, i32 0, i32 0
  %1225 = getelementptr inbounds [258 x [258 x double]]* %1224, i32 0, i64 %1222
  %1226 = getelementptr inbounds [258 x double]* %1225, i32 0, i64 %1220
  %1227 = load double* %1226, align 8
  %1228 = fmul double 2.500000e-01, %1227
  %1229 = fadd double %1218, %1228
  store double %1229, double* %psibipriv, align 8
  br label %1230

; <label>:1230                                    ; preds = %1217, %1212
  %1231 = load i64* %firstrow, align 8
  %1232 = icmp eq i64 %1231, 1
  br i1 %1232, label %1233, label %1253

; <label>:1233                                    ; preds = %1230
  %1234 = load i64* %firstcol, align 8
  store i64 %1234, i64* %j, align 8
  br label %1235

; <label>:1235                                    ; preds = %1249, %1233
  %1236 = load i64* %j, align 8
  %1237 = load i64* %lastcol, align 8
  %1238 = icmp sle i64 %1236, %1237
  br i1 %1238, label %1239, label %1252

; <label>:1239                                    ; preds = %1235
  %1240 = load double* %psibipriv, align 8
  %1241 = load i64* %j, align 8
  %1242 = load %struct.wrk1_struct** @wrk1, align 8
  %1243 = getelementptr inbounds %struct.wrk1_struct* %1242, i32 0, i32 0
  %1244 = getelementptr inbounds [258 x [258 x double]]* %1243, i32 0, i64 0
  %1245 = getelementptr inbounds [258 x double]* %1244, i32 0, i64 %1241
  %1246 = load double* %1245, align 8
  %1247 = fmul double 5.000000e-01, %1246
  %1248 = fadd double %1240, %1247
  store double %1248, double* %psibipriv, align 8
  br label %1249

; <label>:1249                                    ; preds = %1239
  %1250 = load i64* %j, align 8
  %1251 = add nsw i64 %1250, 1
  store i64 %1251, i64* %j, align 8
  br label %1235

; <label>:1252                                    ; preds = %1235
  br label %1253

; <label>:1253                                    ; preds = %1252, %1230
  %1254 = load i64* %firstrow, align 8
  %1255 = load i64* %numrows, align 8
  %1256 = add nsw i64 %1254, %1255
  %1257 = load i64* @im, align 8
  %1258 = sub nsw i64 %1257, 1
  %1259 = icmp eq i64 %1256, %1258
  br i1 %1259, label %1260, label %1282

; <label>:1260                                    ; preds = %1253
  %1261 = load i64* %firstcol, align 8
  store i64 %1261, i64* %j, align 8
  br label %1262

; <label>:1262                                    ; preds = %1278, %1260
  %1263 = load i64* %j, align 8
  %1264 = load i64* %lastcol, align 8
  %1265 = icmp sle i64 %1263, %1264
  br i1 %1265, label %1266, label %1281

; <label>:1266                                    ; preds = %1262
  %1267 = load double* %psibipriv, align 8
  %1268 = load i64* %j, align 8
  %1269 = load i64* @im, align 8
  %1270 = sub nsw i64 %1269, 1
  %1271 = load %struct.wrk1_struct** @wrk1, align 8
  %1272 = getelementptr inbounds %struct.wrk1_struct* %1271, i32 0, i32 0
  %1273 = getelementptr inbounds [258 x [258 x double]]* %1272, i32 0, i64 %1270
  %1274 = getelementptr inbounds [258 x double]* %1273, i32 0, i64 %1268
  %1275 = load double* %1274, align 8
  %1276 = fmul double 5.000000e-01, %1275
  %1277 = fadd double %1267, %1276
  store double %1277, double* %psibipriv, align 8
  br label %1278

; <label>:1278                                    ; preds = %1266
  %1279 = load i64* %j, align 8
  %1280 = add nsw i64 %1279, 1
  store i64 %1280, i64* %j, align 8
  br label %1262

; <label>:1281                                    ; preds = %1262
  br label %1282

; <label>:1282                                    ; preds = %1281, %1253
  %1283 = load i64* %firstcol, align 8
  %1284 = icmp eq i64 %1283, 1
  br i1 %1284, label %1285, label %1305

; <label>:1285                                    ; preds = %1282
  %1286 = load i64* %firstrow, align 8
  store i64 %1286, i64* %j, align 8
  br label %1287

; <label>:1287                                    ; preds = %1301, %1285
  %1288 = load i64* %j, align 8
  %1289 = load i64* %lastrow, align 8
  %1290 = icmp sle i64 %1288, %1289
  br i1 %1290, label %1291, label %1304

; <label>:1291                                    ; preds = %1287
  %1292 = load double* %psibipriv, align 8
  %1293 = load i64* %j, align 8
  %1294 = load %struct.wrk1_struct** @wrk1, align 8
  %1295 = getelementptr inbounds %struct.wrk1_struct* %1294, i32 0, i32 0
  %1296 = getelementptr inbounds [258 x [258 x double]]* %1295, i32 0, i64 %1293
  %1297 = getelementptr inbounds [258 x double]* %1296, i32 0, i64 0
  %1298 = load double* %1297, align 8
  %1299 = fmul double 5.000000e-01, %1298
  %1300 = fadd double %1292, %1299
  store double %1300, double* %psibipriv, align 8
  br label %1301

; <label>:1301                                    ; preds = %1291
  %1302 = load i64* %j, align 8
  %1303 = add nsw i64 %1302, 1
  store i64 %1303, i64* %j, align 8
  br label %1287

; <label>:1304                                    ; preds = %1287
  br label %1305

; <label>:1305                                    ; preds = %1304, %1282
  %1306 = load i64* %firstcol, align 8
  %1307 = load i64* %numcols, align 8
  %1308 = add nsw i64 %1306, %1307
  %1309 = load i64* @jm, align 8
  %1310 = sub nsw i64 %1309, 1
  %1311 = icmp eq i64 %1308, %1310
  br i1 %1311, label %1312, label %1334

; <label>:1312                                    ; preds = %1305
  %1313 = load i64* %firstrow, align 8
  store i64 %1313, i64* %j, align 8
  br label %1314

; <label>:1314                                    ; preds = %1330, %1312
  %1315 = load i64* %j, align 8
  %1316 = load i64* %lastrow, align 8
  %1317 = icmp sle i64 %1315, %1316
  br i1 %1317, label %1318, label %1333

; <label>:1318                                    ; preds = %1314
  %1319 = load double* %psibipriv, align 8
  %1320 = load i64* @jm, align 8
  %1321 = sub nsw i64 %1320, 1
  %1322 = load i64* %j, align 8
  %1323 = load %struct.wrk1_struct** @wrk1, align 8
  %1324 = getelementptr inbounds %struct.wrk1_struct* %1323, i32 0, i32 0
  %1325 = getelementptr inbounds [258 x [258 x double]]* %1324, i32 0, i64 %1322
  %1326 = getelementptr inbounds [258 x double]* %1325, i32 0, i64 %1321
  %1327 = load double* %1326, align 8
  %1328 = fmul double 5.000000e-01, %1327
  %1329 = fadd double %1319, %1328
  store double %1329, double* %psibipriv, align 8
  br label %1330

; <label>:1330                                    ; preds = %1318
  %1331 = load i64* %j, align 8
  %1332 = add nsw i64 %1331, 1
  store i64 %1332, i64* %j, align 8
  br label %1314

; <label>:1333                                    ; preds = %1314
  br label %1334

; <label>:1334                                    ; preds = %1333, %1305
  %1335 = load i64* %firstcol, align 8
  store i64 %1335, i64* %iindex, align 8
  br label %1336

; <label>:1336                                    ; preds = %1360, %1334
  %1337 = load i64* %iindex, align 8
  %1338 = load i64* %lastcol, align 8
  %1339 = icmp sle i64 %1337, %1338
  br i1 %1339, label %1340, label %1363

; <label>:1340                                    ; preds = %1336
  %1341 = load i64* %firstrow, align 8
  store i64 %1341, i64* %i, align 8
  br label %1342

; <label>:1342                                    ; preds = %1356, %1340
  %1343 = load i64* %i, align 8
  %1344 = load i64* %lastrow, align 8
  %1345 = icmp sle i64 %1343, %1344
  br i1 %1345, label %1346, label %1359

; <label>:1346                                    ; preds = %1342
  %1347 = load double* %psibipriv, align 8
  %1348 = load i64* %iindex, align 8
  %1349 = load i64* %i, align 8
  %1350 = load %struct.wrk1_struct** @wrk1, align 8
  %1351 = getelementptr inbounds %struct.wrk1_struct* %1350, i32 0, i32 0
  %1352 = getelementptr inbounds [258 x [258 x double]]* %1351, i32 0, i64 %1349
  %1353 = getelementptr inbounds [258 x double]* %1352, i32 0, i64 %1348
  %1354 = load double* %1353, align 8
  %1355 = fadd double %1347, %1354
  store double %1355, double* %psibipriv, align 8
  br label %1356

; <label>:1356                                    ; preds = %1346
  %1357 = load i64* %i, align 8
  %1358 = add nsw i64 %1357, 1
  store i64 %1358, i64* %i, align 8
  br label %1342

; <label>:1359                                    ; preds = %1342
  br label %1360

; <label>:1360                                    ; preds = %1359
  %1361 = load i64* %iindex, align 8
  %1362 = add nsw i64 %1361, 1
  store i64 %1362, i64* %iindex, align 8
  br label %1336

; <label>:1363                                    ; preds = %1336
  %1364 = load %struct.locks_struct** @locks, align 8
  %1365 = getelementptr inbounds %struct.locks_struct* %1364, i32 0, i32 2
  %1366 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %1365) #6
  %1367 = load %struct.global_struct** @global, align 8
  %1368 = getelementptr inbounds %struct.global_struct* %1367, i32 0, i32 4
  %1369 = load double* %1368, align 8
  %1370 = load double* %psibipriv, align 8
  %1371 = fadd double %1369, %1370
  %1372 = load %struct.global_struct** @global, align 8
  %1373 = getelementptr inbounds %struct.global_struct* %1372, i32 0, i32 4
  store double %1371, double* %1373, align 8
  %1374 = load %struct.locks_struct** @locks, align 8
  %1375 = getelementptr inbounds %struct.locks_struct* %1374, i32 0, i32 2
  %1376 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %1375) #6
  store i64 0, i64* %psiindex, align 8
  br label %1377

; <label>:1377                                    ; preds = %1560, %1363
  %1378 = load i64* %psiindex, align 8
  %1379 = icmp sle i64 %1378, 1
  br i1 %1379, label %1380, label %1563

; <label>:1380                                    ; preds = %1377
  %1381 = load i64* %procid, align 8
  %1382 = icmp eq i64 %1381, 0
  br i1 %1382, label %1383, label %1390

; <label>:1383                                    ; preds = %1380
  %1384 = load i64* %psiindex, align 8
  %1385 = load %struct.fields_struct** @fields, align 8
  %1386 = getelementptr inbounds %struct.fields_struct* %1385, i32 0, i32 1
  %1387 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1386, i32 0, i64 %1384
  %1388 = getelementptr inbounds [258 x [258 x double]]* %1387, i32 0, i64 0
  %1389 = getelementptr inbounds [258 x double]* %1388, i32 0, i64 0
  store double 0.000000e+00, double* %1389, align 8
  br label %1390

; <label>:1390                                    ; preds = %1383, %1380
  %1391 = load i64* %procid, align 8
  %1392 = load i64* @nprocs, align 8
  %1393 = load i64* @xprocs, align 8
  %1394 = sub nsw i64 %1392, %1393
  %1395 = icmp eq i64 %1391, %1394
  br i1 %1395, label %1396, label %1405

; <label>:1396                                    ; preds = %1390
  %1397 = load i64* @im, align 8
  %1398 = sub nsw i64 %1397, 1
  %1399 = load i64* %psiindex, align 8
  %1400 = load %struct.fields_struct** @fields, align 8
  %1401 = getelementptr inbounds %struct.fields_struct* %1400, i32 0, i32 1
  %1402 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1401, i32 0, i64 %1399
  %1403 = getelementptr inbounds [258 x [258 x double]]* %1402, i32 0, i64 %1398
  %1404 = getelementptr inbounds [258 x double]* %1403, i32 0, i64 0
  store double 0.000000e+00, double* %1404, align 8
  br label %1405

; <label>:1405                                    ; preds = %1396, %1390
  %1406 = load i64* %procid, align 8
  %1407 = load i64* @xprocs, align 8
  %1408 = sub nsw i64 %1407, 1
  %1409 = icmp eq i64 %1406, %1408
  br i1 %1409, label %1410, label %1419

; <label>:1410                                    ; preds = %1405
  %1411 = load i64* @jm, align 8
  %1412 = sub nsw i64 %1411, 1
  %1413 = load i64* %psiindex, align 8
  %1414 = load %struct.fields_struct** @fields, align 8
  %1415 = getelementptr inbounds %struct.fields_struct* %1414, i32 0, i32 1
  %1416 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1415, i32 0, i64 %1413
  %1417 = getelementptr inbounds [258 x [258 x double]]* %1416, i32 0, i64 0
  %1418 = getelementptr inbounds [258 x double]* %1417, i32 0, i64 %1412
  store double 0.000000e+00, double* %1418, align 8
  br label %1419

; <label>:1419                                    ; preds = %1410, %1405
  %1420 = load i64* %procid, align 8
  %1421 = load i64* @nprocs, align 8
  %1422 = sub nsw i64 %1421, 1
  %1423 = icmp eq i64 %1420, %1422
  br i1 %1423, label %1424, label %1435

; <label>:1424                                    ; preds = %1419
  %1425 = load i64* @jm, align 8
  %1426 = sub nsw i64 %1425, 1
  %1427 = load i64* @im, align 8
  %1428 = sub nsw i64 %1427, 1
  %1429 = load i64* %psiindex, align 8
  %1430 = load %struct.fields_struct** @fields, align 8
  %1431 = getelementptr inbounds %struct.fields_struct* %1430, i32 0, i32 1
  %1432 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1431, i32 0, i64 %1429
  %1433 = getelementptr inbounds [258 x [258 x double]]* %1432, i32 0, i64 %1428
  %1434 = getelementptr inbounds [258 x double]* %1433, i32 0, i64 %1426
  store double 0.000000e+00, double* %1434, align 8
  br label %1435

; <label>:1435                                    ; preds = %1424, %1419
  %1436 = load i64* %firstrow, align 8
  %1437 = icmp eq i64 %1436, 1
  br i1 %1437, label %1438, label %1456

; <label>:1438                                    ; preds = %1435
  %1439 = load i64* %firstcol, align 8
  store i64 %1439, i64* %j, align 8
  br label %1440

; <label>:1440                                    ; preds = %1452, %1438
  %1441 = load i64* %j, align 8
  %1442 = load i64* %lastcol, align 8
  %1443 = icmp sle i64 %1441, %1442
  br i1 %1443, label %1444, label %1455

; <label>:1444                                    ; preds = %1440
  %1445 = load i64* %j, align 8
  %1446 = load i64* %psiindex, align 8
  %1447 = load %struct.fields_struct** @fields, align 8
  %1448 = getelementptr inbounds %struct.fields_struct* %1447, i32 0, i32 1
  %1449 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1448, i32 0, i64 %1446
  %1450 = getelementptr inbounds [258 x [258 x double]]* %1449, i32 0, i64 0
  %1451 = getelementptr inbounds [258 x double]* %1450, i32 0, i64 %1445
  store double 0.000000e+00, double* %1451, align 8
  br label %1452

; <label>:1452                                    ; preds = %1444
  %1453 = load i64* %j, align 8
  %1454 = add nsw i64 %1453, 1
  store i64 %1454, i64* %j, align 8
  br label %1440

; <label>:1455                                    ; preds = %1440
  br label %1456

; <label>:1456                                    ; preds = %1455, %1435
  %1457 = load i64* %firstrow, align 8
  %1458 = load i64* %numrows, align 8
  %1459 = add nsw i64 %1457, %1458
  %1460 = load i64* @im, align 8
  %1461 = sub nsw i64 %1460, 1
  %1462 = icmp eq i64 %1459, %1461
  br i1 %1462, label %1463, label %1483

; <label>:1463                                    ; preds = %1456
  %1464 = load i64* %firstcol, align 8
  store i64 %1464, i64* %j, align 8
  br label %1465

; <label>:1465                                    ; preds = %1479, %1463
  %1466 = load i64* %j, align 8
  %1467 = load i64* %lastcol, align 8
  %1468 = icmp sle i64 %1466, %1467
  br i1 %1468, label %1469, label %1482

; <label>:1469                                    ; preds = %1465
  %1470 = load i64* %j, align 8
  %1471 = load i64* @im, align 8
  %1472 = sub nsw i64 %1471, 1
  %1473 = load i64* %psiindex, align 8
  %1474 = load %struct.fields_struct** @fields, align 8
  %1475 = getelementptr inbounds %struct.fields_struct* %1474, i32 0, i32 1
  %1476 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1475, i32 0, i64 %1473
  %1477 = getelementptr inbounds [258 x [258 x double]]* %1476, i32 0, i64 %1472
  %1478 = getelementptr inbounds [258 x double]* %1477, i32 0, i64 %1470
  store double 0.000000e+00, double* %1478, align 8
  br label %1479

; <label>:1479                                    ; preds = %1469
  %1480 = load i64* %j, align 8
  %1481 = add nsw i64 %1480, 1
  store i64 %1481, i64* %j, align 8
  br label %1465

; <label>:1482                                    ; preds = %1465
  br label %1483

; <label>:1483                                    ; preds = %1482, %1456
  %1484 = load i64* %firstcol, align 8
  %1485 = icmp eq i64 %1484, 1
  br i1 %1485, label %1486, label %1504

; <label>:1486                                    ; preds = %1483
  %1487 = load i64* %firstrow, align 8
  store i64 %1487, i64* %j, align 8
  br label %1488

; <label>:1488                                    ; preds = %1500, %1486
  %1489 = load i64* %j, align 8
  %1490 = load i64* %lastrow, align 8
  %1491 = icmp sle i64 %1489, %1490
  br i1 %1491, label %1492, label %1503

; <label>:1492                                    ; preds = %1488
  %1493 = load i64* %j, align 8
  %1494 = load i64* %psiindex, align 8
  %1495 = load %struct.fields_struct** @fields, align 8
  %1496 = getelementptr inbounds %struct.fields_struct* %1495, i32 0, i32 1
  %1497 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1496, i32 0, i64 %1494
  %1498 = getelementptr inbounds [258 x [258 x double]]* %1497, i32 0, i64 %1493
  %1499 = getelementptr inbounds [258 x double]* %1498, i32 0, i64 0
  store double 0.000000e+00, double* %1499, align 8
  br label %1500

; <label>:1500                                    ; preds = %1492
  %1501 = load i64* %j, align 8
  %1502 = add nsw i64 %1501, 1
  store i64 %1502, i64* %j, align 8
  br label %1488

; <label>:1503                                    ; preds = %1488
  br label %1504

; <label>:1504                                    ; preds = %1503, %1483
  %1505 = load i64* %firstcol, align 8
  %1506 = load i64* %numcols, align 8
  %1507 = add nsw i64 %1505, %1506
  %1508 = load i64* @jm, align 8
  %1509 = sub nsw i64 %1508, 1
  %1510 = icmp eq i64 %1507, %1509
  br i1 %1510, label %1511, label %1531

; <label>:1511                                    ; preds = %1504
  %1512 = load i64* %firstrow, align 8
  store i64 %1512, i64* %j, align 8
  br label %1513

; <label>:1513                                    ; preds = %1527, %1511
  %1514 = load i64* %j, align 8
  %1515 = load i64* %lastrow, align 8
  %1516 = icmp sle i64 %1514, %1515
  br i1 %1516, label %1517, label %1530

; <label>:1517                                    ; preds = %1513
  %1518 = load i64* @jm, align 8
  %1519 = sub nsw i64 %1518, 1
  %1520 = load i64* %j, align 8
  %1521 = load i64* %psiindex, align 8
  %1522 = load %struct.fields_struct** @fields, align 8
  %1523 = getelementptr inbounds %struct.fields_struct* %1522, i32 0, i32 1
  %1524 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1523, i32 0, i64 %1521
  %1525 = getelementptr inbounds [258 x [258 x double]]* %1524, i32 0, i64 %1520
  %1526 = getelementptr inbounds [258 x double]* %1525, i32 0, i64 %1519
  store double 0.000000e+00, double* %1526, align 8
  br label %1527

; <label>:1527                                    ; preds = %1517
  %1528 = load i64* %j, align 8
  %1529 = add nsw i64 %1528, 1
  store i64 %1529, i64* %j, align 8
  br label %1513

; <label>:1530                                    ; preds = %1513
  br label %1531

; <label>:1531                                    ; preds = %1530, %1504
  %1532 = load i64* %firstrow, align 8
  store i64 %1532, i64* %i, align 8
  br label %1533

; <label>:1533                                    ; preds = %1556, %1531
  %1534 = load i64* %i, align 8
  %1535 = load i64* %lastrow, align 8
  %1536 = icmp sle i64 %1534, %1535
  br i1 %1536, label %1537, label %1559

; <label>:1537                                    ; preds = %1533
  %1538 = load i64* %firstcol, align 8
  store i64 %1538, i64* %iindex, align 8
  br label %1539

; <label>:1539                                    ; preds = %1552, %1537
  %1540 = load i64* %iindex, align 8
  %1541 = load i64* %lastcol, align 8
  %1542 = icmp sle i64 %1540, %1541
  br i1 %1542, label %1543, label %1555

; <label>:1543                                    ; preds = %1539
  %1544 = load i64* %iindex, align 8
  %1545 = load i64* %i, align 8
  %1546 = load i64* %psiindex, align 8
  %1547 = load %struct.fields_struct** @fields, align 8
  %1548 = getelementptr inbounds %struct.fields_struct* %1547, i32 0, i32 1
  %1549 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1548, i32 0, i64 %1546
  %1550 = getelementptr inbounds [258 x [258 x double]]* %1549, i32 0, i64 %1545
  %1551 = getelementptr inbounds [258 x double]* %1550, i32 0, i64 %1544
  store double 0.000000e+00, double* %1551, align 8
  br label %1552

; <label>:1552                                    ; preds = %1543
  %1553 = load i64* %iindex, align 8
  %1554 = add nsw i64 %1553, 1
  store i64 %1554, i64* %iindex, align 8
  br label %1539

; <label>:1555                                    ; preds = %1539
  br label %1556

; <label>:1556                                    ; preds = %1555
  %1557 = load i64* %i, align 8
  %1558 = add nsw i64 %1557, 1
  store i64 %1558, i64* %i, align 8
  br label %1533

; <label>:1559                                    ; preds = %1533
  br label %1560

; <label>:1560                                    ; preds = %1559
  %1561 = load i64* %psiindex, align 8
  %1562 = add nsw i64 %1561, 1
  store i64 %1562, i64* %psiindex, align 8
  br label %1377

; <label>:1563                                    ; preds = %1377
  store i64 0, i64* %psiindex, align 8
  br label %1564

; <label>:1564                                    ; preds = %1747, %1563
  %1565 = load i64* %psiindex, align 8
  %1566 = icmp sle i64 %1565, 1
  br i1 %1566, label %1567, label %1750

; <label>:1567                                    ; preds = %1564
  %1568 = load i64* %procid, align 8
  %1569 = icmp eq i64 %1568, 0
  br i1 %1569, label %1570, label %1577

; <label>:1570                                    ; preds = %1567
  %1571 = load i64* %psiindex, align 8
  %1572 = load %struct.fields_struct** @fields, align 8
  %1573 = getelementptr inbounds %struct.fields_struct* %1572, i32 0, i32 0
  %1574 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1573, i32 0, i64 %1571
  %1575 = getelementptr inbounds [258 x [258 x double]]* %1574, i32 0, i64 0
  %1576 = getelementptr inbounds [258 x double]* %1575, i32 0, i64 0
  store double 0.000000e+00, double* %1576, align 8
  br label %1577

; <label>:1577                                    ; preds = %1570, %1567
  %1578 = load i64* %procid, align 8
  %1579 = load i64* @xprocs, align 8
  %1580 = sub nsw i64 %1579, 1
  %1581 = icmp eq i64 %1578, %1580
  br i1 %1581, label %1582, label %1591

; <label>:1582                                    ; preds = %1577
  %1583 = load i64* @jm, align 8
  %1584 = sub nsw i64 %1583, 1
  %1585 = load i64* %psiindex, align 8
  %1586 = load %struct.fields_struct** @fields, align 8
  %1587 = getelementptr inbounds %struct.fields_struct* %1586, i32 0, i32 0
  %1588 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1587, i32 0, i64 %1585
  %1589 = getelementptr inbounds [258 x [258 x double]]* %1588, i32 0, i64 0
  %1590 = getelementptr inbounds [258 x double]* %1589, i32 0, i64 %1584
  store double 0.000000e+00, double* %1590, align 8
  br label %1591

; <label>:1591                                    ; preds = %1582, %1577
  %1592 = load i64* %procid, align 8
  %1593 = load i64* @nprocs, align 8
  %1594 = load i64* @xprocs, align 8
  %1595 = sub nsw i64 %1593, %1594
  %1596 = icmp eq i64 %1592, %1595
  br i1 %1596, label %1597, label %1606

; <label>:1597                                    ; preds = %1591
  %1598 = load i64* @im, align 8
  %1599 = sub nsw i64 %1598, 1
  %1600 = load i64* %psiindex, align 8
  %1601 = load %struct.fields_struct** @fields, align 8
  %1602 = getelementptr inbounds %struct.fields_struct* %1601, i32 0, i32 0
  %1603 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1602, i32 0, i64 %1600
  %1604 = getelementptr inbounds [258 x [258 x double]]* %1603, i32 0, i64 %1599
  %1605 = getelementptr inbounds [258 x double]* %1604, i32 0, i64 0
  store double 0.000000e+00, double* %1605, align 8
  br label %1606

; <label>:1606                                    ; preds = %1597, %1591
  %1607 = load i64* %procid, align 8
  %1608 = load i64* @nprocs, align 8
  %1609 = sub nsw i64 %1608, 1
  %1610 = icmp eq i64 %1607, %1609
  br i1 %1610, label %1611, label %1622

; <label>:1611                                    ; preds = %1606
  %1612 = load i64* @jm, align 8
  %1613 = sub nsw i64 %1612, 1
  %1614 = load i64* @im, align 8
  %1615 = sub nsw i64 %1614, 1
  %1616 = load i64* %psiindex, align 8
  %1617 = load %struct.fields_struct** @fields, align 8
  %1618 = getelementptr inbounds %struct.fields_struct* %1617, i32 0, i32 0
  %1619 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1618, i32 0, i64 %1616
  %1620 = getelementptr inbounds [258 x [258 x double]]* %1619, i32 0, i64 %1615
  %1621 = getelementptr inbounds [258 x double]* %1620, i32 0, i64 %1613
  store double 0.000000e+00, double* %1621, align 8
  br label %1622

; <label>:1622                                    ; preds = %1611, %1606
  %1623 = load i64* %firstrow, align 8
  %1624 = icmp eq i64 %1623, 1
  br i1 %1624, label %1625, label %1643

; <label>:1625                                    ; preds = %1622
  %1626 = load i64* %firstcol, align 8
  store i64 %1626, i64* %j, align 8
  br label %1627

; <label>:1627                                    ; preds = %1639, %1625
  %1628 = load i64* %j, align 8
  %1629 = load i64* %lastcol, align 8
  %1630 = icmp sle i64 %1628, %1629
  br i1 %1630, label %1631, label %1642

; <label>:1631                                    ; preds = %1627
  %1632 = load i64* %j, align 8
  %1633 = load i64* %psiindex, align 8
  %1634 = load %struct.fields_struct** @fields, align 8
  %1635 = getelementptr inbounds %struct.fields_struct* %1634, i32 0, i32 0
  %1636 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1635, i32 0, i64 %1633
  %1637 = getelementptr inbounds [258 x [258 x double]]* %1636, i32 0, i64 0
  %1638 = getelementptr inbounds [258 x double]* %1637, i32 0, i64 %1632
  store double 0.000000e+00, double* %1638, align 8
  br label %1639

; <label>:1639                                    ; preds = %1631
  %1640 = load i64* %j, align 8
  %1641 = add nsw i64 %1640, 1
  store i64 %1641, i64* %j, align 8
  br label %1627

; <label>:1642                                    ; preds = %1627
  br label %1643

; <label>:1643                                    ; preds = %1642, %1622
  %1644 = load i64* %firstrow, align 8
  %1645 = load i64* %numrows, align 8
  %1646 = add nsw i64 %1644, %1645
  %1647 = load i64* @im, align 8
  %1648 = sub nsw i64 %1647, 1
  %1649 = icmp eq i64 %1646, %1648
  br i1 %1649, label %1650, label %1670

; <label>:1650                                    ; preds = %1643
  %1651 = load i64* %firstcol, align 8
  store i64 %1651, i64* %j, align 8
  br label %1652

; <label>:1652                                    ; preds = %1666, %1650
  %1653 = load i64* %j, align 8
  %1654 = load i64* %lastcol, align 8
  %1655 = icmp sle i64 %1653, %1654
  br i1 %1655, label %1656, label %1669

; <label>:1656                                    ; preds = %1652
  %1657 = load i64* %j, align 8
  %1658 = load i64* @im, align 8
  %1659 = sub nsw i64 %1658, 1
  %1660 = load i64* %psiindex, align 8
  %1661 = load %struct.fields_struct** @fields, align 8
  %1662 = getelementptr inbounds %struct.fields_struct* %1661, i32 0, i32 0
  %1663 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1662, i32 0, i64 %1660
  %1664 = getelementptr inbounds [258 x [258 x double]]* %1663, i32 0, i64 %1659
  %1665 = getelementptr inbounds [258 x double]* %1664, i32 0, i64 %1657
  store double 0.000000e+00, double* %1665, align 8
  br label %1666

; <label>:1666                                    ; preds = %1656
  %1667 = load i64* %j, align 8
  %1668 = add nsw i64 %1667, 1
  store i64 %1668, i64* %j, align 8
  br label %1652

; <label>:1669                                    ; preds = %1652
  br label %1670

; <label>:1670                                    ; preds = %1669, %1643
  %1671 = load i64* %firstcol, align 8
  %1672 = icmp eq i64 %1671, 1
  br i1 %1672, label %1673, label %1691

; <label>:1673                                    ; preds = %1670
  %1674 = load i64* %firstrow, align 8
  store i64 %1674, i64* %j, align 8
  br label %1675

; <label>:1675                                    ; preds = %1687, %1673
  %1676 = load i64* %j, align 8
  %1677 = load i64* %lastrow, align 8
  %1678 = icmp sle i64 %1676, %1677
  br i1 %1678, label %1679, label %1690

; <label>:1679                                    ; preds = %1675
  %1680 = load i64* %j, align 8
  %1681 = load i64* %psiindex, align 8
  %1682 = load %struct.fields_struct** @fields, align 8
  %1683 = getelementptr inbounds %struct.fields_struct* %1682, i32 0, i32 0
  %1684 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1683, i32 0, i64 %1681
  %1685 = getelementptr inbounds [258 x [258 x double]]* %1684, i32 0, i64 %1680
  %1686 = getelementptr inbounds [258 x double]* %1685, i32 0, i64 0
  store double 0.000000e+00, double* %1686, align 8
  br label %1687

; <label>:1687                                    ; preds = %1679
  %1688 = load i64* %j, align 8
  %1689 = add nsw i64 %1688, 1
  store i64 %1689, i64* %j, align 8
  br label %1675

; <label>:1690                                    ; preds = %1675
  br label %1691

; <label>:1691                                    ; preds = %1690, %1670
  %1692 = load i64* %firstcol, align 8
  %1693 = load i64* %numcols, align 8
  %1694 = add nsw i64 %1692, %1693
  %1695 = load i64* @jm, align 8
  %1696 = sub nsw i64 %1695, 1
  %1697 = icmp eq i64 %1694, %1696
  br i1 %1697, label %1698, label %1718

; <label>:1698                                    ; preds = %1691
  %1699 = load i64* %firstrow, align 8
  store i64 %1699, i64* %j, align 8
  br label %1700

; <label>:1700                                    ; preds = %1714, %1698
  %1701 = load i64* %j, align 8
  %1702 = load i64* %lastrow, align 8
  %1703 = icmp sle i64 %1701, %1702
  br i1 %1703, label %1704, label %1717

; <label>:1704                                    ; preds = %1700
  %1705 = load i64* @jm, align 8
  %1706 = sub nsw i64 %1705, 1
  %1707 = load i64* %j, align 8
  %1708 = load i64* %psiindex, align 8
  %1709 = load %struct.fields_struct** @fields, align 8
  %1710 = getelementptr inbounds %struct.fields_struct* %1709, i32 0, i32 0
  %1711 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1710, i32 0, i64 %1708
  %1712 = getelementptr inbounds [258 x [258 x double]]* %1711, i32 0, i64 %1707
  %1713 = getelementptr inbounds [258 x double]* %1712, i32 0, i64 %1706
  store double 0.000000e+00, double* %1713, align 8
  br label %1714

; <label>:1714                                    ; preds = %1704
  %1715 = load i64* %j, align 8
  %1716 = add nsw i64 %1715, 1
  store i64 %1716, i64* %j, align 8
  br label %1700

; <label>:1717                                    ; preds = %1700
  br label %1718

; <label>:1718                                    ; preds = %1717, %1691
  %1719 = load i64* %firstrow, align 8
  store i64 %1719, i64* %i, align 8
  br label %1720

; <label>:1720                                    ; preds = %1743, %1718
  %1721 = load i64* %i, align 8
  %1722 = load i64* %lastrow, align 8
  %1723 = icmp sle i64 %1721, %1722
  br i1 %1723, label %1724, label %1746

; <label>:1724                                    ; preds = %1720
  %1725 = load i64* %firstcol, align 8
  store i64 %1725, i64* %iindex, align 8
  br label %1726

; <label>:1726                                    ; preds = %1739, %1724
  %1727 = load i64* %iindex, align 8
  %1728 = load i64* %lastcol, align 8
  %1729 = icmp sle i64 %1727, %1728
  br i1 %1729, label %1730, label %1742

; <label>:1730                                    ; preds = %1726
  %1731 = load i64* %iindex, align 8
  %1732 = load i64* %i, align 8
  %1733 = load i64* %psiindex, align 8
  %1734 = load %struct.fields_struct** @fields, align 8
  %1735 = getelementptr inbounds %struct.fields_struct* %1734, i32 0, i32 0
  %1736 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1735, i32 0, i64 %1733
  %1737 = getelementptr inbounds [258 x [258 x double]]* %1736, i32 0, i64 %1732
  %1738 = getelementptr inbounds [258 x double]* %1737, i32 0, i64 %1731
  store double 0.000000e+00, double* %1738, align 8
  br label %1739

; <label>:1739                                    ; preds = %1730
  %1740 = load i64* %iindex, align 8
  %1741 = add nsw i64 %1740, 1
  store i64 %1741, i64* %iindex, align 8
  br label %1726

; <label>:1742                                    ; preds = %1726
  br label %1743

; <label>:1743                                    ; preds = %1742
  %1744 = load i64* %i, align 8
  %1745 = add nsw i64 %1744, 1
  store i64 %1745, i64* %i, align 8
  br label %1720

; <label>:1746                                    ; preds = %1720
  br label %1747

; <label>:1747                                    ; preds = %1746
  %1748 = load i64* %psiindex, align 8
  %1749 = add nsw i64 %1748, 1
  store i64 %1749, i64* %psiindex, align 8
  br label %1564

; <label>:1750                                    ; preds = %1564
  %1751 = load double* @ysca, align 8
  %1752 = fmul double 5.000000e-01, %1751
  store double %1752, double* %ysca1, align 8
  %1753 = load double* @t0, align 8
  %1754 = fsub double -0.000000e+00, %1753
  %1755 = load double* @pi, align 8
  %1756 = fmul double %1754, %1755
  %1757 = load double* %ysca1, align 8
  %1758 = fdiv double %1756, %1757
  store double %1758, double* %factor, align 8
  %1759 = load i64* %procid, align 8
  %1760 = icmp eq i64 %1759, 0
  br i1 %1760, label %1761, label %1766

; <label>:1761                                    ; preds = %1750
  %1762 = load %struct.frcng_struct** @frcng, align 8
  %1763 = getelementptr inbounds %struct.frcng_struct* %1762, i32 0, i32 0
  %1764 = getelementptr inbounds [258 x [258 x double]]* %1763, i32 0, i64 0
  %1765 = getelementptr inbounds [258 x double]* %1764, i32 0, i64 0
  store double 0.000000e+00, double* %1765, align 8
  br label %1766

; <label>:1766                                    ; preds = %1761, %1750
  %1767 = load i64* %procid, align 8
  %1768 = load i64* @nprocs, align 8
  %1769 = load i64* @xprocs, align 8
  %1770 = sub nsw i64 %1768, %1769
  %1771 = icmp eq i64 %1767, %1770
  br i1 %1771, label %1772, label %1779

; <label>:1772                                    ; preds = %1766
  %1773 = load i64* @im, align 8
  %1774 = sub nsw i64 %1773, 1
  %1775 = load %struct.frcng_struct** @frcng, align 8
  %1776 = getelementptr inbounds %struct.frcng_struct* %1775, i32 0, i32 0
  %1777 = getelementptr inbounds [258 x [258 x double]]* %1776, i32 0, i64 %1774
  %1778 = getelementptr inbounds [258 x double]* %1777, i32 0, i64 0
  store double 0.000000e+00, double* %1778, align 8
  br label %1779

; <label>:1779                                    ; preds = %1772, %1766
  %1780 = load i64* %procid, align 8
  %1781 = load i64* @xprocs, align 8
  %1782 = sub nsw i64 %1781, 1
  %1783 = icmp eq i64 %1780, %1782
  br i1 %1783, label %1784, label %1804

; <label>:1784                                    ; preds = %1779
  %1785 = load double* @pi, align 8
  %1786 = load i64* @jmm1, align 8
  %1787 = sitofp i64 %1786 to double
  %1788 = fmul double %1785, %1787
  %1789 = load double* @res, align 8
  %1790 = fmul double %1788, %1789
  %1791 = load double* %ysca1, align 8
  %1792 = fdiv double %1790, %1791
  store double %1792, double* %sintemp, align 8
  %1793 = load double* %sintemp, align 8
  %1794 = call double @sin(double %1793) #6
  store double %1794, double* %sintemp, align 8
  %1795 = load double* %factor, align 8
  %1796 = load double* %sintemp, align 8
  %1797 = fmul double %1795, %1796
  %1798 = load i64* @jm, align 8
  %1799 = sub nsw i64 %1798, 1
  %1800 = load %struct.frcng_struct** @frcng, align 8
  %1801 = getelementptr inbounds %struct.frcng_struct* %1800, i32 0, i32 0
  %1802 = getelementptr inbounds [258 x [258 x double]]* %1801, i32 0, i64 0
  %1803 = getelementptr inbounds [258 x double]* %1802, i32 0, i64 %1799
  store double %1797, double* %1803, align 8
  br label %1804

; <label>:1804                                    ; preds = %1784, %1779
  %1805 = load i64* %procid, align 8
  %1806 = load i64* @nprocs, align 8
  %1807 = sub nsw i64 %1806, 1
  %1808 = icmp eq i64 %1805, %1807
  br i1 %1808, label %1809, label %1835

; <label>:1809                                    ; preds = %1804
  %1810 = load double* @pi, align 8
  %1811 = load i64* @jmm1, align 8
  %1812 = sitofp i64 %1811 to double
  %1813 = fmul double %1810, %1812
  %1814 = load double* @res, align 8
  %1815 = fmul double %1813, %1814
  %1816 = load double* %ysca1, align 8
  %1817 = fdiv double %1815, %1816
  store double %1817, double* %sintemp, align 8
  %1818 = load double* %sintemp, align 8
  %1819 = call double @sin(double %1818) #6
  store double %1819, double* %sintemp, align 8
  %1820 = load i64* @jm, align 8
  %1821 = sub nsw i64 %1820, 1
  %1822 = load %struct.frcng_struct** @frcng, align 8
  %1823 = getelementptr inbounds %struct.frcng_struct* %1822, i32 0, i32 0
  %1824 = getelementptr inbounds [258 x [258 x double]]* %1823, i32 0, i64 0
  %1825 = getelementptr inbounds [258 x double]* %1824, i32 0, i64 %1821
  %1826 = load double* %1825, align 8
  %1827 = load i64* @jm, align 8
  %1828 = sub nsw i64 %1827, 1
  %1829 = load i64* @im, align 8
  %1830 = sub nsw i64 %1829, 1
  %1831 = load %struct.frcng_struct** @frcng, align 8
  %1832 = getelementptr inbounds %struct.frcng_struct* %1831, i32 0, i32 0
  %1833 = getelementptr inbounds [258 x [258 x double]]* %1832, i32 0, i64 %1830
  %1834 = getelementptr inbounds [258 x double]* %1833, i32 0, i64 %1828
  store double %1826, double* %1834, align 8
  br label %1835

; <label>:1835                                    ; preds = %1809, %1804
  %1836 = load i64* %firstrow, align 8
  %1837 = icmp eq i64 %1836, 1
  br i1 %1837, label %1838, label %1868

; <label>:1838                                    ; preds = %1835
  %1839 = load i64* %firstcol, align 8
  store i64 %1839, i64* %j, align 8
  br label %1840

; <label>:1840                                    ; preds = %1864, %1838
  %1841 = load i64* %j, align 8
  %1842 = load i64* %lastcol, align 8
  %1843 = icmp sle i64 %1841, %1842
  br i1 %1843, label %1844, label %1867

; <label>:1844                                    ; preds = %1840
  %1845 = load double* @pi, align 8
  %1846 = load i64* %j, align 8
  %1847 = sitofp i64 %1846 to double
  %1848 = fmul double %1845, %1847
  %1849 = load double* @res, align 8
  %1850 = fmul double %1848, %1849
  %1851 = load double* %ysca1, align 8
  %1852 = fdiv double %1850, %1851
  store double %1852, double* %sintemp, align 8
  %1853 = load double* %sintemp, align 8
  %1854 = call double @sin(double %1853) #6
  store double %1854, double* %sintemp, align 8
  %1855 = load double* %factor, align 8
  %1856 = load double* %sintemp, align 8
  %1857 = fmul double %1855, %1856
  store double %1857, double* %curlt, align 8
  %1858 = load double* %curlt, align 8
  %1859 = load i64* %j, align 8
  %1860 = load %struct.frcng_struct** @frcng, align 8
  %1861 = getelementptr inbounds %struct.frcng_struct* %1860, i32 0, i32 0
  %1862 = getelementptr inbounds [258 x [258 x double]]* %1861, i32 0, i64 0
  %1863 = getelementptr inbounds [258 x double]* %1862, i32 0, i64 %1859
  store double %1858, double* %1863, align 8
  br label %1864

; <label>:1864                                    ; preds = %1844
  %1865 = load i64* %j, align 8
  %1866 = add nsw i64 %1865, 1
  store i64 %1866, i64* %j, align 8
  br label %1840

; <label>:1867                                    ; preds = %1840
  br label %1868

; <label>:1868                                    ; preds = %1867, %1835
  %1869 = load i64* %firstrow, align 8
  %1870 = load i64* %numrows, align 8
  %1871 = add nsw i64 %1869, %1870
  %1872 = load i64* @im, align 8
  %1873 = sub nsw i64 %1872, 1
  %1874 = icmp eq i64 %1871, %1873
  br i1 %1874, label %1875, label %1907

; <label>:1875                                    ; preds = %1868
  %1876 = load i64* %firstcol, align 8
  store i64 %1876, i64* %j, align 8
  br label %1877

; <label>:1877                                    ; preds = %1903, %1875
  %1878 = load i64* %j, align 8
  %1879 = load i64* %lastcol, align 8
  %1880 = icmp sle i64 %1878, %1879
  br i1 %1880, label %1881, label %1906

; <label>:1881                                    ; preds = %1877
  %1882 = load double* @pi, align 8
  %1883 = load i64* %j, align 8
  %1884 = sitofp i64 %1883 to double
  %1885 = fmul double %1882, %1884
  %1886 = load double* @res, align 8
  %1887 = fmul double %1885, %1886
  %1888 = load double* %ysca1, align 8
  %1889 = fdiv double %1887, %1888
  store double %1889, double* %sintemp, align 8
  %1890 = load double* %sintemp, align 8
  %1891 = call double @sin(double %1890) #6
  store double %1891, double* %sintemp, align 8
  %1892 = load double* %factor, align 8
  %1893 = load double* %sintemp, align 8
  %1894 = fmul double %1892, %1893
  store double %1894, double* %curlt, align 8
  %1895 = load double* %curlt, align 8
  %1896 = load i64* %j, align 8
  %1897 = load i64* @im, align 8
  %1898 = sub nsw i64 %1897, 1
  %1899 = load %struct.frcng_struct** @frcng, align 8
  %1900 = getelementptr inbounds %struct.frcng_struct* %1899, i32 0, i32 0
  %1901 = getelementptr inbounds [258 x [258 x double]]* %1900, i32 0, i64 %1898
  %1902 = getelementptr inbounds [258 x double]* %1901, i32 0, i64 %1896
  store double %1895, double* %1902, align 8
  br label %1903

; <label>:1903                                    ; preds = %1881
  %1904 = load i64* %j, align 8
  %1905 = add nsw i64 %1904, 1
  store i64 %1905, i64* %j, align 8
  br label %1877

; <label>:1906                                    ; preds = %1877
  br label %1907

; <label>:1907                                    ; preds = %1906, %1868
  %1908 = load i64* %firstcol, align 8
  %1909 = icmp eq i64 %1908, 1
  br i1 %1909, label %1910, label %1926

; <label>:1910                                    ; preds = %1907
  %1911 = load i64* %firstrow, align 8
  store i64 %1911, i64* %j, align 8
  br label %1912

; <label>:1912                                    ; preds = %1922, %1910
  %1913 = load i64* %j, align 8
  %1914 = load i64* %lastrow, align 8
  %1915 = icmp sle i64 %1913, %1914
  br i1 %1915, label %1916, label %1925

; <label>:1916                                    ; preds = %1912
  %1917 = load i64* %j, align 8
  %1918 = load %struct.frcng_struct** @frcng, align 8
  %1919 = getelementptr inbounds %struct.frcng_struct* %1918, i32 0, i32 0
  %1920 = getelementptr inbounds [258 x [258 x double]]* %1919, i32 0, i64 %1917
  %1921 = getelementptr inbounds [258 x double]* %1920, i32 0, i64 0
  store double 0.000000e+00, double* %1921, align 8
  br label %1922

; <label>:1922                                    ; preds = %1916
  %1923 = load i64* %j, align 8
  %1924 = add nsw i64 %1923, 1
  store i64 %1924, i64* %j, align 8
  br label %1912

; <label>:1925                                    ; preds = %1912
  br label %1926

; <label>:1926                                    ; preds = %1925, %1907
  %1927 = load i64* %firstcol, align 8
  %1928 = load i64* %numcols, align 8
  %1929 = add nsw i64 %1927, %1928
  %1930 = load i64* @jm, align 8
  %1931 = sub nsw i64 %1930, 1
  %1932 = icmp eq i64 %1929, %1931
  br i1 %1932, label %1933, label %1965

; <label>:1933                                    ; preds = %1926
  %1934 = load double* @pi, align 8
  %1935 = load i64* @jmm1, align 8
  %1936 = sitofp i64 %1935 to double
  %1937 = fmul double %1934, %1936
  %1938 = load double* @res, align 8
  %1939 = fmul double %1937, %1938
  %1940 = load double* %ysca1, align 8
  %1941 = fdiv double %1939, %1940
  store double %1941, double* %sintemp, align 8
  %1942 = load double* %sintemp, align 8
  %1943 = call double @sin(double %1942) #6
  store double %1943, double* %sintemp, align 8
  %1944 = load double* %factor, align 8
  %1945 = load double* %sintemp, align 8
  %1946 = fmul double %1944, %1945
  store double %1946, double* %curlt, align 8
  %1947 = load i64* %firstrow, align 8
  store i64 %1947, i64* %j, align 8
  br label %1948

; <label>:1948                                    ; preds = %1961, %1933
  %1949 = load i64* %j, align 8
  %1950 = load i64* %lastrow, align 8
  %1951 = icmp sle i64 %1949, %1950
  br i1 %1951, label %1952, label %1964

; <label>:1952                                    ; preds = %1948
  %1953 = load double* %curlt, align 8
  %1954 = load i64* @jm, align 8
  %1955 = sub nsw i64 %1954, 1
  %1956 = load i64* %j, align 8
  %1957 = load %struct.frcng_struct** @frcng, align 8
  %1958 = getelementptr inbounds %struct.frcng_struct* %1957, i32 0, i32 0
  %1959 = getelementptr inbounds [258 x [258 x double]]* %1958, i32 0, i64 %1956
  %1960 = getelementptr inbounds [258 x double]* %1959, i32 0, i64 %1955
  store double %1953, double* %1960, align 8
  br label %1961

; <label>:1961                                    ; preds = %1952
  %1962 = load i64* %j, align 8
  %1963 = add nsw i64 %1962, 1
  store i64 %1963, i64* %j, align 8
  br label %1948

; <label>:1964                                    ; preds = %1948
  br label %1965

; <label>:1965                                    ; preds = %1964, %1926
  %1966 = load i64* %firstcol, align 8
  store i64 %1966, i64* %iindex, align 8
  br label %1967

; <label>:1967                                    ; preds = %2002, %1965
  %1968 = load i64* %iindex, align 8
  %1969 = load i64* %lastcol, align 8
  %1970 = icmp sle i64 %1968, %1969
  br i1 %1970, label %1971, label %2005

; <label>:1971                                    ; preds = %1967
  %1972 = load double* @pi, align 8
  %1973 = load i64* %iindex, align 8
  %1974 = sitofp i64 %1973 to double
  %1975 = fmul double %1972, %1974
  %1976 = load double* @res, align 8
  %1977 = fmul double %1975, %1976
  %1978 = load double* %ysca1, align 8
  %1979 = fdiv double %1977, %1978
  store double %1979, double* %sintemp, align 8
  %1980 = load double* %sintemp, align 8
  %1981 = call double @sin(double %1980) #6
  store double %1981, double* %sintemp, align 8
  %1982 = load double* %factor, align 8
  %1983 = load double* %sintemp, align 8
  %1984 = fmul double %1982, %1983
  store double %1984, double* %curlt, align 8
  %1985 = load i64* %firstrow, align 8
  store i64 %1985, i64* %i, align 8
  br label %1986

; <label>:1986                                    ; preds = %1998, %1971
  %1987 = load i64* %i, align 8
  %1988 = load i64* %lastrow, align 8
  %1989 = icmp sle i64 %1987, %1988
  br i1 %1989, label %1990, label %2001

; <label>:1990                                    ; preds = %1986
  %1991 = load double* %curlt, align 8
  %1992 = load i64* %iindex, align 8
  %1993 = load i64* %i, align 8
  %1994 = load %struct.frcng_struct** @frcng, align 8
  %1995 = getelementptr inbounds %struct.frcng_struct* %1994, i32 0, i32 0
  %1996 = getelementptr inbounds [258 x [258 x double]]* %1995, i32 0, i64 %1993
  %1997 = getelementptr inbounds [258 x double]* %1996, i32 0, i64 %1992
  store double %1991, double* %1997, align 8
  br label %1998

; <label>:1998                                    ; preds = %1990
  %1999 = load i64* %i, align 8
  %2000 = add nsw i64 %1999, 1
  store i64 %2000, i64* %i, align 8
  br label %1986

; <label>:2001                                    ; preds = %1986
  br label %2002

; <label>:2002                                    ; preds = %2001
  %2003 = load i64* %iindex, align 8
  %2004 = add nsw i64 %2003, 1
  store i64 %2004, i64* %iindex, align 8
  br label %1967

; <label>:2005                                    ; preds = %1967
  %2006 = load %struct.bars_struct** @bars, align 8
  %2007 = getelementptr inbounds %struct.bars_struct* %2006, i32 0, i32 0
  %2008 = getelementptr inbounds %struct.anon* %2007, i32 0, i32 0
  %2009 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %2008) #6
  %2010 = sext i32 %2009 to i64
  store i64 %2010, i64* %Error9, align 8
  %2011 = load i64* %Error9, align 8
  %2012 = icmp ne i64 %2011, 0
  br i1 %2012, label %2013, label %2015

; <label>:2013                                    ; preds = %2005
  %2014 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str38, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:2015                                    ; preds = %2005
  %2016 = load %struct.bars_struct** @bars, align 8
  %2017 = getelementptr inbounds %struct.bars_struct* %2016, i32 0, i32 0
  %2018 = getelementptr inbounds %struct.anon* %2017, i32 0, i32 3
  %2019 = load i64* %2018, align 8
  store i64 %2019, i64* %Cycle10, align 8
  %2020 = load %struct.bars_struct** @bars, align 8
  %2021 = getelementptr inbounds %struct.bars_struct* %2020, i32 0, i32 0
  %2022 = getelementptr inbounds %struct.anon* %2021, i32 0, i32 2
  %2023 = load i64* %2022, align 8
  %2024 = add i64 %2023, 1
  store i64 %2024, i64* %2022, align 8
  %2025 = load i64* @nprocs, align 8
  %2026 = icmp ne i64 %2024, %2025
  br i1 %2026, label %2027, label %2055

; <label>:2027                                    ; preds = %2015
  %2028 = bitcast i64* %Cancel11 to i32*
  %2029 = call i32 @pthread_setcancelstate(i32 1, i32* %2028)
  br label %2030

; <label>:2030                                    ; preds = %2049, %2027
  %2031 = load i64* %Cycle10, align 8
  %2032 = load %struct.bars_struct** @bars, align 8
  %2033 = getelementptr inbounds %struct.bars_struct* %2032, i32 0, i32 0
  %2034 = getelementptr inbounds %struct.anon* %2033, i32 0, i32 3
  %2035 = load i64* %2034, align 8
  %2036 = icmp eq i64 %2031, %2035
  br i1 %2036, label %2037, label %2050

; <label>:2037                                    ; preds = %2030
  %2038 = load %struct.bars_struct** @bars, align 8
  %2039 = getelementptr inbounds %struct.bars_struct* %2038, i32 0, i32 0
  %2040 = getelementptr inbounds %struct.anon* %2039, i32 0, i32 1
  %2041 = load %struct.bars_struct** @bars, align 8
  %2042 = getelementptr inbounds %struct.bars_struct* %2041, i32 0, i32 0
  %2043 = getelementptr inbounds %struct.anon* %2042, i32 0, i32 0
  %2044 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %2040, %union.pthread_mutex_t* %2043)
  %2045 = sext i32 %2044 to i64
  store i64 %2045, i64* %Error9, align 8
  %2046 = load i64* %Error9, align 8
  %2047 = icmp ne i64 %2046, 0
  br i1 %2047, label %2048, label %2049

; <label>:2048                                    ; preds = %2037
  br label %2050

; <label>:2049                                    ; preds = %2037
  br label %2030

; <label>:2050                                    ; preds = %2048, %2030
  %2051 = load i64* %Cancel11, align 8
  %2052 = trunc i64 %2051 to i32
  %2053 = bitcast i64* %Temp12 to i32*
  %2054 = call i32 @pthread_setcancelstate(i32 %2052, i32* %2053)
  br label %2075

; <label>:2055                                    ; preds = %2015
  %2056 = load %struct.bars_struct** @bars, align 8
  %2057 = getelementptr inbounds %struct.bars_struct* %2056, i32 0, i32 0
  %2058 = getelementptr inbounds %struct.anon* %2057, i32 0, i32 3
  %2059 = load i64* %2058, align 8
  %2060 = icmp ne i64 %2059, 0
  %2061 = xor i1 %2060, true
  %2062 = zext i1 %2061 to i32
  %2063 = sext i32 %2062 to i64
  %2064 = load %struct.bars_struct** @bars, align 8
  %2065 = getelementptr inbounds %struct.bars_struct* %2064, i32 0, i32 0
  %2066 = getelementptr inbounds %struct.anon* %2065, i32 0, i32 3
  store i64 %2063, i64* %2066, align 8
  %2067 = load %struct.bars_struct** @bars, align 8
  %2068 = getelementptr inbounds %struct.bars_struct* %2067, i32 0, i32 0
  %2069 = getelementptr inbounds %struct.anon* %2068, i32 0, i32 2
  store i64 0, i64* %2069, align 8
  %2070 = load %struct.bars_struct** @bars, align 8
  %2071 = getelementptr inbounds %struct.bars_struct* %2070, i32 0, i32 0
  %2072 = getelementptr inbounds %struct.anon* %2071, i32 0, i32 1
  %2073 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %2072) #6
  %2074 = sext i32 %2073 to i64
  store i64 %2074, i64* %Error9, align 8
  br label %2075

; <label>:2075                                    ; preds = %2055, %2050
  %2076 = load %struct.bars_struct** @bars, align 8
  %2077 = getelementptr inbounds %struct.bars_struct* %2076, i32 0, i32 0
  %2078 = getelementptr inbounds %struct.anon* %2077, i32 0, i32 0
  %2079 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %2078) #6
  br label %2080

; <label>:2080                                    ; preds = %2780, %2075
  %2081 = load i64* %endflag, align 8
  %2082 = icmp ne i64 %2081, 0
  %2083 = xor i1 %2082, true
  br i1 %2083, label %2084, label %2781

; <label>:2084                                    ; preds = %2080
  br label %2085

; <label>:2085                                    ; preds = %2163, %2084
  %2086 = load i64* %dayflag, align 8
  %2087 = icmp ne i64 %2086, 0
  br i1 %2087, label %2088, label %2092

; <label>:2088                                    ; preds = %2085
  %2089 = load i64* %dhourflag, align 8
  %2090 = icmp ne i64 %2089, 0
  %2091 = xor i1 %2090, true
  br label %2092

; <label>:2092                                    ; preds = %2088, %2085
  %2093 = phi i1 [ true, %2085 ], [ %2091, %2088 ]
  br i1 %2093, label %2094, label %2164

; <label>:2094                                    ; preds = %2092
  store i64 0, i64* %dayflag, align 8
  store i64 0, i64* %dhourflag, align 8
  %2095 = load i64* %nstep, align 8
  %2096 = icmp eq i64 %2095, 1
  br i1 %2096, label %2097, label %2135

; <label>:2097                                    ; preds = %2094
  %2098 = load i64* %procid, align 8
  %2099 = icmp eq i64 %2098, 0
  br i1 %2099, label %2100, label %2110

; <label>:2100                                    ; preds = %2097
  %2101 = call i32 @gettimeofday(%struct.timeval* %FullTime, %struct.timezone* null) #6
  %2102 = getelementptr inbounds %struct.timeval* %FullTime, i32 0, i32 1
  %2103 = load i64* %2102, align 8
  %2104 = getelementptr inbounds %struct.timeval* %FullTime, i32 0, i32 0
  %2105 = load i64* %2104, align 8
  %2106 = mul nsw i64 %2105, 1000000
  %2107 = add nsw i64 %2103, %2106
  %2108 = load %struct.global_struct** @global, align 8
  %2109 = getelementptr inbounds %struct.global_struct* %2108, i32 0, i32 2
  store i64 %2107, i64* %2109, align 8
  br label %2110

; <label>:2110                                    ; preds = %2100, %2097
  %2111 = load i64* %procid, align 8
  %2112 = icmp eq i64 %2111, 0
  br i1 %2112, label %2116, label %2113

; <label>:2113                                    ; preds = %2110
  %2114 = load i64* @do_stats, align 8
  %2115 = icmp ne i64 %2114, 0
  br i1 %2115, label %2116, label %2134

; <label>:2116                                    ; preds = %2113, %2110
  %2117 = call i32 @gettimeofday(%struct.timeval* %FullTime13, %struct.timezone* null) #6
  %2118 = getelementptr inbounds %struct.timeval* %FullTime13, i32 0, i32 1
  %2119 = load i64* %2118, align 8
  %2120 = getelementptr inbounds %struct.timeval* %FullTime13, i32 0, i32 0
  %2121 = load i64* %2120, align 8
  %2122 = mul nsw i64 %2121, 1000000
  %2123 = add nsw i64 %2119, %2122
  store i64 %2123, i64* %t1, align 8
  %2124 = load i64* %t1, align 8
  %2125 = uitofp i64 %2124 to double
  %2126 = load i64* %procid, align 8
  %2127 = load %struct.Global_Private** @gp, align 8
  %2128 = getelementptr inbounds %struct.Global_Private* %2127, i64 %2126
  %2129 = getelementptr inbounds %struct.Global_Private* %2128, i32 0, i32 2
  store double %2125, double* %2129, align 8
  %2130 = load i64* %procid, align 8
  %2131 = load %struct.Global_Private** @gp, align 8
  %2132 = getelementptr inbounds %struct.Global_Private* %2131, i64 %2130
  %2133 = getelementptr inbounds %struct.Global_Private* %2132, i32 0, i32 1
  store double 0.000000e+00, double* %2133, align 8
  br label %2134

; <label>:2134                                    ; preds = %2116, %2113
  br label %2135

; <label>:2135                                    ; preds = %2134, %2094
  %2136 = load i64* %procid, align 8
  %2137 = load i64* %firstrow, align 8
  %2138 = load i64* %lastrow, align 8
  %2139 = load i64* %numrows, align 8
  %2140 = load i64* %firstcol, align 8
  %2141 = load i64* %lastcol, align 8
  %2142 = load i64* %numcols, align 8
  call void @slave2(i64 %2136, i64 %2137, i64 %2138, i64 %2139, i64 %2140, i64 %2141, i64 %2142)
  %2143 = load double* %ttime, align 8
  %2144 = load double* @dtau, align 8
  %2145 = fadd double %2143, %2144
  store double %2145, double* %ttime, align 8
  %2146 = load i64* %nstep, align 8
  %2147 = add nsw i64 %2146, 1
  store i64 %2147, i64* %nstep, align 8
  %2148 = load double* %ttime, align 8
  %2149 = fdiv double %2148, 8.640000e+04
  store double %2149, double* %day, align 8
  %2150 = load double* %day, align 8
  %2151 = load double* @outday0, align 8
  %2152 = fcmp ogt double %2150, %2151
  br i1 %2152, label %2153, label %2163

; <label>:2153                                    ; preds = %2135
  store i64 1, i64* %dayflag, align 8
  %2154 = load double* %day, align 8
  %2155 = fptosi double %2154 to i64
  store i64 %2155, i64* %iday, align 8
  %2156 = load double* %dhour, align 8
  %2157 = load double* @dtau, align 8
  %2158 = fadd double %2156, %2157
  store double %2158, double* %dhour, align 8
  %2159 = load double* %dhour, align 8
  %2160 = fcmp oge double %2159, 8.640000e+04
  br i1 %2160, label %2161, label %2162

; <label>:2161                                    ; preds = %2153
  store i64 1, i64* %dhourflag, align 8
  br label %2162

; <label>:2162                                    ; preds = %2161, %2153
  br label %2163

; <label>:2163                                    ; preds = %2162, %2135
  br label %2085

; <label>:2164                                    ; preds = %2092
  store double 0.000000e+00, double* %dhour, align 8
  %2165 = load i64* %procid, align 8
  %2166 = icmp eq i64 %2165, 0
  br i1 %2166, label %2167, label %2184

; <label>:2167                                    ; preds = %2164
  %2168 = load %struct.fields2_struct** @fields2, align 8
  %2169 = getelementptr inbounds %struct.fields2_struct* %2168, i32 0, i32 0
  %2170 = getelementptr inbounds [258 x [258 x double]]* %2169, i32 0, i64 0
  %2171 = getelementptr inbounds [258 x double]* %2170, i32 0, i64 0
  %2172 = load double* %2171, align 8
  %2173 = load %struct.fields_struct** @fields, align 8
  %2174 = getelementptr inbounds %struct.fields_struct* %2173, i32 0, i32 1
  %2175 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2174, i32 0, i64 0
  %2176 = getelementptr inbounds [258 x [258 x double]]* %2175, i32 0, i64 0
  %2177 = getelementptr inbounds [258 x double]* %2176, i32 0, i64 0
  %2178 = load double* %2177, align 8
  %2179 = fadd double %2172, %2178
  %2180 = load %struct.fields2_struct** @fields2, align 8
  %2181 = getelementptr inbounds %struct.fields2_struct* %2180, i32 0, i32 0
  %2182 = getelementptr inbounds [258 x [258 x double]]* %2181, i32 0, i64 0
  %2183 = getelementptr inbounds [258 x double]* %2182, i32 0, i64 0
  store double %2179, double* %2183, align 8
  br label %2184

; <label>:2184                                    ; preds = %2167, %2164
  %2185 = load i64* %procid, align 8
  %2186 = load i64* @nprocs, align 8
  %2187 = load i64* @xprocs, align 8
  %2188 = sub nsw i64 %2186, %2187
  %2189 = icmp eq i64 %2185, %2188
  br i1 %2189, label %2190, label %2213

; <label>:2190                                    ; preds = %2184
  %2191 = load i64* @im, align 8
  %2192 = sub nsw i64 %2191, 1
  %2193 = load %struct.fields2_struct** @fields2, align 8
  %2194 = getelementptr inbounds %struct.fields2_struct* %2193, i32 0, i32 0
  %2195 = getelementptr inbounds [258 x [258 x double]]* %2194, i32 0, i64 %2192
  %2196 = getelementptr inbounds [258 x double]* %2195, i32 0, i64 0
  %2197 = load double* %2196, align 8
  %2198 = load i64* @im, align 8
  %2199 = sub nsw i64 %2198, 1
  %2200 = load %struct.fields_struct** @fields, align 8
  %2201 = getelementptr inbounds %struct.fields_struct* %2200, i32 0, i32 1
  %2202 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2201, i32 0, i64 0
  %2203 = getelementptr inbounds [258 x [258 x double]]* %2202, i32 0, i64 %2199
  %2204 = getelementptr inbounds [258 x double]* %2203, i32 0, i64 0
  %2205 = load double* %2204, align 8
  %2206 = fadd double %2197, %2205
  %2207 = load i64* @im, align 8
  %2208 = sub nsw i64 %2207, 1
  %2209 = load %struct.fields2_struct** @fields2, align 8
  %2210 = getelementptr inbounds %struct.fields2_struct* %2209, i32 0, i32 0
  %2211 = getelementptr inbounds [258 x [258 x double]]* %2210, i32 0, i64 %2208
  %2212 = getelementptr inbounds [258 x double]* %2211, i32 0, i64 0
  store double %2206, double* %2212, align 8
  br label %2213

; <label>:2213                                    ; preds = %2190, %2184
  %2214 = load i64* %procid, align 8
  %2215 = load i64* @xprocs, align 8
  %2216 = sub nsw i64 %2215, 1
  %2217 = icmp eq i64 %2214, %2216
  br i1 %2217, label %2218, label %2241

; <label>:2218                                    ; preds = %2213
  %2219 = load i64* @jm, align 8
  %2220 = sub nsw i64 %2219, 1
  %2221 = load %struct.fields2_struct** @fields2, align 8
  %2222 = getelementptr inbounds %struct.fields2_struct* %2221, i32 0, i32 0
  %2223 = getelementptr inbounds [258 x [258 x double]]* %2222, i32 0, i64 0
  %2224 = getelementptr inbounds [258 x double]* %2223, i32 0, i64 %2220
  %2225 = load double* %2224, align 8
  %2226 = load i64* @jm, align 8
  %2227 = sub nsw i64 %2226, 1
  %2228 = load %struct.fields_struct** @fields, align 8
  %2229 = getelementptr inbounds %struct.fields_struct* %2228, i32 0, i32 1
  %2230 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2229, i32 0, i64 0
  %2231 = getelementptr inbounds [258 x [258 x double]]* %2230, i32 0, i64 0
  %2232 = getelementptr inbounds [258 x double]* %2231, i32 0, i64 %2227
  %2233 = load double* %2232, align 8
  %2234 = fadd double %2225, %2233
  %2235 = load i64* @jm, align 8
  %2236 = sub nsw i64 %2235, 1
  %2237 = load %struct.fields2_struct** @fields2, align 8
  %2238 = getelementptr inbounds %struct.fields2_struct* %2237, i32 0, i32 0
  %2239 = getelementptr inbounds [258 x [258 x double]]* %2238, i32 0, i64 0
  %2240 = getelementptr inbounds [258 x double]* %2239, i32 0, i64 %2236
  store double %2234, double* %2240, align 8
  br label %2241

; <label>:2241                                    ; preds = %2218, %2213
  %2242 = load i64* %procid, align 8
  %2243 = load i64* @nprocs, align 8
  %2244 = sub nsw i64 %2243, 1
  %2245 = icmp eq i64 %2242, %2244
  br i1 %2245, label %2246, label %2275

; <label>:2246                                    ; preds = %2241
  %2247 = load i64* @jm, align 8
  %2248 = sub nsw i64 %2247, 1
  %2249 = load i64* @im, align 8
  %2250 = sub nsw i64 %2249, 1
  %2251 = load %struct.fields2_struct** @fields2, align 8
  %2252 = getelementptr inbounds %struct.fields2_struct* %2251, i32 0, i32 0
  %2253 = getelementptr inbounds [258 x [258 x double]]* %2252, i32 0, i64 %2250
  %2254 = getelementptr inbounds [258 x double]* %2253, i32 0, i64 %2248
  %2255 = load double* %2254, align 8
  %2256 = load i64* @jm, align 8
  %2257 = sub nsw i64 %2256, 1
  %2258 = load i64* @im, align 8
  %2259 = sub nsw i64 %2258, 1
  %2260 = load %struct.fields_struct** @fields, align 8
  %2261 = getelementptr inbounds %struct.fields_struct* %2260, i32 0, i32 1
  %2262 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2261, i32 0, i64 0
  %2263 = getelementptr inbounds [258 x [258 x double]]* %2262, i32 0, i64 %2259
  %2264 = getelementptr inbounds [258 x double]* %2263, i32 0, i64 %2257
  %2265 = load double* %2264, align 8
  %2266 = fadd double %2255, %2265
  %2267 = load i64* @jm, align 8
  %2268 = sub nsw i64 %2267, 1
  %2269 = load i64* @im, align 8
  %2270 = sub nsw i64 %2269, 1
  %2271 = load %struct.fields2_struct** @fields2, align 8
  %2272 = getelementptr inbounds %struct.fields2_struct* %2271, i32 0, i32 0
  %2273 = getelementptr inbounds [258 x [258 x double]]* %2272, i32 0, i64 %2270
  %2274 = getelementptr inbounds [258 x double]* %2273, i32 0, i64 %2268
  store double %2266, double* %2274, align 8
  br label %2275

; <label>:2275                                    ; preds = %2246, %2241
  %2276 = load i64* %firstrow, align 8
  %2277 = icmp eq i64 %2276, 1
  br i1 %2277, label %2278, label %2308

; <label>:2278                                    ; preds = %2275
  %2279 = load i64* %firstcol, align 8
  store i64 %2279, i64* %j, align 8
  br label %2280

; <label>:2280                                    ; preds = %2304, %2278
  %2281 = load i64* %j, align 8
  %2282 = load i64* %lastcol, align 8
  %2283 = icmp sle i64 %2281, %2282
  br i1 %2283, label %2284, label %2307

; <label>:2284                                    ; preds = %2280
  %2285 = load i64* %j, align 8
  %2286 = load %struct.fields2_struct** @fields2, align 8
  %2287 = getelementptr inbounds %struct.fields2_struct* %2286, i32 0, i32 0
  %2288 = getelementptr inbounds [258 x [258 x double]]* %2287, i32 0, i64 0
  %2289 = getelementptr inbounds [258 x double]* %2288, i32 0, i64 %2285
  %2290 = load double* %2289, align 8
  %2291 = load i64* %j, align 8
  %2292 = load %struct.fields_struct** @fields, align 8
  %2293 = getelementptr inbounds %struct.fields_struct* %2292, i32 0, i32 1
  %2294 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2293, i32 0, i64 0
  %2295 = getelementptr inbounds [258 x [258 x double]]* %2294, i32 0, i64 0
  %2296 = getelementptr inbounds [258 x double]* %2295, i32 0, i64 %2291
  %2297 = load double* %2296, align 8
  %2298 = fadd double %2290, %2297
  %2299 = load i64* %j, align 8
  %2300 = load %struct.fields2_struct** @fields2, align 8
  %2301 = getelementptr inbounds %struct.fields2_struct* %2300, i32 0, i32 0
  %2302 = getelementptr inbounds [258 x [258 x double]]* %2301, i32 0, i64 0
  %2303 = getelementptr inbounds [258 x double]* %2302, i32 0, i64 %2299
  store double %2298, double* %2303, align 8
  br label %2304

; <label>:2304                                    ; preds = %2284
  %2305 = load i64* %j, align 8
  %2306 = add nsw i64 %2305, 1
  store i64 %2306, i64* %j, align 8
  br label %2280

; <label>:2307                                    ; preds = %2280
  br label %2308

; <label>:2308                                    ; preds = %2307, %2275
  %2309 = load i64* %firstrow, align 8
  %2310 = load i64* %numrows, align 8
  %2311 = add nsw i64 %2309, %2310
  %2312 = load i64* @im, align 8
  %2313 = sub nsw i64 %2312, 1
  %2314 = icmp eq i64 %2311, %2313
  br i1 %2314, label %2315, label %2351

; <label>:2315                                    ; preds = %2308
  %2316 = load i64* %firstcol, align 8
  store i64 %2316, i64* %j, align 8
  br label %2317

; <label>:2317                                    ; preds = %2347, %2315
  %2318 = load i64* %j, align 8
  %2319 = load i64* %lastcol, align 8
  %2320 = icmp sle i64 %2318, %2319
  br i1 %2320, label %2321, label %2350

; <label>:2321                                    ; preds = %2317
  %2322 = load i64* %j, align 8
  %2323 = load i64* @im, align 8
  %2324 = sub nsw i64 %2323, 1
  %2325 = load %struct.fields2_struct** @fields2, align 8
  %2326 = getelementptr inbounds %struct.fields2_struct* %2325, i32 0, i32 0
  %2327 = getelementptr inbounds [258 x [258 x double]]* %2326, i32 0, i64 %2324
  %2328 = getelementptr inbounds [258 x double]* %2327, i32 0, i64 %2322
  %2329 = load double* %2328, align 8
  %2330 = load i64* %j, align 8
  %2331 = load i64* @im, align 8
  %2332 = sub nsw i64 %2331, 1
  %2333 = load %struct.fields_struct** @fields, align 8
  %2334 = getelementptr inbounds %struct.fields_struct* %2333, i32 0, i32 1
  %2335 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2334, i32 0, i64 0
  %2336 = getelementptr inbounds [258 x [258 x double]]* %2335, i32 0, i64 %2332
  %2337 = getelementptr inbounds [258 x double]* %2336, i32 0, i64 %2330
  %2338 = load double* %2337, align 8
  %2339 = fadd double %2329, %2338
  %2340 = load i64* %j, align 8
  %2341 = load i64* @im, align 8
  %2342 = sub nsw i64 %2341, 1
  %2343 = load %struct.fields2_struct** @fields2, align 8
  %2344 = getelementptr inbounds %struct.fields2_struct* %2343, i32 0, i32 0
  %2345 = getelementptr inbounds [258 x [258 x double]]* %2344, i32 0, i64 %2342
  %2346 = getelementptr inbounds [258 x double]* %2345, i32 0, i64 %2340
  store double %2339, double* %2346, align 8
  br label %2347

; <label>:2347                                    ; preds = %2321
  %2348 = load i64* %j, align 8
  %2349 = add nsw i64 %2348, 1
  store i64 %2349, i64* %j, align 8
  br label %2317

; <label>:2350                                    ; preds = %2317
  br label %2351

; <label>:2351                                    ; preds = %2350, %2308
  %2352 = load i64* %firstcol, align 8
  %2353 = icmp eq i64 %2352, 1
  br i1 %2353, label %2354, label %2384

; <label>:2354                                    ; preds = %2351
  %2355 = load i64* %firstrow, align 8
  store i64 %2355, i64* %j, align 8
  br label %2356

; <label>:2356                                    ; preds = %2380, %2354
  %2357 = load i64* %j, align 8
  %2358 = load i64* %lastrow, align 8
  %2359 = icmp sle i64 %2357, %2358
  br i1 %2359, label %2360, label %2383

; <label>:2360                                    ; preds = %2356
  %2361 = load i64* %j, align 8
  %2362 = load %struct.fields2_struct** @fields2, align 8
  %2363 = getelementptr inbounds %struct.fields2_struct* %2362, i32 0, i32 0
  %2364 = getelementptr inbounds [258 x [258 x double]]* %2363, i32 0, i64 %2361
  %2365 = getelementptr inbounds [258 x double]* %2364, i32 0, i64 0
  %2366 = load double* %2365, align 8
  %2367 = load i64* %j, align 8
  %2368 = load %struct.fields_struct** @fields, align 8
  %2369 = getelementptr inbounds %struct.fields_struct* %2368, i32 0, i32 1
  %2370 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2369, i32 0, i64 0
  %2371 = getelementptr inbounds [258 x [258 x double]]* %2370, i32 0, i64 %2367
  %2372 = getelementptr inbounds [258 x double]* %2371, i32 0, i64 0
  %2373 = load double* %2372, align 8
  %2374 = fadd double %2366, %2373
  %2375 = load i64* %j, align 8
  %2376 = load %struct.fields2_struct** @fields2, align 8
  %2377 = getelementptr inbounds %struct.fields2_struct* %2376, i32 0, i32 0
  %2378 = getelementptr inbounds [258 x [258 x double]]* %2377, i32 0, i64 %2375
  %2379 = getelementptr inbounds [258 x double]* %2378, i32 0, i64 0
  store double %2374, double* %2379, align 8
  br label %2380

; <label>:2380                                    ; preds = %2360
  %2381 = load i64* %j, align 8
  %2382 = add nsw i64 %2381, 1
  store i64 %2382, i64* %j, align 8
  br label %2356

; <label>:2383                                    ; preds = %2356
  br label %2384

; <label>:2384                                    ; preds = %2383, %2351
  %2385 = load i64* %firstcol, align 8
  %2386 = load i64* %numcols, align 8
  %2387 = add nsw i64 %2385, %2386
  %2388 = load i64* @jm, align 8
  %2389 = sub nsw i64 %2388, 1
  %2390 = icmp eq i64 %2387, %2389
  br i1 %2390, label %2391, label %2427

; <label>:2391                                    ; preds = %2384
  %2392 = load i64* %firstrow, align 8
  store i64 %2392, i64* %j, align 8
  br label %2393

; <label>:2393                                    ; preds = %2423, %2391
  %2394 = load i64* %j, align 8
  %2395 = load i64* %lastrow, align 8
  %2396 = icmp sle i64 %2394, %2395
  br i1 %2396, label %2397, label %2426

; <label>:2397                                    ; preds = %2393
  %2398 = load i64* @jm, align 8
  %2399 = sub nsw i64 %2398, 1
  %2400 = load i64* %j, align 8
  %2401 = load %struct.fields2_struct** @fields2, align 8
  %2402 = getelementptr inbounds %struct.fields2_struct* %2401, i32 0, i32 0
  %2403 = getelementptr inbounds [258 x [258 x double]]* %2402, i32 0, i64 %2400
  %2404 = getelementptr inbounds [258 x double]* %2403, i32 0, i64 %2399
  %2405 = load double* %2404, align 8
  %2406 = load i64* @jm, align 8
  %2407 = sub nsw i64 %2406, 1
  %2408 = load i64* %j, align 8
  %2409 = load %struct.fields_struct** @fields, align 8
  %2410 = getelementptr inbounds %struct.fields_struct* %2409, i32 0, i32 1
  %2411 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2410, i32 0, i64 0
  %2412 = getelementptr inbounds [258 x [258 x double]]* %2411, i32 0, i64 %2408
  %2413 = getelementptr inbounds [258 x double]* %2412, i32 0, i64 %2407
  %2414 = load double* %2413, align 8
  %2415 = fadd double %2405, %2414
  %2416 = load i64* @jm, align 8
  %2417 = sub nsw i64 %2416, 1
  %2418 = load i64* %j, align 8
  %2419 = load %struct.fields2_struct** @fields2, align 8
  %2420 = getelementptr inbounds %struct.fields2_struct* %2419, i32 0, i32 0
  %2421 = getelementptr inbounds [258 x [258 x double]]* %2420, i32 0, i64 %2418
  %2422 = getelementptr inbounds [258 x double]* %2421, i32 0, i64 %2417
  store double %2415, double* %2422, align 8
  br label %2423

; <label>:2423                                    ; preds = %2397
  %2424 = load i64* %j, align 8
  %2425 = add nsw i64 %2424, 1
  store i64 %2425, i64* %j, align 8
  br label %2393

; <label>:2426                                    ; preds = %2393
  br label %2427

; <label>:2427                                    ; preds = %2426, %2384
  %2428 = load i64* %firstrow, align 8
  store i64 %2428, i64* %i, align 8
  br label %2429

; <label>:2429                                    ; preds = %2466, %2427
  %2430 = load i64* %i, align 8
  %2431 = load i64* %lastrow, align 8
  %2432 = icmp sle i64 %2430, %2431
  br i1 %2432, label %2433, label %2469

; <label>:2433                                    ; preds = %2429
  %2434 = load i64* %firstcol, align 8
  store i64 %2434, i64* %iindex, align 8
  br label %2435

; <label>:2435                                    ; preds = %2462, %2433
  %2436 = load i64* %iindex, align 8
  %2437 = load i64* %lastcol, align 8
  %2438 = icmp sle i64 %2436, %2437
  br i1 %2438, label %2439, label %2465

; <label>:2439                                    ; preds = %2435
  %2440 = load i64* %iindex, align 8
  %2441 = load i64* %i, align 8
  %2442 = load %struct.fields2_struct** @fields2, align 8
  %2443 = getelementptr inbounds %struct.fields2_struct* %2442, i32 0, i32 0
  %2444 = getelementptr inbounds [258 x [258 x double]]* %2443, i32 0, i64 %2441
  %2445 = getelementptr inbounds [258 x double]* %2444, i32 0, i64 %2440
  %2446 = load double* %2445, align 8
  %2447 = load i64* %iindex, align 8
  %2448 = load i64* %i, align 8
  %2449 = load %struct.fields_struct** @fields, align 8
  %2450 = getelementptr inbounds %struct.fields_struct* %2449, i32 0, i32 1
  %2451 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2450, i32 0, i64 0
  %2452 = getelementptr inbounds [258 x [258 x double]]* %2451, i32 0, i64 %2448
  %2453 = getelementptr inbounds [258 x double]* %2452, i32 0, i64 %2447
  %2454 = load double* %2453, align 8
  %2455 = fadd double %2446, %2454
  %2456 = load i64* %iindex, align 8
  %2457 = load i64* %i, align 8
  %2458 = load %struct.fields2_struct** @fields2, align 8
  %2459 = getelementptr inbounds %struct.fields2_struct* %2458, i32 0, i32 0
  %2460 = getelementptr inbounds [258 x [258 x double]]* %2459, i32 0, i64 %2457
  %2461 = getelementptr inbounds [258 x double]* %2460, i32 0, i64 %2456
  store double %2455, double* %2461, align 8
  br label %2462

; <label>:2462                                    ; preds = %2439
  %2463 = load i64* %iindex, align 8
  %2464 = add nsw i64 %2463, 1
  store i64 %2464, i64* %iindex, align 8
  br label %2435

; <label>:2465                                    ; preds = %2435
  br label %2466

; <label>:2466                                    ; preds = %2465
  %2467 = load i64* %i, align 8
  %2468 = add nsw i64 %2467, 1
  store i64 %2468, i64* %i, align 8
  br label %2429

; <label>:2469                                    ; preds = %2429
  %2470 = load i64* %procid, align 8
  %2471 = icmp eq i64 %2470, 0
  br i1 %2471, label %2472, label %2489

; <label>:2472                                    ; preds = %2469
  %2473 = load %struct.fields2_struct** @fields2, align 8
  %2474 = getelementptr inbounds %struct.fields2_struct* %2473, i32 0, i32 1
  %2475 = getelementptr inbounds [258 x [258 x double]]* %2474, i32 0, i64 0
  %2476 = getelementptr inbounds [258 x double]* %2475, i32 0, i64 0
  %2477 = load double* %2476, align 8
  %2478 = load %struct.fields_struct** @fields, align 8
  %2479 = getelementptr inbounds %struct.fields_struct* %2478, i32 0, i32 1
  %2480 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2479, i32 0, i64 1
  %2481 = getelementptr inbounds [258 x [258 x double]]* %2480, i32 0, i64 0
  %2482 = getelementptr inbounds [258 x double]* %2481, i32 0, i64 0
  %2483 = load double* %2482, align 8
  %2484 = fadd double %2477, %2483
  %2485 = load %struct.fields2_struct** @fields2, align 8
  %2486 = getelementptr inbounds %struct.fields2_struct* %2485, i32 0, i32 1
  %2487 = getelementptr inbounds [258 x [258 x double]]* %2486, i32 0, i64 0
  %2488 = getelementptr inbounds [258 x double]* %2487, i32 0, i64 0
  store double %2484, double* %2488, align 8
  br label %2489

; <label>:2489                                    ; preds = %2472, %2469
  %2490 = load i64* %procid, align 8
  %2491 = load i64* @nprocs, align 8
  %2492 = load i64* @xprocs, align 8
  %2493 = sub nsw i64 %2491, %2492
  %2494 = icmp eq i64 %2490, %2493
  br i1 %2494, label %2495, label %2518

; <label>:2495                                    ; preds = %2489
  %2496 = load i64* @im, align 8
  %2497 = sub nsw i64 %2496, 1
  %2498 = load %struct.fields2_struct** @fields2, align 8
  %2499 = getelementptr inbounds %struct.fields2_struct* %2498, i32 0, i32 1
  %2500 = getelementptr inbounds [258 x [258 x double]]* %2499, i32 0, i64 %2497
  %2501 = getelementptr inbounds [258 x double]* %2500, i32 0, i64 0
  %2502 = load double* %2501, align 8
  %2503 = load i64* @im, align 8
  %2504 = sub nsw i64 %2503, 1
  %2505 = load %struct.fields_struct** @fields, align 8
  %2506 = getelementptr inbounds %struct.fields_struct* %2505, i32 0, i32 1
  %2507 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2506, i32 0, i64 1
  %2508 = getelementptr inbounds [258 x [258 x double]]* %2507, i32 0, i64 %2504
  %2509 = getelementptr inbounds [258 x double]* %2508, i32 0, i64 0
  %2510 = load double* %2509, align 8
  %2511 = fadd double %2502, %2510
  %2512 = load i64* @im, align 8
  %2513 = sub nsw i64 %2512, 1
  %2514 = load %struct.fields2_struct** @fields2, align 8
  %2515 = getelementptr inbounds %struct.fields2_struct* %2514, i32 0, i32 1
  %2516 = getelementptr inbounds [258 x [258 x double]]* %2515, i32 0, i64 %2513
  %2517 = getelementptr inbounds [258 x double]* %2516, i32 0, i64 0
  store double %2511, double* %2517, align 8
  br label %2518

; <label>:2518                                    ; preds = %2495, %2489
  %2519 = load i64* %procid, align 8
  %2520 = load i64* @xprocs, align 8
  %2521 = sub nsw i64 %2520, 1
  %2522 = icmp eq i64 %2519, %2521
  br i1 %2522, label %2523, label %2546

; <label>:2523                                    ; preds = %2518
  %2524 = load i64* @jm, align 8
  %2525 = sub nsw i64 %2524, 1
  %2526 = load %struct.fields2_struct** @fields2, align 8
  %2527 = getelementptr inbounds %struct.fields2_struct* %2526, i32 0, i32 1
  %2528 = getelementptr inbounds [258 x [258 x double]]* %2527, i32 0, i64 0
  %2529 = getelementptr inbounds [258 x double]* %2528, i32 0, i64 %2525
  %2530 = load double* %2529, align 8
  %2531 = load i64* @jm, align 8
  %2532 = sub nsw i64 %2531, 1
  %2533 = load %struct.fields_struct** @fields, align 8
  %2534 = getelementptr inbounds %struct.fields_struct* %2533, i32 0, i32 1
  %2535 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2534, i32 0, i64 1
  %2536 = getelementptr inbounds [258 x [258 x double]]* %2535, i32 0, i64 0
  %2537 = getelementptr inbounds [258 x double]* %2536, i32 0, i64 %2532
  %2538 = load double* %2537, align 8
  %2539 = fadd double %2530, %2538
  %2540 = load i64* @jm, align 8
  %2541 = sub nsw i64 %2540, 1
  %2542 = load %struct.fields2_struct** @fields2, align 8
  %2543 = getelementptr inbounds %struct.fields2_struct* %2542, i32 0, i32 1
  %2544 = getelementptr inbounds [258 x [258 x double]]* %2543, i32 0, i64 0
  %2545 = getelementptr inbounds [258 x double]* %2544, i32 0, i64 %2541
  store double %2539, double* %2545, align 8
  br label %2546

; <label>:2546                                    ; preds = %2523, %2518
  %2547 = load i64* %procid, align 8
  %2548 = load i64* @nprocs, align 8
  %2549 = sub nsw i64 %2548, 1
  %2550 = icmp eq i64 %2547, %2549
  br i1 %2550, label %2551, label %2580

; <label>:2551                                    ; preds = %2546
  %2552 = load i64* @jm, align 8
  %2553 = sub nsw i64 %2552, 1
  %2554 = load i64* @im, align 8
  %2555 = sub nsw i64 %2554, 1
  %2556 = load %struct.fields2_struct** @fields2, align 8
  %2557 = getelementptr inbounds %struct.fields2_struct* %2556, i32 0, i32 1
  %2558 = getelementptr inbounds [258 x [258 x double]]* %2557, i32 0, i64 %2555
  %2559 = getelementptr inbounds [258 x double]* %2558, i32 0, i64 %2553
  %2560 = load double* %2559, align 8
  %2561 = load i64* @jm, align 8
  %2562 = sub nsw i64 %2561, 1
  %2563 = load i64* @im, align 8
  %2564 = sub nsw i64 %2563, 1
  %2565 = load %struct.fields_struct** @fields, align 8
  %2566 = getelementptr inbounds %struct.fields_struct* %2565, i32 0, i32 1
  %2567 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2566, i32 0, i64 1
  %2568 = getelementptr inbounds [258 x [258 x double]]* %2567, i32 0, i64 %2564
  %2569 = getelementptr inbounds [258 x double]* %2568, i32 0, i64 %2562
  %2570 = load double* %2569, align 8
  %2571 = fadd double %2560, %2570
  %2572 = load i64* @jm, align 8
  %2573 = sub nsw i64 %2572, 1
  %2574 = load i64* @im, align 8
  %2575 = sub nsw i64 %2574, 1
  %2576 = load %struct.fields2_struct** @fields2, align 8
  %2577 = getelementptr inbounds %struct.fields2_struct* %2576, i32 0, i32 1
  %2578 = getelementptr inbounds [258 x [258 x double]]* %2577, i32 0, i64 %2575
  %2579 = getelementptr inbounds [258 x double]* %2578, i32 0, i64 %2573
  store double %2571, double* %2579, align 8
  br label %2580

; <label>:2580                                    ; preds = %2551, %2546
  %2581 = load i64* %firstrow, align 8
  %2582 = icmp eq i64 %2581, 1
  br i1 %2582, label %2583, label %2613

; <label>:2583                                    ; preds = %2580
  %2584 = load i64* %firstcol, align 8
  store i64 %2584, i64* %j, align 8
  br label %2585

; <label>:2585                                    ; preds = %2609, %2583
  %2586 = load i64* %j, align 8
  %2587 = load i64* %lastcol, align 8
  %2588 = icmp sle i64 %2586, %2587
  br i1 %2588, label %2589, label %2612

; <label>:2589                                    ; preds = %2585
  %2590 = load i64* %j, align 8
  %2591 = load %struct.fields2_struct** @fields2, align 8
  %2592 = getelementptr inbounds %struct.fields2_struct* %2591, i32 0, i32 1
  %2593 = getelementptr inbounds [258 x [258 x double]]* %2592, i32 0, i64 0
  %2594 = getelementptr inbounds [258 x double]* %2593, i32 0, i64 %2590
  %2595 = load double* %2594, align 8
  %2596 = load i64* %j, align 8
  %2597 = load %struct.fields_struct** @fields, align 8
  %2598 = getelementptr inbounds %struct.fields_struct* %2597, i32 0, i32 1
  %2599 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2598, i32 0, i64 1
  %2600 = getelementptr inbounds [258 x [258 x double]]* %2599, i32 0, i64 0
  %2601 = getelementptr inbounds [258 x double]* %2600, i32 0, i64 %2596
  %2602 = load double* %2601, align 8
  %2603 = fadd double %2595, %2602
  %2604 = load i64* %j, align 8
  %2605 = load %struct.fields2_struct** @fields2, align 8
  %2606 = getelementptr inbounds %struct.fields2_struct* %2605, i32 0, i32 1
  %2607 = getelementptr inbounds [258 x [258 x double]]* %2606, i32 0, i64 0
  %2608 = getelementptr inbounds [258 x double]* %2607, i32 0, i64 %2604
  store double %2603, double* %2608, align 8
  br label %2609

; <label>:2609                                    ; preds = %2589
  %2610 = load i64* %j, align 8
  %2611 = add nsw i64 %2610, 1
  store i64 %2611, i64* %j, align 8
  br label %2585

; <label>:2612                                    ; preds = %2585
  br label %2613

; <label>:2613                                    ; preds = %2612, %2580
  %2614 = load i64* %firstrow, align 8
  %2615 = load i64* %numrows, align 8
  %2616 = add nsw i64 %2614, %2615
  %2617 = load i64* @im, align 8
  %2618 = sub nsw i64 %2617, 1
  %2619 = icmp eq i64 %2616, %2618
  br i1 %2619, label %2620, label %2656

; <label>:2620                                    ; preds = %2613
  %2621 = load i64* %firstcol, align 8
  store i64 %2621, i64* %j, align 8
  br label %2622

; <label>:2622                                    ; preds = %2652, %2620
  %2623 = load i64* %j, align 8
  %2624 = load i64* %lastcol, align 8
  %2625 = icmp sle i64 %2623, %2624
  br i1 %2625, label %2626, label %2655

; <label>:2626                                    ; preds = %2622
  %2627 = load i64* %j, align 8
  %2628 = load i64* @im, align 8
  %2629 = sub nsw i64 %2628, 1
  %2630 = load %struct.fields2_struct** @fields2, align 8
  %2631 = getelementptr inbounds %struct.fields2_struct* %2630, i32 0, i32 1
  %2632 = getelementptr inbounds [258 x [258 x double]]* %2631, i32 0, i64 %2629
  %2633 = getelementptr inbounds [258 x double]* %2632, i32 0, i64 %2627
  %2634 = load double* %2633, align 8
  %2635 = load i64* %j, align 8
  %2636 = load i64* @im, align 8
  %2637 = sub nsw i64 %2636, 1
  %2638 = load %struct.fields_struct** @fields, align 8
  %2639 = getelementptr inbounds %struct.fields_struct* %2638, i32 0, i32 1
  %2640 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2639, i32 0, i64 1
  %2641 = getelementptr inbounds [258 x [258 x double]]* %2640, i32 0, i64 %2637
  %2642 = getelementptr inbounds [258 x double]* %2641, i32 0, i64 %2635
  %2643 = load double* %2642, align 8
  %2644 = fadd double %2634, %2643
  %2645 = load i64* %j, align 8
  %2646 = load i64* @im, align 8
  %2647 = sub nsw i64 %2646, 1
  %2648 = load %struct.fields2_struct** @fields2, align 8
  %2649 = getelementptr inbounds %struct.fields2_struct* %2648, i32 0, i32 1
  %2650 = getelementptr inbounds [258 x [258 x double]]* %2649, i32 0, i64 %2647
  %2651 = getelementptr inbounds [258 x double]* %2650, i32 0, i64 %2645
  store double %2644, double* %2651, align 8
  br label %2652

; <label>:2652                                    ; preds = %2626
  %2653 = load i64* %j, align 8
  %2654 = add nsw i64 %2653, 1
  store i64 %2654, i64* %j, align 8
  br label %2622

; <label>:2655                                    ; preds = %2622
  br label %2656

; <label>:2656                                    ; preds = %2655, %2613
  %2657 = load i64* %firstcol, align 8
  %2658 = icmp eq i64 %2657, 1
  br i1 %2658, label %2659, label %2689

; <label>:2659                                    ; preds = %2656
  %2660 = load i64* %firstrow, align 8
  store i64 %2660, i64* %j, align 8
  br label %2661

; <label>:2661                                    ; preds = %2685, %2659
  %2662 = load i64* %j, align 8
  %2663 = load i64* %lastrow, align 8
  %2664 = icmp sle i64 %2662, %2663
  br i1 %2664, label %2665, label %2688

; <label>:2665                                    ; preds = %2661
  %2666 = load i64* %j, align 8
  %2667 = load %struct.fields2_struct** @fields2, align 8
  %2668 = getelementptr inbounds %struct.fields2_struct* %2667, i32 0, i32 1
  %2669 = getelementptr inbounds [258 x [258 x double]]* %2668, i32 0, i64 %2666
  %2670 = getelementptr inbounds [258 x double]* %2669, i32 0, i64 0
  %2671 = load double* %2670, align 8
  %2672 = load i64* %j, align 8
  %2673 = load %struct.fields_struct** @fields, align 8
  %2674 = getelementptr inbounds %struct.fields_struct* %2673, i32 0, i32 1
  %2675 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2674, i32 0, i64 1
  %2676 = getelementptr inbounds [258 x [258 x double]]* %2675, i32 0, i64 %2672
  %2677 = getelementptr inbounds [258 x double]* %2676, i32 0, i64 0
  %2678 = load double* %2677, align 8
  %2679 = fadd double %2671, %2678
  %2680 = load i64* %j, align 8
  %2681 = load %struct.fields2_struct** @fields2, align 8
  %2682 = getelementptr inbounds %struct.fields2_struct* %2681, i32 0, i32 1
  %2683 = getelementptr inbounds [258 x [258 x double]]* %2682, i32 0, i64 %2680
  %2684 = getelementptr inbounds [258 x double]* %2683, i32 0, i64 0
  store double %2679, double* %2684, align 8
  br label %2685

; <label>:2685                                    ; preds = %2665
  %2686 = load i64* %j, align 8
  %2687 = add nsw i64 %2686, 1
  store i64 %2687, i64* %j, align 8
  br label %2661

; <label>:2688                                    ; preds = %2661
  br label %2689

; <label>:2689                                    ; preds = %2688, %2656
  %2690 = load i64* %firstcol, align 8
  %2691 = load i64* %numcols, align 8
  %2692 = add nsw i64 %2690, %2691
  %2693 = load i64* @jm, align 8
  %2694 = sub nsw i64 %2693, 1
  %2695 = icmp eq i64 %2692, %2694
  br i1 %2695, label %2696, label %2732

; <label>:2696                                    ; preds = %2689
  %2697 = load i64* %firstrow, align 8
  store i64 %2697, i64* %j, align 8
  br label %2698

; <label>:2698                                    ; preds = %2728, %2696
  %2699 = load i64* %j, align 8
  %2700 = load i64* %lastrow, align 8
  %2701 = icmp sle i64 %2699, %2700
  br i1 %2701, label %2702, label %2731

; <label>:2702                                    ; preds = %2698
  %2703 = load i64* @jm, align 8
  %2704 = sub nsw i64 %2703, 1
  %2705 = load i64* %j, align 8
  %2706 = load %struct.fields2_struct** @fields2, align 8
  %2707 = getelementptr inbounds %struct.fields2_struct* %2706, i32 0, i32 1
  %2708 = getelementptr inbounds [258 x [258 x double]]* %2707, i32 0, i64 %2705
  %2709 = getelementptr inbounds [258 x double]* %2708, i32 0, i64 %2704
  %2710 = load double* %2709, align 8
  %2711 = load i64* @jm, align 8
  %2712 = sub nsw i64 %2711, 1
  %2713 = load i64* %j, align 8
  %2714 = load %struct.fields_struct** @fields, align 8
  %2715 = getelementptr inbounds %struct.fields_struct* %2714, i32 0, i32 1
  %2716 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2715, i32 0, i64 1
  %2717 = getelementptr inbounds [258 x [258 x double]]* %2716, i32 0, i64 %2713
  %2718 = getelementptr inbounds [258 x double]* %2717, i32 0, i64 %2712
  %2719 = load double* %2718, align 8
  %2720 = fadd double %2710, %2719
  %2721 = load i64* @jm, align 8
  %2722 = sub nsw i64 %2721, 1
  %2723 = load i64* %j, align 8
  %2724 = load %struct.fields2_struct** @fields2, align 8
  %2725 = getelementptr inbounds %struct.fields2_struct* %2724, i32 0, i32 1
  %2726 = getelementptr inbounds [258 x [258 x double]]* %2725, i32 0, i64 %2723
  %2727 = getelementptr inbounds [258 x double]* %2726, i32 0, i64 %2722
  store double %2720, double* %2727, align 8
  br label %2728

; <label>:2728                                    ; preds = %2702
  %2729 = load i64* %j, align 8
  %2730 = add nsw i64 %2729, 1
  store i64 %2730, i64* %j, align 8
  br label %2698

; <label>:2731                                    ; preds = %2698
  br label %2732

; <label>:2732                                    ; preds = %2731, %2689
  %2733 = load i64* %firstrow, align 8
  store i64 %2733, i64* %i, align 8
  br label %2734

; <label>:2734                                    ; preds = %2771, %2732
  %2735 = load i64* %i, align 8
  %2736 = load i64* %lastrow, align 8
  %2737 = icmp sle i64 %2735, %2736
  br i1 %2737, label %2738, label %2774

; <label>:2738                                    ; preds = %2734
  %2739 = load i64* %firstcol, align 8
  store i64 %2739, i64* %iindex, align 8
  br label %2740

; <label>:2740                                    ; preds = %2767, %2738
  %2741 = load i64* %iindex, align 8
  %2742 = load i64* %lastcol, align 8
  %2743 = icmp sle i64 %2741, %2742
  br i1 %2743, label %2744, label %2770

; <label>:2744                                    ; preds = %2740
  %2745 = load i64* %iindex, align 8
  %2746 = load i64* %i, align 8
  %2747 = load %struct.fields2_struct** @fields2, align 8
  %2748 = getelementptr inbounds %struct.fields2_struct* %2747, i32 0, i32 1
  %2749 = getelementptr inbounds [258 x [258 x double]]* %2748, i32 0, i64 %2746
  %2750 = getelementptr inbounds [258 x double]* %2749, i32 0, i64 %2745
  %2751 = load double* %2750, align 8
  %2752 = load i64* %iindex, align 8
  %2753 = load i64* %i, align 8
  %2754 = load %struct.fields_struct** @fields, align 8
  %2755 = getelementptr inbounds %struct.fields_struct* %2754, i32 0, i32 1
  %2756 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2755, i32 0, i64 1
  %2757 = getelementptr inbounds [258 x [258 x double]]* %2756, i32 0, i64 %2753
  %2758 = getelementptr inbounds [258 x double]* %2757, i32 0, i64 %2752
  %2759 = load double* %2758, align 8
  %2760 = fadd double %2751, %2759
  %2761 = load i64* %iindex, align 8
  %2762 = load i64* %i, align 8
  %2763 = load %struct.fields2_struct** @fields2, align 8
  %2764 = getelementptr inbounds %struct.fields2_struct* %2763, i32 0, i32 1
  %2765 = getelementptr inbounds [258 x [258 x double]]* %2764, i32 0, i64 %2762
  %2766 = getelementptr inbounds [258 x double]* %2765, i32 0, i64 %2761
  store double %2760, double* %2766, align 8
  br label %2767

; <label>:2767                                    ; preds = %2744
  %2768 = load i64* %iindex, align 8
  %2769 = add nsw i64 %2768, 1
  store i64 %2769, i64* %iindex, align 8
  br label %2740

; <label>:2770                                    ; preds = %2740
  br label %2771

; <label>:2771                                    ; preds = %2770
  %2772 = load i64* %i, align 8
  %2773 = add nsw i64 %2772, 1
  store i64 %2773, i64* %i, align 8
  br label %2734

; <label>:2774                                    ; preds = %2734
  %2775 = load i64* %iday, align 8
  %2776 = load double* @outday3, align 8
  %2777 = fptosi double %2776 to i64
  %2778 = icmp sge i64 %2775, %2777
  br i1 %2778, label %2779, label %2780

; <label>:2779                                    ; preds = %2774
  store i64 1, i64* %endflag, align 8
  br label %2780

; <label>:2780                                    ; preds = %2779, %2774
  br label %2080

; <label>:2781                                    ; preds = %2080
  %2782 = load i64* %procid, align 8
  %2783 = icmp eq i64 %2782, 0
  br i1 %2783, label %2787, label %2784

; <label>:2784                                    ; preds = %2781
  %2785 = load i64* @do_stats, align 8
  %2786 = icmp ne i64 %2785, 0
  br i1 %2786, label %2787, label %2807

; <label>:2787                                    ; preds = %2784, %2781
  %2788 = call i32 @gettimeofday(%struct.timeval* %FullTime14, %struct.timezone* null) #6
  %2789 = getelementptr inbounds %struct.timeval* %FullTime14, i32 0, i32 1
  %2790 = load i64* %2789, align 8
  %2791 = getelementptr inbounds %struct.timeval* %FullTime14, i32 0, i32 0
  %2792 = load i64* %2791, align 8
  %2793 = mul nsw i64 %2792, 1000000
  %2794 = add nsw i64 %2790, %2793
  store i64 %2794, i64* %t1, align 8
  %2795 = load i64* %t1, align 8
  %2796 = uitofp i64 %2795 to double
  %2797 = load i64* %procid, align 8
  %2798 = load %struct.Global_Private** @gp, align 8
  %2799 = getelementptr inbounds %struct.Global_Private* %2798, i64 %2797
  %2800 = getelementptr inbounds %struct.Global_Private* %2799, i32 0, i32 2
  %2801 = load double* %2800, align 8
  %2802 = fsub double %2796, %2801
  %2803 = load i64* %procid, align 8
  %2804 = load %struct.Global_Private** @gp, align 8
  %2805 = getelementptr inbounds %struct.Global_Private* %2804, i64 %2803
  %2806 = getelementptr inbounds %struct.Global_Private* %2805, i32 0, i32 2
  store double %2802, double* %2806, align 8
  br label %2807

; <label>:2807                                    ; preds = %2787, %2784
  ret void
}

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind uwtable
define void @slave2(i64 %procid, i64 %firstrow, i64 %lastrow, i64 %numrows, i64 %firstcol, i64 %lastcol, i64 %numcols) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %iindex = alloca i64, align 8
  %hh1 = alloca double, align 8
  %hh3 = alloca double, align 8
  %hinv = alloca double, align 8
  %h1inv = alloca double, align 8
  %istart = alloca i64, align 8
  %iend = alloca i64, align 8
  %jstart = alloca i64, align 8
  %jend = alloca i64, align 8
  %ist = alloca i64, align 8
  %ien = alloca i64, align 8
  %jst = alloca i64, align 8
  %jen = alloca i64, align 8
  %fac = alloca double, align 8
  %ressqr = alloca double, align 8
  %timst = alloca double, align 8
  %f4 = alloca double, align 8
  %psiindex = alloca i64, align 8
  %psiaipriv = alloca double, align 8
  %multi_start = alloca i64, align 8
  %multi_end = alloca i64, align 8
  %Error = alloca i64, align 8
  %Cycle = alloca i64, align 8
  %Cancel = alloca i64, align 8
  %Temp = alloca i64, align 8
  %Error1 = alloca i64, align 8
  %Cycle2 = alloca i64, align 8
  %Cancel3 = alloca i64, align 8
  %Temp4 = alloca i64, align 8
  %Error5 = alloca i64, align 8
  %Cycle6 = alloca i64, align 8
  %Cancel7 = alloca i64, align 8
  %Temp8 = alloca i64, align 8
  %Error9 = alloca i64, align 8
  %Cycle10 = alloca i64, align 8
  %Cancel11 = alloca i64, align 8
  %Temp12 = alloca i64, align 8
  %Error13 = alloca i64, align 8
  %Cycle14 = alloca i64, align 8
  %Cancel15 = alloca i64, align 8
  %Temp16 = alloca i64, align 8
  %FullTime = alloca %struct.timeval, align 8
  %FullTime17 = alloca %struct.timeval, align 8
  %Error18 = alloca i64, align 8
  %Cycle19 = alloca i64, align 8
  %Cancel20 = alloca i64, align 8
  %Temp21 = alloca i64, align 8
  %Error22 = alloca i64, align 8
  %Cycle23 = alloca i64, align 8
  %Cancel24 = alloca i64, align 8
  %Temp25 = alloca i64, align 8
  %Error26 = alloca i64, align 8
  %Cycle27 = alloca i64, align 8
  %Cancel28 = alloca i64, align 8
  %Temp29 = alloca i64, align 8
  %FullTime30 = alloca %struct.timeval, align 8
  %FullTime31 = alloca %struct.timeval, align 8
  %Error32 = alloca i64, align 8
  %Cycle33 = alloca i64, align 8
  %Cancel34 = alloca i64, align 8
  %Temp35 = alloca i64, align 8
  %Error36 = alloca i64, align 8
  %Cycle37 = alloca i64, align 8
  %Cancel38 = alloca i64, align 8
  %Temp39 = alloca i64, align 8
  %Error40 = alloca i64, align 8
  %Cycle41 = alloca i64, align 8
  %Cancel42 = alloca i64, align 8
  %Temp43 = alloca i64, align 8
  store i64 %procid, i64* %1, align 8
  store i64 %firstrow, i64* %2, align 8
  store i64 %lastrow, i64* %3, align 8
  store i64 %numrows, i64* %4, align 8
  store i64 %firstcol, i64* %5, align 8
  store i64 %lastcol, i64* %6, align 8
  store i64 %numcols, i64* %7, align 8
  %8 = load i64* @numlev, align 8
  %9 = sub nsw i64 %8, 1
  %10 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %9
  %11 = load double* %10, align 8
  %12 = load i64* @numlev, align 8
  %13 = sub nsw i64 %12, 1
  %14 = getelementptr inbounds [9 x double]* @lev_res, i32 0, i64 %13
  %15 = load double* %14, align 8
  %16 = fmul double %11, %15
  store double %16, double* %ressqr, align 8
  %17 = load i64* %1, align 8
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %19, label %24

; <label>:19                                      ; preds = %0
  %20 = load %struct.wrk1_struct** @wrk1, align 8
  %21 = getelementptr inbounds %struct.wrk1_struct* %20, i32 0, i32 1
  %22 = getelementptr inbounds [258 x [258 x double]]* %21, i32 0, i64 0
  %23 = getelementptr inbounds [258 x double]* %22, i32 0, i64 0
  store double 0.000000e+00, double* %23, align 8
  br label %24

; <label>:24                                      ; preds = %19, %0
  %25 = load i64* %1, align 8
  %26 = load i64* @nprocs, align 8
  %27 = load i64* @xprocs, align 8
  %28 = sub nsw i64 %26, %27
  %29 = icmp eq i64 %25, %28
  br i1 %29, label %30, label %37

; <label>:30                                      ; preds = %24
  %31 = load i64* @im, align 8
  %32 = sub nsw i64 %31, 1
  %33 = load %struct.wrk1_struct** @wrk1, align 8
  %34 = getelementptr inbounds %struct.wrk1_struct* %33, i32 0, i32 1
  %35 = getelementptr inbounds [258 x [258 x double]]* %34, i32 0, i64 %32
  %36 = getelementptr inbounds [258 x double]* %35, i32 0, i64 0
  store double 0.000000e+00, double* %36, align 8
  br label %37

; <label>:37                                      ; preds = %30, %24
  %38 = load i64* %1, align 8
  %39 = load i64* @xprocs, align 8
  %40 = sub nsw i64 %39, 1
  %41 = icmp eq i64 %38, %40
  br i1 %41, label %42, label %49

; <label>:42                                      ; preds = %37
  %43 = load i64* @jm, align 8
  %44 = sub nsw i64 %43, 1
  %45 = load %struct.wrk1_struct** @wrk1, align 8
  %46 = getelementptr inbounds %struct.wrk1_struct* %45, i32 0, i32 1
  %47 = getelementptr inbounds [258 x [258 x double]]* %46, i32 0, i64 0
  %48 = getelementptr inbounds [258 x double]* %47, i32 0, i64 %44
  store double 0.000000e+00, double* %48, align 8
  br label %49

; <label>:49                                      ; preds = %42, %37
  %50 = load i64* %1, align 8
  %51 = load i64* @nprocs, align 8
  %52 = sub nsw i64 %51, 1
  %53 = icmp eq i64 %50, %52
  br i1 %53, label %54, label %63

; <label>:54                                      ; preds = %49
  %55 = load i64* @jm, align 8
  %56 = sub nsw i64 %55, 1
  %57 = load i64* @im, align 8
  %58 = sub nsw i64 %57, 1
  %59 = load %struct.wrk1_struct** @wrk1, align 8
  %60 = getelementptr inbounds %struct.wrk1_struct* %59, i32 0, i32 1
  %61 = getelementptr inbounds [258 x [258 x double]]* %60, i32 0, i64 %58
  %62 = getelementptr inbounds [258 x double]* %61, i32 0, i64 %56
  store double 0.000000e+00, double* %62, align 8
  br label %63

; <label>:63                                      ; preds = %54, %49
  %64 = load i64* %2, align 8
  %65 = icmp eq i64 %64, 1
  br i1 %65, label %66, label %82

; <label>:66                                      ; preds = %63
  %67 = load i64* %5, align 8
  store i64 %67, i64* %j, align 8
  br label %68

; <label>:68                                      ; preds = %78, %66
  %69 = load i64* %j, align 8
  %70 = load i64* %6, align 8
  %71 = icmp sle i64 %69, %70
  br i1 %71, label %72, label %81

; <label>:72                                      ; preds = %68
  %73 = load i64* %j, align 8
  %74 = load %struct.wrk1_struct** @wrk1, align 8
  %75 = getelementptr inbounds %struct.wrk1_struct* %74, i32 0, i32 1
  %76 = getelementptr inbounds [258 x [258 x double]]* %75, i32 0, i64 0
  %77 = getelementptr inbounds [258 x double]* %76, i32 0, i64 %73
  store double 0.000000e+00, double* %77, align 8
  br label %78

; <label>:78                                      ; preds = %72
  %79 = load i64* %j, align 8
  %80 = add nsw i64 %79, 1
  store i64 %80, i64* %j, align 8
  br label %68

; <label>:81                                      ; preds = %68
  br label %82

; <label>:82                                      ; preds = %81, %63
  %83 = load i64* %2, align 8
  %84 = load i64* %4, align 8
  %85 = add nsw i64 %83, %84
  %86 = load i64* @im, align 8
  %87 = sub nsw i64 %86, 1
  %88 = icmp eq i64 %85, %87
  br i1 %88, label %89, label %107

; <label>:89                                      ; preds = %82
  %90 = load i64* %5, align 8
  store i64 %90, i64* %j, align 8
  br label %91

; <label>:91                                      ; preds = %103, %89
  %92 = load i64* %j, align 8
  %93 = load i64* %6, align 8
  %94 = icmp sle i64 %92, %93
  br i1 %94, label %95, label %106

; <label>:95                                      ; preds = %91
  %96 = load i64* %j, align 8
  %97 = load i64* @im, align 8
  %98 = sub nsw i64 %97, 1
  %99 = load %struct.wrk1_struct** @wrk1, align 8
  %100 = getelementptr inbounds %struct.wrk1_struct* %99, i32 0, i32 1
  %101 = getelementptr inbounds [258 x [258 x double]]* %100, i32 0, i64 %98
  %102 = getelementptr inbounds [258 x double]* %101, i32 0, i64 %96
  store double 0.000000e+00, double* %102, align 8
  br label %103

; <label>:103                                     ; preds = %95
  %104 = load i64* %j, align 8
  %105 = add nsw i64 %104, 1
  store i64 %105, i64* %j, align 8
  br label %91

; <label>:106                                     ; preds = %91
  br label %107

; <label>:107                                     ; preds = %106, %82
  %108 = load i64* %5, align 8
  %109 = icmp eq i64 %108, 1
  br i1 %109, label %110, label %126

; <label>:110                                     ; preds = %107
  %111 = load i64* %2, align 8
  store i64 %111, i64* %j, align 8
  br label %112

; <label>:112                                     ; preds = %122, %110
  %113 = load i64* %j, align 8
  %114 = load i64* %3, align 8
  %115 = icmp sle i64 %113, %114
  br i1 %115, label %116, label %125

; <label>:116                                     ; preds = %112
  %117 = load i64* %j, align 8
  %118 = load %struct.wrk1_struct** @wrk1, align 8
  %119 = getelementptr inbounds %struct.wrk1_struct* %118, i32 0, i32 1
  %120 = getelementptr inbounds [258 x [258 x double]]* %119, i32 0, i64 %117
  %121 = getelementptr inbounds [258 x double]* %120, i32 0, i64 0
  store double 0.000000e+00, double* %121, align 8
  br label %122

; <label>:122                                     ; preds = %116
  %123 = load i64* %j, align 8
  %124 = add nsw i64 %123, 1
  store i64 %124, i64* %j, align 8
  br label %112

; <label>:125                                     ; preds = %112
  br label %126

; <label>:126                                     ; preds = %125, %107
  %127 = load i64* %5, align 8
  %128 = load i64* %7, align 8
  %129 = add nsw i64 %127, %128
  %130 = load i64* @jm, align 8
  %131 = sub nsw i64 %130, 1
  %132 = icmp eq i64 %129, %131
  br i1 %132, label %133, label %151

; <label>:133                                     ; preds = %126
  %134 = load i64* %2, align 8
  store i64 %134, i64* %j, align 8
  br label %135

; <label>:135                                     ; preds = %147, %133
  %136 = load i64* %j, align 8
  %137 = load i64* %3, align 8
  %138 = icmp sle i64 %136, %137
  br i1 %138, label %139, label %150

; <label>:139                                     ; preds = %135
  %140 = load i64* @jm, align 8
  %141 = sub nsw i64 %140, 1
  %142 = load i64* %j, align 8
  %143 = load %struct.wrk1_struct** @wrk1, align 8
  %144 = getelementptr inbounds %struct.wrk1_struct* %143, i32 0, i32 1
  %145 = getelementptr inbounds [258 x [258 x double]]* %144, i32 0, i64 %142
  %146 = getelementptr inbounds [258 x double]* %145, i32 0, i64 %141
  store double 0.000000e+00, double* %146, align 8
  br label %147

; <label>:147                                     ; preds = %139
  %148 = load i64* %j, align 8
  %149 = add nsw i64 %148, 1
  store i64 %149, i64* %j, align 8
  br label %135

; <label>:150                                     ; preds = %135
  br label %151

; <label>:151                                     ; preds = %150, %126
  %152 = load i64* %2, align 8
  store i64 %152, i64* %i, align 8
  br label %153

; <label>:153                                     ; preds = %174, %151
  %154 = load i64* %i, align 8
  %155 = load i64* %3, align 8
  %156 = icmp sle i64 %154, %155
  br i1 %156, label %157, label %177

; <label>:157                                     ; preds = %153
  %158 = load i64* %5, align 8
  store i64 %158, i64* %iindex, align 8
  br label %159

; <label>:159                                     ; preds = %170, %157
  %160 = load i64* %iindex, align 8
  %161 = load i64* %6, align 8
  %162 = icmp sle i64 %160, %161
  br i1 %162, label %163, label %173

; <label>:163                                     ; preds = %159
  %164 = load i64* %iindex, align 8
  %165 = load i64* %i, align 8
  %166 = load %struct.wrk1_struct** @wrk1, align 8
  %167 = getelementptr inbounds %struct.wrk1_struct* %166, i32 0, i32 1
  %168 = getelementptr inbounds [258 x [258 x double]]* %167, i32 0, i64 %165
  %169 = getelementptr inbounds [258 x double]* %168, i32 0, i64 %164
  store double 0.000000e+00, double* %169, align 8
  br label %170

; <label>:170                                     ; preds = %163
  %171 = load i64* %iindex, align 8
  %172 = add nsw i64 %171, 1
  store i64 %172, i64* %iindex, align 8
  br label %159

; <label>:173                                     ; preds = %159
  br label %174

; <label>:174                                     ; preds = %173
  %175 = load i64* %i, align 8
  %176 = add nsw i64 %175, 1
  store i64 %176, i64* %i, align 8
  br label %153

; <label>:177                                     ; preds = %153
  %178 = load i64* %1, align 8
  %179 = icmp eq i64 %178, 0
  br i1 %179, label %180, label %185

; <label>:180                                     ; preds = %177
  %181 = load %struct.wrk1_struct** @wrk1, align 8
  %182 = getelementptr inbounds %struct.wrk1_struct* %181, i32 0, i32 2
  %183 = getelementptr inbounds [258 x [258 x double]]* %182, i32 0, i64 0
  %184 = getelementptr inbounds [258 x double]* %183, i32 0, i64 0
  store double 0.000000e+00, double* %184, align 8
  br label %185

; <label>:185                                     ; preds = %180, %177
  %186 = load i64* %1, align 8
  %187 = load i64* @nprocs, align 8
  %188 = load i64* @xprocs, align 8
  %189 = sub nsw i64 %187, %188
  %190 = icmp eq i64 %186, %189
  br i1 %190, label %191, label %198

; <label>:191                                     ; preds = %185
  %192 = load i64* @im, align 8
  %193 = sub nsw i64 %192, 1
  %194 = load %struct.wrk1_struct** @wrk1, align 8
  %195 = getelementptr inbounds %struct.wrk1_struct* %194, i32 0, i32 2
  %196 = getelementptr inbounds [258 x [258 x double]]* %195, i32 0, i64 %193
  %197 = getelementptr inbounds [258 x double]* %196, i32 0, i64 0
  store double 0.000000e+00, double* %197, align 8
  br label %198

; <label>:198                                     ; preds = %191, %185
  %199 = load i64* %1, align 8
  %200 = load i64* @xprocs, align 8
  %201 = sub nsw i64 %200, 1
  %202 = icmp eq i64 %199, %201
  br i1 %202, label %203, label %210

; <label>:203                                     ; preds = %198
  %204 = load i64* @jm, align 8
  %205 = sub nsw i64 %204, 1
  %206 = load %struct.wrk1_struct** @wrk1, align 8
  %207 = getelementptr inbounds %struct.wrk1_struct* %206, i32 0, i32 2
  %208 = getelementptr inbounds [258 x [258 x double]]* %207, i32 0, i64 0
  %209 = getelementptr inbounds [258 x double]* %208, i32 0, i64 %205
  store double 0.000000e+00, double* %209, align 8
  br label %210

; <label>:210                                     ; preds = %203, %198
  %211 = load i64* %1, align 8
  %212 = load i64* @nprocs, align 8
  %213 = sub nsw i64 %212, 1
  %214 = icmp eq i64 %211, %213
  br i1 %214, label %215, label %224

; <label>:215                                     ; preds = %210
  %216 = load i64* @jm, align 8
  %217 = sub nsw i64 %216, 1
  %218 = load i64* @im, align 8
  %219 = sub nsw i64 %218, 1
  %220 = load %struct.wrk1_struct** @wrk1, align 8
  %221 = getelementptr inbounds %struct.wrk1_struct* %220, i32 0, i32 2
  %222 = getelementptr inbounds [258 x [258 x double]]* %221, i32 0, i64 %219
  %223 = getelementptr inbounds [258 x double]* %222, i32 0, i64 %217
  store double 0.000000e+00, double* %223, align 8
  br label %224

; <label>:224                                     ; preds = %215, %210
  %225 = load i64* %2, align 8
  %226 = icmp eq i64 %225, 1
  br i1 %226, label %227, label %243

; <label>:227                                     ; preds = %224
  %228 = load i64* %5, align 8
  store i64 %228, i64* %j, align 8
  br label %229

; <label>:229                                     ; preds = %239, %227
  %230 = load i64* %j, align 8
  %231 = load i64* %6, align 8
  %232 = icmp sle i64 %230, %231
  br i1 %232, label %233, label %242

; <label>:233                                     ; preds = %229
  %234 = load i64* %j, align 8
  %235 = load %struct.wrk1_struct** @wrk1, align 8
  %236 = getelementptr inbounds %struct.wrk1_struct* %235, i32 0, i32 2
  %237 = getelementptr inbounds [258 x [258 x double]]* %236, i32 0, i64 0
  %238 = getelementptr inbounds [258 x double]* %237, i32 0, i64 %234
  store double 0.000000e+00, double* %238, align 8
  br label %239

; <label>:239                                     ; preds = %233
  %240 = load i64* %j, align 8
  %241 = add nsw i64 %240, 1
  store i64 %241, i64* %j, align 8
  br label %229

; <label>:242                                     ; preds = %229
  br label %243

; <label>:243                                     ; preds = %242, %224
  %244 = load i64* %2, align 8
  %245 = load i64* %4, align 8
  %246 = add nsw i64 %244, %245
  %247 = load i64* @im, align 8
  %248 = sub nsw i64 %247, 1
  %249 = icmp eq i64 %246, %248
  br i1 %249, label %250, label %268

; <label>:250                                     ; preds = %243
  %251 = load i64* %5, align 8
  store i64 %251, i64* %j, align 8
  br label %252

; <label>:252                                     ; preds = %264, %250
  %253 = load i64* %j, align 8
  %254 = load i64* %6, align 8
  %255 = icmp sle i64 %253, %254
  br i1 %255, label %256, label %267

; <label>:256                                     ; preds = %252
  %257 = load i64* %j, align 8
  %258 = load i64* @im, align 8
  %259 = sub nsw i64 %258, 1
  %260 = load %struct.wrk1_struct** @wrk1, align 8
  %261 = getelementptr inbounds %struct.wrk1_struct* %260, i32 0, i32 2
  %262 = getelementptr inbounds [258 x [258 x double]]* %261, i32 0, i64 %259
  %263 = getelementptr inbounds [258 x double]* %262, i32 0, i64 %257
  store double 0.000000e+00, double* %263, align 8
  br label %264

; <label>:264                                     ; preds = %256
  %265 = load i64* %j, align 8
  %266 = add nsw i64 %265, 1
  store i64 %266, i64* %j, align 8
  br label %252

; <label>:267                                     ; preds = %252
  br label %268

; <label>:268                                     ; preds = %267, %243
  %269 = load i64* %5, align 8
  %270 = icmp eq i64 %269, 1
  br i1 %270, label %271, label %287

; <label>:271                                     ; preds = %268
  %272 = load i64* %2, align 8
  store i64 %272, i64* %j, align 8
  br label %273

; <label>:273                                     ; preds = %283, %271
  %274 = load i64* %j, align 8
  %275 = load i64* %3, align 8
  %276 = icmp sle i64 %274, %275
  br i1 %276, label %277, label %286

; <label>:277                                     ; preds = %273
  %278 = load i64* %j, align 8
  %279 = load %struct.wrk1_struct** @wrk1, align 8
  %280 = getelementptr inbounds %struct.wrk1_struct* %279, i32 0, i32 2
  %281 = getelementptr inbounds [258 x [258 x double]]* %280, i32 0, i64 %278
  %282 = getelementptr inbounds [258 x double]* %281, i32 0, i64 0
  store double 0.000000e+00, double* %282, align 8
  br label %283

; <label>:283                                     ; preds = %277
  %284 = load i64* %j, align 8
  %285 = add nsw i64 %284, 1
  store i64 %285, i64* %j, align 8
  br label %273

; <label>:286                                     ; preds = %273
  br label %287

; <label>:287                                     ; preds = %286, %268
  %288 = load i64* %5, align 8
  %289 = load i64* %7, align 8
  %290 = add nsw i64 %288, %289
  %291 = load i64* @jm, align 8
  %292 = sub nsw i64 %291, 1
  %293 = icmp eq i64 %290, %292
  br i1 %293, label %294, label %312

; <label>:294                                     ; preds = %287
  %295 = load i64* %2, align 8
  store i64 %295, i64* %j, align 8
  br label %296

; <label>:296                                     ; preds = %308, %294
  %297 = load i64* %j, align 8
  %298 = load i64* %3, align 8
  %299 = icmp sle i64 %297, %298
  br i1 %299, label %300, label %311

; <label>:300                                     ; preds = %296
  %301 = load i64* @jm, align 8
  %302 = sub nsw i64 %301, 1
  %303 = load i64* %j, align 8
  %304 = load %struct.wrk1_struct** @wrk1, align 8
  %305 = getelementptr inbounds %struct.wrk1_struct* %304, i32 0, i32 2
  %306 = getelementptr inbounds [258 x [258 x double]]* %305, i32 0, i64 %303
  %307 = getelementptr inbounds [258 x double]* %306, i32 0, i64 %302
  store double 0.000000e+00, double* %307, align 8
  br label %308

; <label>:308                                     ; preds = %300
  %309 = load i64* %j, align 8
  %310 = add nsw i64 %309, 1
  store i64 %310, i64* %j, align 8
  br label %296

; <label>:311                                     ; preds = %296
  br label %312

; <label>:312                                     ; preds = %311, %287
  %313 = load i64* %2, align 8
  store i64 %313, i64* %i, align 8
  br label %314

; <label>:314                                     ; preds = %335, %312
  %315 = load i64* %i, align 8
  %316 = load i64* %3, align 8
  %317 = icmp sle i64 %315, %316
  br i1 %317, label %318, label %338

; <label>:318                                     ; preds = %314
  %319 = load i64* %5, align 8
  store i64 %319, i64* %iindex, align 8
  br label %320

; <label>:320                                     ; preds = %331, %318
  %321 = load i64* %iindex, align 8
  %322 = load i64* %6, align 8
  %323 = icmp sle i64 %321, %322
  br i1 %323, label %324, label %334

; <label>:324                                     ; preds = %320
  %325 = load i64* %iindex, align 8
  %326 = load i64* %i, align 8
  %327 = load %struct.wrk1_struct** @wrk1, align 8
  %328 = getelementptr inbounds %struct.wrk1_struct* %327, i32 0, i32 2
  %329 = getelementptr inbounds [258 x [258 x double]]* %328, i32 0, i64 %326
  %330 = getelementptr inbounds [258 x double]* %329, i32 0, i64 %325
  store double 0.000000e+00, double* %330, align 8
  br label %331

; <label>:331                                     ; preds = %324
  %332 = load i64* %iindex, align 8
  %333 = add nsw i64 %332, 1
  store i64 %333, i64* %iindex, align 8
  br label %320

; <label>:334                                     ; preds = %320
  br label %335

; <label>:335                                     ; preds = %334
  %336 = load i64* %i, align 8
  %337 = add nsw i64 %336, 1
  store i64 %337, i64* %i, align 8
  br label %314

; <label>:338                                     ; preds = %314
  store i64 0, i64* %psiindex, align 8
  br label %339

; <label>:339                                     ; preds = %414, %338
  %340 = load i64* %psiindex, align 8
  %341 = icmp sle i64 %340, 1
  br i1 %341, label %342, label %417

; <label>:342                                     ; preds = %339
  %343 = load i64* %1, align 8
  %344 = icmp eq i64 %343, 0
  br i1 %344, label %345, label %352

; <label>:345                                     ; preds = %342
  %346 = load i64* %psiindex, align 8
  %347 = load %struct.wrk3_struct** @wrk3, align 8
  %348 = getelementptr inbounds %struct.wrk3_struct* %347, i32 0, i32 0
  %349 = getelementptr inbounds [2 x [258 x [258 x double]]]* %348, i32 0, i64 %346
  %350 = getelementptr inbounds [258 x [258 x double]]* %349, i32 0, i64 0
  %351 = getelementptr inbounds [258 x double]* %350, i32 0, i64 0
  store double 0.000000e+00, double* %351, align 8
  br label %352

; <label>:352                                     ; preds = %345, %342
  %353 = load i64* %1, align 8
  %354 = load i64* @nprocs, align 8
  %355 = load i64* @xprocs, align 8
  %356 = sub nsw i64 %354, %355
  %357 = icmp eq i64 %353, %356
  br i1 %357, label %358, label %367

; <label>:358                                     ; preds = %352
  %359 = load i64* @im, align 8
  %360 = sub nsw i64 %359, 1
  %361 = load i64* %psiindex, align 8
  %362 = load %struct.wrk3_struct** @wrk3, align 8
  %363 = getelementptr inbounds %struct.wrk3_struct* %362, i32 0, i32 0
  %364 = getelementptr inbounds [2 x [258 x [258 x double]]]* %363, i32 0, i64 %361
  %365 = getelementptr inbounds [258 x [258 x double]]* %364, i32 0, i64 %360
  %366 = getelementptr inbounds [258 x double]* %365, i32 0, i64 0
  store double 0.000000e+00, double* %366, align 8
  br label %367

; <label>:367                                     ; preds = %358, %352
  %368 = load i64* %1, align 8
  %369 = load i64* @xprocs, align 8
  %370 = sub nsw i64 %369, 1
  %371 = icmp eq i64 %368, %370
  br i1 %371, label %372, label %381

; <label>:372                                     ; preds = %367
  %373 = load i64* @jm, align 8
  %374 = sub nsw i64 %373, 1
  %375 = load i64* %psiindex, align 8
  %376 = load %struct.wrk3_struct** @wrk3, align 8
  %377 = getelementptr inbounds %struct.wrk3_struct* %376, i32 0, i32 0
  %378 = getelementptr inbounds [2 x [258 x [258 x double]]]* %377, i32 0, i64 %375
  %379 = getelementptr inbounds [258 x [258 x double]]* %378, i32 0, i64 0
  %380 = getelementptr inbounds [258 x double]* %379, i32 0, i64 %374
  store double 0.000000e+00, double* %380, align 8
  br label %381

; <label>:381                                     ; preds = %372, %367
  %382 = load i64* %1, align 8
  %383 = load i64* @nprocs, align 8
  %384 = sub nsw i64 %383, 1
  %385 = icmp eq i64 %382, %384
  br i1 %385, label %386, label %397

; <label>:386                                     ; preds = %381
  %387 = load i64* @jm, align 8
  %388 = sub nsw i64 %387, 1
  %389 = load i64* @im, align 8
  %390 = sub nsw i64 %389, 1
  %391 = load i64* %psiindex, align 8
  %392 = load %struct.wrk3_struct** @wrk3, align 8
  %393 = getelementptr inbounds %struct.wrk3_struct* %392, i32 0, i32 0
  %394 = getelementptr inbounds [2 x [258 x [258 x double]]]* %393, i32 0, i64 %391
  %395 = getelementptr inbounds [258 x [258 x double]]* %394, i32 0, i64 %390
  %396 = getelementptr inbounds [258 x double]* %395, i32 0, i64 %388
  store double 0.000000e+00, double* %396, align 8
  br label %397

; <label>:397                                     ; preds = %386, %381
  %398 = load i64* %psiindex, align 8
  %399 = load %struct.fields_struct** @fields, align 8
  %400 = getelementptr inbounds %struct.fields_struct* %399, i32 0, i32 0
  %401 = getelementptr inbounds [2 x [258 x [258 x double]]]* %400, i32 0, i64 %398
  %402 = getelementptr inbounds [258 x [258 x double]]* %401, i32 0, i32 0
  %403 = load i64* %psiindex, align 8
  %404 = load %struct.wrk3_struct** @wrk3, align 8
  %405 = getelementptr inbounds %struct.wrk3_struct* %404, i32 0, i32 0
  %406 = getelementptr inbounds [2 x [258 x [258 x double]]]* %405, i32 0, i64 %403
  %407 = getelementptr inbounds [258 x [258 x double]]* %406, i32 0, i32 0
  %408 = load i64* %2, align 8
  %409 = load i64* %3, align 8
  %410 = load i64* %5, align 8
  %411 = load i64* %6, align 8
  %412 = load i64* %4, align 8
  %413 = load i64* %7, align 8
  call void @laplacalc([258 x double]* %402, [258 x double]* %407, i64 %408, i64 %409, i64 %410, i64 %411, i64 %412, i64 %413)
  br label %414

; <label>:414                                     ; preds = %397
  %415 = load i64* %psiindex, align 8
  %416 = add nsw i64 %415, 1
  store i64 %416, i64* %psiindex, align 8
  br label %339

; <label>:417                                     ; preds = %339
  %418 = load i64* %1, align 8
  %419 = icmp eq i64 %418, 0
  br i1 %419, label %420, label %438

; <label>:420                                     ; preds = %417
  %421 = load %struct.fields_struct** @fields, align 8
  %422 = getelementptr inbounds %struct.fields_struct* %421, i32 0, i32 0
  %423 = getelementptr inbounds [2 x [258 x [258 x double]]]* %422, i32 0, i64 0
  %424 = getelementptr inbounds [258 x [258 x double]]* %423, i32 0, i64 0
  %425 = getelementptr inbounds [258 x double]* %424, i32 0, i64 0
  %426 = load double* %425, align 8
  %427 = load %struct.fields_struct** @fields, align 8
  %428 = getelementptr inbounds %struct.fields_struct* %427, i32 0, i32 0
  %429 = getelementptr inbounds [2 x [258 x [258 x double]]]* %428, i32 0, i64 1
  %430 = getelementptr inbounds [258 x [258 x double]]* %429, i32 0, i64 0
  %431 = getelementptr inbounds [258 x double]* %430, i32 0, i64 0
  %432 = load double* %431, align 8
  %433 = fsub double %426, %432
  %434 = load %struct.wrk3_struct** @wrk3, align 8
  %435 = getelementptr inbounds %struct.wrk3_struct* %434, i32 0, i32 1
  %436 = getelementptr inbounds [258 x [258 x double]]* %435, i32 0, i64 0
  %437 = getelementptr inbounds [258 x double]* %436, i32 0, i64 0
  store double %433, double* %437, align 8
  br label %438

; <label>:438                                     ; preds = %420, %417
  %439 = load i64* %1, align 8
  %440 = load i64* @nprocs, align 8
  %441 = load i64* @xprocs, align 8
  %442 = sub nsw i64 %440, %441
  %443 = icmp eq i64 %439, %442
  br i1 %443, label %444, label %468

; <label>:444                                     ; preds = %438
  %445 = load i64* @im, align 8
  %446 = sub nsw i64 %445, 1
  %447 = load %struct.fields_struct** @fields, align 8
  %448 = getelementptr inbounds %struct.fields_struct* %447, i32 0, i32 0
  %449 = getelementptr inbounds [2 x [258 x [258 x double]]]* %448, i32 0, i64 0
  %450 = getelementptr inbounds [258 x [258 x double]]* %449, i32 0, i64 %446
  %451 = getelementptr inbounds [258 x double]* %450, i32 0, i64 0
  %452 = load double* %451, align 8
  %453 = load i64* @im, align 8
  %454 = sub nsw i64 %453, 1
  %455 = load %struct.fields_struct** @fields, align 8
  %456 = getelementptr inbounds %struct.fields_struct* %455, i32 0, i32 0
  %457 = getelementptr inbounds [2 x [258 x [258 x double]]]* %456, i32 0, i64 1
  %458 = getelementptr inbounds [258 x [258 x double]]* %457, i32 0, i64 %454
  %459 = getelementptr inbounds [258 x double]* %458, i32 0, i64 0
  %460 = load double* %459, align 8
  %461 = fsub double %452, %460
  %462 = load i64* @im, align 8
  %463 = sub nsw i64 %462, 1
  %464 = load %struct.wrk3_struct** @wrk3, align 8
  %465 = getelementptr inbounds %struct.wrk3_struct* %464, i32 0, i32 1
  %466 = getelementptr inbounds [258 x [258 x double]]* %465, i32 0, i64 %463
  %467 = getelementptr inbounds [258 x double]* %466, i32 0, i64 0
  store double %461, double* %467, align 8
  br label %468

; <label>:468                                     ; preds = %444, %438
  %469 = load i64* %1, align 8
  %470 = load i64* @xprocs, align 8
  %471 = sub nsw i64 %470, 1
  %472 = icmp eq i64 %469, %471
  br i1 %472, label %473, label %497

; <label>:473                                     ; preds = %468
  %474 = load i64* @jm, align 8
  %475 = sub nsw i64 %474, 1
  %476 = load %struct.fields_struct** @fields, align 8
  %477 = getelementptr inbounds %struct.fields_struct* %476, i32 0, i32 0
  %478 = getelementptr inbounds [2 x [258 x [258 x double]]]* %477, i32 0, i64 0
  %479 = getelementptr inbounds [258 x [258 x double]]* %478, i32 0, i64 0
  %480 = getelementptr inbounds [258 x double]* %479, i32 0, i64 %475
  %481 = load double* %480, align 8
  %482 = load i64* @jm, align 8
  %483 = sub nsw i64 %482, 1
  %484 = load %struct.fields_struct** @fields, align 8
  %485 = getelementptr inbounds %struct.fields_struct* %484, i32 0, i32 0
  %486 = getelementptr inbounds [2 x [258 x [258 x double]]]* %485, i32 0, i64 1
  %487 = getelementptr inbounds [258 x [258 x double]]* %486, i32 0, i64 0
  %488 = getelementptr inbounds [258 x double]* %487, i32 0, i64 %483
  %489 = load double* %488, align 8
  %490 = fsub double %481, %489
  %491 = load i64* @jm, align 8
  %492 = sub nsw i64 %491, 1
  %493 = load %struct.wrk3_struct** @wrk3, align 8
  %494 = getelementptr inbounds %struct.wrk3_struct* %493, i32 0, i32 1
  %495 = getelementptr inbounds [258 x [258 x double]]* %494, i32 0, i64 0
  %496 = getelementptr inbounds [258 x double]* %495, i32 0, i64 %492
  store double %490, double* %496, align 8
  br label %497

; <label>:497                                     ; preds = %473, %468
  %498 = load i64* %1, align 8
  %499 = load i64* @nprocs, align 8
  %500 = sub nsw i64 %499, 1
  %501 = icmp eq i64 %498, %500
  br i1 %501, label %502, label %532

; <label>:502                                     ; preds = %497
  %503 = load i64* @jm, align 8
  %504 = sub nsw i64 %503, 1
  %505 = load i64* @im, align 8
  %506 = sub nsw i64 %505, 1
  %507 = load %struct.fields_struct** @fields, align 8
  %508 = getelementptr inbounds %struct.fields_struct* %507, i32 0, i32 0
  %509 = getelementptr inbounds [2 x [258 x [258 x double]]]* %508, i32 0, i64 0
  %510 = getelementptr inbounds [258 x [258 x double]]* %509, i32 0, i64 %506
  %511 = getelementptr inbounds [258 x double]* %510, i32 0, i64 %504
  %512 = load double* %511, align 8
  %513 = load i64* @jm, align 8
  %514 = sub nsw i64 %513, 1
  %515 = load i64* @im, align 8
  %516 = sub nsw i64 %515, 1
  %517 = load %struct.fields_struct** @fields, align 8
  %518 = getelementptr inbounds %struct.fields_struct* %517, i32 0, i32 0
  %519 = getelementptr inbounds [2 x [258 x [258 x double]]]* %518, i32 0, i64 1
  %520 = getelementptr inbounds [258 x [258 x double]]* %519, i32 0, i64 %516
  %521 = getelementptr inbounds [258 x double]* %520, i32 0, i64 %514
  %522 = load double* %521, align 8
  %523 = fsub double %512, %522
  %524 = load i64* @jm, align 8
  %525 = sub nsw i64 %524, 1
  %526 = load i64* @im, align 8
  %527 = sub nsw i64 %526, 1
  %528 = load %struct.wrk3_struct** @wrk3, align 8
  %529 = getelementptr inbounds %struct.wrk3_struct* %528, i32 0, i32 1
  %530 = getelementptr inbounds [258 x [258 x double]]* %529, i32 0, i64 %527
  %531 = getelementptr inbounds [258 x double]* %530, i32 0, i64 %525
  store double %523, double* %531, align 8
  br label %532

; <label>:532                                     ; preds = %502, %497
  %533 = load i64* %2, align 8
  %534 = icmp eq i64 %533, 1
  br i1 %534, label %535, label %566

; <label>:535                                     ; preds = %532
  %536 = load i64* %5, align 8
  store i64 %536, i64* %j, align 8
  br label %537

; <label>:537                                     ; preds = %562, %535
  %538 = load i64* %j, align 8
  %539 = load i64* %6, align 8
  %540 = icmp sle i64 %538, %539
  br i1 %540, label %541, label %565

; <label>:541                                     ; preds = %537
  %542 = load i64* %j, align 8
  %543 = load %struct.fields_struct** @fields, align 8
  %544 = getelementptr inbounds %struct.fields_struct* %543, i32 0, i32 0
  %545 = getelementptr inbounds [2 x [258 x [258 x double]]]* %544, i32 0, i64 0
  %546 = getelementptr inbounds [258 x [258 x double]]* %545, i32 0, i64 0
  %547 = getelementptr inbounds [258 x double]* %546, i32 0, i64 %542
  %548 = load double* %547, align 8
  %549 = load i64* %j, align 8
  %550 = load %struct.fields_struct** @fields, align 8
  %551 = getelementptr inbounds %struct.fields_struct* %550, i32 0, i32 0
  %552 = getelementptr inbounds [2 x [258 x [258 x double]]]* %551, i32 0, i64 1
  %553 = getelementptr inbounds [258 x [258 x double]]* %552, i32 0, i64 0
  %554 = getelementptr inbounds [258 x double]* %553, i32 0, i64 %549
  %555 = load double* %554, align 8
  %556 = fsub double %548, %555
  %557 = load i64* %j, align 8
  %558 = load %struct.wrk3_struct** @wrk3, align 8
  %559 = getelementptr inbounds %struct.wrk3_struct* %558, i32 0, i32 1
  %560 = getelementptr inbounds [258 x [258 x double]]* %559, i32 0, i64 0
  %561 = getelementptr inbounds [258 x double]* %560, i32 0, i64 %557
  store double %556, double* %561, align 8
  br label %562

; <label>:562                                     ; preds = %541
  %563 = load i64* %j, align 8
  %564 = add nsw i64 %563, 1
  store i64 %564, i64* %j, align 8
  br label %537

; <label>:565                                     ; preds = %537
  br label %566

; <label>:566                                     ; preds = %565, %532
  %567 = load i64* %2, align 8
  %568 = load i64* %4, align 8
  %569 = add nsw i64 %567, %568
  %570 = load i64* @im, align 8
  %571 = sub nsw i64 %570, 1
  %572 = icmp eq i64 %569, %571
  br i1 %572, label %573, label %610

; <label>:573                                     ; preds = %566
  %574 = load i64* %5, align 8
  store i64 %574, i64* %j, align 8
  br label %575

; <label>:575                                     ; preds = %606, %573
  %576 = load i64* %j, align 8
  %577 = load i64* %6, align 8
  %578 = icmp sle i64 %576, %577
  br i1 %578, label %579, label %609

; <label>:579                                     ; preds = %575
  %580 = load i64* %j, align 8
  %581 = load i64* @im, align 8
  %582 = sub nsw i64 %581, 1
  %583 = load %struct.fields_struct** @fields, align 8
  %584 = getelementptr inbounds %struct.fields_struct* %583, i32 0, i32 0
  %585 = getelementptr inbounds [2 x [258 x [258 x double]]]* %584, i32 0, i64 0
  %586 = getelementptr inbounds [258 x [258 x double]]* %585, i32 0, i64 %582
  %587 = getelementptr inbounds [258 x double]* %586, i32 0, i64 %580
  %588 = load double* %587, align 8
  %589 = load i64* %j, align 8
  %590 = load i64* @im, align 8
  %591 = sub nsw i64 %590, 1
  %592 = load %struct.fields_struct** @fields, align 8
  %593 = getelementptr inbounds %struct.fields_struct* %592, i32 0, i32 0
  %594 = getelementptr inbounds [2 x [258 x [258 x double]]]* %593, i32 0, i64 1
  %595 = getelementptr inbounds [258 x [258 x double]]* %594, i32 0, i64 %591
  %596 = getelementptr inbounds [258 x double]* %595, i32 0, i64 %589
  %597 = load double* %596, align 8
  %598 = fsub double %588, %597
  %599 = load i64* %j, align 8
  %600 = load i64* @im, align 8
  %601 = sub nsw i64 %600, 1
  %602 = load %struct.wrk3_struct** @wrk3, align 8
  %603 = getelementptr inbounds %struct.wrk3_struct* %602, i32 0, i32 1
  %604 = getelementptr inbounds [258 x [258 x double]]* %603, i32 0, i64 %601
  %605 = getelementptr inbounds [258 x double]* %604, i32 0, i64 %599
  store double %598, double* %605, align 8
  br label %606

; <label>:606                                     ; preds = %579
  %607 = load i64* %j, align 8
  %608 = add nsw i64 %607, 1
  store i64 %608, i64* %j, align 8
  br label %575

; <label>:609                                     ; preds = %575
  br label %610

; <label>:610                                     ; preds = %609, %566
  %611 = load i64* %5, align 8
  %612 = icmp eq i64 %611, 1
  br i1 %612, label %613, label %644

; <label>:613                                     ; preds = %610
  %614 = load i64* %2, align 8
  store i64 %614, i64* %j, align 8
  br label %615

; <label>:615                                     ; preds = %640, %613
  %616 = load i64* %j, align 8
  %617 = load i64* %3, align 8
  %618 = icmp sle i64 %616, %617
  br i1 %618, label %619, label %643

; <label>:619                                     ; preds = %615
  %620 = load i64* %j, align 8
  %621 = load %struct.fields_struct** @fields, align 8
  %622 = getelementptr inbounds %struct.fields_struct* %621, i32 0, i32 0
  %623 = getelementptr inbounds [2 x [258 x [258 x double]]]* %622, i32 0, i64 0
  %624 = getelementptr inbounds [258 x [258 x double]]* %623, i32 0, i64 %620
  %625 = getelementptr inbounds [258 x double]* %624, i32 0, i64 0
  %626 = load double* %625, align 8
  %627 = load i64* %j, align 8
  %628 = load %struct.fields_struct** @fields, align 8
  %629 = getelementptr inbounds %struct.fields_struct* %628, i32 0, i32 0
  %630 = getelementptr inbounds [2 x [258 x [258 x double]]]* %629, i32 0, i64 1
  %631 = getelementptr inbounds [258 x [258 x double]]* %630, i32 0, i64 %627
  %632 = getelementptr inbounds [258 x double]* %631, i32 0, i64 0
  %633 = load double* %632, align 8
  %634 = fsub double %626, %633
  %635 = load i64* %j, align 8
  %636 = load %struct.wrk3_struct** @wrk3, align 8
  %637 = getelementptr inbounds %struct.wrk3_struct* %636, i32 0, i32 1
  %638 = getelementptr inbounds [258 x [258 x double]]* %637, i32 0, i64 %635
  %639 = getelementptr inbounds [258 x double]* %638, i32 0, i64 0
  store double %634, double* %639, align 8
  br label %640

; <label>:640                                     ; preds = %619
  %641 = load i64* %j, align 8
  %642 = add nsw i64 %641, 1
  store i64 %642, i64* %j, align 8
  br label %615

; <label>:643                                     ; preds = %615
  br label %644

; <label>:644                                     ; preds = %643, %610
  %645 = load i64* %5, align 8
  %646 = load i64* %7, align 8
  %647 = add nsw i64 %645, %646
  %648 = load i64* @jm, align 8
  %649 = sub nsw i64 %648, 1
  %650 = icmp eq i64 %647, %649
  br i1 %650, label %651, label %688

; <label>:651                                     ; preds = %644
  %652 = load i64* %2, align 8
  store i64 %652, i64* %j, align 8
  br label %653

; <label>:653                                     ; preds = %684, %651
  %654 = load i64* %j, align 8
  %655 = load i64* %3, align 8
  %656 = icmp sle i64 %654, %655
  br i1 %656, label %657, label %687

; <label>:657                                     ; preds = %653
  %658 = load i64* @jm, align 8
  %659 = sub nsw i64 %658, 1
  %660 = load i64* %j, align 8
  %661 = load %struct.fields_struct** @fields, align 8
  %662 = getelementptr inbounds %struct.fields_struct* %661, i32 0, i32 0
  %663 = getelementptr inbounds [2 x [258 x [258 x double]]]* %662, i32 0, i64 0
  %664 = getelementptr inbounds [258 x [258 x double]]* %663, i32 0, i64 %660
  %665 = getelementptr inbounds [258 x double]* %664, i32 0, i64 %659
  %666 = load double* %665, align 8
  %667 = load i64* @jm, align 8
  %668 = sub nsw i64 %667, 1
  %669 = load i64* %j, align 8
  %670 = load %struct.fields_struct** @fields, align 8
  %671 = getelementptr inbounds %struct.fields_struct* %670, i32 0, i32 0
  %672 = getelementptr inbounds [2 x [258 x [258 x double]]]* %671, i32 0, i64 1
  %673 = getelementptr inbounds [258 x [258 x double]]* %672, i32 0, i64 %669
  %674 = getelementptr inbounds [258 x double]* %673, i32 0, i64 %668
  %675 = load double* %674, align 8
  %676 = fsub double %666, %675
  %677 = load i64* @jm, align 8
  %678 = sub nsw i64 %677, 1
  %679 = load i64* %j, align 8
  %680 = load %struct.wrk3_struct** @wrk3, align 8
  %681 = getelementptr inbounds %struct.wrk3_struct* %680, i32 0, i32 1
  %682 = getelementptr inbounds [258 x [258 x double]]* %681, i32 0, i64 %679
  %683 = getelementptr inbounds [258 x double]* %682, i32 0, i64 %678
  store double %676, double* %683, align 8
  br label %684

; <label>:684                                     ; preds = %657
  %685 = load i64* %j, align 8
  %686 = add nsw i64 %685, 1
  store i64 %686, i64* %j, align 8
  br label %653

; <label>:687                                     ; preds = %653
  br label %688

; <label>:688                                     ; preds = %687, %644
  %689 = load i64* %2, align 8
  store i64 %689, i64* %i, align 8
  br label %690

; <label>:690                                     ; preds = %728, %688
  %691 = load i64* %i, align 8
  %692 = load i64* %3, align 8
  %693 = icmp sle i64 %691, %692
  br i1 %693, label %694, label %731

; <label>:694                                     ; preds = %690
  %695 = load i64* %5, align 8
  store i64 %695, i64* %iindex, align 8
  br label %696

; <label>:696                                     ; preds = %724, %694
  %697 = load i64* %iindex, align 8
  %698 = load i64* %6, align 8
  %699 = icmp sle i64 %697, %698
  br i1 %699, label %700, label %727

; <label>:700                                     ; preds = %696
  %701 = load i64* %iindex, align 8
  %702 = load i64* %i, align 8
  %703 = load %struct.fields_struct** @fields, align 8
  %704 = getelementptr inbounds %struct.fields_struct* %703, i32 0, i32 0
  %705 = getelementptr inbounds [2 x [258 x [258 x double]]]* %704, i32 0, i64 0
  %706 = getelementptr inbounds [258 x [258 x double]]* %705, i32 0, i64 %702
  %707 = getelementptr inbounds [258 x double]* %706, i32 0, i64 %701
  %708 = load double* %707, align 8
  %709 = load i64* %iindex, align 8
  %710 = load i64* %i, align 8
  %711 = load %struct.fields_struct** @fields, align 8
  %712 = getelementptr inbounds %struct.fields_struct* %711, i32 0, i32 0
  %713 = getelementptr inbounds [2 x [258 x [258 x double]]]* %712, i32 0, i64 1
  %714 = getelementptr inbounds [258 x [258 x double]]* %713, i32 0, i64 %710
  %715 = getelementptr inbounds [258 x double]* %714, i32 0, i64 %709
  %716 = load double* %715, align 8
  %717 = fsub double %708, %716
  %718 = load i64* %iindex, align 8
  %719 = load i64* %i, align 8
  %720 = load %struct.wrk3_struct** @wrk3, align 8
  %721 = getelementptr inbounds %struct.wrk3_struct* %720, i32 0, i32 1
  %722 = getelementptr inbounds [258 x [258 x double]]* %721, i32 0, i64 %719
  %723 = getelementptr inbounds [258 x double]* %722, i32 0, i64 %718
  store double %717, double* %723, align 8
  br label %724

; <label>:724                                     ; preds = %700
  %725 = load i64* %iindex, align 8
  %726 = add nsw i64 %725, 1
  store i64 %726, i64* %iindex, align 8
  br label %696

; <label>:727                                     ; preds = %696
  br label %728

; <label>:728                                     ; preds = %727
  %729 = load i64* %i, align 8
  %730 = add nsw i64 %729, 1
  store i64 %730, i64* %i, align 8
  br label %690

; <label>:731                                     ; preds = %690
  %732 = load double* @h3, align 8
  %733 = load double* @h, align 8
  %734 = fdiv double %732, %733
  store double %734, double* %hh3, align 8
  %735 = load double* @h1, align 8
  %736 = load double* @h, align 8
  %737 = fdiv double %735, %736
  store double %737, double* %hh1, align 8
  %738 = load i64* %1, align 8
  %739 = icmp eq i64 %738, 0
  br i1 %739, label %740, label %762

; <label>:740                                     ; preds = %731
  %741 = load double* %hh3, align 8
  %742 = load %struct.fields_struct** @fields, align 8
  %743 = getelementptr inbounds %struct.fields_struct* %742, i32 0, i32 0
  %744 = getelementptr inbounds [2 x [258 x [258 x double]]]* %743, i32 0, i64 0
  %745 = getelementptr inbounds [258 x [258 x double]]* %744, i32 0, i64 0
  %746 = getelementptr inbounds [258 x double]* %745, i32 0, i64 0
  %747 = load double* %746, align 8
  %748 = fmul double %741, %747
  %749 = load double* %hh1, align 8
  %750 = load %struct.fields_struct** @fields, align 8
  %751 = getelementptr inbounds %struct.fields_struct* %750, i32 0, i32 0
  %752 = getelementptr inbounds [2 x [258 x [258 x double]]]* %751, i32 0, i64 1
  %753 = getelementptr inbounds [258 x [258 x double]]* %752, i32 0, i64 0
  %754 = getelementptr inbounds [258 x double]* %753, i32 0, i64 0
  %755 = load double* %754, align 8
  %756 = fmul double %749, %755
  %757 = fadd double %748, %756
  %758 = load %struct.wrk2_struct** @wrk2, align 8
  %759 = getelementptr inbounds %struct.wrk2_struct* %758, i32 0, i32 0
  %760 = getelementptr inbounds [258 x [258 x double]]* %759, i32 0, i64 0
  %761 = getelementptr inbounds [258 x double]* %760, i32 0, i64 0
  store double %757, double* %761, align 8
  br label %762

; <label>:762                                     ; preds = %740, %731
  %763 = load i64* %1, align 8
  %764 = load i64* @nprocs, align 8
  %765 = load i64* @xprocs, align 8
  %766 = sub nsw i64 %764, %765
  %767 = icmp eq i64 %763, %766
  br i1 %767, label %768, label %796

; <label>:768                                     ; preds = %762
  %769 = load double* %hh3, align 8
  %770 = load i64* @im, align 8
  %771 = sub nsw i64 %770, 1
  %772 = load %struct.fields_struct** @fields, align 8
  %773 = getelementptr inbounds %struct.fields_struct* %772, i32 0, i32 0
  %774 = getelementptr inbounds [2 x [258 x [258 x double]]]* %773, i32 0, i64 0
  %775 = getelementptr inbounds [258 x [258 x double]]* %774, i32 0, i64 %771
  %776 = getelementptr inbounds [258 x double]* %775, i32 0, i64 0
  %777 = load double* %776, align 8
  %778 = fmul double %769, %777
  %779 = load double* %hh1, align 8
  %780 = load i64* @im, align 8
  %781 = sub nsw i64 %780, 1
  %782 = load %struct.fields_struct** @fields, align 8
  %783 = getelementptr inbounds %struct.fields_struct* %782, i32 0, i32 0
  %784 = getelementptr inbounds [2 x [258 x [258 x double]]]* %783, i32 0, i64 1
  %785 = getelementptr inbounds [258 x [258 x double]]* %784, i32 0, i64 %781
  %786 = getelementptr inbounds [258 x double]* %785, i32 0, i64 0
  %787 = load double* %786, align 8
  %788 = fmul double %779, %787
  %789 = fadd double %778, %788
  %790 = load i64* @im, align 8
  %791 = sub nsw i64 %790, 1
  %792 = load %struct.wrk2_struct** @wrk2, align 8
  %793 = getelementptr inbounds %struct.wrk2_struct* %792, i32 0, i32 0
  %794 = getelementptr inbounds [258 x [258 x double]]* %793, i32 0, i64 %791
  %795 = getelementptr inbounds [258 x double]* %794, i32 0, i64 0
  store double %789, double* %795, align 8
  br label %796

; <label>:796                                     ; preds = %768, %762
  %797 = load i64* %1, align 8
  %798 = load i64* @xprocs, align 8
  %799 = sub nsw i64 %798, 1
  %800 = icmp eq i64 %797, %799
  br i1 %800, label %801, label %829

; <label>:801                                     ; preds = %796
  %802 = load double* %hh3, align 8
  %803 = load i64* @jm, align 8
  %804 = sub nsw i64 %803, 1
  %805 = load %struct.fields_struct** @fields, align 8
  %806 = getelementptr inbounds %struct.fields_struct* %805, i32 0, i32 0
  %807 = getelementptr inbounds [2 x [258 x [258 x double]]]* %806, i32 0, i64 0
  %808 = getelementptr inbounds [258 x [258 x double]]* %807, i32 0, i64 0
  %809 = getelementptr inbounds [258 x double]* %808, i32 0, i64 %804
  %810 = load double* %809, align 8
  %811 = fmul double %802, %810
  %812 = load double* %hh1, align 8
  %813 = load i64* @jm, align 8
  %814 = sub nsw i64 %813, 1
  %815 = load %struct.fields_struct** @fields, align 8
  %816 = getelementptr inbounds %struct.fields_struct* %815, i32 0, i32 0
  %817 = getelementptr inbounds [2 x [258 x [258 x double]]]* %816, i32 0, i64 1
  %818 = getelementptr inbounds [258 x [258 x double]]* %817, i32 0, i64 0
  %819 = getelementptr inbounds [258 x double]* %818, i32 0, i64 %814
  %820 = load double* %819, align 8
  %821 = fmul double %812, %820
  %822 = fadd double %811, %821
  %823 = load i64* @jm, align 8
  %824 = sub nsw i64 %823, 1
  %825 = load %struct.wrk2_struct** @wrk2, align 8
  %826 = getelementptr inbounds %struct.wrk2_struct* %825, i32 0, i32 0
  %827 = getelementptr inbounds [258 x [258 x double]]* %826, i32 0, i64 0
  %828 = getelementptr inbounds [258 x double]* %827, i32 0, i64 %824
  store double %822, double* %828, align 8
  br label %829

; <label>:829                                     ; preds = %801, %796
  %830 = load i64* %1, align 8
  %831 = load i64* @nprocs, align 8
  %832 = sub nsw i64 %831, 1
  %833 = icmp eq i64 %830, %832
  br i1 %833, label %834, label %868

; <label>:834                                     ; preds = %829
  %835 = load double* %hh3, align 8
  %836 = load i64* @jm, align 8
  %837 = sub nsw i64 %836, 1
  %838 = load i64* @im, align 8
  %839 = sub nsw i64 %838, 1
  %840 = load %struct.fields_struct** @fields, align 8
  %841 = getelementptr inbounds %struct.fields_struct* %840, i32 0, i32 0
  %842 = getelementptr inbounds [2 x [258 x [258 x double]]]* %841, i32 0, i64 0
  %843 = getelementptr inbounds [258 x [258 x double]]* %842, i32 0, i64 %839
  %844 = getelementptr inbounds [258 x double]* %843, i32 0, i64 %837
  %845 = load double* %844, align 8
  %846 = fmul double %835, %845
  %847 = load double* %hh1, align 8
  %848 = load i64* @jm, align 8
  %849 = sub nsw i64 %848, 1
  %850 = load i64* @im, align 8
  %851 = sub nsw i64 %850, 1
  %852 = load %struct.fields_struct** @fields, align 8
  %853 = getelementptr inbounds %struct.fields_struct* %852, i32 0, i32 0
  %854 = getelementptr inbounds [2 x [258 x [258 x double]]]* %853, i32 0, i64 1
  %855 = getelementptr inbounds [258 x [258 x double]]* %854, i32 0, i64 %851
  %856 = getelementptr inbounds [258 x double]* %855, i32 0, i64 %849
  %857 = load double* %856, align 8
  %858 = fmul double %847, %857
  %859 = fadd double %846, %858
  %860 = load i64* @jm, align 8
  %861 = sub nsw i64 %860, 1
  %862 = load i64* @im, align 8
  %863 = sub nsw i64 %862, 1
  %864 = load %struct.wrk2_struct** @wrk2, align 8
  %865 = getelementptr inbounds %struct.wrk2_struct* %864, i32 0, i32 0
  %866 = getelementptr inbounds [258 x [258 x double]]* %865, i32 0, i64 %863
  %867 = getelementptr inbounds [258 x double]* %866, i32 0, i64 %861
  store double %859, double* %867, align 8
  br label %868

; <label>:868                                     ; preds = %834, %829
  %869 = load i64* %2, align 8
  %870 = icmp eq i64 %869, 1
  br i1 %870, label %871, label %906

; <label>:871                                     ; preds = %868
  %872 = load i64* %5, align 8
  store i64 %872, i64* %j, align 8
  br label %873

; <label>:873                                     ; preds = %902, %871
  %874 = load i64* %j, align 8
  %875 = load i64* %6, align 8
  %876 = icmp sle i64 %874, %875
  br i1 %876, label %877, label %905

; <label>:877                                     ; preds = %873
  %878 = load double* %hh3, align 8
  %879 = load i64* %j, align 8
  %880 = load %struct.fields_struct** @fields, align 8
  %881 = getelementptr inbounds %struct.fields_struct* %880, i32 0, i32 0
  %882 = getelementptr inbounds [2 x [258 x [258 x double]]]* %881, i32 0, i64 0
  %883 = getelementptr inbounds [258 x [258 x double]]* %882, i32 0, i64 0
  %884 = getelementptr inbounds [258 x double]* %883, i32 0, i64 %879
  %885 = load double* %884, align 8
  %886 = fmul double %878, %885
  %887 = load double* %hh1, align 8
  %888 = load i64* %j, align 8
  %889 = load %struct.fields_struct** @fields, align 8
  %890 = getelementptr inbounds %struct.fields_struct* %889, i32 0, i32 0
  %891 = getelementptr inbounds [2 x [258 x [258 x double]]]* %890, i32 0, i64 1
  %892 = getelementptr inbounds [258 x [258 x double]]* %891, i32 0, i64 0
  %893 = getelementptr inbounds [258 x double]* %892, i32 0, i64 %888
  %894 = load double* %893, align 8
  %895 = fmul double %887, %894
  %896 = fadd double %886, %895
  %897 = load i64* %j, align 8
  %898 = load %struct.wrk2_struct** @wrk2, align 8
  %899 = getelementptr inbounds %struct.wrk2_struct* %898, i32 0, i32 0
  %900 = getelementptr inbounds [258 x [258 x double]]* %899, i32 0, i64 0
  %901 = getelementptr inbounds [258 x double]* %900, i32 0, i64 %897
  store double %896, double* %901, align 8
  br label %902

; <label>:902                                     ; preds = %877
  %903 = load i64* %j, align 8
  %904 = add nsw i64 %903, 1
  store i64 %904, i64* %j, align 8
  br label %873

; <label>:905                                     ; preds = %873
  br label %906

; <label>:906                                     ; preds = %905, %868
  %907 = load i64* %2, align 8
  %908 = load i64* %4, align 8
  %909 = add nsw i64 %907, %908
  %910 = load i64* @im, align 8
  %911 = sub nsw i64 %910, 1
  %912 = icmp eq i64 %909, %911
  br i1 %912, label %913, label %954

; <label>:913                                     ; preds = %906
  %914 = load i64* %5, align 8
  store i64 %914, i64* %j, align 8
  br label %915

; <label>:915                                     ; preds = %950, %913
  %916 = load i64* %j, align 8
  %917 = load i64* %6, align 8
  %918 = icmp sle i64 %916, %917
  br i1 %918, label %919, label %953

; <label>:919                                     ; preds = %915
  %920 = load double* %hh3, align 8
  %921 = load i64* %j, align 8
  %922 = load i64* @im, align 8
  %923 = sub nsw i64 %922, 1
  %924 = load %struct.fields_struct** @fields, align 8
  %925 = getelementptr inbounds %struct.fields_struct* %924, i32 0, i32 0
  %926 = getelementptr inbounds [2 x [258 x [258 x double]]]* %925, i32 0, i64 0
  %927 = getelementptr inbounds [258 x [258 x double]]* %926, i32 0, i64 %923
  %928 = getelementptr inbounds [258 x double]* %927, i32 0, i64 %921
  %929 = load double* %928, align 8
  %930 = fmul double %920, %929
  %931 = load double* %hh1, align 8
  %932 = load i64* %j, align 8
  %933 = load i64* @im, align 8
  %934 = sub nsw i64 %933, 1
  %935 = load %struct.fields_struct** @fields, align 8
  %936 = getelementptr inbounds %struct.fields_struct* %935, i32 0, i32 0
  %937 = getelementptr inbounds [2 x [258 x [258 x double]]]* %936, i32 0, i64 1
  %938 = getelementptr inbounds [258 x [258 x double]]* %937, i32 0, i64 %934
  %939 = getelementptr inbounds [258 x double]* %938, i32 0, i64 %932
  %940 = load double* %939, align 8
  %941 = fmul double %931, %940
  %942 = fadd double %930, %941
  %943 = load i64* %j, align 8
  %944 = load i64* @im, align 8
  %945 = sub nsw i64 %944, 1
  %946 = load %struct.wrk2_struct** @wrk2, align 8
  %947 = getelementptr inbounds %struct.wrk2_struct* %946, i32 0, i32 0
  %948 = getelementptr inbounds [258 x [258 x double]]* %947, i32 0, i64 %945
  %949 = getelementptr inbounds [258 x double]* %948, i32 0, i64 %943
  store double %942, double* %949, align 8
  br label %950

; <label>:950                                     ; preds = %919
  %951 = load i64* %j, align 8
  %952 = add nsw i64 %951, 1
  store i64 %952, i64* %j, align 8
  br label %915

; <label>:953                                     ; preds = %915
  br label %954

; <label>:954                                     ; preds = %953, %906
  %955 = load i64* %5, align 8
  %956 = icmp eq i64 %955, 1
  br i1 %956, label %957, label %992

; <label>:957                                     ; preds = %954
  %958 = load i64* %2, align 8
  store i64 %958, i64* %j, align 8
  br label %959

; <label>:959                                     ; preds = %988, %957
  %960 = load i64* %j, align 8
  %961 = load i64* %3, align 8
  %962 = icmp sle i64 %960, %961
  br i1 %962, label %963, label %991

; <label>:963                                     ; preds = %959
  %964 = load double* %hh3, align 8
  %965 = load i64* %j, align 8
  %966 = load %struct.fields_struct** @fields, align 8
  %967 = getelementptr inbounds %struct.fields_struct* %966, i32 0, i32 0
  %968 = getelementptr inbounds [2 x [258 x [258 x double]]]* %967, i32 0, i64 0
  %969 = getelementptr inbounds [258 x [258 x double]]* %968, i32 0, i64 %965
  %970 = getelementptr inbounds [258 x double]* %969, i32 0, i64 0
  %971 = load double* %970, align 8
  %972 = fmul double %964, %971
  %973 = load double* %hh1, align 8
  %974 = load i64* %j, align 8
  %975 = load %struct.fields_struct** @fields, align 8
  %976 = getelementptr inbounds %struct.fields_struct* %975, i32 0, i32 0
  %977 = getelementptr inbounds [2 x [258 x [258 x double]]]* %976, i32 0, i64 1
  %978 = getelementptr inbounds [258 x [258 x double]]* %977, i32 0, i64 %974
  %979 = getelementptr inbounds [258 x double]* %978, i32 0, i64 0
  %980 = load double* %979, align 8
  %981 = fmul double %973, %980
  %982 = fadd double %972, %981
  %983 = load i64* %j, align 8
  %984 = load %struct.wrk2_struct** @wrk2, align 8
  %985 = getelementptr inbounds %struct.wrk2_struct* %984, i32 0, i32 0
  %986 = getelementptr inbounds [258 x [258 x double]]* %985, i32 0, i64 %983
  %987 = getelementptr inbounds [258 x double]* %986, i32 0, i64 0
  store double %982, double* %987, align 8
  br label %988

; <label>:988                                     ; preds = %963
  %989 = load i64* %j, align 8
  %990 = add nsw i64 %989, 1
  store i64 %990, i64* %j, align 8
  br label %959

; <label>:991                                     ; preds = %959
  br label %992

; <label>:992                                     ; preds = %991, %954
  %993 = load i64* %5, align 8
  %994 = load i64* %7, align 8
  %995 = add nsw i64 %993, %994
  %996 = load i64* @jm, align 8
  %997 = sub nsw i64 %996, 1
  %998 = icmp eq i64 %995, %997
  br i1 %998, label %999, label %1040

; <label>:999                                     ; preds = %992
  %1000 = load i64* %2, align 8
  store i64 %1000, i64* %j, align 8
  br label %1001

; <label>:1001                                    ; preds = %1036, %999
  %1002 = load i64* %j, align 8
  %1003 = load i64* %3, align 8
  %1004 = icmp sle i64 %1002, %1003
  br i1 %1004, label %1005, label %1039

; <label>:1005                                    ; preds = %1001
  %1006 = load double* %hh3, align 8
  %1007 = load i64* @jm, align 8
  %1008 = sub nsw i64 %1007, 1
  %1009 = load i64* %j, align 8
  %1010 = load %struct.fields_struct** @fields, align 8
  %1011 = getelementptr inbounds %struct.fields_struct* %1010, i32 0, i32 0
  %1012 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1011, i32 0, i64 0
  %1013 = getelementptr inbounds [258 x [258 x double]]* %1012, i32 0, i64 %1009
  %1014 = getelementptr inbounds [258 x double]* %1013, i32 0, i64 %1008
  %1015 = load double* %1014, align 8
  %1016 = fmul double %1006, %1015
  %1017 = load double* %hh1, align 8
  %1018 = load i64* @jm, align 8
  %1019 = sub nsw i64 %1018, 1
  %1020 = load i64* %j, align 8
  %1021 = load %struct.fields_struct** @fields, align 8
  %1022 = getelementptr inbounds %struct.fields_struct* %1021, i32 0, i32 0
  %1023 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1022, i32 0, i64 1
  %1024 = getelementptr inbounds [258 x [258 x double]]* %1023, i32 0, i64 %1020
  %1025 = getelementptr inbounds [258 x double]* %1024, i32 0, i64 %1019
  %1026 = load double* %1025, align 8
  %1027 = fmul double %1017, %1026
  %1028 = fadd double %1016, %1027
  %1029 = load i64* @jm, align 8
  %1030 = sub nsw i64 %1029, 1
  %1031 = load i64* %j, align 8
  %1032 = load %struct.wrk2_struct** @wrk2, align 8
  %1033 = getelementptr inbounds %struct.wrk2_struct* %1032, i32 0, i32 0
  %1034 = getelementptr inbounds [258 x [258 x double]]* %1033, i32 0, i64 %1031
  %1035 = getelementptr inbounds [258 x double]* %1034, i32 0, i64 %1030
  store double %1028, double* %1035, align 8
  br label %1036

; <label>:1036                                    ; preds = %1005
  %1037 = load i64* %j, align 8
  %1038 = add nsw i64 %1037, 1
  store i64 %1038, i64* %j, align 8
  br label %1001

; <label>:1039                                    ; preds = %1001
  br label %1040

; <label>:1040                                    ; preds = %1039, %992
  %1041 = load i64* %2, align 8
  store i64 %1041, i64* %i, align 8
  br label %1042

; <label>:1042                                    ; preds = %1084, %1040
  %1043 = load i64* %i, align 8
  %1044 = load i64* %3, align 8
  %1045 = icmp sle i64 %1043, %1044
  br i1 %1045, label %1046, label %1087

; <label>:1046                                    ; preds = %1042
  %1047 = load i64* %5, align 8
  store i64 %1047, i64* %iindex, align 8
  br label %1048

; <label>:1048                                    ; preds = %1080, %1046
  %1049 = load i64* %iindex, align 8
  %1050 = load i64* %6, align 8
  %1051 = icmp sle i64 %1049, %1050
  br i1 %1051, label %1052, label %1083

; <label>:1052                                    ; preds = %1048
  %1053 = load double* %hh3, align 8
  %1054 = load i64* %iindex, align 8
  %1055 = load i64* %i, align 8
  %1056 = load %struct.fields_struct** @fields, align 8
  %1057 = getelementptr inbounds %struct.fields_struct* %1056, i32 0, i32 0
  %1058 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1057, i32 0, i64 0
  %1059 = getelementptr inbounds [258 x [258 x double]]* %1058, i32 0, i64 %1055
  %1060 = getelementptr inbounds [258 x double]* %1059, i32 0, i64 %1054
  %1061 = load double* %1060, align 8
  %1062 = fmul double %1053, %1061
  %1063 = load double* %hh1, align 8
  %1064 = load i64* %iindex, align 8
  %1065 = load i64* %i, align 8
  %1066 = load %struct.fields_struct** @fields, align 8
  %1067 = getelementptr inbounds %struct.fields_struct* %1066, i32 0, i32 0
  %1068 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1067, i32 0, i64 1
  %1069 = getelementptr inbounds [258 x [258 x double]]* %1068, i32 0, i64 %1065
  %1070 = getelementptr inbounds [258 x double]* %1069, i32 0, i64 %1064
  %1071 = load double* %1070, align 8
  %1072 = fmul double %1063, %1071
  %1073 = fadd double %1062, %1072
  %1074 = load i64* %iindex, align 8
  %1075 = load i64* %i, align 8
  %1076 = load %struct.wrk2_struct** @wrk2, align 8
  %1077 = getelementptr inbounds %struct.wrk2_struct* %1076, i32 0, i32 0
  %1078 = getelementptr inbounds [258 x [258 x double]]* %1077, i32 0, i64 %1075
  %1079 = getelementptr inbounds [258 x double]* %1078, i32 0, i64 %1074
  store double %1073, double* %1079, align 8
  br label %1080

; <label>:1080                                    ; preds = %1052
  %1081 = load i64* %iindex, align 8
  %1082 = add nsw i64 %1081, 1
  store i64 %1082, i64* %iindex, align 8
  br label %1048

; <label>:1083                                    ; preds = %1048
  br label %1084

; <label>:1084                                    ; preds = %1083
  %1085 = load i64* %i, align 8
  %1086 = add nsw i64 %1085, 1
  store i64 %1086, i64* %i, align 8
  br label %1042

; <label>:1087                                    ; preds = %1042
  store i64 0, i64* %psiindex, align 8
  br label %1088

; <label>:1088                                    ; preds = %1352, %1087
  %1089 = load i64* %psiindex, align 8
  %1090 = icmp sle i64 %1089, 1
  br i1 %1090, label %1091, label %1355

; <label>:1091                                    ; preds = %1088
  %1092 = load i64* %1, align 8
  %1093 = icmp eq i64 %1092, 0
  br i1 %1093, label %1094, label %1108

; <label>:1094                                    ; preds = %1091
  %1095 = load i64* %psiindex, align 8
  %1096 = load %struct.fields_struct** @fields, align 8
  %1097 = getelementptr inbounds %struct.fields_struct* %1096, i32 0, i32 0
  %1098 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1097, i32 0, i64 %1095
  %1099 = getelementptr inbounds [258 x [258 x double]]* %1098, i32 0, i64 0
  %1100 = getelementptr inbounds [258 x double]* %1099, i32 0, i64 0
  %1101 = load double* %1100, align 8
  %1102 = load i64* %psiindex, align 8
  %1103 = load %struct.wrk5_struct** @wrk5, align 8
  %1104 = getelementptr inbounds %struct.wrk5_struct* %1103, i32 0, i32 1
  %1105 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1104, i32 0, i64 %1102
  %1106 = getelementptr inbounds [258 x [258 x double]]* %1105, i32 0, i64 0
  %1107 = getelementptr inbounds [258 x double]* %1106, i32 0, i64 0
  store double %1101, double* %1107, align 8
  br label %1108

; <label>:1108                                    ; preds = %1094, %1091
  %1109 = load i64* %1, align 8
  %1110 = load i64* @nprocs, align 8
  %1111 = load i64* @xprocs, align 8
  %1112 = sub nsw i64 %1110, %1111
  %1113 = icmp eq i64 %1109, %1112
  br i1 %1113, label %1114, label %1132

; <label>:1114                                    ; preds = %1108
  %1115 = load i64* @im, align 8
  %1116 = sub nsw i64 %1115, 1
  %1117 = load i64* %psiindex, align 8
  %1118 = load %struct.fields_struct** @fields, align 8
  %1119 = getelementptr inbounds %struct.fields_struct* %1118, i32 0, i32 0
  %1120 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1119, i32 0, i64 %1117
  %1121 = getelementptr inbounds [258 x [258 x double]]* %1120, i32 0, i64 %1116
  %1122 = getelementptr inbounds [258 x double]* %1121, i32 0, i64 0
  %1123 = load double* %1122, align 8
  %1124 = load i64* @im, align 8
  %1125 = sub nsw i64 %1124, 1
  %1126 = load i64* %psiindex, align 8
  %1127 = load %struct.wrk5_struct** @wrk5, align 8
  %1128 = getelementptr inbounds %struct.wrk5_struct* %1127, i32 0, i32 1
  %1129 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1128, i32 0, i64 %1126
  %1130 = getelementptr inbounds [258 x [258 x double]]* %1129, i32 0, i64 %1125
  %1131 = getelementptr inbounds [258 x double]* %1130, i32 0, i64 0
  store double %1123, double* %1131, align 8
  br label %1132

; <label>:1132                                    ; preds = %1114, %1108
  %1133 = load i64* %1, align 8
  %1134 = load i64* @xprocs, align 8
  %1135 = sub nsw i64 %1134, 1
  %1136 = icmp eq i64 %1133, %1135
  br i1 %1136, label %1137, label %1155

; <label>:1137                                    ; preds = %1132
  %1138 = load i64* @jm, align 8
  %1139 = sub nsw i64 %1138, 1
  %1140 = load i64* %psiindex, align 8
  %1141 = load %struct.fields_struct** @fields, align 8
  %1142 = getelementptr inbounds %struct.fields_struct* %1141, i32 0, i32 0
  %1143 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1142, i32 0, i64 %1140
  %1144 = getelementptr inbounds [258 x [258 x double]]* %1143, i32 0, i64 0
  %1145 = getelementptr inbounds [258 x double]* %1144, i32 0, i64 %1139
  %1146 = load double* %1145, align 8
  %1147 = load i64* @jm, align 8
  %1148 = sub nsw i64 %1147, 1
  %1149 = load i64* %psiindex, align 8
  %1150 = load %struct.wrk5_struct** @wrk5, align 8
  %1151 = getelementptr inbounds %struct.wrk5_struct* %1150, i32 0, i32 1
  %1152 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1151, i32 0, i64 %1149
  %1153 = getelementptr inbounds [258 x [258 x double]]* %1152, i32 0, i64 0
  %1154 = getelementptr inbounds [258 x double]* %1153, i32 0, i64 %1148
  store double %1146, double* %1154, align 8
  br label %1155

; <label>:1155                                    ; preds = %1137, %1132
  %1156 = load i64* %1, align 8
  %1157 = load i64* @nprocs, align 8
  %1158 = sub nsw i64 %1157, 1
  %1159 = icmp eq i64 %1156, %1158
  br i1 %1159, label %1160, label %1182

; <label>:1160                                    ; preds = %1155
  %1161 = load i64* @jm, align 8
  %1162 = sub nsw i64 %1161, 1
  %1163 = load i64* @im, align 8
  %1164 = sub nsw i64 %1163, 1
  %1165 = load i64* %psiindex, align 8
  %1166 = load %struct.fields_struct** @fields, align 8
  %1167 = getelementptr inbounds %struct.fields_struct* %1166, i32 0, i32 0
  %1168 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1167, i32 0, i64 %1165
  %1169 = getelementptr inbounds [258 x [258 x double]]* %1168, i32 0, i64 %1164
  %1170 = getelementptr inbounds [258 x double]* %1169, i32 0, i64 %1162
  %1171 = load double* %1170, align 8
  %1172 = load i64* @jm, align 8
  %1173 = sub nsw i64 %1172, 1
  %1174 = load i64* @im, align 8
  %1175 = sub nsw i64 %1174, 1
  %1176 = load i64* %psiindex, align 8
  %1177 = load %struct.wrk5_struct** @wrk5, align 8
  %1178 = getelementptr inbounds %struct.wrk5_struct* %1177, i32 0, i32 1
  %1179 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1178, i32 0, i64 %1176
  %1180 = getelementptr inbounds [258 x [258 x double]]* %1179, i32 0, i64 %1175
  %1181 = getelementptr inbounds [258 x double]* %1180, i32 0, i64 %1173
  store double %1171, double* %1181, align 8
  br label %1182

; <label>:1182                                    ; preds = %1160, %1155
  %1183 = load i64* %2, align 8
  %1184 = icmp eq i64 %1183, 1
  br i1 %1184, label %1185, label %1211

; <label>:1185                                    ; preds = %1182
  %1186 = load i64* %5, align 8
  store i64 %1186, i64* %j, align 8
  br label %1187

; <label>:1187                                    ; preds = %1207, %1185
  %1188 = load i64* %j, align 8
  %1189 = load i64* %6, align 8
  %1190 = icmp sle i64 %1188, %1189
  br i1 %1190, label %1191, label %1210

; <label>:1191                                    ; preds = %1187
  %1192 = load i64* %j, align 8
  %1193 = load i64* %psiindex, align 8
  %1194 = load %struct.fields_struct** @fields, align 8
  %1195 = getelementptr inbounds %struct.fields_struct* %1194, i32 0, i32 0
  %1196 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1195, i32 0, i64 %1193
  %1197 = getelementptr inbounds [258 x [258 x double]]* %1196, i32 0, i64 0
  %1198 = getelementptr inbounds [258 x double]* %1197, i32 0, i64 %1192
  %1199 = load double* %1198, align 8
  %1200 = load i64* %j, align 8
  %1201 = load i64* %psiindex, align 8
  %1202 = load %struct.wrk5_struct** @wrk5, align 8
  %1203 = getelementptr inbounds %struct.wrk5_struct* %1202, i32 0, i32 1
  %1204 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1203, i32 0, i64 %1201
  %1205 = getelementptr inbounds [258 x [258 x double]]* %1204, i32 0, i64 0
  %1206 = getelementptr inbounds [258 x double]* %1205, i32 0, i64 %1200
  store double %1199, double* %1206, align 8
  br label %1207

; <label>:1207                                    ; preds = %1191
  %1208 = load i64* %j, align 8
  %1209 = add nsw i64 %1208, 1
  store i64 %1209, i64* %j, align 8
  br label %1187

; <label>:1210                                    ; preds = %1187
  br label %1211

; <label>:1211                                    ; preds = %1210, %1182
  %1212 = load i64* %2, align 8
  %1213 = load i64* %4, align 8
  %1214 = add nsw i64 %1212, %1213
  %1215 = load i64* @im, align 8
  %1216 = sub nsw i64 %1215, 1
  %1217 = icmp eq i64 %1214, %1216
  br i1 %1217, label %1218, label %1248

; <label>:1218                                    ; preds = %1211
  %1219 = load i64* %5, align 8
  store i64 %1219, i64* %j, align 8
  br label %1220

; <label>:1220                                    ; preds = %1244, %1218
  %1221 = load i64* %j, align 8
  %1222 = load i64* %6, align 8
  %1223 = icmp sle i64 %1221, %1222
  br i1 %1223, label %1224, label %1247

; <label>:1224                                    ; preds = %1220
  %1225 = load i64* %j, align 8
  %1226 = load i64* @im, align 8
  %1227 = sub nsw i64 %1226, 1
  %1228 = load i64* %psiindex, align 8
  %1229 = load %struct.fields_struct** @fields, align 8
  %1230 = getelementptr inbounds %struct.fields_struct* %1229, i32 0, i32 0
  %1231 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1230, i32 0, i64 %1228
  %1232 = getelementptr inbounds [258 x [258 x double]]* %1231, i32 0, i64 %1227
  %1233 = getelementptr inbounds [258 x double]* %1232, i32 0, i64 %1225
  %1234 = load double* %1233, align 8
  %1235 = load i64* %j, align 8
  %1236 = load i64* @im, align 8
  %1237 = sub nsw i64 %1236, 1
  %1238 = load i64* %psiindex, align 8
  %1239 = load %struct.wrk5_struct** @wrk5, align 8
  %1240 = getelementptr inbounds %struct.wrk5_struct* %1239, i32 0, i32 1
  %1241 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1240, i32 0, i64 %1238
  %1242 = getelementptr inbounds [258 x [258 x double]]* %1241, i32 0, i64 %1237
  %1243 = getelementptr inbounds [258 x double]* %1242, i32 0, i64 %1235
  store double %1234, double* %1243, align 8
  br label %1244

; <label>:1244                                    ; preds = %1224
  %1245 = load i64* %j, align 8
  %1246 = add nsw i64 %1245, 1
  store i64 %1246, i64* %j, align 8
  br label %1220

; <label>:1247                                    ; preds = %1220
  br label %1248

; <label>:1248                                    ; preds = %1247, %1211
  %1249 = load i64* %5, align 8
  %1250 = icmp eq i64 %1249, 1
  br i1 %1250, label %1251, label %1277

; <label>:1251                                    ; preds = %1248
  %1252 = load i64* %2, align 8
  store i64 %1252, i64* %j, align 8
  br label %1253

; <label>:1253                                    ; preds = %1273, %1251
  %1254 = load i64* %j, align 8
  %1255 = load i64* %3, align 8
  %1256 = icmp sle i64 %1254, %1255
  br i1 %1256, label %1257, label %1276

; <label>:1257                                    ; preds = %1253
  %1258 = load i64* %j, align 8
  %1259 = load i64* %psiindex, align 8
  %1260 = load %struct.fields_struct** @fields, align 8
  %1261 = getelementptr inbounds %struct.fields_struct* %1260, i32 0, i32 0
  %1262 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1261, i32 0, i64 %1259
  %1263 = getelementptr inbounds [258 x [258 x double]]* %1262, i32 0, i64 %1258
  %1264 = getelementptr inbounds [258 x double]* %1263, i32 0, i64 0
  %1265 = load double* %1264, align 8
  %1266 = load i64* %j, align 8
  %1267 = load i64* %psiindex, align 8
  %1268 = load %struct.wrk5_struct** @wrk5, align 8
  %1269 = getelementptr inbounds %struct.wrk5_struct* %1268, i32 0, i32 1
  %1270 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1269, i32 0, i64 %1267
  %1271 = getelementptr inbounds [258 x [258 x double]]* %1270, i32 0, i64 %1266
  %1272 = getelementptr inbounds [258 x double]* %1271, i32 0, i64 0
  store double %1265, double* %1272, align 8
  br label %1273

; <label>:1273                                    ; preds = %1257
  %1274 = load i64* %j, align 8
  %1275 = add nsw i64 %1274, 1
  store i64 %1275, i64* %j, align 8
  br label %1253

; <label>:1276                                    ; preds = %1253
  br label %1277

; <label>:1277                                    ; preds = %1276, %1248
  %1278 = load i64* %5, align 8
  %1279 = load i64* %7, align 8
  %1280 = add nsw i64 %1278, %1279
  %1281 = load i64* @jm, align 8
  %1282 = sub nsw i64 %1281, 1
  %1283 = icmp eq i64 %1280, %1282
  br i1 %1283, label %1284, label %1314

; <label>:1284                                    ; preds = %1277
  %1285 = load i64* %2, align 8
  store i64 %1285, i64* %j, align 8
  br label %1286

; <label>:1286                                    ; preds = %1310, %1284
  %1287 = load i64* %j, align 8
  %1288 = load i64* %3, align 8
  %1289 = icmp sle i64 %1287, %1288
  br i1 %1289, label %1290, label %1313

; <label>:1290                                    ; preds = %1286
  %1291 = load i64* @jm, align 8
  %1292 = sub nsw i64 %1291, 1
  %1293 = load i64* %j, align 8
  %1294 = load i64* %psiindex, align 8
  %1295 = load %struct.fields_struct** @fields, align 8
  %1296 = getelementptr inbounds %struct.fields_struct* %1295, i32 0, i32 0
  %1297 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1296, i32 0, i64 %1294
  %1298 = getelementptr inbounds [258 x [258 x double]]* %1297, i32 0, i64 %1293
  %1299 = getelementptr inbounds [258 x double]* %1298, i32 0, i64 %1292
  %1300 = load double* %1299, align 8
  %1301 = load i64* @jm, align 8
  %1302 = sub nsw i64 %1301, 1
  %1303 = load i64* %j, align 8
  %1304 = load i64* %psiindex, align 8
  %1305 = load %struct.wrk5_struct** @wrk5, align 8
  %1306 = getelementptr inbounds %struct.wrk5_struct* %1305, i32 0, i32 1
  %1307 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1306, i32 0, i64 %1304
  %1308 = getelementptr inbounds [258 x [258 x double]]* %1307, i32 0, i64 %1303
  %1309 = getelementptr inbounds [258 x double]* %1308, i32 0, i64 %1302
  store double %1300, double* %1309, align 8
  br label %1310

; <label>:1310                                    ; preds = %1290
  %1311 = load i64* %j, align 8
  %1312 = add nsw i64 %1311, 1
  store i64 %1312, i64* %j, align 8
  br label %1286

; <label>:1313                                    ; preds = %1286
  br label %1314

; <label>:1314                                    ; preds = %1313, %1277
  %1315 = load i64* %2, align 8
  store i64 %1315, i64* %i, align 8
  br label %1316

; <label>:1316                                    ; preds = %1348, %1314
  %1317 = load i64* %i, align 8
  %1318 = load i64* %3, align 8
  %1319 = icmp sle i64 %1317, %1318
  br i1 %1319, label %1320, label %1351

; <label>:1320                                    ; preds = %1316
  %1321 = load i64* %5, align 8
  store i64 %1321, i64* %iindex, align 8
  br label %1322

; <label>:1322                                    ; preds = %1344, %1320
  %1323 = load i64* %iindex, align 8
  %1324 = load i64* %6, align 8
  %1325 = icmp sle i64 %1323, %1324
  br i1 %1325, label %1326, label %1347

; <label>:1326                                    ; preds = %1322
  %1327 = load i64* %iindex, align 8
  %1328 = load i64* %i, align 8
  %1329 = load i64* %psiindex, align 8
  %1330 = load %struct.fields_struct** @fields, align 8
  %1331 = getelementptr inbounds %struct.fields_struct* %1330, i32 0, i32 0
  %1332 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1331, i32 0, i64 %1329
  %1333 = getelementptr inbounds [258 x [258 x double]]* %1332, i32 0, i64 %1328
  %1334 = getelementptr inbounds [258 x double]* %1333, i32 0, i64 %1327
  %1335 = load double* %1334, align 8
  %1336 = load i64* %iindex, align 8
  %1337 = load i64* %i, align 8
  %1338 = load i64* %psiindex, align 8
  %1339 = load %struct.wrk5_struct** @wrk5, align 8
  %1340 = getelementptr inbounds %struct.wrk5_struct* %1339, i32 0, i32 1
  %1341 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1340, i32 0, i64 %1338
  %1342 = getelementptr inbounds [258 x [258 x double]]* %1341, i32 0, i64 %1337
  %1343 = getelementptr inbounds [258 x double]* %1342, i32 0, i64 %1336
  store double %1335, double* %1343, align 8
  br label %1344

; <label>:1344                                    ; preds = %1326
  %1345 = load i64* %iindex, align 8
  %1346 = add nsw i64 %1345, 1
  store i64 %1346, i64* %iindex, align 8
  br label %1322

; <label>:1347                                    ; preds = %1322
  br label %1348

; <label>:1348                                    ; preds = %1347
  %1349 = load i64* %i, align 8
  %1350 = add nsw i64 %1349, 1
  store i64 %1350, i64* %i, align 8
  br label %1316

; <label>:1351                                    ; preds = %1316
  br label %1352

; <label>:1352                                    ; preds = %1351
  %1353 = load i64* %psiindex, align 8
  %1354 = add nsw i64 %1353, 1
  store i64 %1354, i64* %psiindex, align 8
  br label %1088

; <label>:1355                                    ; preds = %1088
  %1356 = load %struct.bars_struct** @bars, align 8
  %1357 = getelementptr inbounds %struct.bars_struct* %1356, i32 0, i32 0
  %1358 = getelementptr inbounds %struct.anon* %1357, i32 0, i32 0
  %1359 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %1358) #6
  %1360 = sext i32 %1359 to i64
  store i64 %1360, i64* %Error, align 8
  %1361 = load i64* %Error, align 8
  %1362 = icmp ne i64 %1361, 0
  br i1 %1362, label %1363, label %1365

; <label>:1363                                    ; preds = %1355
  %1364 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str41, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:1365                                    ; preds = %1355
  %1366 = load %struct.bars_struct** @bars, align 8
  %1367 = getelementptr inbounds %struct.bars_struct* %1366, i32 0, i32 0
  %1368 = getelementptr inbounds %struct.anon* %1367, i32 0, i32 3
  %1369 = load i64* %1368, align 8
  store i64 %1369, i64* %Cycle, align 8
  %1370 = load %struct.bars_struct** @bars, align 8
  %1371 = getelementptr inbounds %struct.bars_struct* %1370, i32 0, i32 0
  %1372 = getelementptr inbounds %struct.anon* %1371, i32 0, i32 2
  %1373 = load i64* %1372, align 8
  %1374 = add i64 %1373, 1
  store i64 %1374, i64* %1372, align 8
  %1375 = load i64* @nprocs, align 8
  %1376 = icmp ne i64 %1374, %1375
  br i1 %1376, label %1377, label %1405

; <label>:1377                                    ; preds = %1365
  %1378 = bitcast i64* %Cancel to i32*
  %1379 = call i32 @pthread_setcancelstate(i32 1, i32* %1378)
  br label %1380

; <label>:1380                                    ; preds = %1399, %1377
  %1381 = load i64* %Cycle, align 8
  %1382 = load %struct.bars_struct** @bars, align 8
  %1383 = getelementptr inbounds %struct.bars_struct* %1382, i32 0, i32 0
  %1384 = getelementptr inbounds %struct.anon* %1383, i32 0, i32 3
  %1385 = load i64* %1384, align 8
  %1386 = icmp eq i64 %1381, %1385
  br i1 %1386, label %1387, label %1400

; <label>:1387                                    ; preds = %1380
  %1388 = load %struct.bars_struct** @bars, align 8
  %1389 = getelementptr inbounds %struct.bars_struct* %1388, i32 0, i32 0
  %1390 = getelementptr inbounds %struct.anon* %1389, i32 0, i32 1
  %1391 = load %struct.bars_struct** @bars, align 8
  %1392 = getelementptr inbounds %struct.bars_struct* %1391, i32 0, i32 0
  %1393 = getelementptr inbounds %struct.anon* %1392, i32 0, i32 0
  %1394 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %1390, %union.pthread_mutex_t* %1393)
  %1395 = sext i32 %1394 to i64
  store i64 %1395, i64* %Error, align 8
  %1396 = load i64* %Error, align 8
  %1397 = icmp ne i64 %1396, 0
  br i1 %1397, label %1398, label %1399

; <label>:1398                                    ; preds = %1387
  br label %1400

; <label>:1399                                    ; preds = %1387
  br label %1380

; <label>:1400                                    ; preds = %1398, %1380
  %1401 = load i64* %Cancel, align 8
  %1402 = trunc i64 %1401 to i32
  %1403 = bitcast i64* %Temp to i32*
  %1404 = call i32 @pthread_setcancelstate(i32 %1402, i32* %1403)
  br label %1425

; <label>:1405                                    ; preds = %1365
  %1406 = load %struct.bars_struct** @bars, align 8
  %1407 = getelementptr inbounds %struct.bars_struct* %1406, i32 0, i32 0
  %1408 = getelementptr inbounds %struct.anon* %1407, i32 0, i32 3
  %1409 = load i64* %1408, align 8
  %1410 = icmp ne i64 %1409, 0
  %1411 = xor i1 %1410, true
  %1412 = zext i1 %1411 to i32
  %1413 = sext i32 %1412 to i64
  %1414 = load %struct.bars_struct** @bars, align 8
  %1415 = getelementptr inbounds %struct.bars_struct* %1414, i32 0, i32 0
  %1416 = getelementptr inbounds %struct.anon* %1415, i32 0, i32 3
  store i64 %1413, i64* %1416, align 8
  %1417 = load %struct.bars_struct** @bars, align 8
  %1418 = getelementptr inbounds %struct.bars_struct* %1417, i32 0, i32 0
  %1419 = getelementptr inbounds %struct.anon* %1418, i32 0, i32 2
  store i64 0, i64* %1419, align 8
  %1420 = load %struct.bars_struct** @bars, align 8
  %1421 = getelementptr inbounds %struct.bars_struct* %1420, i32 0, i32 0
  %1422 = getelementptr inbounds %struct.anon* %1421, i32 0, i32 1
  %1423 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %1422) #6
  %1424 = sext i32 %1423 to i64
  store i64 %1424, i64* %Error, align 8
  br label %1425

; <label>:1425                                    ; preds = %1405, %1400
  %1426 = load %struct.bars_struct** @bars, align 8
  %1427 = getelementptr inbounds %struct.bars_struct* %1426, i32 0, i32 0
  %1428 = getelementptr inbounds %struct.anon* %1427, i32 0, i32 0
  %1429 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %1428) #6
  store i64 0, i64* %psiindex, align 8
  br label %1430

; <label>:1430                                    ; preds = %1694, %1425
  %1431 = load i64* %psiindex, align 8
  %1432 = icmp sle i64 %1431, 1
  br i1 %1432, label %1433, label %1697

; <label>:1433                                    ; preds = %1430
  %1434 = load i64* %1, align 8
  %1435 = icmp eq i64 %1434, 0
  br i1 %1435, label %1436, label %1450

; <label>:1436                                    ; preds = %1433
  %1437 = load i64* %psiindex, align 8
  %1438 = load %struct.fields_struct** @fields, align 8
  %1439 = getelementptr inbounds %struct.fields_struct* %1438, i32 0, i32 1
  %1440 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1439, i32 0, i64 %1437
  %1441 = getelementptr inbounds [258 x [258 x double]]* %1440, i32 0, i64 0
  %1442 = getelementptr inbounds [258 x double]* %1441, i32 0, i64 0
  %1443 = load double* %1442, align 8
  %1444 = load i64* %psiindex, align 8
  %1445 = load %struct.fields_struct** @fields, align 8
  %1446 = getelementptr inbounds %struct.fields_struct* %1445, i32 0, i32 0
  %1447 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1446, i32 0, i64 %1444
  %1448 = getelementptr inbounds [258 x [258 x double]]* %1447, i32 0, i64 0
  %1449 = getelementptr inbounds [258 x double]* %1448, i32 0, i64 0
  store double %1443, double* %1449, align 8
  br label %1450

; <label>:1450                                    ; preds = %1436, %1433
  %1451 = load i64* %1, align 8
  %1452 = load i64* @xprocs, align 8
  %1453 = sub nsw i64 %1452, 1
  %1454 = icmp eq i64 %1451, %1453
  br i1 %1454, label %1455, label %1473

; <label>:1455                                    ; preds = %1450
  %1456 = load i64* @jm, align 8
  %1457 = sub nsw i64 %1456, 1
  %1458 = load i64* %psiindex, align 8
  %1459 = load %struct.fields_struct** @fields, align 8
  %1460 = getelementptr inbounds %struct.fields_struct* %1459, i32 0, i32 1
  %1461 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1460, i32 0, i64 %1458
  %1462 = getelementptr inbounds [258 x [258 x double]]* %1461, i32 0, i64 0
  %1463 = getelementptr inbounds [258 x double]* %1462, i32 0, i64 %1457
  %1464 = load double* %1463, align 8
  %1465 = load i64* @jm, align 8
  %1466 = sub nsw i64 %1465, 1
  %1467 = load i64* %psiindex, align 8
  %1468 = load %struct.fields_struct** @fields, align 8
  %1469 = getelementptr inbounds %struct.fields_struct* %1468, i32 0, i32 0
  %1470 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1469, i32 0, i64 %1467
  %1471 = getelementptr inbounds [258 x [258 x double]]* %1470, i32 0, i64 0
  %1472 = getelementptr inbounds [258 x double]* %1471, i32 0, i64 %1466
  store double %1464, double* %1472, align 8
  br label %1473

; <label>:1473                                    ; preds = %1455, %1450
  %1474 = load i64* %1, align 8
  %1475 = load i64* @nprocs, align 8
  %1476 = load i64* @xprocs, align 8
  %1477 = sub nsw i64 %1475, %1476
  %1478 = icmp eq i64 %1474, %1477
  br i1 %1478, label %1479, label %1497

; <label>:1479                                    ; preds = %1473
  %1480 = load i64* @im, align 8
  %1481 = sub nsw i64 %1480, 1
  %1482 = load i64* %psiindex, align 8
  %1483 = load %struct.fields_struct** @fields, align 8
  %1484 = getelementptr inbounds %struct.fields_struct* %1483, i32 0, i32 1
  %1485 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1484, i32 0, i64 %1482
  %1486 = getelementptr inbounds [258 x [258 x double]]* %1485, i32 0, i64 %1481
  %1487 = getelementptr inbounds [258 x double]* %1486, i32 0, i64 0
  %1488 = load double* %1487, align 8
  %1489 = load i64* @im, align 8
  %1490 = sub nsw i64 %1489, 1
  %1491 = load i64* %psiindex, align 8
  %1492 = load %struct.fields_struct** @fields, align 8
  %1493 = getelementptr inbounds %struct.fields_struct* %1492, i32 0, i32 0
  %1494 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1493, i32 0, i64 %1491
  %1495 = getelementptr inbounds [258 x [258 x double]]* %1494, i32 0, i64 %1490
  %1496 = getelementptr inbounds [258 x double]* %1495, i32 0, i64 0
  store double %1488, double* %1496, align 8
  br label %1497

; <label>:1497                                    ; preds = %1479, %1473
  %1498 = load i64* %1, align 8
  %1499 = load i64* @nprocs, align 8
  %1500 = sub nsw i64 %1499, 1
  %1501 = icmp eq i64 %1498, %1500
  br i1 %1501, label %1502, label %1524

; <label>:1502                                    ; preds = %1497
  %1503 = load i64* @jm, align 8
  %1504 = sub nsw i64 %1503, 1
  %1505 = load i64* @im, align 8
  %1506 = sub nsw i64 %1505, 1
  %1507 = load i64* %psiindex, align 8
  %1508 = load %struct.fields_struct** @fields, align 8
  %1509 = getelementptr inbounds %struct.fields_struct* %1508, i32 0, i32 1
  %1510 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1509, i32 0, i64 %1507
  %1511 = getelementptr inbounds [258 x [258 x double]]* %1510, i32 0, i64 %1506
  %1512 = getelementptr inbounds [258 x double]* %1511, i32 0, i64 %1504
  %1513 = load double* %1512, align 8
  %1514 = load i64* @jm, align 8
  %1515 = sub nsw i64 %1514, 1
  %1516 = load i64* @im, align 8
  %1517 = sub nsw i64 %1516, 1
  %1518 = load i64* %psiindex, align 8
  %1519 = load %struct.fields_struct** @fields, align 8
  %1520 = getelementptr inbounds %struct.fields_struct* %1519, i32 0, i32 0
  %1521 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1520, i32 0, i64 %1518
  %1522 = getelementptr inbounds [258 x [258 x double]]* %1521, i32 0, i64 %1517
  %1523 = getelementptr inbounds [258 x double]* %1522, i32 0, i64 %1515
  store double %1513, double* %1523, align 8
  br label %1524

; <label>:1524                                    ; preds = %1502, %1497
  %1525 = load i64* %2, align 8
  %1526 = icmp eq i64 %1525, 1
  br i1 %1526, label %1527, label %1553

; <label>:1527                                    ; preds = %1524
  %1528 = load i64* %5, align 8
  store i64 %1528, i64* %j, align 8
  br label %1529

; <label>:1529                                    ; preds = %1549, %1527
  %1530 = load i64* %j, align 8
  %1531 = load i64* %6, align 8
  %1532 = icmp sle i64 %1530, %1531
  br i1 %1532, label %1533, label %1552

; <label>:1533                                    ; preds = %1529
  %1534 = load i64* %j, align 8
  %1535 = load i64* %psiindex, align 8
  %1536 = load %struct.fields_struct** @fields, align 8
  %1537 = getelementptr inbounds %struct.fields_struct* %1536, i32 0, i32 1
  %1538 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1537, i32 0, i64 %1535
  %1539 = getelementptr inbounds [258 x [258 x double]]* %1538, i32 0, i64 0
  %1540 = getelementptr inbounds [258 x double]* %1539, i32 0, i64 %1534
  %1541 = load double* %1540, align 8
  %1542 = load i64* %j, align 8
  %1543 = load i64* %psiindex, align 8
  %1544 = load %struct.fields_struct** @fields, align 8
  %1545 = getelementptr inbounds %struct.fields_struct* %1544, i32 0, i32 0
  %1546 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1545, i32 0, i64 %1543
  %1547 = getelementptr inbounds [258 x [258 x double]]* %1546, i32 0, i64 0
  %1548 = getelementptr inbounds [258 x double]* %1547, i32 0, i64 %1542
  store double %1541, double* %1548, align 8
  br label %1549

; <label>:1549                                    ; preds = %1533
  %1550 = load i64* %j, align 8
  %1551 = add nsw i64 %1550, 1
  store i64 %1551, i64* %j, align 8
  br label %1529

; <label>:1552                                    ; preds = %1529
  br label %1553

; <label>:1553                                    ; preds = %1552, %1524
  %1554 = load i64* %2, align 8
  %1555 = load i64* %4, align 8
  %1556 = add nsw i64 %1554, %1555
  %1557 = load i64* @im, align 8
  %1558 = sub nsw i64 %1557, 1
  %1559 = icmp eq i64 %1556, %1558
  br i1 %1559, label %1560, label %1590

; <label>:1560                                    ; preds = %1553
  %1561 = load i64* %5, align 8
  store i64 %1561, i64* %j, align 8
  br label %1562

; <label>:1562                                    ; preds = %1586, %1560
  %1563 = load i64* %j, align 8
  %1564 = load i64* %6, align 8
  %1565 = icmp sle i64 %1563, %1564
  br i1 %1565, label %1566, label %1589

; <label>:1566                                    ; preds = %1562
  %1567 = load i64* %j, align 8
  %1568 = load i64* @im, align 8
  %1569 = sub nsw i64 %1568, 1
  %1570 = load i64* %psiindex, align 8
  %1571 = load %struct.fields_struct** @fields, align 8
  %1572 = getelementptr inbounds %struct.fields_struct* %1571, i32 0, i32 1
  %1573 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1572, i32 0, i64 %1570
  %1574 = getelementptr inbounds [258 x [258 x double]]* %1573, i32 0, i64 %1569
  %1575 = getelementptr inbounds [258 x double]* %1574, i32 0, i64 %1567
  %1576 = load double* %1575, align 8
  %1577 = load i64* %j, align 8
  %1578 = load i64* @im, align 8
  %1579 = sub nsw i64 %1578, 1
  %1580 = load i64* %psiindex, align 8
  %1581 = load %struct.fields_struct** @fields, align 8
  %1582 = getelementptr inbounds %struct.fields_struct* %1581, i32 0, i32 0
  %1583 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1582, i32 0, i64 %1580
  %1584 = getelementptr inbounds [258 x [258 x double]]* %1583, i32 0, i64 %1579
  %1585 = getelementptr inbounds [258 x double]* %1584, i32 0, i64 %1577
  store double %1576, double* %1585, align 8
  br label %1586

; <label>:1586                                    ; preds = %1566
  %1587 = load i64* %j, align 8
  %1588 = add nsw i64 %1587, 1
  store i64 %1588, i64* %j, align 8
  br label %1562

; <label>:1589                                    ; preds = %1562
  br label %1590

; <label>:1590                                    ; preds = %1589, %1553
  %1591 = load i64* %5, align 8
  %1592 = icmp eq i64 %1591, 1
  br i1 %1592, label %1593, label %1619

; <label>:1593                                    ; preds = %1590
  %1594 = load i64* %2, align 8
  store i64 %1594, i64* %j, align 8
  br label %1595

; <label>:1595                                    ; preds = %1615, %1593
  %1596 = load i64* %j, align 8
  %1597 = load i64* %3, align 8
  %1598 = icmp sle i64 %1596, %1597
  br i1 %1598, label %1599, label %1618

; <label>:1599                                    ; preds = %1595
  %1600 = load i64* %j, align 8
  %1601 = load i64* %psiindex, align 8
  %1602 = load %struct.fields_struct** @fields, align 8
  %1603 = getelementptr inbounds %struct.fields_struct* %1602, i32 0, i32 1
  %1604 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1603, i32 0, i64 %1601
  %1605 = getelementptr inbounds [258 x [258 x double]]* %1604, i32 0, i64 %1600
  %1606 = getelementptr inbounds [258 x double]* %1605, i32 0, i64 0
  %1607 = load double* %1606, align 8
  %1608 = load i64* %j, align 8
  %1609 = load i64* %psiindex, align 8
  %1610 = load %struct.fields_struct** @fields, align 8
  %1611 = getelementptr inbounds %struct.fields_struct* %1610, i32 0, i32 0
  %1612 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1611, i32 0, i64 %1609
  %1613 = getelementptr inbounds [258 x [258 x double]]* %1612, i32 0, i64 %1608
  %1614 = getelementptr inbounds [258 x double]* %1613, i32 0, i64 0
  store double %1607, double* %1614, align 8
  br label %1615

; <label>:1615                                    ; preds = %1599
  %1616 = load i64* %j, align 8
  %1617 = add nsw i64 %1616, 1
  store i64 %1617, i64* %j, align 8
  br label %1595

; <label>:1618                                    ; preds = %1595
  br label %1619

; <label>:1619                                    ; preds = %1618, %1590
  %1620 = load i64* %5, align 8
  %1621 = load i64* %7, align 8
  %1622 = add nsw i64 %1620, %1621
  %1623 = load i64* @jm, align 8
  %1624 = sub nsw i64 %1623, 1
  %1625 = icmp eq i64 %1622, %1624
  br i1 %1625, label %1626, label %1656

; <label>:1626                                    ; preds = %1619
  %1627 = load i64* %2, align 8
  store i64 %1627, i64* %j, align 8
  br label %1628

; <label>:1628                                    ; preds = %1652, %1626
  %1629 = load i64* %j, align 8
  %1630 = load i64* %3, align 8
  %1631 = icmp sle i64 %1629, %1630
  br i1 %1631, label %1632, label %1655

; <label>:1632                                    ; preds = %1628
  %1633 = load i64* @jm, align 8
  %1634 = sub nsw i64 %1633, 1
  %1635 = load i64* %j, align 8
  %1636 = load i64* %psiindex, align 8
  %1637 = load %struct.fields_struct** @fields, align 8
  %1638 = getelementptr inbounds %struct.fields_struct* %1637, i32 0, i32 1
  %1639 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1638, i32 0, i64 %1636
  %1640 = getelementptr inbounds [258 x [258 x double]]* %1639, i32 0, i64 %1635
  %1641 = getelementptr inbounds [258 x double]* %1640, i32 0, i64 %1634
  %1642 = load double* %1641, align 8
  %1643 = load i64* @jm, align 8
  %1644 = sub nsw i64 %1643, 1
  %1645 = load i64* %j, align 8
  %1646 = load i64* %psiindex, align 8
  %1647 = load %struct.fields_struct** @fields, align 8
  %1648 = getelementptr inbounds %struct.fields_struct* %1647, i32 0, i32 0
  %1649 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1648, i32 0, i64 %1646
  %1650 = getelementptr inbounds [258 x [258 x double]]* %1649, i32 0, i64 %1645
  %1651 = getelementptr inbounds [258 x double]* %1650, i32 0, i64 %1644
  store double %1642, double* %1651, align 8
  br label %1652

; <label>:1652                                    ; preds = %1632
  %1653 = load i64* %j, align 8
  %1654 = add nsw i64 %1653, 1
  store i64 %1654, i64* %j, align 8
  br label %1628

; <label>:1655                                    ; preds = %1628
  br label %1656

; <label>:1656                                    ; preds = %1655, %1619
  %1657 = load i64* %2, align 8
  store i64 %1657, i64* %i, align 8
  br label %1658

; <label>:1658                                    ; preds = %1690, %1656
  %1659 = load i64* %i, align 8
  %1660 = load i64* %3, align 8
  %1661 = icmp sle i64 %1659, %1660
  br i1 %1661, label %1662, label %1693

; <label>:1662                                    ; preds = %1658
  %1663 = load i64* %5, align 8
  store i64 %1663, i64* %iindex, align 8
  br label %1664

; <label>:1664                                    ; preds = %1686, %1662
  %1665 = load i64* %iindex, align 8
  %1666 = load i64* %6, align 8
  %1667 = icmp sle i64 %1665, %1666
  br i1 %1667, label %1668, label %1689

; <label>:1668                                    ; preds = %1664
  %1669 = load i64* %iindex, align 8
  %1670 = load i64* %i, align 8
  %1671 = load i64* %psiindex, align 8
  %1672 = load %struct.fields_struct** @fields, align 8
  %1673 = getelementptr inbounds %struct.fields_struct* %1672, i32 0, i32 1
  %1674 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1673, i32 0, i64 %1671
  %1675 = getelementptr inbounds [258 x [258 x double]]* %1674, i32 0, i64 %1670
  %1676 = getelementptr inbounds [258 x double]* %1675, i32 0, i64 %1669
  %1677 = load double* %1676, align 8
  %1678 = load i64* %iindex, align 8
  %1679 = load i64* %i, align 8
  %1680 = load i64* %psiindex, align 8
  %1681 = load %struct.fields_struct** @fields, align 8
  %1682 = getelementptr inbounds %struct.fields_struct* %1681, i32 0, i32 0
  %1683 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1682, i32 0, i64 %1680
  %1684 = getelementptr inbounds [258 x [258 x double]]* %1683, i32 0, i64 %1679
  %1685 = getelementptr inbounds [258 x double]* %1684, i32 0, i64 %1678
  store double %1677, double* %1685, align 8
  br label %1686

; <label>:1686                                    ; preds = %1668
  %1687 = load i64* %iindex, align 8
  %1688 = add nsw i64 %1687, 1
  store i64 %1688, i64* %iindex, align 8
  br label %1664

; <label>:1689                                    ; preds = %1664
  br label %1690

; <label>:1690                                    ; preds = %1689
  %1691 = load i64* %i, align 8
  %1692 = add nsw i64 %1691, 1
  store i64 %1692, i64* %i, align 8
  br label %1658

; <label>:1693                                    ; preds = %1658
  br label %1694

; <label>:1694                                    ; preds = %1693
  %1695 = load i64* %psiindex, align 8
  %1696 = add nsw i64 %1695, 1
  store i64 %1696, i64* %psiindex, align 8
  br label %1430

; <label>:1697                                    ; preds = %1430
  store i64 0, i64* %psiindex, align 8
  br label %1698

; <label>:1698                                    ; preds = %1773, %1697
  %1699 = load i64* %psiindex, align 8
  %1700 = icmp sle i64 %1699, 1
  br i1 %1700, label %1701, label %1776

; <label>:1701                                    ; preds = %1698
  %1702 = load i64* %1, align 8
  %1703 = icmp eq i64 %1702, 0
  br i1 %1703, label %1704, label %1711

; <label>:1704                                    ; preds = %1701
  %1705 = load i64* %psiindex, align 8
  %1706 = load %struct.wrk5_struct** @wrk5, align 8
  %1707 = getelementptr inbounds %struct.wrk5_struct* %1706, i32 0, i32 0
  %1708 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1707, i32 0, i64 %1705
  %1709 = getelementptr inbounds [258 x [258 x double]]* %1708, i32 0, i64 0
  %1710 = getelementptr inbounds [258 x double]* %1709, i32 0, i64 0
  store double 0.000000e+00, double* %1710, align 8
  br label %1711

; <label>:1711                                    ; preds = %1704, %1701
  %1712 = load i64* %1, align 8
  %1713 = load i64* @nprocs, align 8
  %1714 = load i64* @xprocs, align 8
  %1715 = sub nsw i64 %1713, %1714
  %1716 = icmp eq i64 %1712, %1715
  br i1 %1716, label %1717, label %1726

; <label>:1717                                    ; preds = %1711
  %1718 = load i64* @im, align 8
  %1719 = sub nsw i64 %1718, 1
  %1720 = load i64* %psiindex, align 8
  %1721 = load %struct.wrk5_struct** @wrk5, align 8
  %1722 = getelementptr inbounds %struct.wrk5_struct* %1721, i32 0, i32 0
  %1723 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1722, i32 0, i64 %1720
  %1724 = getelementptr inbounds [258 x [258 x double]]* %1723, i32 0, i64 %1719
  %1725 = getelementptr inbounds [258 x double]* %1724, i32 0, i64 0
  store double 0.000000e+00, double* %1725, align 8
  br label %1726

; <label>:1726                                    ; preds = %1717, %1711
  %1727 = load i64* %1, align 8
  %1728 = load i64* @xprocs, align 8
  %1729 = sub nsw i64 %1728, 1
  %1730 = icmp eq i64 %1727, %1729
  br i1 %1730, label %1731, label %1740

; <label>:1731                                    ; preds = %1726
  %1732 = load i64* @jm, align 8
  %1733 = sub nsw i64 %1732, 1
  %1734 = load i64* %psiindex, align 8
  %1735 = load %struct.wrk5_struct** @wrk5, align 8
  %1736 = getelementptr inbounds %struct.wrk5_struct* %1735, i32 0, i32 0
  %1737 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1736, i32 0, i64 %1734
  %1738 = getelementptr inbounds [258 x [258 x double]]* %1737, i32 0, i64 0
  %1739 = getelementptr inbounds [258 x double]* %1738, i32 0, i64 %1733
  store double 0.000000e+00, double* %1739, align 8
  br label %1740

; <label>:1740                                    ; preds = %1731, %1726
  %1741 = load i64* %1, align 8
  %1742 = load i64* @nprocs, align 8
  %1743 = sub nsw i64 %1742, 1
  %1744 = icmp eq i64 %1741, %1743
  br i1 %1744, label %1745, label %1756

; <label>:1745                                    ; preds = %1740
  %1746 = load i64* @jm, align 8
  %1747 = sub nsw i64 %1746, 1
  %1748 = load i64* @im, align 8
  %1749 = sub nsw i64 %1748, 1
  %1750 = load i64* %psiindex, align 8
  %1751 = load %struct.wrk5_struct** @wrk5, align 8
  %1752 = getelementptr inbounds %struct.wrk5_struct* %1751, i32 0, i32 0
  %1753 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1752, i32 0, i64 %1750
  %1754 = getelementptr inbounds [258 x [258 x double]]* %1753, i32 0, i64 %1749
  %1755 = getelementptr inbounds [258 x double]* %1754, i32 0, i64 %1747
  store double 0.000000e+00, double* %1755, align 8
  br label %1756

; <label>:1756                                    ; preds = %1745, %1740
  %1757 = load i64* %psiindex, align 8
  %1758 = load %struct.fields_struct** @fields, align 8
  %1759 = getelementptr inbounds %struct.fields_struct* %1758, i32 0, i32 1
  %1760 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1759, i32 0, i64 %1757
  %1761 = getelementptr inbounds [258 x [258 x double]]* %1760, i32 0, i32 0
  %1762 = load i64* %psiindex, align 8
  %1763 = load %struct.wrk5_struct** @wrk5, align 8
  %1764 = getelementptr inbounds %struct.wrk5_struct* %1763, i32 0, i32 0
  %1765 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1764, i32 0, i64 %1762
  %1766 = getelementptr inbounds [258 x [258 x double]]* %1765, i32 0, i32 0
  %1767 = load i64* %2, align 8
  %1768 = load i64* %3, align 8
  %1769 = load i64* %5, align 8
  %1770 = load i64* %6, align 8
  %1771 = load i64* %4, align 8
  %1772 = load i64* %7, align 8
  call void @laplacalc([258 x double]* %1761, [258 x double]* %1766, i64 %1767, i64 %1768, i64 %1769, i64 %1770, i64 %1771, i64 %1772)
  br label %1773

; <label>:1773                                    ; preds = %1756
  %1774 = load i64* %psiindex, align 8
  %1775 = add nsw i64 %1774, 1
  store i64 %1775, i64* %psiindex, align 8
  br label %1698

; <label>:1776                                    ; preds = %1698
  store i64 0, i64* %psiindex, align 8
  br label %1777

; <label>:1777                                    ; preds = %2095, %1776
  %1778 = load i64* %psiindex, align 8
  %1779 = icmp sle i64 %1778, 1
  br i1 %1779, label %1780, label %2098

; <label>:1780                                    ; preds = %1777
  %1781 = load i64* %1, align 8
  %1782 = icmp eq i64 %1781, 0
  br i1 %1782, label %1783, label %1802

; <label>:1783                                    ; preds = %1780
  %1784 = load i64* %psiindex, align 8
  %1785 = load %struct.wrk3_struct** @wrk3, align 8
  %1786 = getelementptr inbounds %struct.wrk3_struct* %1785, i32 0, i32 0
  %1787 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1786, i32 0, i64 %1784
  %1788 = getelementptr inbounds [258 x [258 x double]]* %1787, i32 0, i64 0
  %1789 = getelementptr inbounds [258 x double]* %1788, i32 0, i64 0
  %1790 = load double* %1789, align 8
  %1791 = load %struct.wrk2_struct** @wrk2, align 8
  %1792 = getelementptr inbounds %struct.wrk2_struct* %1791, i32 0, i32 1
  %1793 = getelementptr inbounds [258 x double]* %1792, i32 0, i64 0
  %1794 = load double* %1793, align 8
  %1795 = fadd double %1790, %1794
  %1796 = load i64* %psiindex, align 8
  %1797 = load %struct.wrk3_struct** @wrk3, align 8
  %1798 = getelementptr inbounds %struct.wrk3_struct* %1797, i32 0, i32 0
  %1799 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1798, i32 0, i64 %1796
  %1800 = getelementptr inbounds [258 x [258 x double]]* %1799, i32 0, i64 0
  %1801 = getelementptr inbounds [258 x double]* %1800, i32 0, i64 0
  store double %1795, double* %1801, align 8
  br label %1802

; <label>:1802                                    ; preds = %1783, %1780
  %1803 = load i64* %1, align 8
  %1804 = load i64* @nprocs, align 8
  %1805 = load i64* @xprocs, align 8
  %1806 = sub nsw i64 %1804, %1805
  %1807 = icmp eq i64 %1803, %1806
  br i1 %1807, label %1808, label %1831

; <label>:1808                                    ; preds = %1802
  %1809 = load i64* @im, align 8
  %1810 = sub nsw i64 %1809, 1
  %1811 = load i64* %psiindex, align 8
  %1812 = load %struct.wrk3_struct** @wrk3, align 8
  %1813 = getelementptr inbounds %struct.wrk3_struct* %1812, i32 0, i32 0
  %1814 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1813, i32 0, i64 %1811
  %1815 = getelementptr inbounds [258 x [258 x double]]* %1814, i32 0, i64 %1810
  %1816 = getelementptr inbounds [258 x double]* %1815, i32 0, i64 0
  %1817 = load double* %1816, align 8
  %1818 = load %struct.wrk2_struct** @wrk2, align 8
  %1819 = getelementptr inbounds %struct.wrk2_struct* %1818, i32 0, i32 1
  %1820 = getelementptr inbounds [258 x double]* %1819, i32 0, i64 0
  %1821 = load double* %1820, align 8
  %1822 = fadd double %1817, %1821
  %1823 = load i64* @im, align 8
  %1824 = sub nsw i64 %1823, 1
  %1825 = load i64* %psiindex, align 8
  %1826 = load %struct.wrk3_struct** @wrk3, align 8
  %1827 = getelementptr inbounds %struct.wrk3_struct* %1826, i32 0, i32 0
  %1828 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1827, i32 0, i64 %1825
  %1829 = getelementptr inbounds [258 x [258 x double]]* %1828, i32 0, i64 %1824
  %1830 = getelementptr inbounds [258 x double]* %1829, i32 0, i64 0
  store double %1822, double* %1830, align 8
  br label %1831

; <label>:1831                                    ; preds = %1808, %1802
  %1832 = load i64* %1, align 8
  %1833 = load i64* @xprocs, align 8
  %1834 = sub nsw i64 %1833, 1
  %1835 = icmp eq i64 %1832, %1834
  br i1 %1835, label %1836, label %1861

; <label>:1836                                    ; preds = %1831
  %1837 = load i64* @jm, align 8
  %1838 = sub nsw i64 %1837, 1
  %1839 = load i64* %psiindex, align 8
  %1840 = load %struct.wrk3_struct** @wrk3, align 8
  %1841 = getelementptr inbounds %struct.wrk3_struct* %1840, i32 0, i32 0
  %1842 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1841, i32 0, i64 %1839
  %1843 = getelementptr inbounds [258 x [258 x double]]* %1842, i32 0, i64 0
  %1844 = getelementptr inbounds [258 x double]* %1843, i32 0, i64 %1838
  %1845 = load double* %1844, align 8
  %1846 = load i64* @jm, align 8
  %1847 = sub nsw i64 %1846, 1
  %1848 = load %struct.wrk2_struct** @wrk2, align 8
  %1849 = getelementptr inbounds %struct.wrk2_struct* %1848, i32 0, i32 1
  %1850 = getelementptr inbounds [258 x double]* %1849, i32 0, i64 %1847
  %1851 = load double* %1850, align 8
  %1852 = fadd double %1845, %1851
  %1853 = load i64* @jm, align 8
  %1854 = sub nsw i64 %1853, 1
  %1855 = load i64* %psiindex, align 8
  %1856 = load %struct.wrk3_struct** @wrk3, align 8
  %1857 = getelementptr inbounds %struct.wrk3_struct* %1856, i32 0, i32 0
  %1858 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1857, i32 0, i64 %1855
  %1859 = getelementptr inbounds [258 x [258 x double]]* %1858, i32 0, i64 0
  %1860 = getelementptr inbounds [258 x double]* %1859, i32 0, i64 %1854
  store double %1852, double* %1860, align 8
  br label %1861

; <label>:1861                                    ; preds = %1836, %1831
  %1862 = load i64* %1, align 8
  %1863 = load i64* @nprocs, align 8
  %1864 = sub nsw i64 %1863, 1
  %1865 = icmp eq i64 %1862, %1864
  br i1 %1865, label %1866, label %1895

; <label>:1866                                    ; preds = %1861
  %1867 = load i64* @jm, align 8
  %1868 = sub nsw i64 %1867, 1
  %1869 = load i64* @im, align 8
  %1870 = sub nsw i64 %1869, 1
  %1871 = load i64* %psiindex, align 8
  %1872 = load %struct.wrk3_struct** @wrk3, align 8
  %1873 = getelementptr inbounds %struct.wrk3_struct* %1872, i32 0, i32 0
  %1874 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1873, i32 0, i64 %1871
  %1875 = getelementptr inbounds [258 x [258 x double]]* %1874, i32 0, i64 %1870
  %1876 = getelementptr inbounds [258 x double]* %1875, i32 0, i64 %1868
  %1877 = load double* %1876, align 8
  %1878 = load i64* @jm, align 8
  %1879 = sub nsw i64 %1878, 1
  %1880 = load %struct.wrk2_struct** @wrk2, align 8
  %1881 = getelementptr inbounds %struct.wrk2_struct* %1880, i32 0, i32 1
  %1882 = getelementptr inbounds [258 x double]* %1881, i32 0, i64 %1879
  %1883 = load double* %1882, align 8
  %1884 = fadd double %1877, %1883
  %1885 = load i64* @jm, align 8
  %1886 = sub nsw i64 %1885, 1
  %1887 = load i64* @im, align 8
  %1888 = sub nsw i64 %1887, 1
  %1889 = load i64* %psiindex, align 8
  %1890 = load %struct.wrk3_struct** @wrk3, align 8
  %1891 = getelementptr inbounds %struct.wrk3_struct* %1890, i32 0, i32 0
  %1892 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1891, i32 0, i64 %1889
  %1893 = getelementptr inbounds [258 x [258 x double]]* %1892, i32 0, i64 %1888
  %1894 = getelementptr inbounds [258 x double]* %1893, i32 0, i64 %1886
  store double %1884, double* %1894, align 8
  br label %1895

; <label>:1895                                    ; preds = %1866, %1861
  %1896 = load i64* %2, align 8
  %1897 = icmp eq i64 %1896, 1
  br i1 %1897, label %1898, label %1930

; <label>:1898                                    ; preds = %1895
  %1899 = load i64* %5, align 8
  store i64 %1899, i64* %j, align 8
  br label %1900

; <label>:1900                                    ; preds = %1926, %1898
  %1901 = load i64* %j, align 8
  %1902 = load i64* %6, align 8
  %1903 = icmp sle i64 %1901, %1902
  br i1 %1903, label %1904, label %1929

; <label>:1904                                    ; preds = %1900
  %1905 = load i64* %j, align 8
  %1906 = load i64* %psiindex, align 8
  %1907 = load %struct.wrk3_struct** @wrk3, align 8
  %1908 = getelementptr inbounds %struct.wrk3_struct* %1907, i32 0, i32 0
  %1909 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1908, i32 0, i64 %1906
  %1910 = getelementptr inbounds [258 x [258 x double]]* %1909, i32 0, i64 0
  %1911 = getelementptr inbounds [258 x double]* %1910, i32 0, i64 %1905
  %1912 = load double* %1911, align 8
  %1913 = load i64* %j, align 8
  %1914 = load %struct.wrk2_struct** @wrk2, align 8
  %1915 = getelementptr inbounds %struct.wrk2_struct* %1914, i32 0, i32 1
  %1916 = getelementptr inbounds [258 x double]* %1915, i32 0, i64 %1913
  %1917 = load double* %1916, align 8
  %1918 = fadd double %1912, %1917
  %1919 = load i64* %j, align 8
  %1920 = load i64* %psiindex, align 8
  %1921 = load %struct.wrk3_struct** @wrk3, align 8
  %1922 = getelementptr inbounds %struct.wrk3_struct* %1921, i32 0, i32 0
  %1923 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1922, i32 0, i64 %1920
  %1924 = getelementptr inbounds [258 x [258 x double]]* %1923, i32 0, i64 0
  %1925 = getelementptr inbounds [258 x double]* %1924, i32 0, i64 %1919
  store double %1918, double* %1925, align 8
  br label %1926

; <label>:1926                                    ; preds = %1904
  %1927 = load i64* %j, align 8
  %1928 = add nsw i64 %1927, 1
  store i64 %1928, i64* %j, align 8
  br label %1900

; <label>:1929                                    ; preds = %1900
  br label %1930

; <label>:1930                                    ; preds = %1929, %1895
  %1931 = load i64* %2, align 8
  %1932 = load i64* %4, align 8
  %1933 = add nsw i64 %1931, %1932
  %1934 = load i64* @im, align 8
  %1935 = sub nsw i64 %1934, 1
  %1936 = icmp eq i64 %1933, %1935
  br i1 %1936, label %1937, label %1973

; <label>:1937                                    ; preds = %1930
  %1938 = load i64* %5, align 8
  store i64 %1938, i64* %j, align 8
  br label %1939

; <label>:1939                                    ; preds = %1969, %1937
  %1940 = load i64* %j, align 8
  %1941 = load i64* %6, align 8
  %1942 = icmp sle i64 %1940, %1941
  br i1 %1942, label %1943, label %1972

; <label>:1943                                    ; preds = %1939
  %1944 = load i64* %j, align 8
  %1945 = load i64* @im, align 8
  %1946 = sub nsw i64 %1945, 1
  %1947 = load i64* %psiindex, align 8
  %1948 = load %struct.wrk3_struct** @wrk3, align 8
  %1949 = getelementptr inbounds %struct.wrk3_struct* %1948, i32 0, i32 0
  %1950 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1949, i32 0, i64 %1947
  %1951 = getelementptr inbounds [258 x [258 x double]]* %1950, i32 0, i64 %1946
  %1952 = getelementptr inbounds [258 x double]* %1951, i32 0, i64 %1944
  %1953 = load double* %1952, align 8
  %1954 = load i64* %j, align 8
  %1955 = load %struct.wrk2_struct** @wrk2, align 8
  %1956 = getelementptr inbounds %struct.wrk2_struct* %1955, i32 0, i32 1
  %1957 = getelementptr inbounds [258 x double]* %1956, i32 0, i64 %1954
  %1958 = load double* %1957, align 8
  %1959 = fadd double %1953, %1958
  %1960 = load i64* %j, align 8
  %1961 = load i64* @im, align 8
  %1962 = sub nsw i64 %1961, 1
  %1963 = load i64* %psiindex, align 8
  %1964 = load %struct.wrk3_struct** @wrk3, align 8
  %1965 = getelementptr inbounds %struct.wrk3_struct* %1964, i32 0, i32 0
  %1966 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1965, i32 0, i64 %1963
  %1967 = getelementptr inbounds [258 x [258 x double]]* %1966, i32 0, i64 %1962
  %1968 = getelementptr inbounds [258 x double]* %1967, i32 0, i64 %1960
  store double %1959, double* %1968, align 8
  br label %1969

; <label>:1969                                    ; preds = %1943
  %1970 = load i64* %j, align 8
  %1971 = add nsw i64 %1970, 1
  store i64 %1971, i64* %j, align 8
  br label %1939

; <label>:1972                                    ; preds = %1939
  br label %1973

; <label>:1973                                    ; preds = %1972, %1930
  %1974 = load i64* %5, align 8
  %1975 = icmp eq i64 %1974, 1
  br i1 %1975, label %1976, label %2008

; <label>:1976                                    ; preds = %1973
  %1977 = load i64* %2, align 8
  store i64 %1977, i64* %j, align 8
  br label %1978

; <label>:1978                                    ; preds = %2004, %1976
  %1979 = load i64* %j, align 8
  %1980 = load i64* %3, align 8
  %1981 = icmp sle i64 %1979, %1980
  br i1 %1981, label %1982, label %2007

; <label>:1982                                    ; preds = %1978
  %1983 = load i64* %j, align 8
  %1984 = load i64* %psiindex, align 8
  %1985 = load %struct.wrk3_struct** @wrk3, align 8
  %1986 = getelementptr inbounds %struct.wrk3_struct* %1985, i32 0, i32 0
  %1987 = getelementptr inbounds [2 x [258 x [258 x double]]]* %1986, i32 0, i64 %1984
  %1988 = getelementptr inbounds [258 x [258 x double]]* %1987, i32 0, i64 %1983
  %1989 = getelementptr inbounds [258 x double]* %1988, i32 0, i64 0
  %1990 = load double* %1989, align 8
  %1991 = load i64* %j, align 8
  %1992 = load %struct.wrk2_struct** @wrk2, align 8
  %1993 = getelementptr inbounds %struct.wrk2_struct* %1992, i32 0, i32 1
  %1994 = getelementptr inbounds [258 x double]* %1993, i32 0, i64 %1991
  %1995 = load double* %1994, align 8
  %1996 = fadd double %1990, %1995
  %1997 = load i64* %j, align 8
  %1998 = load i64* %psiindex, align 8
  %1999 = load %struct.wrk3_struct** @wrk3, align 8
  %2000 = getelementptr inbounds %struct.wrk3_struct* %1999, i32 0, i32 0
  %2001 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2000, i32 0, i64 %1998
  %2002 = getelementptr inbounds [258 x [258 x double]]* %2001, i32 0, i64 %1997
  %2003 = getelementptr inbounds [258 x double]* %2002, i32 0, i64 0
  store double %1996, double* %2003, align 8
  br label %2004

; <label>:2004                                    ; preds = %1982
  %2005 = load i64* %j, align 8
  %2006 = add nsw i64 %2005, 1
  store i64 %2006, i64* %j, align 8
  br label %1978

; <label>:2007                                    ; preds = %1978
  br label %2008

; <label>:2008                                    ; preds = %2007, %1973
  %2009 = load i64* %5, align 8
  %2010 = load i64* %7, align 8
  %2011 = add nsw i64 %2009, %2010
  %2012 = load i64* @jm, align 8
  %2013 = sub nsw i64 %2012, 1
  %2014 = icmp eq i64 %2011, %2013
  br i1 %2014, label %2015, label %2051

; <label>:2015                                    ; preds = %2008
  %2016 = load i64* %2, align 8
  store i64 %2016, i64* %j, align 8
  br label %2017

; <label>:2017                                    ; preds = %2047, %2015
  %2018 = load i64* %j, align 8
  %2019 = load i64* %3, align 8
  %2020 = icmp sle i64 %2018, %2019
  br i1 %2020, label %2021, label %2050

; <label>:2021                                    ; preds = %2017
  %2022 = load i64* @jm, align 8
  %2023 = sub nsw i64 %2022, 1
  %2024 = load i64* %j, align 8
  %2025 = load i64* %psiindex, align 8
  %2026 = load %struct.wrk3_struct** @wrk3, align 8
  %2027 = getelementptr inbounds %struct.wrk3_struct* %2026, i32 0, i32 0
  %2028 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2027, i32 0, i64 %2025
  %2029 = getelementptr inbounds [258 x [258 x double]]* %2028, i32 0, i64 %2024
  %2030 = getelementptr inbounds [258 x double]* %2029, i32 0, i64 %2023
  %2031 = load double* %2030, align 8
  %2032 = load i64* %j, align 8
  %2033 = load %struct.wrk2_struct** @wrk2, align 8
  %2034 = getelementptr inbounds %struct.wrk2_struct* %2033, i32 0, i32 1
  %2035 = getelementptr inbounds [258 x double]* %2034, i32 0, i64 %2032
  %2036 = load double* %2035, align 8
  %2037 = fadd double %2031, %2036
  %2038 = load i64* @jm, align 8
  %2039 = sub nsw i64 %2038, 1
  %2040 = load i64* %j, align 8
  %2041 = load i64* %psiindex, align 8
  %2042 = load %struct.wrk3_struct** @wrk3, align 8
  %2043 = getelementptr inbounds %struct.wrk3_struct* %2042, i32 0, i32 0
  %2044 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2043, i32 0, i64 %2041
  %2045 = getelementptr inbounds [258 x [258 x double]]* %2044, i32 0, i64 %2040
  %2046 = getelementptr inbounds [258 x double]* %2045, i32 0, i64 %2039
  store double %2037, double* %2046, align 8
  br label %2047

; <label>:2047                                    ; preds = %2021
  %2048 = load i64* %j, align 8
  %2049 = add nsw i64 %2048, 1
  store i64 %2049, i64* %j, align 8
  br label %2017

; <label>:2050                                    ; preds = %2017
  br label %2051

; <label>:2051                                    ; preds = %2050, %2008
  %2052 = load i64* %2, align 8
  store i64 %2052, i64* %i, align 8
  br label %2053

; <label>:2053                                    ; preds = %2091, %2051
  %2054 = load i64* %i, align 8
  %2055 = load i64* %3, align 8
  %2056 = icmp sle i64 %2054, %2055
  br i1 %2056, label %2057, label %2094

; <label>:2057                                    ; preds = %2053
  %2058 = load i64* %5, align 8
  store i64 %2058, i64* %iindex, align 8
  br label %2059

; <label>:2059                                    ; preds = %2087, %2057
  %2060 = load i64* %iindex, align 8
  %2061 = load i64* %6, align 8
  %2062 = icmp sle i64 %2060, %2061
  br i1 %2062, label %2063, label %2090

; <label>:2063                                    ; preds = %2059
  %2064 = load i64* %iindex, align 8
  %2065 = load i64* %i, align 8
  %2066 = load i64* %psiindex, align 8
  %2067 = load %struct.wrk3_struct** @wrk3, align 8
  %2068 = getelementptr inbounds %struct.wrk3_struct* %2067, i32 0, i32 0
  %2069 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2068, i32 0, i64 %2066
  %2070 = getelementptr inbounds [258 x [258 x double]]* %2069, i32 0, i64 %2065
  %2071 = getelementptr inbounds [258 x double]* %2070, i32 0, i64 %2064
  %2072 = load double* %2071, align 8
  %2073 = load i64* %iindex, align 8
  %2074 = load %struct.wrk2_struct** @wrk2, align 8
  %2075 = getelementptr inbounds %struct.wrk2_struct* %2074, i32 0, i32 1
  %2076 = getelementptr inbounds [258 x double]* %2075, i32 0, i64 %2073
  %2077 = load double* %2076, align 8
  %2078 = fadd double %2072, %2077
  %2079 = load i64* %iindex, align 8
  %2080 = load i64* %i, align 8
  %2081 = load i64* %psiindex, align 8
  %2082 = load %struct.wrk3_struct** @wrk3, align 8
  %2083 = getelementptr inbounds %struct.wrk3_struct* %2082, i32 0, i32 0
  %2084 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2083, i32 0, i64 %2081
  %2085 = getelementptr inbounds [258 x [258 x double]]* %2084, i32 0, i64 %2080
  %2086 = getelementptr inbounds [258 x double]* %2085, i32 0, i64 %2079
  store double %2078, double* %2086, align 8
  br label %2087

; <label>:2087                                    ; preds = %2063
  %2088 = load i64* %iindex, align 8
  %2089 = add nsw i64 %2088, 1
  store i64 %2089, i64* %iindex, align 8
  br label %2059

; <label>:2090                                    ; preds = %2059
  br label %2091

; <label>:2091                                    ; preds = %2090
  %2092 = load i64* %i, align 8
  %2093 = add nsw i64 %2092, 1
  store i64 %2093, i64* %i, align 8
  br label %2053

; <label>:2094                                    ; preds = %2053
  br label %2095

; <label>:2095                                    ; preds = %2094
  %2096 = load i64* %psiindex, align 8
  %2097 = add nsw i64 %2096, 1
  store i64 %2097, i64* %psiindex, align 8
  br label %1777

; <label>:2098                                    ; preds = %1777
  %2099 = load %struct.bars_struct** @bars, align 8
  %2100 = getelementptr inbounds %struct.bars_struct* %2099, i32 0, i32 0
  %2101 = getelementptr inbounds %struct.anon* %2100, i32 0, i32 0
  %2102 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %2101) #6
  %2103 = sext i32 %2102 to i64
  store i64 %2103, i64* %Error1, align 8
  %2104 = load i64* %Error1, align 8
  %2105 = icmp ne i64 %2104, 0
  br i1 %2105, label %2106, label %2108

; <label>:2106                                    ; preds = %2098
  %2107 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str41, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:2108                                    ; preds = %2098
  %2109 = load %struct.bars_struct** @bars, align 8
  %2110 = getelementptr inbounds %struct.bars_struct* %2109, i32 0, i32 0
  %2111 = getelementptr inbounds %struct.anon* %2110, i32 0, i32 3
  %2112 = load i64* %2111, align 8
  store i64 %2112, i64* %Cycle2, align 8
  %2113 = load %struct.bars_struct** @bars, align 8
  %2114 = getelementptr inbounds %struct.bars_struct* %2113, i32 0, i32 0
  %2115 = getelementptr inbounds %struct.anon* %2114, i32 0, i32 2
  %2116 = load i64* %2115, align 8
  %2117 = add i64 %2116, 1
  store i64 %2117, i64* %2115, align 8
  %2118 = load i64* @nprocs, align 8
  %2119 = icmp ne i64 %2117, %2118
  br i1 %2119, label %2120, label %2148

; <label>:2120                                    ; preds = %2108
  %2121 = bitcast i64* %Cancel3 to i32*
  %2122 = call i32 @pthread_setcancelstate(i32 1, i32* %2121)
  br label %2123

; <label>:2123                                    ; preds = %2142, %2120
  %2124 = load i64* %Cycle2, align 8
  %2125 = load %struct.bars_struct** @bars, align 8
  %2126 = getelementptr inbounds %struct.bars_struct* %2125, i32 0, i32 0
  %2127 = getelementptr inbounds %struct.anon* %2126, i32 0, i32 3
  %2128 = load i64* %2127, align 8
  %2129 = icmp eq i64 %2124, %2128
  br i1 %2129, label %2130, label %2143

; <label>:2130                                    ; preds = %2123
  %2131 = load %struct.bars_struct** @bars, align 8
  %2132 = getelementptr inbounds %struct.bars_struct* %2131, i32 0, i32 0
  %2133 = getelementptr inbounds %struct.anon* %2132, i32 0, i32 1
  %2134 = load %struct.bars_struct** @bars, align 8
  %2135 = getelementptr inbounds %struct.bars_struct* %2134, i32 0, i32 0
  %2136 = getelementptr inbounds %struct.anon* %2135, i32 0, i32 0
  %2137 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %2133, %union.pthread_mutex_t* %2136)
  %2138 = sext i32 %2137 to i64
  store i64 %2138, i64* %Error1, align 8
  %2139 = load i64* %Error1, align 8
  %2140 = icmp ne i64 %2139, 0
  br i1 %2140, label %2141, label %2142

; <label>:2141                                    ; preds = %2130
  br label %2143

; <label>:2142                                    ; preds = %2130
  br label %2123

; <label>:2143                                    ; preds = %2141, %2123
  %2144 = load i64* %Cancel3, align 8
  %2145 = trunc i64 %2144 to i32
  %2146 = bitcast i64* %Temp4 to i32*
  %2147 = call i32 @pthread_setcancelstate(i32 %2145, i32* %2146)
  br label %2168

; <label>:2148                                    ; preds = %2108
  %2149 = load %struct.bars_struct** @bars, align 8
  %2150 = getelementptr inbounds %struct.bars_struct* %2149, i32 0, i32 0
  %2151 = getelementptr inbounds %struct.anon* %2150, i32 0, i32 3
  %2152 = load i64* %2151, align 8
  %2153 = icmp ne i64 %2152, 0
  %2154 = xor i1 %2153, true
  %2155 = zext i1 %2154 to i32
  %2156 = sext i32 %2155 to i64
  %2157 = load %struct.bars_struct** @bars, align 8
  %2158 = getelementptr inbounds %struct.bars_struct* %2157, i32 0, i32 0
  %2159 = getelementptr inbounds %struct.anon* %2158, i32 0, i32 3
  store i64 %2156, i64* %2159, align 8
  %2160 = load %struct.bars_struct** @bars, align 8
  %2161 = getelementptr inbounds %struct.bars_struct* %2160, i32 0, i32 0
  %2162 = getelementptr inbounds %struct.anon* %2161, i32 0, i32 2
  store i64 0, i64* %2162, align 8
  %2163 = load %struct.bars_struct** @bars, align 8
  %2164 = getelementptr inbounds %struct.bars_struct* %2163, i32 0, i32 0
  %2165 = getelementptr inbounds %struct.anon* %2164, i32 0, i32 1
  %2166 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %2165) #6
  %2167 = sext i32 %2166 to i64
  store i64 %2167, i64* %Error1, align 8
  br label %2168

; <label>:2168                                    ; preds = %2148, %2143
  %2169 = load %struct.bars_struct** @bars, align 8
  %2170 = getelementptr inbounds %struct.bars_struct* %2169, i32 0, i32 0
  %2171 = getelementptr inbounds %struct.anon* %2170, i32 0, i32 0
  %2172 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %2171) #6
  store i64 0, i64* %psiindex, align 8
  br label %2173

; <label>:2173                                    ; preds = %2199, %2168
  %2174 = load i64* %psiindex, align 8
  %2175 = icmp sle i64 %2174, 1
  br i1 %2175, label %2176, label %2202

; <label>:2176                                    ; preds = %2173
  %2177 = load i64* %psiindex, align 8
  %2178 = load %struct.wrk3_struct** @wrk3, align 8
  %2179 = getelementptr inbounds %struct.wrk3_struct* %2178, i32 0, i32 0
  %2180 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2179, i32 0, i64 %2177
  %2181 = getelementptr inbounds [258 x [258 x double]]* %2180, i32 0, i32 0
  %2182 = load i64* %psiindex, align 8
  %2183 = load %struct.wrk5_struct** @wrk5, align 8
  %2184 = getelementptr inbounds %struct.wrk5_struct* %2183, i32 0, i32 1
  %2185 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2184, i32 0, i64 %2182
  %2186 = getelementptr inbounds [258 x [258 x double]]* %2185, i32 0, i32 0
  %2187 = load i64* %psiindex, align 8
  %2188 = load %struct.wrk4_struct** @wrk4, align 8
  %2189 = getelementptr inbounds %struct.wrk4_struct* %2188, i32 0, i32 1
  %2190 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2189, i32 0, i64 %2187
  %2191 = getelementptr inbounds [258 x [258 x double]]* %2190, i32 0, i32 0
  %2192 = load i64* %1, align 8
  %2193 = load i64* %2, align 8
  %2194 = load i64* %3, align 8
  %2195 = load i64* %5, align 8
  %2196 = load i64* %6, align 8
  %2197 = load i64* %4, align 8
  %2198 = load i64* %7, align 8
  call void @jacobcalc([258 x double]* %2181, [258 x double]* %2186, [258 x double]* %2191, i64 %2192, i64 %2193, i64 %2194, i64 %2195, i64 %2196, i64 %2197, i64 %2198)
  br label %2199

; <label>:2199                                    ; preds = %2176
  %2200 = load i64* %psiindex, align 8
  %2201 = add nsw i64 %2200, 1
  store i64 %2201, i64* %psiindex, align 8
  br label %2173

; <label>:2202                                    ; preds = %2173
  store i64 0, i64* %psiindex, align 8
  br label %2203

; <label>:2203                                    ; preds = %2467, %2202
  %2204 = load i64* %psiindex, align 8
  %2205 = icmp sle i64 %2204, 1
  br i1 %2205, label %2206, label %2470

; <label>:2206                                    ; preds = %2203
  %2207 = load i64* %1, align 8
  %2208 = icmp eq i64 %2207, 0
  br i1 %2208, label %2209, label %2223

; <label>:2209                                    ; preds = %2206
  %2210 = load i64* %psiindex, align 8
  %2211 = load %struct.wrk5_struct** @wrk5, align 8
  %2212 = getelementptr inbounds %struct.wrk5_struct* %2211, i32 0, i32 1
  %2213 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2212, i32 0, i64 %2210
  %2214 = getelementptr inbounds [258 x [258 x double]]* %2213, i32 0, i64 0
  %2215 = getelementptr inbounds [258 x double]* %2214, i32 0, i64 0
  %2216 = load double* %2215, align 8
  %2217 = load i64* %psiindex, align 8
  %2218 = load %struct.fields_struct** @fields, align 8
  %2219 = getelementptr inbounds %struct.fields_struct* %2218, i32 0, i32 1
  %2220 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2219, i32 0, i64 %2217
  %2221 = getelementptr inbounds [258 x [258 x double]]* %2220, i32 0, i64 0
  %2222 = getelementptr inbounds [258 x double]* %2221, i32 0, i64 0
  store double %2216, double* %2222, align 8
  br label %2223

; <label>:2223                                    ; preds = %2209, %2206
  %2224 = load i64* %1, align 8
  %2225 = load i64* @nprocs, align 8
  %2226 = load i64* @xprocs, align 8
  %2227 = sub nsw i64 %2225, %2226
  %2228 = icmp eq i64 %2224, %2227
  br i1 %2228, label %2229, label %2247

; <label>:2229                                    ; preds = %2223
  %2230 = load i64* @im, align 8
  %2231 = sub nsw i64 %2230, 1
  %2232 = load i64* %psiindex, align 8
  %2233 = load %struct.wrk5_struct** @wrk5, align 8
  %2234 = getelementptr inbounds %struct.wrk5_struct* %2233, i32 0, i32 1
  %2235 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2234, i32 0, i64 %2232
  %2236 = getelementptr inbounds [258 x [258 x double]]* %2235, i32 0, i64 %2231
  %2237 = getelementptr inbounds [258 x double]* %2236, i32 0, i64 0
  %2238 = load double* %2237, align 8
  %2239 = load i64* @im, align 8
  %2240 = sub nsw i64 %2239, 1
  %2241 = load i64* %psiindex, align 8
  %2242 = load %struct.fields_struct** @fields, align 8
  %2243 = getelementptr inbounds %struct.fields_struct* %2242, i32 0, i32 1
  %2244 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2243, i32 0, i64 %2241
  %2245 = getelementptr inbounds [258 x [258 x double]]* %2244, i32 0, i64 %2240
  %2246 = getelementptr inbounds [258 x double]* %2245, i32 0, i64 0
  store double %2238, double* %2246, align 8
  br label %2247

; <label>:2247                                    ; preds = %2229, %2223
  %2248 = load i64* %1, align 8
  %2249 = load i64* @xprocs, align 8
  %2250 = sub nsw i64 %2249, 1
  %2251 = icmp eq i64 %2248, %2250
  br i1 %2251, label %2252, label %2270

; <label>:2252                                    ; preds = %2247
  %2253 = load i64* @jm, align 8
  %2254 = sub nsw i64 %2253, 1
  %2255 = load i64* %psiindex, align 8
  %2256 = load %struct.wrk5_struct** @wrk5, align 8
  %2257 = getelementptr inbounds %struct.wrk5_struct* %2256, i32 0, i32 1
  %2258 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2257, i32 0, i64 %2255
  %2259 = getelementptr inbounds [258 x [258 x double]]* %2258, i32 0, i64 0
  %2260 = getelementptr inbounds [258 x double]* %2259, i32 0, i64 %2254
  %2261 = load double* %2260, align 8
  %2262 = load i64* @jm, align 8
  %2263 = sub nsw i64 %2262, 1
  %2264 = load i64* %psiindex, align 8
  %2265 = load %struct.fields_struct** @fields, align 8
  %2266 = getelementptr inbounds %struct.fields_struct* %2265, i32 0, i32 1
  %2267 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2266, i32 0, i64 %2264
  %2268 = getelementptr inbounds [258 x [258 x double]]* %2267, i32 0, i64 0
  %2269 = getelementptr inbounds [258 x double]* %2268, i32 0, i64 %2263
  store double %2261, double* %2269, align 8
  br label %2270

; <label>:2270                                    ; preds = %2252, %2247
  %2271 = load i64* %1, align 8
  %2272 = load i64* @nprocs, align 8
  %2273 = sub nsw i64 %2272, 1
  %2274 = icmp eq i64 %2271, %2273
  br i1 %2274, label %2275, label %2297

; <label>:2275                                    ; preds = %2270
  %2276 = load i64* @jm, align 8
  %2277 = sub nsw i64 %2276, 1
  %2278 = load i64* @im, align 8
  %2279 = sub nsw i64 %2278, 1
  %2280 = load i64* %psiindex, align 8
  %2281 = load %struct.wrk5_struct** @wrk5, align 8
  %2282 = getelementptr inbounds %struct.wrk5_struct* %2281, i32 0, i32 1
  %2283 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2282, i32 0, i64 %2280
  %2284 = getelementptr inbounds [258 x [258 x double]]* %2283, i32 0, i64 %2279
  %2285 = getelementptr inbounds [258 x double]* %2284, i32 0, i64 %2277
  %2286 = load double* %2285, align 8
  %2287 = load i64* @jm, align 8
  %2288 = sub nsw i64 %2287, 1
  %2289 = load i64* @im, align 8
  %2290 = sub nsw i64 %2289, 1
  %2291 = load i64* %psiindex, align 8
  %2292 = load %struct.fields_struct** @fields, align 8
  %2293 = getelementptr inbounds %struct.fields_struct* %2292, i32 0, i32 1
  %2294 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2293, i32 0, i64 %2291
  %2295 = getelementptr inbounds [258 x [258 x double]]* %2294, i32 0, i64 %2290
  %2296 = getelementptr inbounds [258 x double]* %2295, i32 0, i64 %2288
  store double %2286, double* %2296, align 8
  br label %2297

; <label>:2297                                    ; preds = %2275, %2270
  %2298 = load i64* %2, align 8
  %2299 = icmp eq i64 %2298, 1
  br i1 %2299, label %2300, label %2326

; <label>:2300                                    ; preds = %2297
  %2301 = load i64* %5, align 8
  store i64 %2301, i64* %j, align 8
  br label %2302

; <label>:2302                                    ; preds = %2322, %2300
  %2303 = load i64* %j, align 8
  %2304 = load i64* %6, align 8
  %2305 = icmp sle i64 %2303, %2304
  br i1 %2305, label %2306, label %2325

; <label>:2306                                    ; preds = %2302
  %2307 = load i64* %j, align 8
  %2308 = load i64* %psiindex, align 8
  %2309 = load %struct.wrk5_struct** @wrk5, align 8
  %2310 = getelementptr inbounds %struct.wrk5_struct* %2309, i32 0, i32 1
  %2311 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2310, i32 0, i64 %2308
  %2312 = getelementptr inbounds [258 x [258 x double]]* %2311, i32 0, i64 0
  %2313 = getelementptr inbounds [258 x double]* %2312, i32 0, i64 %2307
  %2314 = load double* %2313, align 8
  %2315 = load i64* %j, align 8
  %2316 = load i64* %psiindex, align 8
  %2317 = load %struct.fields_struct** @fields, align 8
  %2318 = getelementptr inbounds %struct.fields_struct* %2317, i32 0, i32 1
  %2319 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2318, i32 0, i64 %2316
  %2320 = getelementptr inbounds [258 x [258 x double]]* %2319, i32 0, i64 0
  %2321 = getelementptr inbounds [258 x double]* %2320, i32 0, i64 %2315
  store double %2314, double* %2321, align 8
  br label %2322

; <label>:2322                                    ; preds = %2306
  %2323 = load i64* %j, align 8
  %2324 = add nsw i64 %2323, 1
  store i64 %2324, i64* %j, align 8
  br label %2302

; <label>:2325                                    ; preds = %2302
  br label %2326

; <label>:2326                                    ; preds = %2325, %2297
  %2327 = load i64* %2, align 8
  %2328 = load i64* %4, align 8
  %2329 = add nsw i64 %2327, %2328
  %2330 = load i64* @im, align 8
  %2331 = sub nsw i64 %2330, 1
  %2332 = icmp eq i64 %2329, %2331
  br i1 %2332, label %2333, label %2363

; <label>:2333                                    ; preds = %2326
  %2334 = load i64* %5, align 8
  store i64 %2334, i64* %j, align 8
  br label %2335

; <label>:2335                                    ; preds = %2359, %2333
  %2336 = load i64* %j, align 8
  %2337 = load i64* %6, align 8
  %2338 = icmp sle i64 %2336, %2337
  br i1 %2338, label %2339, label %2362

; <label>:2339                                    ; preds = %2335
  %2340 = load i64* %j, align 8
  %2341 = load i64* @im, align 8
  %2342 = sub nsw i64 %2341, 1
  %2343 = load i64* %psiindex, align 8
  %2344 = load %struct.wrk5_struct** @wrk5, align 8
  %2345 = getelementptr inbounds %struct.wrk5_struct* %2344, i32 0, i32 1
  %2346 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2345, i32 0, i64 %2343
  %2347 = getelementptr inbounds [258 x [258 x double]]* %2346, i32 0, i64 %2342
  %2348 = getelementptr inbounds [258 x double]* %2347, i32 0, i64 %2340
  %2349 = load double* %2348, align 8
  %2350 = load i64* %j, align 8
  %2351 = load i64* @im, align 8
  %2352 = sub nsw i64 %2351, 1
  %2353 = load i64* %psiindex, align 8
  %2354 = load %struct.fields_struct** @fields, align 8
  %2355 = getelementptr inbounds %struct.fields_struct* %2354, i32 0, i32 1
  %2356 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2355, i32 0, i64 %2353
  %2357 = getelementptr inbounds [258 x [258 x double]]* %2356, i32 0, i64 %2352
  %2358 = getelementptr inbounds [258 x double]* %2357, i32 0, i64 %2350
  store double %2349, double* %2358, align 8
  br label %2359

; <label>:2359                                    ; preds = %2339
  %2360 = load i64* %j, align 8
  %2361 = add nsw i64 %2360, 1
  store i64 %2361, i64* %j, align 8
  br label %2335

; <label>:2362                                    ; preds = %2335
  br label %2363

; <label>:2363                                    ; preds = %2362, %2326
  %2364 = load i64* %5, align 8
  %2365 = icmp eq i64 %2364, 1
  br i1 %2365, label %2366, label %2392

; <label>:2366                                    ; preds = %2363
  %2367 = load i64* %2, align 8
  store i64 %2367, i64* %j, align 8
  br label %2368

; <label>:2368                                    ; preds = %2388, %2366
  %2369 = load i64* %j, align 8
  %2370 = load i64* %3, align 8
  %2371 = icmp sle i64 %2369, %2370
  br i1 %2371, label %2372, label %2391

; <label>:2372                                    ; preds = %2368
  %2373 = load i64* %j, align 8
  %2374 = load i64* %psiindex, align 8
  %2375 = load %struct.wrk5_struct** @wrk5, align 8
  %2376 = getelementptr inbounds %struct.wrk5_struct* %2375, i32 0, i32 1
  %2377 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2376, i32 0, i64 %2374
  %2378 = getelementptr inbounds [258 x [258 x double]]* %2377, i32 0, i64 %2373
  %2379 = getelementptr inbounds [258 x double]* %2378, i32 0, i64 0
  %2380 = load double* %2379, align 8
  %2381 = load i64* %j, align 8
  %2382 = load i64* %psiindex, align 8
  %2383 = load %struct.fields_struct** @fields, align 8
  %2384 = getelementptr inbounds %struct.fields_struct* %2383, i32 0, i32 1
  %2385 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2384, i32 0, i64 %2382
  %2386 = getelementptr inbounds [258 x [258 x double]]* %2385, i32 0, i64 %2381
  %2387 = getelementptr inbounds [258 x double]* %2386, i32 0, i64 0
  store double %2380, double* %2387, align 8
  br label %2388

; <label>:2388                                    ; preds = %2372
  %2389 = load i64* %j, align 8
  %2390 = add nsw i64 %2389, 1
  store i64 %2390, i64* %j, align 8
  br label %2368

; <label>:2391                                    ; preds = %2368
  br label %2392

; <label>:2392                                    ; preds = %2391, %2363
  %2393 = load i64* %5, align 8
  %2394 = load i64* %7, align 8
  %2395 = add nsw i64 %2393, %2394
  %2396 = load i64* @jm, align 8
  %2397 = sub nsw i64 %2396, 1
  %2398 = icmp eq i64 %2395, %2397
  br i1 %2398, label %2399, label %2429

; <label>:2399                                    ; preds = %2392
  %2400 = load i64* %2, align 8
  store i64 %2400, i64* %j, align 8
  br label %2401

; <label>:2401                                    ; preds = %2425, %2399
  %2402 = load i64* %j, align 8
  %2403 = load i64* %3, align 8
  %2404 = icmp sle i64 %2402, %2403
  br i1 %2404, label %2405, label %2428

; <label>:2405                                    ; preds = %2401
  %2406 = load i64* @jm, align 8
  %2407 = sub nsw i64 %2406, 1
  %2408 = load i64* %j, align 8
  %2409 = load i64* %psiindex, align 8
  %2410 = load %struct.wrk5_struct** @wrk5, align 8
  %2411 = getelementptr inbounds %struct.wrk5_struct* %2410, i32 0, i32 1
  %2412 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2411, i32 0, i64 %2409
  %2413 = getelementptr inbounds [258 x [258 x double]]* %2412, i32 0, i64 %2408
  %2414 = getelementptr inbounds [258 x double]* %2413, i32 0, i64 %2407
  %2415 = load double* %2414, align 8
  %2416 = load i64* @jm, align 8
  %2417 = sub nsw i64 %2416, 1
  %2418 = load i64* %j, align 8
  %2419 = load i64* %psiindex, align 8
  %2420 = load %struct.fields_struct** @fields, align 8
  %2421 = getelementptr inbounds %struct.fields_struct* %2420, i32 0, i32 1
  %2422 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2421, i32 0, i64 %2419
  %2423 = getelementptr inbounds [258 x [258 x double]]* %2422, i32 0, i64 %2418
  %2424 = getelementptr inbounds [258 x double]* %2423, i32 0, i64 %2417
  store double %2415, double* %2424, align 8
  br label %2425

; <label>:2425                                    ; preds = %2405
  %2426 = load i64* %j, align 8
  %2427 = add nsw i64 %2426, 1
  store i64 %2427, i64* %j, align 8
  br label %2401

; <label>:2428                                    ; preds = %2401
  br label %2429

; <label>:2429                                    ; preds = %2428, %2392
  %2430 = load i64* %2, align 8
  store i64 %2430, i64* %i, align 8
  br label %2431

; <label>:2431                                    ; preds = %2463, %2429
  %2432 = load i64* %i, align 8
  %2433 = load i64* %3, align 8
  %2434 = icmp sle i64 %2432, %2433
  br i1 %2434, label %2435, label %2466

; <label>:2435                                    ; preds = %2431
  %2436 = load i64* %5, align 8
  store i64 %2436, i64* %iindex, align 8
  br label %2437

; <label>:2437                                    ; preds = %2459, %2435
  %2438 = load i64* %iindex, align 8
  %2439 = load i64* %6, align 8
  %2440 = icmp sle i64 %2438, %2439
  br i1 %2440, label %2441, label %2462

; <label>:2441                                    ; preds = %2437
  %2442 = load i64* %iindex, align 8
  %2443 = load i64* %i, align 8
  %2444 = load i64* %psiindex, align 8
  %2445 = load %struct.wrk5_struct** @wrk5, align 8
  %2446 = getelementptr inbounds %struct.wrk5_struct* %2445, i32 0, i32 1
  %2447 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2446, i32 0, i64 %2444
  %2448 = getelementptr inbounds [258 x [258 x double]]* %2447, i32 0, i64 %2443
  %2449 = getelementptr inbounds [258 x double]* %2448, i32 0, i64 %2442
  %2450 = load double* %2449, align 8
  %2451 = load i64* %iindex, align 8
  %2452 = load i64* %i, align 8
  %2453 = load i64* %psiindex, align 8
  %2454 = load %struct.fields_struct** @fields, align 8
  %2455 = getelementptr inbounds %struct.fields_struct* %2454, i32 0, i32 1
  %2456 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2455, i32 0, i64 %2453
  %2457 = getelementptr inbounds [258 x [258 x double]]* %2456, i32 0, i64 %2452
  %2458 = getelementptr inbounds [258 x double]* %2457, i32 0, i64 %2451
  store double %2450, double* %2458, align 8
  br label %2459

; <label>:2459                                    ; preds = %2441
  %2460 = load i64* %iindex, align 8
  %2461 = add nsw i64 %2460, 1
  store i64 %2461, i64* %iindex, align 8
  br label %2437

; <label>:2462                                    ; preds = %2437
  br label %2463

; <label>:2463                                    ; preds = %2462
  %2464 = load i64* %i, align 8
  %2465 = add nsw i64 %2464, 1
  store i64 %2465, i64* %i, align 8
  br label %2431

; <label>:2466                                    ; preds = %2431
  br label %2467

; <label>:2467                                    ; preds = %2466
  %2468 = load i64* %psiindex, align 8
  %2469 = add nsw i64 %2468, 1
  store i64 %2469, i64* %psiindex, align 8
  br label %2203

; <label>:2470                                    ; preds = %2203
  store i64 0, i64* %psiindex, align 8
  br label %2471

; <label>:2471                                    ; preds = %2491, %2470
  %2472 = load i64* %psiindex, align 8
  %2473 = icmp sle i64 %2472, 1
  br i1 %2473, label %2474, label %2494

; <label>:2474                                    ; preds = %2471
  %2475 = load i64* %psiindex, align 8
  %2476 = load %struct.wrk5_struct** @wrk5, align 8
  %2477 = getelementptr inbounds %struct.wrk5_struct* %2476, i32 0, i32 0
  %2478 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2477, i32 0, i64 %2475
  %2479 = getelementptr inbounds [258 x [258 x double]]* %2478, i32 0, i32 0
  %2480 = load i64* %psiindex, align 8
  %2481 = load %struct.wrk4_struct** @wrk4, align 8
  %2482 = getelementptr inbounds %struct.wrk4_struct* %2481, i32 0, i32 0
  %2483 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2482, i32 0, i64 %2480
  %2484 = getelementptr inbounds [258 x [258 x double]]* %2483, i32 0, i32 0
  %2485 = load i64* %2, align 8
  %2486 = load i64* %3, align 8
  %2487 = load i64* %5, align 8
  %2488 = load i64* %6, align 8
  %2489 = load i64* %4, align 8
  %2490 = load i64* %7, align 8
  call void @laplacalc([258 x double]* %2479, [258 x double]* %2484, i64 %2485, i64 %2486, i64 %2487, i64 %2488, i64 %2489, i64 %2490)
  br label %2491

; <label>:2491                                    ; preds = %2474
  %2492 = load i64* %psiindex, align 8
  %2493 = add nsw i64 %2492, 1
  store i64 %2493, i64* %psiindex, align 8
  br label %2471

; <label>:2494                                    ; preds = %2471
  %2495 = load %struct.bars_struct** @bars, align 8
  %2496 = getelementptr inbounds %struct.bars_struct* %2495, i32 0, i32 0
  %2497 = getelementptr inbounds %struct.anon* %2496, i32 0, i32 0
  %2498 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %2497) #6
  %2499 = sext i32 %2498 to i64
  store i64 %2499, i64* %Error5, align 8
  %2500 = load i64* %Error5, align 8
  %2501 = icmp ne i64 %2500, 0
  br i1 %2501, label %2502, label %2504

; <label>:2502                                    ; preds = %2494
  %2503 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str41, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:2504                                    ; preds = %2494
  %2505 = load %struct.bars_struct** @bars, align 8
  %2506 = getelementptr inbounds %struct.bars_struct* %2505, i32 0, i32 0
  %2507 = getelementptr inbounds %struct.anon* %2506, i32 0, i32 3
  %2508 = load i64* %2507, align 8
  store i64 %2508, i64* %Cycle6, align 8
  %2509 = load %struct.bars_struct** @bars, align 8
  %2510 = getelementptr inbounds %struct.bars_struct* %2509, i32 0, i32 0
  %2511 = getelementptr inbounds %struct.anon* %2510, i32 0, i32 2
  %2512 = load i64* %2511, align 8
  %2513 = add i64 %2512, 1
  store i64 %2513, i64* %2511, align 8
  %2514 = load i64* @nprocs, align 8
  %2515 = icmp ne i64 %2513, %2514
  br i1 %2515, label %2516, label %2544

; <label>:2516                                    ; preds = %2504
  %2517 = bitcast i64* %Cancel7 to i32*
  %2518 = call i32 @pthread_setcancelstate(i32 1, i32* %2517)
  br label %2519

; <label>:2519                                    ; preds = %2538, %2516
  %2520 = load i64* %Cycle6, align 8
  %2521 = load %struct.bars_struct** @bars, align 8
  %2522 = getelementptr inbounds %struct.bars_struct* %2521, i32 0, i32 0
  %2523 = getelementptr inbounds %struct.anon* %2522, i32 0, i32 3
  %2524 = load i64* %2523, align 8
  %2525 = icmp eq i64 %2520, %2524
  br i1 %2525, label %2526, label %2539

; <label>:2526                                    ; preds = %2519
  %2527 = load %struct.bars_struct** @bars, align 8
  %2528 = getelementptr inbounds %struct.bars_struct* %2527, i32 0, i32 0
  %2529 = getelementptr inbounds %struct.anon* %2528, i32 0, i32 1
  %2530 = load %struct.bars_struct** @bars, align 8
  %2531 = getelementptr inbounds %struct.bars_struct* %2530, i32 0, i32 0
  %2532 = getelementptr inbounds %struct.anon* %2531, i32 0, i32 0
  %2533 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %2529, %union.pthread_mutex_t* %2532)
  %2534 = sext i32 %2533 to i64
  store i64 %2534, i64* %Error5, align 8
  %2535 = load i64* %Error5, align 8
  %2536 = icmp ne i64 %2535, 0
  br i1 %2536, label %2537, label %2538

; <label>:2537                                    ; preds = %2526
  br label %2539

; <label>:2538                                    ; preds = %2526
  br label %2519

; <label>:2539                                    ; preds = %2537, %2519
  %2540 = load i64* %Cancel7, align 8
  %2541 = trunc i64 %2540 to i32
  %2542 = bitcast i64* %Temp8 to i32*
  %2543 = call i32 @pthread_setcancelstate(i32 %2541, i32* %2542)
  br label %2564

; <label>:2544                                    ; preds = %2504
  %2545 = load %struct.bars_struct** @bars, align 8
  %2546 = getelementptr inbounds %struct.bars_struct* %2545, i32 0, i32 0
  %2547 = getelementptr inbounds %struct.anon* %2546, i32 0, i32 3
  %2548 = load i64* %2547, align 8
  %2549 = icmp ne i64 %2548, 0
  %2550 = xor i1 %2549, true
  %2551 = zext i1 %2550 to i32
  %2552 = sext i32 %2551 to i64
  %2553 = load %struct.bars_struct** @bars, align 8
  %2554 = getelementptr inbounds %struct.bars_struct* %2553, i32 0, i32 0
  %2555 = getelementptr inbounds %struct.anon* %2554, i32 0, i32 3
  store i64 %2552, i64* %2555, align 8
  %2556 = load %struct.bars_struct** @bars, align 8
  %2557 = getelementptr inbounds %struct.bars_struct* %2556, i32 0, i32 0
  %2558 = getelementptr inbounds %struct.anon* %2557, i32 0, i32 2
  store i64 0, i64* %2558, align 8
  %2559 = load %struct.bars_struct** @bars, align 8
  %2560 = getelementptr inbounds %struct.bars_struct* %2559, i32 0, i32 0
  %2561 = getelementptr inbounds %struct.anon* %2560, i32 0, i32 1
  %2562 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %2561) #6
  %2563 = sext i32 %2562 to i64
  store i64 %2563, i64* %Error5, align 8
  br label %2564

; <label>:2564                                    ; preds = %2544, %2539
  %2565 = load %struct.bars_struct** @bars, align 8
  %2566 = getelementptr inbounds %struct.bars_struct* %2565, i32 0, i32 0
  %2567 = getelementptr inbounds %struct.anon* %2566, i32 0, i32 0
  %2568 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %2567) #6
  %2569 = load %struct.wrk3_struct** @wrk3, align 8
  %2570 = getelementptr inbounds %struct.wrk3_struct* %2569, i32 0, i32 1
  %2571 = getelementptr inbounds [258 x [258 x double]]* %2570, i32 0, i32 0
  %2572 = load %struct.wrk2_struct** @wrk2, align 8
  %2573 = getelementptr inbounds %struct.wrk2_struct* %2572, i32 0, i32 0
  %2574 = getelementptr inbounds [258 x [258 x double]]* %2573, i32 0, i32 0
  %2575 = load %struct.wrk6_struct** @wrk6, align 8
  %2576 = getelementptr inbounds %struct.wrk6_struct* %2575, i32 0, i32 0
  %2577 = getelementptr inbounds [258 x [258 x double]]* %2576, i32 0, i32 0
  %2578 = load i64* %1, align 8
  %2579 = load i64* %2, align 8
  %2580 = load i64* %3, align 8
  %2581 = load i64* %5, align 8
  %2582 = load i64* %6, align 8
  %2583 = load i64* %4, align 8
  %2584 = load i64* %7, align 8
  call void @jacobcalc([258 x double]* %2571, [258 x double]* %2574, [258 x double]* %2577, i64 %2578, i64 %2579, i64 %2580, i64 %2581, i64 %2582, i64 %2583, i64 %2584)
  store i64 0, i64* %psiindex, align 8
  br label %2585

; <label>:2585                                    ; preds = %2605, %2564
  %2586 = load i64* %psiindex, align 8
  %2587 = icmp sle i64 %2586, 1
  br i1 %2587, label %2588, label %2608

; <label>:2588                                    ; preds = %2585
  %2589 = load i64* %psiindex, align 8
  %2590 = load %struct.wrk4_struct** @wrk4, align 8
  %2591 = getelementptr inbounds %struct.wrk4_struct* %2590, i32 0, i32 0
  %2592 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2591, i32 0, i64 %2589
  %2593 = getelementptr inbounds [258 x [258 x double]]* %2592, i32 0, i32 0
  %2594 = load i64* %psiindex, align 8
  %2595 = load %struct.wrk5_struct** @wrk5, align 8
  %2596 = getelementptr inbounds %struct.wrk5_struct* %2595, i32 0, i32 0
  %2597 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2596, i32 0, i64 %2594
  %2598 = getelementptr inbounds [258 x [258 x double]]* %2597, i32 0, i32 0
  %2599 = load i64* %2, align 8
  %2600 = load i64* %3, align 8
  %2601 = load i64* %5, align 8
  %2602 = load i64* %6, align 8
  %2603 = load i64* %4, align 8
  %2604 = load i64* %7, align 8
  call void @laplacalc([258 x double]* %2593, [258 x double]* %2598, i64 %2599, i64 %2600, i64 %2601, i64 %2602, i64 %2603, i64 %2604)
  br label %2605

; <label>:2605                                    ; preds = %2588
  %2606 = load i64* %psiindex, align 8
  %2607 = add nsw i64 %2606, 1
  store i64 %2607, i64* %psiindex, align 8
  br label %2585

; <label>:2608                                    ; preds = %2585
  %2609 = load %struct.bars_struct** @bars, align 8
  %2610 = getelementptr inbounds %struct.bars_struct* %2609, i32 0, i32 0
  %2611 = getelementptr inbounds %struct.anon* %2610, i32 0, i32 0
  %2612 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %2611) #6
  %2613 = sext i32 %2612 to i64
  store i64 %2613, i64* %Error9, align 8
  %2614 = load i64* %Error9, align 8
  %2615 = icmp ne i64 %2614, 0
  br i1 %2615, label %2616, label %2618

; <label>:2616                                    ; preds = %2608
  %2617 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str41, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:2618                                    ; preds = %2608
  %2619 = load %struct.bars_struct** @bars, align 8
  %2620 = getelementptr inbounds %struct.bars_struct* %2619, i32 0, i32 0
  %2621 = getelementptr inbounds %struct.anon* %2620, i32 0, i32 3
  %2622 = load i64* %2621, align 8
  store i64 %2622, i64* %Cycle10, align 8
  %2623 = load %struct.bars_struct** @bars, align 8
  %2624 = getelementptr inbounds %struct.bars_struct* %2623, i32 0, i32 0
  %2625 = getelementptr inbounds %struct.anon* %2624, i32 0, i32 2
  %2626 = load i64* %2625, align 8
  %2627 = add i64 %2626, 1
  store i64 %2627, i64* %2625, align 8
  %2628 = load i64* @nprocs, align 8
  %2629 = icmp ne i64 %2627, %2628
  br i1 %2629, label %2630, label %2658

; <label>:2630                                    ; preds = %2618
  %2631 = bitcast i64* %Cancel11 to i32*
  %2632 = call i32 @pthread_setcancelstate(i32 1, i32* %2631)
  br label %2633

; <label>:2633                                    ; preds = %2652, %2630
  %2634 = load i64* %Cycle10, align 8
  %2635 = load %struct.bars_struct** @bars, align 8
  %2636 = getelementptr inbounds %struct.bars_struct* %2635, i32 0, i32 0
  %2637 = getelementptr inbounds %struct.anon* %2636, i32 0, i32 3
  %2638 = load i64* %2637, align 8
  %2639 = icmp eq i64 %2634, %2638
  br i1 %2639, label %2640, label %2653

; <label>:2640                                    ; preds = %2633
  %2641 = load %struct.bars_struct** @bars, align 8
  %2642 = getelementptr inbounds %struct.bars_struct* %2641, i32 0, i32 0
  %2643 = getelementptr inbounds %struct.anon* %2642, i32 0, i32 1
  %2644 = load %struct.bars_struct** @bars, align 8
  %2645 = getelementptr inbounds %struct.bars_struct* %2644, i32 0, i32 0
  %2646 = getelementptr inbounds %struct.anon* %2645, i32 0, i32 0
  %2647 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %2643, %union.pthread_mutex_t* %2646)
  %2648 = sext i32 %2647 to i64
  store i64 %2648, i64* %Error9, align 8
  %2649 = load i64* %Error9, align 8
  %2650 = icmp ne i64 %2649, 0
  br i1 %2650, label %2651, label %2652

; <label>:2651                                    ; preds = %2640
  br label %2653

; <label>:2652                                    ; preds = %2640
  br label %2633

; <label>:2653                                    ; preds = %2651, %2633
  %2654 = load i64* %Cancel11, align 8
  %2655 = trunc i64 %2654 to i32
  %2656 = bitcast i64* %Temp12 to i32*
  %2657 = call i32 @pthread_setcancelstate(i32 %2655, i32* %2656)
  br label %2678

; <label>:2658                                    ; preds = %2618
  %2659 = load %struct.bars_struct** @bars, align 8
  %2660 = getelementptr inbounds %struct.bars_struct* %2659, i32 0, i32 0
  %2661 = getelementptr inbounds %struct.anon* %2660, i32 0, i32 3
  %2662 = load i64* %2661, align 8
  %2663 = icmp ne i64 %2662, 0
  %2664 = xor i1 %2663, true
  %2665 = zext i1 %2664 to i32
  %2666 = sext i32 %2665 to i64
  %2667 = load %struct.bars_struct** @bars, align 8
  %2668 = getelementptr inbounds %struct.bars_struct* %2667, i32 0, i32 0
  %2669 = getelementptr inbounds %struct.anon* %2668, i32 0, i32 3
  store i64 %2666, i64* %2669, align 8
  %2670 = load %struct.bars_struct** @bars, align 8
  %2671 = getelementptr inbounds %struct.bars_struct* %2670, i32 0, i32 0
  %2672 = getelementptr inbounds %struct.anon* %2671, i32 0, i32 2
  store i64 0, i64* %2672, align 8
  %2673 = load %struct.bars_struct** @bars, align 8
  %2674 = getelementptr inbounds %struct.bars_struct* %2673, i32 0, i32 0
  %2675 = getelementptr inbounds %struct.anon* %2674, i32 0, i32 1
  %2676 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %2675) #6
  %2677 = sext i32 %2676 to i64
  store i64 %2677, i64* %Error9, align 8
  br label %2678

; <label>:2678                                    ; preds = %2658, %2653
  %2679 = load %struct.bars_struct** @bars, align 8
  %2680 = getelementptr inbounds %struct.bars_struct* %2679, i32 0, i32 0
  %2681 = getelementptr inbounds %struct.anon* %2680, i32 0, i32 0
  %2682 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %2681) #6
  %2683 = load double* @h, align 8
  %2684 = fdiv double 1.000000e+00, %2683
  store double %2684, double* %hinv, align 8
  %2685 = load double* @h1, align 8
  %2686 = fdiv double 1.000000e+00, %2685
  store double %2686, double* %h1inv, align 8
  %2687 = load i64* %1, align 8
  %2688 = icmp eq i64 %2687, 0
  br i1 %2688, label %2689, label %2792

; <label>:2689                                    ; preds = %2678
  %2690 = load %struct.wrk4_struct** @wrk4, align 8
  %2691 = getelementptr inbounds %struct.wrk4_struct* %2690, i32 0, i32 1
  %2692 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2691, i32 0, i64 0
  %2693 = getelementptr inbounds [258 x [258 x double]]* %2692, i32 0, i64 0
  %2694 = getelementptr inbounds [258 x double]* %2693, i32 0, i64 0
  %2695 = load double* %2694, align 8
  %2696 = load %struct.wrk4_struct** @wrk4, align 8
  %2697 = getelementptr inbounds %struct.wrk4_struct* %2696, i32 0, i32 1
  %2698 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2697, i32 0, i64 1
  %2699 = getelementptr inbounds [258 x [258 x double]]* %2698, i32 0, i64 0
  %2700 = getelementptr inbounds [258 x double]* %2699, i32 0, i64 0
  %2701 = load double* %2700, align 8
  %2702 = fsub double %2695, %2701
  %2703 = load double* @eig2, align 8
  %2704 = load %struct.wrk6_struct** @wrk6, align 8
  %2705 = getelementptr inbounds %struct.wrk6_struct* %2704, i32 0, i32 0
  %2706 = getelementptr inbounds [258 x [258 x double]]* %2705, i32 0, i64 0
  %2707 = getelementptr inbounds [258 x double]* %2706, i32 0, i64 0
  %2708 = load double* %2707, align 8
  %2709 = fmul double %2703, %2708
  %2710 = fadd double %2702, %2709
  %2711 = load double* %h1inv, align 8
  %2712 = load %struct.frcng_struct** @frcng, align 8
  %2713 = getelementptr inbounds %struct.frcng_struct* %2712, i32 0, i32 0
  %2714 = getelementptr inbounds [258 x [258 x double]]* %2713, i32 0, i64 0
  %2715 = getelementptr inbounds [258 x double]* %2714, i32 0, i64 0
  %2716 = load double* %2715, align 8
  %2717 = fmul double %2711, %2716
  %2718 = fadd double %2710, %2717
  %2719 = load double* @lf, align 8
  %2720 = load %struct.wrk5_struct** @wrk5, align 8
  %2721 = getelementptr inbounds %struct.wrk5_struct* %2720, i32 0, i32 0
  %2722 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2721, i32 0, i64 0
  %2723 = getelementptr inbounds [258 x [258 x double]]* %2722, i32 0, i64 0
  %2724 = getelementptr inbounds [258 x double]* %2723, i32 0, i64 0
  %2725 = load double* %2724, align 8
  %2726 = fmul double %2719, %2725
  %2727 = fadd double %2718, %2726
  %2728 = load double* @lf, align 8
  %2729 = load %struct.wrk5_struct** @wrk5, align 8
  %2730 = getelementptr inbounds %struct.wrk5_struct* %2729, i32 0, i32 0
  %2731 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2730, i32 0, i64 1
  %2732 = getelementptr inbounds [258 x [258 x double]]* %2731, i32 0, i64 0
  %2733 = getelementptr inbounds [258 x double]* %2732, i32 0, i64 0
  %2734 = load double* %2733, align 8
  %2735 = fmul double %2728, %2734
  %2736 = fsub double %2727, %2735
  %2737 = load %struct.wrk1_struct** @wrk1, align 8
  %2738 = getelementptr inbounds %struct.wrk1_struct* %2737, i32 0, i32 1
  %2739 = getelementptr inbounds [258 x [258 x double]]* %2738, i32 0, i64 0
  %2740 = getelementptr inbounds [258 x double]* %2739, i32 0, i64 0
  store double %2736, double* %2740, align 8
  %2741 = load double* %hh1, align 8
  %2742 = load %struct.wrk4_struct** @wrk4, align 8
  %2743 = getelementptr inbounds %struct.wrk4_struct* %2742, i32 0, i32 1
  %2744 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2743, i32 0, i64 0
  %2745 = getelementptr inbounds [258 x [258 x double]]* %2744, i32 0, i64 0
  %2746 = getelementptr inbounds [258 x double]* %2745, i32 0, i64 0
  %2747 = load double* %2746, align 8
  %2748 = fmul double %2741, %2747
  %2749 = load double* %hh3, align 8
  %2750 = load %struct.wrk4_struct** @wrk4, align 8
  %2751 = getelementptr inbounds %struct.wrk4_struct* %2750, i32 0, i32 1
  %2752 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2751, i32 0, i64 1
  %2753 = getelementptr inbounds [258 x [258 x double]]* %2752, i32 0, i64 0
  %2754 = getelementptr inbounds [258 x double]* %2753, i32 0, i64 0
  %2755 = load double* %2754, align 8
  %2756 = fmul double %2749, %2755
  %2757 = fadd double %2748, %2756
  %2758 = load double* %hinv, align 8
  %2759 = load %struct.frcng_struct** @frcng, align 8
  %2760 = getelementptr inbounds %struct.frcng_struct* %2759, i32 0, i32 0
  %2761 = getelementptr inbounds [258 x [258 x double]]* %2760, i32 0, i64 0
  %2762 = getelementptr inbounds [258 x double]* %2761, i32 0, i64 0
  %2763 = load double* %2762, align 8
  %2764 = fmul double %2758, %2763
  %2765 = fadd double %2757, %2764
  %2766 = load double* @lf, align 8
  %2767 = load double* %hh1, align 8
  %2768 = fmul double %2766, %2767
  %2769 = load %struct.wrk5_struct** @wrk5, align 8
  %2770 = getelementptr inbounds %struct.wrk5_struct* %2769, i32 0, i32 0
  %2771 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2770, i32 0, i64 0
  %2772 = getelementptr inbounds [258 x [258 x double]]* %2771, i32 0, i64 0
  %2773 = getelementptr inbounds [258 x double]* %2772, i32 0, i64 0
  %2774 = load double* %2773, align 8
  %2775 = fmul double %2768, %2774
  %2776 = fadd double %2765, %2775
  %2777 = load double* @lf, align 8
  %2778 = load double* %hh3, align 8
  %2779 = fmul double %2777, %2778
  %2780 = load %struct.wrk5_struct** @wrk5, align 8
  %2781 = getelementptr inbounds %struct.wrk5_struct* %2780, i32 0, i32 0
  %2782 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2781, i32 0, i64 1
  %2783 = getelementptr inbounds [258 x [258 x double]]* %2782, i32 0, i64 0
  %2784 = getelementptr inbounds [258 x double]* %2783, i32 0, i64 0
  %2785 = load double* %2784, align 8
  %2786 = fmul double %2779, %2785
  %2787 = fadd double %2776, %2786
  %2788 = load %struct.wrk1_struct** @wrk1, align 8
  %2789 = getelementptr inbounds %struct.wrk1_struct* %2788, i32 0, i32 2
  %2790 = getelementptr inbounds [258 x [258 x double]]* %2789, i32 0, i64 0
  %2791 = getelementptr inbounds [258 x double]* %2790, i32 0, i64 0
  store double %2787, double* %2791, align 8
  br label %2792

; <label>:2792                                    ; preds = %2689, %2678
  %2793 = load i64* %1, align 8
  %2794 = load i64* @nprocs, align 8
  %2795 = load i64* @xprocs, align 8
  %2796 = sub nsw i64 %2794, %2795
  %2797 = icmp eq i64 %2793, %2796
  br i1 %2797, label %2798, label %2927

; <label>:2798                                    ; preds = %2792
  %2799 = load i64* @im, align 8
  %2800 = sub nsw i64 %2799, 1
  %2801 = load %struct.wrk4_struct** @wrk4, align 8
  %2802 = getelementptr inbounds %struct.wrk4_struct* %2801, i32 0, i32 1
  %2803 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2802, i32 0, i64 0
  %2804 = getelementptr inbounds [258 x [258 x double]]* %2803, i32 0, i64 %2800
  %2805 = getelementptr inbounds [258 x double]* %2804, i32 0, i64 0
  %2806 = load double* %2805, align 8
  %2807 = load i64* @im, align 8
  %2808 = sub nsw i64 %2807, 1
  %2809 = load %struct.wrk4_struct** @wrk4, align 8
  %2810 = getelementptr inbounds %struct.wrk4_struct* %2809, i32 0, i32 1
  %2811 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2810, i32 0, i64 1
  %2812 = getelementptr inbounds [258 x [258 x double]]* %2811, i32 0, i64 %2808
  %2813 = getelementptr inbounds [258 x double]* %2812, i32 0, i64 0
  %2814 = load double* %2813, align 8
  %2815 = fsub double %2806, %2814
  %2816 = load double* @eig2, align 8
  %2817 = load i64* @im, align 8
  %2818 = sub nsw i64 %2817, 1
  %2819 = load %struct.wrk6_struct** @wrk6, align 8
  %2820 = getelementptr inbounds %struct.wrk6_struct* %2819, i32 0, i32 0
  %2821 = getelementptr inbounds [258 x [258 x double]]* %2820, i32 0, i64 %2818
  %2822 = getelementptr inbounds [258 x double]* %2821, i32 0, i64 0
  %2823 = load double* %2822, align 8
  %2824 = fmul double %2816, %2823
  %2825 = fadd double %2815, %2824
  %2826 = load double* %h1inv, align 8
  %2827 = load i64* @im, align 8
  %2828 = sub nsw i64 %2827, 1
  %2829 = load %struct.frcng_struct** @frcng, align 8
  %2830 = getelementptr inbounds %struct.frcng_struct* %2829, i32 0, i32 0
  %2831 = getelementptr inbounds [258 x [258 x double]]* %2830, i32 0, i64 %2828
  %2832 = getelementptr inbounds [258 x double]* %2831, i32 0, i64 0
  %2833 = load double* %2832, align 8
  %2834 = fmul double %2826, %2833
  %2835 = fadd double %2825, %2834
  %2836 = load double* @lf, align 8
  %2837 = load i64* @im, align 8
  %2838 = sub nsw i64 %2837, 1
  %2839 = load %struct.wrk5_struct** @wrk5, align 8
  %2840 = getelementptr inbounds %struct.wrk5_struct* %2839, i32 0, i32 0
  %2841 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2840, i32 0, i64 0
  %2842 = getelementptr inbounds [258 x [258 x double]]* %2841, i32 0, i64 %2838
  %2843 = getelementptr inbounds [258 x double]* %2842, i32 0, i64 0
  %2844 = load double* %2843, align 8
  %2845 = fmul double %2836, %2844
  %2846 = fadd double %2835, %2845
  %2847 = load double* @lf, align 8
  %2848 = load i64* @im, align 8
  %2849 = sub nsw i64 %2848, 1
  %2850 = load %struct.wrk5_struct** @wrk5, align 8
  %2851 = getelementptr inbounds %struct.wrk5_struct* %2850, i32 0, i32 0
  %2852 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2851, i32 0, i64 1
  %2853 = getelementptr inbounds [258 x [258 x double]]* %2852, i32 0, i64 %2849
  %2854 = getelementptr inbounds [258 x double]* %2853, i32 0, i64 0
  %2855 = load double* %2854, align 8
  %2856 = fmul double %2847, %2855
  %2857 = fsub double %2846, %2856
  %2858 = load i64* @im, align 8
  %2859 = sub nsw i64 %2858, 1
  %2860 = load %struct.wrk1_struct** @wrk1, align 8
  %2861 = getelementptr inbounds %struct.wrk1_struct* %2860, i32 0, i32 1
  %2862 = getelementptr inbounds [258 x [258 x double]]* %2861, i32 0, i64 %2859
  %2863 = getelementptr inbounds [258 x double]* %2862, i32 0, i64 0
  store double %2857, double* %2863, align 8
  %2864 = load double* %hh1, align 8
  %2865 = load i64* @im, align 8
  %2866 = sub nsw i64 %2865, 1
  %2867 = load %struct.wrk4_struct** @wrk4, align 8
  %2868 = getelementptr inbounds %struct.wrk4_struct* %2867, i32 0, i32 1
  %2869 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2868, i32 0, i64 0
  %2870 = getelementptr inbounds [258 x [258 x double]]* %2869, i32 0, i64 %2866
  %2871 = getelementptr inbounds [258 x double]* %2870, i32 0, i64 0
  %2872 = load double* %2871, align 8
  %2873 = fmul double %2864, %2872
  %2874 = load double* %hh3, align 8
  %2875 = load i64* @im, align 8
  %2876 = sub nsw i64 %2875, 1
  %2877 = load %struct.wrk4_struct** @wrk4, align 8
  %2878 = getelementptr inbounds %struct.wrk4_struct* %2877, i32 0, i32 1
  %2879 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2878, i32 0, i64 1
  %2880 = getelementptr inbounds [258 x [258 x double]]* %2879, i32 0, i64 %2876
  %2881 = getelementptr inbounds [258 x double]* %2880, i32 0, i64 0
  %2882 = load double* %2881, align 8
  %2883 = fmul double %2874, %2882
  %2884 = fadd double %2873, %2883
  %2885 = load double* %hinv, align 8
  %2886 = load i64* @im, align 8
  %2887 = sub nsw i64 %2886, 1
  %2888 = load %struct.frcng_struct** @frcng, align 8
  %2889 = getelementptr inbounds %struct.frcng_struct* %2888, i32 0, i32 0
  %2890 = getelementptr inbounds [258 x [258 x double]]* %2889, i32 0, i64 %2887
  %2891 = getelementptr inbounds [258 x double]* %2890, i32 0, i64 0
  %2892 = load double* %2891, align 8
  %2893 = fmul double %2885, %2892
  %2894 = fadd double %2884, %2893
  %2895 = load double* @lf, align 8
  %2896 = load double* %hh1, align 8
  %2897 = fmul double %2895, %2896
  %2898 = load i64* @im, align 8
  %2899 = sub nsw i64 %2898, 1
  %2900 = load %struct.wrk5_struct** @wrk5, align 8
  %2901 = getelementptr inbounds %struct.wrk5_struct* %2900, i32 0, i32 0
  %2902 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2901, i32 0, i64 0
  %2903 = getelementptr inbounds [258 x [258 x double]]* %2902, i32 0, i64 %2899
  %2904 = getelementptr inbounds [258 x double]* %2903, i32 0, i64 0
  %2905 = load double* %2904, align 8
  %2906 = fmul double %2897, %2905
  %2907 = fadd double %2894, %2906
  %2908 = load double* @lf, align 8
  %2909 = load double* %hh3, align 8
  %2910 = fmul double %2908, %2909
  %2911 = load i64* @im, align 8
  %2912 = sub nsw i64 %2911, 1
  %2913 = load %struct.wrk5_struct** @wrk5, align 8
  %2914 = getelementptr inbounds %struct.wrk5_struct* %2913, i32 0, i32 0
  %2915 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2914, i32 0, i64 1
  %2916 = getelementptr inbounds [258 x [258 x double]]* %2915, i32 0, i64 %2912
  %2917 = getelementptr inbounds [258 x double]* %2916, i32 0, i64 0
  %2918 = load double* %2917, align 8
  %2919 = fmul double %2910, %2918
  %2920 = fadd double %2907, %2919
  %2921 = load i64* @im, align 8
  %2922 = sub nsw i64 %2921, 1
  %2923 = load %struct.wrk1_struct** @wrk1, align 8
  %2924 = getelementptr inbounds %struct.wrk1_struct* %2923, i32 0, i32 2
  %2925 = getelementptr inbounds [258 x [258 x double]]* %2924, i32 0, i64 %2922
  %2926 = getelementptr inbounds [258 x double]* %2925, i32 0, i64 0
  store double %2920, double* %2926, align 8
  br label %2927

; <label>:2927                                    ; preds = %2798, %2792
  %2928 = load i64* %1, align 8
  %2929 = load i64* @xprocs, align 8
  %2930 = sub nsw i64 %2929, 1
  %2931 = icmp eq i64 %2928, %2930
  br i1 %2931, label %2932, label %3061

; <label>:2932                                    ; preds = %2927
  %2933 = load i64* @jm, align 8
  %2934 = sub nsw i64 %2933, 1
  %2935 = load %struct.wrk4_struct** @wrk4, align 8
  %2936 = getelementptr inbounds %struct.wrk4_struct* %2935, i32 0, i32 1
  %2937 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2936, i32 0, i64 0
  %2938 = getelementptr inbounds [258 x [258 x double]]* %2937, i32 0, i64 0
  %2939 = getelementptr inbounds [258 x double]* %2938, i32 0, i64 %2934
  %2940 = load double* %2939, align 8
  %2941 = load i64* @jm, align 8
  %2942 = sub nsw i64 %2941, 1
  %2943 = load %struct.wrk4_struct** @wrk4, align 8
  %2944 = getelementptr inbounds %struct.wrk4_struct* %2943, i32 0, i32 1
  %2945 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2944, i32 0, i64 1
  %2946 = getelementptr inbounds [258 x [258 x double]]* %2945, i32 0, i64 0
  %2947 = getelementptr inbounds [258 x double]* %2946, i32 0, i64 %2942
  %2948 = load double* %2947, align 8
  %2949 = fsub double %2940, %2948
  %2950 = load double* @eig2, align 8
  %2951 = load i64* @jm, align 8
  %2952 = sub nsw i64 %2951, 1
  %2953 = load %struct.wrk6_struct** @wrk6, align 8
  %2954 = getelementptr inbounds %struct.wrk6_struct* %2953, i32 0, i32 0
  %2955 = getelementptr inbounds [258 x [258 x double]]* %2954, i32 0, i64 0
  %2956 = getelementptr inbounds [258 x double]* %2955, i32 0, i64 %2952
  %2957 = load double* %2956, align 8
  %2958 = fmul double %2950, %2957
  %2959 = fadd double %2949, %2958
  %2960 = load double* %h1inv, align 8
  %2961 = load i64* @jm, align 8
  %2962 = sub nsw i64 %2961, 1
  %2963 = load %struct.frcng_struct** @frcng, align 8
  %2964 = getelementptr inbounds %struct.frcng_struct* %2963, i32 0, i32 0
  %2965 = getelementptr inbounds [258 x [258 x double]]* %2964, i32 0, i64 0
  %2966 = getelementptr inbounds [258 x double]* %2965, i32 0, i64 %2962
  %2967 = load double* %2966, align 8
  %2968 = fmul double %2960, %2967
  %2969 = fadd double %2959, %2968
  %2970 = load double* @lf, align 8
  %2971 = load i64* @jm, align 8
  %2972 = sub nsw i64 %2971, 1
  %2973 = load %struct.wrk5_struct** @wrk5, align 8
  %2974 = getelementptr inbounds %struct.wrk5_struct* %2973, i32 0, i32 0
  %2975 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2974, i32 0, i64 0
  %2976 = getelementptr inbounds [258 x [258 x double]]* %2975, i32 0, i64 0
  %2977 = getelementptr inbounds [258 x double]* %2976, i32 0, i64 %2972
  %2978 = load double* %2977, align 8
  %2979 = fmul double %2970, %2978
  %2980 = fadd double %2969, %2979
  %2981 = load double* @lf, align 8
  %2982 = load i64* @jm, align 8
  %2983 = sub nsw i64 %2982, 1
  %2984 = load %struct.wrk5_struct** @wrk5, align 8
  %2985 = getelementptr inbounds %struct.wrk5_struct* %2984, i32 0, i32 0
  %2986 = getelementptr inbounds [2 x [258 x [258 x double]]]* %2985, i32 0, i64 1
  %2987 = getelementptr inbounds [258 x [258 x double]]* %2986, i32 0, i64 0
  %2988 = getelementptr inbounds [258 x double]* %2987, i32 0, i64 %2983
  %2989 = load double* %2988, align 8
  %2990 = fmul double %2981, %2989
  %2991 = fsub double %2980, %2990
  %2992 = load i64* @jm, align 8
  %2993 = sub nsw i64 %2992, 1
  %2994 = load %struct.wrk1_struct** @wrk1, align 8
  %2995 = getelementptr inbounds %struct.wrk1_struct* %2994, i32 0, i32 1
  %2996 = getelementptr inbounds [258 x [258 x double]]* %2995, i32 0, i64 0
  %2997 = getelementptr inbounds [258 x double]* %2996, i32 0, i64 %2993
  store double %2991, double* %2997, align 8
  %2998 = load double* %hh1, align 8
  %2999 = load i64* @jm, align 8
  %3000 = sub nsw i64 %2999, 1
  %3001 = load %struct.wrk4_struct** @wrk4, align 8
  %3002 = getelementptr inbounds %struct.wrk4_struct* %3001, i32 0, i32 1
  %3003 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3002, i32 0, i64 0
  %3004 = getelementptr inbounds [258 x [258 x double]]* %3003, i32 0, i64 0
  %3005 = getelementptr inbounds [258 x double]* %3004, i32 0, i64 %3000
  %3006 = load double* %3005, align 8
  %3007 = fmul double %2998, %3006
  %3008 = load double* %hh3, align 8
  %3009 = load i64* @jm, align 8
  %3010 = sub nsw i64 %3009, 1
  %3011 = load %struct.wrk4_struct** @wrk4, align 8
  %3012 = getelementptr inbounds %struct.wrk4_struct* %3011, i32 0, i32 1
  %3013 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3012, i32 0, i64 1
  %3014 = getelementptr inbounds [258 x [258 x double]]* %3013, i32 0, i64 0
  %3015 = getelementptr inbounds [258 x double]* %3014, i32 0, i64 %3010
  %3016 = load double* %3015, align 8
  %3017 = fmul double %3008, %3016
  %3018 = fadd double %3007, %3017
  %3019 = load double* %hinv, align 8
  %3020 = load i64* @jm, align 8
  %3021 = sub nsw i64 %3020, 1
  %3022 = load %struct.frcng_struct** @frcng, align 8
  %3023 = getelementptr inbounds %struct.frcng_struct* %3022, i32 0, i32 0
  %3024 = getelementptr inbounds [258 x [258 x double]]* %3023, i32 0, i64 0
  %3025 = getelementptr inbounds [258 x double]* %3024, i32 0, i64 %3021
  %3026 = load double* %3025, align 8
  %3027 = fmul double %3019, %3026
  %3028 = fadd double %3018, %3027
  %3029 = load double* @lf, align 8
  %3030 = load double* %hh1, align 8
  %3031 = fmul double %3029, %3030
  %3032 = load i64* @jm, align 8
  %3033 = sub nsw i64 %3032, 1
  %3034 = load %struct.wrk5_struct** @wrk5, align 8
  %3035 = getelementptr inbounds %struct.wrk5_struct* %3034, i32 0, i32 0
  %3036 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3035, i32 0, i64 0
  %3037 = getelementptr inbounds [258 x [258 x double]]* %3036, i32 0, i64 0
  %3038 = getelementptr inbounds [258 x double]* %3037, i32 0, i64 %3033
  %3039 = load double* %3038, align 8
  %3040 = fmul double %3031, %3039
  %3041 = fadd double %3028, %3040
  %3042 = load double* @lf, align 8
  %3043 = load double* %hh3, align 8
  %3044 = fmul double %3042, %3043
  %3045 = load i64* @jm, align 8
  %3046 = sub nsw i64 %3045, 1
  %3047 = load %struct.wrk5_struct** @wrk5, align 8
  %3048 = getelementptr inbounds %struct.wrk5_struct* %3047, i32 0, i32 0
  %3049 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3048, i32 0, i64 1
  %3050 = getelementptr inbounds [258 x [258 x double]]* %3049, i32 0, i64 0
  %3051 = getelementptr inbounds [258 x double]* %3050, i32 0, i64 %3046
  %3052 = load double* %3051, align 8
  %3053 = fmul double %3044, %3052
  %3054 = fadd double %3041, %3053
  %3055 = load i64* @jm, align 8
  %3056 = sub nsw i64 %3055, 1
  %3057 = load %struct.wrk1_struct** @wrk1, align 8
  %3058 = getelementptr inbounds %struct.wrk1_struct* %3057, i32 0, i32 2
  %3059 = getelementptr inbounds [258 x [258 x double]]* %3058, i32 0, i64 0
  %3060 = getelementptr inbounds [258 x double]* %3059, i32 0, i64 %3056
  store double %3054, double* %3060, align 8
  br label %3061

; <label>:3061                                    ; preds = %2932, %2927
  %3062 = load i64* %1, align 8
  %3063 = load i64* @nprocs, align 8
  %3064 = sub nsw i64 %3063, 1
  %3065 = icmp eq i64 %3062, %3064
  br i1 %3065, label %3066, label %3221

; <label>:3066                                    ; preds = %3061
  %3067 = load i64* @jm, align 8
  %3068 = sub nsw i64 %3067, 1
  %3069 = load i64* @im, align 8
  %3070 = sub nsw i64 %3069, 1
  %3071 = load %struct.wrk4_struct** @wrk4, align 8
  %3072 = getelementptr inbounds %struct.wrk4_struct* %3071, i32 0, i32 1
  %3073 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3072, i32 0, i64 0
  %3074 = getelementptr inbounds [258 x [258 x double]]* %3073, i32 0, i64 %3070
  %3075 = getelementptr inbounds [258 x double]* %3074, i32 0, i64 %3068
  %3076 = load double* %3075, align 8
  %3077 = load i64* @jm, align 8
  %3078 = sub nsw i64 %3077, 1
  %3079 = load i64* @im, align 8
  %3080 = sub nsw i64 %3079, 1
  %3081 = load %struct.wrk4_struct** @wrk4, align 8
  %3082 = getelementptr inbounds %struct.wrk4_struct* %3081, i32 0, i32 1
  %3083 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3082, i32 0, i64 1
  %3084 = getelementptr inbounds [258 x [258 x double]]* %3083, i32 0, i64 %3080
  %3085 = getelementptr inbounds [258 x double]* %3084, i32 0, i64 %3078
  %3086 = load double* %3085, align 8
  %3087 = fsub double %3076, %3086
  %3088 = load double* @eig2, align 8
  %3089 = load i64* @jm, align 8
  %3090 = sub nsw i64 %3089, 1
  %3091 = load i64* @im, align 8
  %3092 = sub nsw i64 %3091, 1
  %3093 = load %struct.wrk6_struct** @wrk6, align 8
  %3094 = getelementptr inbounds %struct.wrk6_struct* %3093, i32 0, i32 0
  %3095 = getelementptr inbounds [258 x [258 x double]]* %3094, i32 0, i64 %3092
  %3096 = getelementptr inbounds [258 x double]* %3095, i32 0, i64 %3090
  %3097 = load double* %3096, align 8
  %3098 = fmul double %3088, %3097
  %3099 = fadd double %3087, %3098
  %3100 = load double* %h1inv, align 8
  %3101 = load i64* @jm, align 8
  %3102 = sub nsw i64 %3101, 1
  %3103 = load i64* @im, align 8
  %3104 = sub nsw i64 %3103, 1
  %3105 = load %struct.frcng_struct** @frcng, align 8
  %3106 = getelementptr inbounds %struct.frcng_struct* %3105, i32 0, i32 0
  %3107 = getelementptr inbounds [258 x [258 x double]]* %3106, i32 0, i64 %3104
  %3108 = getelementptr inbounds [258 x double]* %3107, i32 0, i64 %3102
  %3109 = load double* %3108, align 8
  %3110 = fmul double %3100, %3109
  %3111 = fadd double %3099, %3110
  %3112 = load double* @lf, align 8
  %3113 = load i64* @jm, align 8
  %3114 = sub nsw i64 %3113, 1
  %3115 = load i64* @im, align 8
  %3116 = sub nsw i64 %3115, 1
  %3117 = load %struct.wrk5_struct** @wrk5, align 8
  %3118 = getelementptr inbounds %struct.wrk5_struct* %3117, i32 0, i32 0
  %3119 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3118, i32 0, i64 0
  %3120 = getelementptr inbounds [258 x [258 x double]]* %3119, i32 0, i64 %3116
  %3121 = getelementptr inbounds [258 x double]* %3120, i32 0, i64 %3114
  %3122 = load double* %3121, align 8
  %3123 = fmul double %3112, %3122
  %3124 = fadd double %3111, %3123
  %3125 = load double* @lf, align 8
  %3126 = load i64* @jm, align 8
  %3127 = sub nsw i64 %3126, 1
  %3128 = load i64* @im, align 8
  %3129 = sub nsw i64 %3128, 1
  %3130 = load %struct.wrk5_struct** @wrk5, align 8
  %3131 = getelementptr inbounds %struct.wrk5_struct* %3130, i32 0, i32 0
  %3132 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3131, i32 0, i64 1
  %3133 = getelementptr inbounds [258 x [258 x double]]* %3132, i32 0, i64 %3129
  %3134 = getelementptr inbounds [258 x double]* %3133, i32 0, i64 %3127
  %3135 = load double* %3134, align 8
  %3136 = fmul double %3125, %3135
  %3137 = fsub double %3124, %3136
  %3138 = load i64* @jm, align 8
  %3139 = sub nsw i64 %3138, 1
  %3140 = load i64* @im, align 8
  %3141 = sub nsw i64 %3140, 1
  %3142 = load %struct.wrk1_struct** @wrk1, align 8
  %3143 = getelementptr inbounds %struct.wrk1_struct* %3142, i32 0, i32 1
  %3144 = getelementptr inbounds [258 x [258 x double]]* %3143, i32 0, i64 %3141
  %3145 = getelementptr inbounds [258 x double]* %3144, i32 0, i64 %3139
  store double %3137, double* %3145, align 8
  %3146 = load double* %hh1, align 8
  %3147 = load i64* @jm, align 8
  %3148 = sub nsw i64 %3147, 1
  %3149 = load i64* @im, align 8
  %3150 = sub nsw i64 %3149, 1
  %3151 = load %struct.wrk4_struct** @wrk4, align 8
  %3152 = getelementptr inbounds %struct.wrk4_struct* %3151, i32 0, i32 1
  %3153 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3152, i32 0, i64 0
  %3154 = getelementptr inbounds [258 x [258 x double]]* %3153, i32 0, i64 %3150
  %3155 = getelementptr inbounds [258 x double]* %3154, i32 0, i64 %3148
  %3156 = load double* %3155, align 8
  %3157 = fmul double %3146, %3156
  %3158 = load double* %hh3, align 8
  %3159 = load i64* @jm, align 8
  %3160 = sub nsw i64 %3159, 1
  %3161 = load i64* @im, align 8
  %3162 = sub nsw i64 %3161, 1
  %3163 = load %struct.wrk4_struct** @wrk4, align 8
  %3164 = getelementptr inbounds %struct.wrk4_struct* %3163, i32 0, i32 1
  %3165 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3164, i32 0, i64 1
  %3166 = getelementptr inbounds [258 x [258 x double]]* %3165, i32 0, i64 %3162
  %3167 = getelementptr inbounds [258 x double]* %3166, i32 0, i64 %3160
  %3168 = load double* %3167, align 8
  %3169 = fmul double %3158, %3168
  %3170 = fadd double %3157, %3169
  %3171 = load double* %hinv, align 8
  %3172 = load i64* @jm, align 8
  %3173 = sub nsw i64 %3172, 1
  %3174 = load i64* @im, align 8
  %3175 = sub nsw i64 %3174, 1
  %3176 = load %struct.frcng_struct** @frcng, align 8
  %3177 = getelementptr inbounds %struct.frcng_struct* %3176, i32 0, i32 0
  %3178 = getelementptr inbounds [258 x [258 x double]]* %3177, i32 0, i64 %3175
  %3179 = getelementptr inbounds [258 x double]* %3178, i32 0, i64 %3173
  %3180 = load double* %3179, align 8
  %3181 = fmul double %3171, %3180
  %3182 = fadd double %3170, %3181
  %3183 = load double* @lf, align 8
  %3184 = load double* %hh1, align 8
  %3185 = fmul double %3183, %3184
  %3186 = load i64* @jm, align 8
  %3187 = sub nsw i64 %3186, 1
  %3188 = load i64* @im, align 8
  %3189 = sub nsw i64 %3188, 1
  %3190 = load %struct.wrk5_struct** @wrk5, align 8
  %3191 = getelementptr inbounds %struct.wrk5_struct* %3190, i32 0, i32 0
  %3192 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3191, i32 0, i64 0
  %3193 = getelementptr inbounds [258 x [258 x double]]* %3192, i32 0, i64 %3189
  %3194 = getelementptr inbounds [258 x double]* %3193, i32 0, i64 %3187
  %3195 = load double* %3194, align 8
  %3196 = fmul double %3185, %3195
  %3197 = fadd double %3182, %3196
  %3198 = load double* @lf, align 8
  %3199 = load double* %hh3, align 8
  %3200 = fmul double %3198, %3199
  %3201 = load i64* @jm, align 8
  %3202 = sub nsw i64 %3201, 1
  %3203 = load i64* @im, align 8
  %3204 = sub nsw i64 %3203, 1
  %3205 = load %struct.wrk5_struct** @wrk5, align 8
  %3206 = getelementptr inbounds %struct.wrk5_struct* %3205, i32 0, i32 0
  %3207 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3206, i32 0, i64 1
  %3208 = getelementptr inbounds [258 x [258 x double]]* %3207, i32 0, i64 %3204
  %3209 = getelementptr inbounds [258 x double]* %3208, i32 0, i64 %3202
  %3210 = load double* %3209, align 8
  %3211 = fmul double %3200, %3210
  %3212 = fadd double %3197, %3211
  %3213 = load i64* @jm, align 8
  %3214 = sub nsw i64 %3213, 1
  %3215 = load i64* @im, align 8
  %3216 = sub nsw i64 %3215, 1
  %3217 = load %struct.wrk1_struct** @wrk1, align 8
  %3218 = getelementptr inbounds %struct.wrk1_struct* %3217, i32 0, i32 2
  %3219 = getelementptr inbounds [258 x [258 x double]]* %3218, i32 0, i64 %3216
  %3220 = getelementptr inbounds [258 x double]* %3219, i32 0, i64 %3214
  store double %3212, double* %3220, align 8
  br label %3221

; <label>:3221                                    ; preds = %3066, %3061
  %3222 = load i64* %2, align 8
  %3223 = icmp eq i64 %3222, 1
  br i1 %3223, label %3224, label %3350

; <label>:3224                                    ; preds = %3221
  %3225 = load i64* %5, align 8
  store i64 %3225, i64* %j, align 8
  br label %3226

; <label>:3226                                    ; preds = %3346, %3224
  %3227 = load i64* %j, align 8
  %3228 = load i64* %6, align 8
  %3229 = icmp sle i64 %3227, %3228
  br i1 %3229, label %3230, label %3349

; <label>:3230                                    ; preds = %3226
  %3231 = load i64* %j, align 8
  %3232 = load %struct.wrk4_struct** @wrk4, align 8
  %3233 = getelementptr inbounds %struct.wrk4_struct* %3232, i32 0, i32 1
  %3234 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3233, i32 0, i64 0
  %3235 = getelementptr inbounds [258 x [258 x double]]* %3234, i32 0, i64 0
  %3236 = getelementptr inbounds [258 x double]* %3235, i32 0, i64 %3231
  %3237 = load double* %3236, align 8
  %3238 = load i64* %j, align 8
  %3239 = load %struct.wrk4_struct** @wrk4, align 8
  %3240 = getelementptr inbounds %struct.wrk4_struct* %3239, i32 0, i32 1
  %3241 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3240, i32 0, i64 1
  %3242 = getelementptr inbounds [258 x [258 x double]]* %3241, i32 0, i64 0
  %3243 = getelementptr inbounds [258 x double]* %3242, i32 0, i64 %3238
  %3244 = load double* %3243, align 8
  %3245 = fsub double %3237, %3244
  %3246 = load double* @eig2, align 8
  %3247 = load i64* %j, align 8
  %3248 = load %struct.wrk6_struct** @wrk6, align 8
  %3249 = getelementptr inbounds %struct.wrk6_struct* %3248, i32 0, i32 0
  %3250 = getelementptr inbounds [258 x [258 x double]]* %3249, i32 0, i64 0
  %3251 = getelementptr inbounds [258 x double]* %3250, i32 0, i64 %3247
  %3252 = load double* %3251, align 8
  %3253 = fmul double %3246, %3252
  %3254 = fadd double %3245, %3253
  %3255 = load double* %h1inv, align 8
  %3256 = load i64* %j, align 8
  %3257 = load %struct.frcng_struct** @frcng, align 8
  %3258 = getelementptr inbounds %struct.frcng_struct* %3257, i32 0, i32 0
  %3259 = getelementptr inbounds [258 x [258 x double]]* %3258, i32 0, i64 0
  %3260 = getelementptr inbounds [258 x double]* %3259, i32 0, i64 %3256
  %3261 = load double* %3260, align 8
  %3262 = fmul double %3255, %3261
  %3263 = fadd double %3254, %3262
  %3264 = load double* @lf, align 8
  %3265 = load i64* %j, align 8
  %3266 = load %struct.wrk5_struct** @wrk5, align 8
  %3267 = getelementptr inbounds %struct.wrk5_struct* %3266, i32 0, i32 0
  %3268 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3267, i32 0, i64 0
  %3269 = getelementptr inbounds [258 x [258 x double]]* %3268, i32 0, i64 0
  %3270 = getelementptr inbounds [258 x double]* %3269, i32 0, i64 %3265
  %3271 = load double* %3270, align 8
  %3272 = fmul double %3264, %3271
  %3273 = fadd double %3263, %3272
  %3274 = load double* @lf, align 8
  %3275 = load i64* %j, align 8
  %3276 = load %struct.wrk5_struct** @wrk5, align 8
  %3277 = getelementptr inbounds %struct.wrk5_struct* %3276, i32 0, i32 0
  %3278 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3277, i32 0, i64 0
  %3279 = getelementptr inbounds [258 x [258 x double]]* %3278, i32 0, i64 0
  %3280 = getelementptr inbounds [258 x double]* %3279, i32 0, i64 %3275
  %3281 = load double* %3280, align 8
  %3282 = fmul double %3274, %3281
  %3283 = fsub double %3273, %3282
  %3284 = load i64* %j, align 8
  %3285 = load %struct.wrk1_struct** @wrk1, align 8
  %3286 = getelementptr inbounds %struct.wrk1_struct* %3285, i32 0, i32 1
  %3287 = getelementptr inbounds [258 x [258 x double]]* %3286, i32 0, i64 0
  %3288 = getelementptr inbounds [258 x double]* %3287, i32 0, i64 %3284
  store double %3283, double* %3288, align 8
  %3289 = load double* %hh1, align 8
  %3290 = load i64* %j, align 8
  %3291 = load %struct.wrk4_struct** @wrk4, align 8
  %3292 = getelementptr inbounds %struct.wrk4_struct* %3291, i32 0, i32 1
  %3293 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3292, i32 0, i64 0
  %3294 = getelementptr inbounds [258 x [258 x double]]* %3293, i32 0, i64 0
  %3295 = getelementptr inbounds [258 x double]* %3294, i32 0, i64 %3290
  %3296 = load double* %3295, align 8
  %3297 = fmul double %3289, %3296
  %3298 = load double* %hh3, align 8
  %3299 = load i64* %j, align 8
  %3300 = load %struct.wrk4_struct** @wrk4, align 8
  %3301 = getelementptr inbounds %struct.wrk4_struct* %3300, i32 0, i32 1
  %3302 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3301, i32 0, i64 1
  %3303 = getelementptr inbounds [258 x [258 x double]]* %3302, i32 0, i64 0
  %3304 = getelementptr inbounds [258 x double]* %3303, i32 0, i64 %3299
  %3305 = load double* %3304, align 8
  %3306 = fmul double %3298, %3305
  %3307 = fadd double %3297, %3306
  %3308 = load double* %hinv, align 8
  %3309 = load i64* %j, align 8
  %3310 = load %struct.frcng_struct** @frcng, align 8
  %3311 = getelementptr inbounds %struct.frcng_struct* %3310, i32 0, i32 0
  %3312 = getelementptr inbounds [258 x [258 x double]]* %3311, i32 0, i64 0
  %3313 = getelementptr inbounds [258 x double]* %3312, i32 0, i64 %3309
  %3314 = load double* %3313, align 8
  %3315 = fmul double %3308, %3314
  %3316 = fadd double %3307, %3315
  %3317 = load double* @lf, align 8
  %3318 = load double* %hh1, align 8
  %3319 = fmul double %3317, %3318
  %3320 = load i64* %j, align 8
  %3321 = load %struct.wrk5_struct** @wrk5, align 8
  %3322 = getelementptr inbounds %struct.wrk5_struct* %3321, i32 0, i32 0
  %3323 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3322, i32 0, i64 0
  %3324 = getelementptr inbounds [258 x [258 x double]]* %3323, i32 0, i64 0
  %3325 = getelementptr inbounds [258 x double]* %3324, i32 0, i64 %3320
  %3326 = load double* %3325, align 8
  %3327 = fmul double %3319, %3326
  %3328 = fadd double %3316, %3327
  %3329 = load double* @lf, align 8
  %3330 = load double* %hh3, align 8
  %3331 = fmul double %3329, %3330
  %3332 = load i64* %j, align 8
  %3333 = load %struct.wrk5_struct** @wrk5, align 8
  %3334 = getelementptr inbounds %struct.wrk5_struct* %3333, i32 0, i32 0
  %3335 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3334, i32 0, i64 1
  %3336 = getelementptr inbounds [258 x [258 x double]]* %3335, i32 0, i64 0
  %3337 = getelementptr inbounds [258 x double]* %3336, i32 0, i64 %3332
  %3338 = load double* %3337, align 8
  %3339 = fmul double %3331, %3338
  %3340 = fadd double %3328, %3339
  %3341 = load i64* %j, align 8
  %3342 = load %struct.wrk1_struct** @wrk1, align 8
  %3343 = getelementptr inbounds %struct.wrk1_struct* %3342, i32 0, i32 2
  %3344 = getelementptr inbounds [258 x [258 x double]]* %3343, i32 0, i64 0
  %3345 = getelementptr inbounds [258 x double]* %3344, i32 0, i64 %3341
  store double %3340, double* %3345, align 8
  br label %3346

; <label>:3346                                    ; preds = %3230
  %3347 = load i64* %j, align 8
  %3348 = add nsw i64 %3347, 1
  store i64 %3348, i64* %j, align 8
  br label %3226

; <label>:3349                                    ; preds = %3226
  br label %3350

; <label>:3350                                    ; preds = %3349, %3221
  %3351 = load i64* %2, align 8
  %3352 = load i64* %4, align 8
  %3353 = add nsw i64 %3351, %3352
  %3354 = load i64* @im, align 8
  %3355 = sub nsw i64 %3354, 1
  %3356 = icmp eq i64 %3353, %3355
  br i1 %3356, label %3357, label %3509

; <label>:3357                                    ; preds = %3350
  %3358 = load i64* %5, align 8
  store i64 %3358, i64* %j, align 8
  br label %3359

; <label>:3359                                    ; preds = %3505, %3357
  %3360 = load i64* %j, align 8
  %3361 = load i64* %6, align 8
  %3362 = icmp sle i64 %3360, %3361
  br i1 %3362, label %3363, label %3508

; <label>:3363                                    ; preds = %3359
  %3364 = load i64* %j, align 8
  %3365 = load i64* @im, align 8
  %3366 = sub nsw i64 %3365, 1
  %3367 = load %struct.wrk4_struct** @wrk4, align 8
  %3368 = getelementptr inbounds %struct.wrk4_struct* %3367, i32 0, i32 1
  %3369 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3368, i32 0, i64 0
  %3370 = getelementptr inbounds [258 x [258 x double]]* %3369, i32 0, i64 %3366
  %3371 = getelementptr inbounds [258 x double]* %3370, i32 0, i64 %3364
  %3372 = load double* %3371, align 8
  %3373 = load i64* %j, align 8
  %3374 = load i64* @im, align 8
  %3375 = sub nsw i64 %3374, 1
  %3376 = load %struct.wrk4_struct** @wrk4, align 8
  %3377 = getelementptr inbounds %struct.wrk4_struct* %3376, i32 0, i32 1
  %3378 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3377, i32 0, i64 1
  %3379 = getelementptr inbounds [258 x [258 x double]]* %3378, i32 0, i64 %3375
  %3380 = getelementptr inbounds [258 x double]* %3379, i32 0, i64 %3373
  %3381 = load double* %3380, align 8
  %3382 = fsub double %3372, %3381
  %3383 = load double* @eig2, align 8
  %3384 = load i64* %j, align 8
  %3385 = load i64* @im, align 8
  %3386 = sub nsw i64 %3385, 1
  %3387 = load %struct.wrk6_struct** @wrk6, align 8
  %3388 = getelementptr inbounds %struct.wrk6_struct* %3387, i32 0, i32 0
  %3389 = getelementptr inbounds [258 x [258 x double]]* %3388, i32 0, i64 %3386
  %3390 = getelementptr inbounds [258 x double]* %3389, i32 0, i64 %3384
  %3391 = load double* %3390, align 8
  %3392 = fmul double %3383, %3391
  %3393 = fadd double %3382, %3392
  %3394 = load double* %h1inv, align 8
  %3395 = load i64* %j, align 8
  %3396 = load i64* @im, align 8
  %3397 = sub nsw i64 %3396, 1
  %3398 = load %struct.frcng_struct** @frcng, align 8
  %3399 = getelementptr inbounds %struct.frcng_struct* %3398, i32 0, i32 0
  %3400 = getelementptr inbounds [258 x [258 x double]]* %3399, i32 0, i64 %3397
  %3401 = getelementptr inbounds [258 x double]* %3400, i32 0, i64 %3395
  %3402 = load double* %3401, align 8
  %3403 = fmul double %3394, %3402
  %3404 = fadd double %3393, %3403
  %3405 = load double* @lf, align 8
  %3406 = load i64* %j, align 8
  %3407 = load i64* @im, align 8
  %3408 = sub nsw i64 %3407, 1
  %3409 = load %struct.wrk5_struct** @wrk5, align 8
  %3410 = getelementptr inbounds %struct.wrk5_struct* %3409, i32 0, i32 0
  %3411 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3410, i32 0, i64 0
  %3412 = getelementptr inbounds [258 x [258 x double]]* %3411, i32 0, i64 %3408
  %3413 = getelementptr inbounds [258 x double]* %3412, i32 0, i64 %3406
  %3414 = load double* %3413, align 8
  %3415 = fmul double %3405, %3414
  %3416 = fadd double %3404, %3415
  %3417 = load double* @lf, align 8
  %3418 = load i64* %j, align 8
  %3419 = load i64* @im, align 8
  %3420 = sub nsw i64 %3419, 1
  %3421 = load %struct.wrk5_struct** @wrk5, align 8
  %3422 = getelementptr inbounds %struct.wrk5_struct* %3421, i32 0, i32 0
  %3423 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3422, i32 0, i64 1
  %3424 = getelementptr inbounds [258 x [258 x double]]* %3423, i32 0, i64 %3420
  %3425 = getelementptr inbounds [258 x double]* %3424, i32 0, i64 %3418
  %3426 = load double* %3425, align 8
  %3427 = fmul double %3417, %3426
  %3428 = fsub double %3416, %3427
  %3429 = load i64* %j, align 8
  %3430 = load i64* @im, align 8
  %3431 = sub nsw i64 %3430, 1
  %3432 = load %struct.wrk1_struct** @wrk1, align 8
  %3433 = getelementptr inbounds %struct.wrk1_struct* %3432, i32 0, i32 1
  %3434 = getelementptr inbounds [258 x [258 x double]]* %3433, i32 0, i64 %3431
  %3435 = getelementptr inbounds [258 x double]* %3434, i32 0, i64 %3429
  store double %3428, double* %3435, align 8
  %3436 = load double* %hh1, align 8
  %3437 = load i64* %j, align 8
  %3438 = load i64* @im, align 8
  %3439 = sub nsw i64 %3438, 1
  %3440 = load %struct.wrk4_struct** @wrk4, align 8
  %3441 = getelementptr inbounds %struct.wrk4_struct* %3440, i32 0, i32 1
  %3442 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3441, i32 0, i64 0
  %3443 = getelementptr inbounds [258 x [258 x double]]* %3442, i32 0, i64 %3439
  %3444 = getelementptr inbounds [258 x double]* %3443, i32 0, i64 %3437
  %3445 = load double* %3444, align 8
  %3446 = fmul double %3436, %3445
  %3447 = load double* %hh3, align 8
  %3448 = load i64* %j, align 8
  %3449 = load i64* @im, align 8
  %3450 = sub nsw i64 %3449, 1
  %3451 = load %struct.wrk4_struct** @wrk4, align 8
  %3452 = getelementptr inbounds %struct.wrk4_struct* %3451, i32 0, i32 1
  %3453 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3452, i32 0, i64 1
  %3454 = getelementptr inbounds [258 x [258 x double]]* %3453, i32 0, i64 %3450
  %3455 = getelementptr inbounds [258 x double]* %3454, i32 0, i64 %3448
  %3456 = load double* %3455, align 8
  %3457 = fmul double %3447, %3456
  %3458 = fadd double %3446, %3457
  %3459 = load double* %hinv, align 8
  %3460 = load i64* %j, align 8
  %3461 = load i64* @im, align 8
  %3462 = sub nsw i64 %3461, 1
  %3463 = load %struct.frcng_struct** @frcng, align 8
  %3464 = getelementptr inbounds %struct.frcng_struct* %3463, i32 0, i32 0
  %3465 = getelementptr inbounds [258 x [258 x double]]* %3464, i32 0, i64 %3462
  %3466 = getelementptr inbounds [258 x double]* %3465, i32 0, i64 %3460
  %3467 = load double* %3466, align 8
  %3468 = fmul double %3459, %3467
  %3469 = fadd double %3458, %3468
  %3470 = load double* @lf, align 8
  %3471 = load double* %hh1, align 8
  %3472 = fmul double %3470, %3471
  %3473 = load i64* %j, align 8
  %3474 = load i64* @im, align 8
  %3475 = sub nsw i64 %3474, 1
  %3476 = load %struct.wrk5_struct** @wrk5, align 8
  %3477 = getelementptr inbounds %struct.wrk5_struct* %3476, i32 0, i32 0
  %3478 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3477, i32 0, i64 0
  %3479 = getelementptr inbounds [258 x [258 x double]]* %3478, i32 0, i64 %3475
  %3480 = getelementptr inbounds [258 x double]* %3479, i32 0, i64 %3473
  %3481 = load double* %3480, align 8
  %3482 = fmul double %3472, %3481
  %3483 = fadd double %3469, %3482
  %3484 = load double* @lf, align 8
  %3485 = load double* %hh3, align 8
  %3486 = fmul double %3484, %3485
  %3487 = load i64* %j, align 8
  %3488 = load i64* @im, align 8
  %3489 = sub nsw i64 %3488, 1
  %3490 = load %struct.wrk5_struct** @wrk5, align 8
  %3491 = getelementptr inbounds %struct.wrk5_struct* %3490, i32 0, i32 0
  %3492 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3491, i32 0, i64 1
  %3493 = getelementptr inbounds [258 x [258 x double]]* %3492, i32 0, i64 %3489
  %3494 = getelementptr inbounds [258 x double]* %3493, i32 0, i64 %3487
  %3495 = load double* %3494, align 8
  %3496 = fmul double %3486, %3495
  %3497 = fadd double %3483, %3496
  %3498 = load i64* %j, align 8
  %3499 = load i64* @im, align 8
  %3500 = sub nsw i64 %3499, 1
  %3501 = load %struct.wrk1_struct** @wrk1, align 8
  %3502 = getelementptr inbounds %struct.wrk1_struct* %3501, i32 0, i32 2
  %3503 = getelementptr inbounds [258 x [258 x double]]* %3502, i32 0, i64 %3500
  %3504 = getelementptr inbounds [258 x double]* %3503, i32 0, i64 %3498
  store double %3497, double* %3504, align 8
  br label %3505

; <label>:3505                                    ; preds = %3363
  %3506 = load i64* %j, align 8
  %3507 = add nsw i64 %3506, 1
  store i64 %3507, i64* %j, align 8
  br label %3359

; <label>:3508                                    ; preds = %3359
  br label %3509

; <label>:3509                                    ; preds = %3508, %3350
  %3510 = load i64* %5, align 8
  %3511 = icmp eq i64 %3510, 1
  br i1 %3511, label %3512, label %3638

; <label>:3512                                    ; preds = %3509
  %3513 = load i64* %2, align 8
  store i64 %3513, i64* %j, align 8
  br label %3514

; <label>:3514                                    ; preds = %3634, %3512
  %3515 = load i64* %j, align 8
  %3516 = load i64* %3, align 8
  %3517 = icmp sle i64 %3515, %3516
  br i1 %3517, label %3518, label %3637

; <label>:3518                                    ; preds = %3514
  %3519 = load i64* %j, align 8
  %3520 = load %struct.wrk4_struct** @wrk4, align 8
  %3521 = getelementptr inbounds %struct.wrk4_struct* %3520, i32 0, i32 1
  %3522 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3521, i32 0, i64 0
  %3523 = getelementptr inbounds [258 x [258 x double]]* %3522, i32 0, i64 %3519
  %3524 = getelementptr inbounds [258 x double]* %3523, i32 0, i64 0
  %3525 = load double* %3524, align 8
  %3526 = load i64* %j, align 8
  %3527 = load %struct.wrk4_struct** @wrk4, align 8
  %3528 = getelementptr inbounds %struct.wrk4_struct* %3527, i32 0, i32 1
  %3529 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3528, i32 0, i64 1
  %3530 = getelementptr inbounds [258 x [258 x double]]* %3529, i32 0, i64 %3526
  %3531 = getelementptr inbounds [258 x double]* %3530, i32 0, i64 0
  %3532 = load double* %3531, align 8
  %3533 = fsub double %3525, %3532
  %3534 = load double* @eig2, align 8
  %3535 = load i64* %j, align 8
  %3536 = load %struct.wrk6_struct** @wrk6, align 8
  %3537 = getelementptr inbounds %struct.wrk6_struct* %3536, i32 0, i32 0
  %3538 = getelementptr inbounds [258 x [258 x double]]* %3537, i32 0, i64 %3535
  %3539 = getelementptr inbounds [258 x double]* %3538, i32 0, i64 0
  %3540 = load double* %3539, align 8
  %3541 = fmul double %3534, %3540
  %3542 = fadd double %3533, %3541
  %3543 = load double* %h1inv, align 8
  %3544 = load i64* %j, align 8
  %3545 = load %struct.frcng_struct** @frcng, align 8
  %3546 = getelementptr inbounds %struct.frcng_struct* %3545, i32 0, i32 0
  %3547 = getelementptr inbounds [258 x [258 x double]]* %3546, i32 0, i64 %3544
  %3548 = getelementptr inbounds [258 x double]* %3547, i32 0, i64 0
  %3549 = load double* %3548, align 8
  %3550 = fmul double %3543, %3549
  %3551 = fadd double %3542, %3550
  %3552 = load double* @lf, align 8
  %3553 = load i64* %j, align 8
  %3554 = load %struct.wrk5_struct** @wrk5, align 8
  %3555 = getelementptr inbounds %struct.wrk5_struct* %3554, i32 0, i32 0
  %3556 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3555, i32 0, i64 0
  %3557 = getelementptr inbounds [258 x [258 x double]]* %3556, i32 0, i64 %3553
  %3558 = getelementptr inbounds [258 x double]* %3557, i32 0, i64 0
  %3559 = load double* %3558, align 8
  %3560 = fmul double %3552, %3559
  %3561 = fadd double %3551, %3560
  %3562 = load double* @lf, align 8
  %3563 = load i64* %j, align 8
  %3564 = load %struct.wrk5_struct** @wrk5, align 8
  %3565 = getelementptr inbounds %struct.wrk5_struct* %3564, i32 0, i32 0
  %3566 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3565, i32 0, i64 1
  %3567 = getelementptr inbounds [258 x [258 x double]]* %3566, i32 0, i64 %3563
  %3568 = getelementptr inbounds [258 x double]* %3567, i32 0, i64 0
  %3569 = load double* %3568, align 8
  %3570 = fmul double %3562, %3569
  %3571 = fsub double %3561, %3570
  %3572 = load i64* %j, align 8
  %3573 = load %struct.wrk1_struct** @wrk1, align 8
  %3574 = getelementptr inbounds %struct.wrk1_struct* %3573, i32 0, i32 1
  %3575 = getelementptr inbounds [258 x [258 x double]]* %3574, i32 0, i64 %3572
  %3576 = getelementptr inbounds [258 x double]* %3575, i32 0, i64 0
  store double %3571, double* %3576, align 8
  %3577 = load double* %hh1, align 8
  %3578 = load i64* %j, align 8
  %3579 = load %struct.wrk4_struct** @wrk4, align 8
  %3580 = getelementptr inbounds %struct.wrk4_struct* %3579, i32 0, i32 1
  %3581 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3580, i32 0, i64 0
  %3582 = getelementptr inbounds [258 x [258 x double]]* %3581, i32 0, i64 %3578
  %3583 = getelementptr inbounds [258 x double]* %3582, i32 0, i64 0
  %3584 = load double* %3583, align 8
  %3585 = fmul double %3577, %3584
  %3586 = load double* %hh3, align 8
  %3587 = load i64* %j, align 8
  %3588 = load %struct.wrk4_struct** @wrk4, align 8
  %3589 = getelementptr inbounds %struct.wrk4_struct* %3588, i32 0, i32 1
  %3590 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3589, i32 0, i64 1
  %3591 = getelementptr inbounds [258 x [258 x double]]* %3590, i32 0, i64 %3587
  %3592 = getelementptr inbounds [258 x double]* %3591, i32 0, i64 0
  %3593 = load double* %3592, align 8
  %3594 = fmul double %3586, %3593
  %3595 = fadd double %3585, %3594
  %3596 = load double* %hinv, align 8
  %3597 = load i64* %j, align 8
  %3598 = load %struct.frcng_struct** @frcng, align 8
  %3599 = getelementptr inbounds %struct.frcng_struct* %3598, i32 0, i32 0
  %3600 = getelementptr inbounds [258 x [258 x double]]* %3599, i32 0, i64 %3597
  %3601 = getelementptr inbounds [258 x double]* %3600, i32 0, i64 0
  %3602 = load double* %3601, align 8
  %3603 = fmul double %3596, %3602
  %3604 = fadd double %3595, %3603
  %3605 = load double* @lf, align 8
  %3606 = load double* %hh1, align 8
  %3607 = fmul double %3605, %3606
  %3608 = load i64* %j, align 8
  %3609 = load %struct.wrk5_struct** @wrk5, align 8
  %3610 = getelementptr inbounds %struct.wrk5_struct* %3609, i32 0, i32 0
  %3611 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3610, i32 0, i64 0
  %3612 = getelementptr inbounds [258 x [258 x double]]* %3611, i32 0, i64 %3608
  %3613 = getelementptr inbounds [258 x double]* %3612, i32 0, i64 0
  %3614 = load double* %3613, align 8
  %3615 = fmul double %3607, %3614
  %3616 = fadd double %3604, %3615
  %3617 = load double* @lf, align 8
  %3618 = load double* %hh3, align 8
  %3619 = fmul double %3617, %3618
  %3620 = load i64* %j, align 8
  %3621 = load %struct.wrk5_struct** @wrk5, align 8
  %3622 = getelementptr inbounds %struct.wrk5_struct* %3621, i32 0, i32 0
  %3623 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3622, i32 0, i64 1
  %3624 = getelementptr inbounds [258 x [258 x double]]* %3623, i32 0, i64 %3620
  %3625 = getelementptr inbounds [258 x double]* %3624, i32 0, i64 0
  %3626 = load double* %3625, align 8
  %3627 = fmul double %3619, %3626
  %3628 = fadd double %3616, %3627
  %3629 = load i64* %j, align 8
  %3630 = load %struct.wrk1_struct** @wrk1, align 8
  %3631 = getelementptr inbounds %struct.wrk1_struct* %3630, i32 0, i32 2
  %3632 = getelementptr inbounds [258 x [258 x double]]* %3631, i32 0, i64 %3629
  %3633 = getelementptr inbounds [258 x double]* %3632, i32 0, i64 0
  store double %3628, double* %3633, align 8
  br label %3634

; <label>:3634                                    ; preds = %3518
  %3635 = load i64* %j, align 8
  %3636 = add nsw i64 %3635, 1
  store i64 %3636, i64* %j, align 8
  br label %3514

; <label>:3637                                    ; preds = %3514
  br label %3638

; <label>:3638                                    ; preds = %3637, %3509
  %3639 = load i64* %5, align 8
  %3640 = load i64* %7, align 8
  %3641 = add nsw i64 %3639, %3640
  %3642 = load i64* @jm, align 8
  %3643 = sub nsw i64 %3642, 1
  %3644 = icmp eq i64 %3641, %3643
  br i1 %3644, label %3645, label %3797

; <label>:3645                                    ; preds = %3638
  %3646 = load i64* %2, align 8
  store i64 %3646, i64* %j, align 8
  br label %3647

; <label>:3647                                    ; preds = %3793, %3645
  %3648 = load i64* %j, align 8
  %3649 = load i64* %3, align 8
  %3650 = icmp sle i64 %3648, %3649
  br i1 %3650, label %3651, label %3796

; <label>:3651                                    ; preds = %3647
  %3652 = load i64* @jm, align 8
  %3653 = sub nsw i64 %3652, 1
  %3654 = load i64* %j, align 8
  %3655 = load %struct.wrk4_struct** @wrk4, align 8
  %3656 = getelementptr inbounds %struct.wrk4_struct* %3655, i32 0, i32 1
  %3657 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3656, i32 0, i64 0
  %3658 = getelementptr inbounds [258 x [258 x double]]* %3657, i32 0, i64 %3654
  %3659 = getelementptr inbounds [258 x double]* %3658, i32 0, i64 %3653
  %3660 = load double* %3659, align 8
  %3661 = load i64* @jm, align 8
  %3662 = sub nsw i64 %3661, 1
  %3663 = load i64* %j, align 8
  %3664 = load %struct.wrk4_struct** @wrk4, align 8
  %3665 = getelementptr inbounds %struct.wrk4_struct* %3664, i32 0, i32 1
  %3666 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3665, i32 0, i64 1
  %3667 = getelementptr inbounds [258 x [258 x double]]* %3666, i32 0, i64 %3663
  %3668 = getelementptr inbounds [258 x double]* %3667, i32 0, i64 %3662
  %3669 = load double* %3668, align 8
  %3670 = fsub double %3660, %3669
  %3671 = load double* @eig2, align 8
  %3672 = load i64* @jm, align 8
  %3673 = sub nsw i64 %3672, 1
  %3674 = load i64* %j, align 8
  %3675 = load %struct.wrk6_struct** @wrk6, align 8
  %3676 = getelementptr inbounds %struct.wrk6_struct* %3675, i32 0, i32 0
  %3677 = getelementptr inbounds [258 x [258 x double]]* %3676, i32 0, i64 %3674
  %3678 = getelementptr inbounds [258 x double]* %3677, i32 0, i64 %3673
  %3679 = load double* %3678, align 8
  %3680 = fmul double %3671, %3679
  %3681 = fadd double %3670, %3680
  %3682 = load double* %h1inv, align 8
  %3683 = load i64* @jm, align 8
  %3684 = sub nsw i64 %3683, 1
  %3685 = load i64* %j, align 8
  %3686 = load %struct.frcng_struct** @frcng, align 8
  %3687 = getelementptr inbounds %struct.frcng_struct* %3686, i32 0, i32 0
  %3688 = getelementptr inbounds [258 x [258 x double]]* %3687, i32 0, i64 %3685
  %3689 = getelementptr inbounds [258 x double]* %3688, i32 0, i64 %3684
  %3690 = load double* %3689, align 8
  %3691 = fmul double %3682, %3690
  %3692 = fadd double %3681, %3691
  %3693 = load double* @lf, align 8
  %3694 = load i64* @jm, align 8
  %3695 = sub nsw i64 %3694, 1
  %3696 = load i64* %j, align 8
  %3697 = load %struct.wrk5_struct** @wrk5, align 8
  %3698 = getelementptr inbounds %struct.wrk5_struct* %3697, i32 0, i32 0
  %3699 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3698, i32 0, i64 0
  %3700 = getelementptr inbounds [258 x [258 x double]]* %3699, i32 0, i64 %3696
  %3701 = getelementptr inbounds [258 x double]* %3700, i32 0, i64 %3695
  %3702 = load double* %3701, align 8
  %3703 = fmul double %3693, %3702
  %3704 = fadd double %3692, %3703
  %3705 = load double* @lf, align 8
  %3706 = load i64* @jm, align 8
  %3707 = sub nsw i64 %3706, 1
  %3708 = load i64* %j, align 8
  %3709 = load %struct.wrk5_struct** @wrk5, align 8
  %3710 = getelementptr inbounds %struct.wrk5_struct* %3709, i32 0, i32 0
  %3711 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3710, i32 0, i64 1
  %3712 = getelementptr inbounds [258 x [258 x double]]* %3711, i32 0, i64 %3708
  %3713 = getelementptr inbounds [258 x double]* %3712, i32 0, i64 %3707
  %3714 = load double* %3713, align 8
  %3715 = fmul double %3705, %3714
  %3716 = fsub double %3704, %3715
  %3717 = load i64* @jm, align 8
  %3718 = sub nsw i64 %3717, 1
  %3719 = load i64* %j, align 8
  %3720 = load %struct.wrk1_struct** @wrk1, align 8
  %3721 = getelementptr inbounds %struct.wrk1_struct* %3720, i32 0, i32 1
  %3722 = getelementptr inbounds [258 x [258 x double]]* %3721, i32 0, i64 %3719
  %3723 = getelementptr inbounds [258 x double]* %3722, i32 0, i64 %3718
  store double %3716, double* %3723, align 8
  %3724 = load double* %hh1, align 8
  %3725 = load i64* @jm, align 8
  %3726 = sub nsw i64 %3725, 1
  %3727 = load i64* %j, align 8
  %3728 = load %struct.wrk4_struct** @wrk4, align 8
  %3729 = getelementptr inbounds %struct.wrk4_struct* %3728, i32 0, i32 1
  %3730 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3729, i32 0, i64 0
  %3731 = getelementptr inbounds [258 x [258 x double]]* %3730, i32 0, i64 %3727
  %3732 = getelementptr inbounds [258 x double]* %3731, i32 0, i64 %3726
  %3733 = load double* %3732, align 8
  %3734 = fmul double %3724, %3733
  %3735 = load double* %hh3, align 8
  %3736 = load i64* @jm, align 8
  %3737 = sub nsw i64 %3736, 1
  %3738 = load i64* %j, align 8
  %3739 = load %struct.wrk4_struct** @wrk4, align 8
  %3740 = getelementptr inbounds %struct.wrk4_struct* %3739, i32 0, i32 1
  %3741 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3740, i32 0, i64 1
  %3742 = getelementptr inbounds [258 x [258 x double]]* %3741, i32 0, i64 %3738
  %3743 = getelementptr inbounds [258 x double]* %3742, i32 0, i64 %3737
  %3744 = load double* %3743, align 8
  %3745 = fmul double %3735, %3744
  %3746 = fadd double %3734, %3745
  %3747 = load double* %hinv, align 8
  %3748 = load i64* @jm, align 8
  %3749 = sub nsw i64 %3748, 1
  %3750 = load i64* %j, align 8
  %3751 = load %struct.frcng_struct** @frcng, align 8
  %3752 = getelementptr inbounds %struct.frcng_struct* %3751, i32 0, i32 0
  %3753 = getelementptr inbounds [258 x [258 x double]]* %3752, i32 0, i64 %3750
  %3754 = getelementptr inbounds [258 x double]* %3753, i32 0, i64 %3749
  %3755 = load double* %3754, align 8
  %3756 = fmul double %3747, %3755
  %3757 = fadd double %3746, %3756
  %3758 = load double* @lf, align 8
  %3759 = load double* %hh1, align 8
  %3760 = fmul double %3758, %3759
  %3761 = load i64* @jm, align 8
  %3762 = sub nsw i64 %3761, 1
  %3763 = load i64* %j, align 8
  %3764 = load %struct.wrk5_struct** @wrk5, align 8
  %3765 = getelementptr inbounds %struct.wrk5_struct* %3764, i32 0, i32 0
  %3766 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3765, i32 0, i64 0
  %3767 = getelementptr inbounds [258 x [258 x double]]* %3766, i32 0, i64 %3763
  %3768 = getelementptr inbounds [258 x double]* %3767, i32 0, i64 %3762
  %3769 = load double* %3768, align 8
  %3770 = fmul double %3760, %3769
  %3771 = fadd double %3757, %3770
  %3772 = load double* @lf, align 8
  %3773 = load double* %hh3, align 8
  %3774 = fmul double %3772, %3773
  %3775 = load i64* @jm, align 8
  %3776 = sub nsw i64 %3775, 1
  %3777 = load i64* %j, align 8
  %3778 = load %struct.wrk5_struct** @wrk5, align 8
  %3779 = getelementptr inbounds %struct.wrk5_struct* %3778, i32 0, i32 0
  %3780 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3779, i32 0, i64 1
  %3781 = getelementptr inbounds [258 x [258 x double]]* %3780, i32 0, i64 %3777
  %3782 = getelementptr inbounds [258 x double]* %3781, i32 0, i64 %3776
  %3783 = load double* %3782, align 8
  %3784 = fmul double %3774, %3783
  %3785 = fadd double %3771, %3784
  %3786 = load i64* @jm, align 8
  %3787 = sub nsw i64 %3786, 1
  %3788 = load i64* %j, align 8
  %3789 = load %struct.wrk1_struct** @wrk1, align 8
  %3790 = getelementptr inbounds %struct.wrk1_struct* %3789, i32 0, i32 2
  %3791 = getelementptr inbounds [258 x [258 x double]]* %3790, i32 0, i64 %3788
  %3792 = getelementptr inbounds [258 x double]* %3791, i32 0, i64 %3787
  store double %3785, double* %3792, align 8
  br label %3793

; <label>:3793                                    ; preds = %3651
  %3794 = load i64* %j, align 8
  %3795 = add nsw i64 %3794, 1
  store i64 %3795, i64* %j, align 8
  br label %3647

; <label>:3796                                    ; preds = %3647
  br label %3797

; <label>:3797                                    ; preds = %3796, %3638
  %3798 = load i64* %2, align 8
  store i64 %3798, i64* %i, align 8
  br label %3799

; <label>:3799                                    ; preds = %3942, %3797
  %3800 = load i64* %i, align 8
  %3801 = load i64* %3, align 8
  %3802 = icmp sle i64 %3800, %3801
  br i1 %3802, label %3803, label %3945

; <label>:3803                                    ; preds = %3799
  %3804 = load i64* %5, align 8
  store i64 %3804, i64* %iindex, align 8
  br label %3805

; <label>:3805                                    ; preds = %3938, %3803
  %3806 = load i64* %iindex, align 8
  %3807 = load i64* %6, align 8
  %3808 = icmp sle i64 %3806, %3807
  br i1 %3808, label %3809, label %3941

; <label>:3809                                    ; preds = %3805
  %3810 = load i64* %iindex, align 8
  %3811 = load i64* %i, align 8
  %3812 = load %struct.wrk4_struct** @wrk4, align 8
  %3813 = getelementptr inbounds %struct.wrk4_struct* %3812, i32 0, i32 1
  %3814 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3813, i32 0, i64 0
  %3815 = getelementptr inbounds [258 x [258 x double]]* %3814, i32 0, i64 %3811
  %3816 = getelementptr inbounds [258 x double]* %3815, i32 0, i64 %3810
  %3817 = load double* %3816, align 8
  %3818 = load i64* %iindex, align 8
  %3819 = load i64* %i, align 8
  %3820 = load %struct.wrk4_struct** @wrk4, align 8
  %3821 = getelementptr inbounds %struct.wrk4_struct* %3820, i32 0, i32 1
  %3822 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3821, i32 0, i64 1
  %3823 = getelementptr inbounds [258 x [258 x double]]* %3822, i32 0, i64 %3819
  %3824 = getelementptr inbounds [258 x double]* %3823, i32 0, i64 %3818
  %3825 = load double* %3824, align 8
  %3826 = fsub double %3817, %3825
  %3827 = load double* @eig2, align 8
  %3828 = load i64* %iindex, align 8
  %3829 = load i64* %i, align 8
  %3830 = load %struct.wrk6_struct** @wrk6, align 8
  %3831 = getelementptr inbounds %struct.wrk6_struct* %3830, i32 0, i32 0
  %3832 = getelementptr inbounds [258 x [258 x double]]* %3831, i32 0, i64 %3829
  %3833 = getelementptr inbounds [258 x double]* %3832, i32 0, i64 %3828
  %3834 = load double* %3833, align 8
  %3835 = fmul double %3827, %3834
  %3836 = fadd double %3826, %3835
  %3837 = load double* %h1inv, align 8
  %3838 = load i64* %iindex, align 8
  %3839 = load i64* %i, align 8
  %3840 = load %struct.frcng_struct** @frcng, align 8
  %3841 = getelementptr inbounds %struct.frcng_struct* %3840, i32 0, i32 0
  %3842 = getelementptr inbounds [258 x [258 x double]]* %3841, i32 0, i64 %3839
  %3843 = getelementptr inbounds [258 x double]* %3842, i32 0, i64 %3838
  %3844 = load double* %3843, align 8
  %3845 = fmul double %3837, %3844
  %3846 = fadd double %3836, %3845
  %3847 = load double* @lf, align 8
  %3848 = load i64* %iindex, align 8
  %3849 = load i64* %i, align 8
  %3850 = load %struct.wrk5_struct** @wrk5, align 8
  %3851 = getelementptr inbounds %struct.wrk5_struct* %3850, i32 0, i32 0
  %3852 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3851, i32 0, i64 0
  %3853 = getelementptr inbounds [258 x [258 x double]]* %3852, i32 0, i64 %3849
  %3854 = getelementptr inbounds [258 x double]* %3853, i32 0, i64 %3848
  %3855 = load double* %3854, align 8
  %3856 = fmul double %3847, %3855
  %3857 = fadd double %3846, %3856
  %3858 = load double* @lf, align 8
  %3859 = load i64* %iindex, align 8
  %3860 = load i64* %i, align 8
  %3861 = load %struct.wrk5_struct** @wrk5, align 8
  %3862 = getelementptr inbounds %struct.wrk5_struct* %3861, i32 0, i32 0
  %3863 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3862, i32 0, i64 1
  %3864 = getelementptr inbounds [258 x [258 x double]]* %3863, i32 0, i64 %3860
  %3865 = getelementptr inbounds [258 x double]* %3864, i32 0, i64 %3859
  %3866 = load double* %3865, align 8
  %3867 = fmul double %3858, %3866
  %3868 = fsub double %3857, %3867
  %3869 = load i64* %iindex, align 8
  %3870 = load i64* %i, align 8
  %3871 = load %struct.wrk1_struct** @wrk1, align 8
  %3872 = getelementptr inbounds %struct.wrk1_struct* %3871, i32 0, i32 1
  %3873 = getelementptr inbounds [258 x [258 x double]]* %3872, i32 0, i64 %3870
  %3874 = getelementptr inbounds [258 x double]* %3873, i32 0, i64 %3869
  store double %3868, double* %3874, align 8
  %3875 = load double* %hh1, align 8
  %3876 = load i64* %iindex, align 8
  %3877 = load i64* %i, align 8
  %3878 = load %struct.wrk4_struct** @wrk4, align 8
  %3879 = getelementptr inbounds %struct.wrk4_struct* %3878, i32 0, i32 1
  %3880 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3879, i32 0, i64 0
  %3881 = getelementptr inbounds [258 x [258 x double]]* %3880, i32 0, i64 %3877
  %3882 = getelementptr inbounds [258 x double]* %3881, i32 0, i64 %3876
  %3883 = load double* %3882, align 8
  %3884 = fmul double %3875, %3883
  %3885 = load double* %hh3, align 8
  %3886 = load i64* %iindex, align 8
  %3887 = load i64* %i, align 8
  %3888 = load %struct.wrk4_struct** @wrk4, align 8
  %3889 = getelementptr inbounds %struct.wrk4_struct* %3888, i32 0, i32 1
  %3890 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3889, i32 0, i64 1
  %3891 = getelementptr inbounds [258 x [258 x double]]* %3890, i32 0, i64 %3887
  %3892 = getelementptr inbounds [258 x double]* %3891, i32 0, i64 %3886
  %3893 = load double* %3892, align 8
  %3894 = fmul double %3885, %3893
  %3895 = fadd double %3884, %3894
  %3896 = load double* %hinv, align 8
  %3897 = load i64* %iindex, align 8
  %3898 = load i64* %i, align 8
  %3899 = load %struct.frcng_struct** @frcng, align 8
  %3900 = getelementptr inbounds %struct.frcng_struct* %3899, i32 0, i32 0
  %3901 = getelementptr inbounds [258 x [258 x double]]* %3900, i32 0, i64 %3898
  %3902 = getelementptr inbounds [258 x double]* %3901, i32 0, i64 %3897
  %3903 = load double* %3902, align 8
  %3904 = fmul double %3896, %3903
  %3905 = fadd double %3895, %3904
  %3906 = load double* @lf, align 8
  %3907 = load double* %hh1, align 8
  %3908 = fmul double %3906, %3907
  %3909 = load i64* %iindex, align 8
  %3910 = load i64* %i, align 8
  %3911 = load %struct.wrk5_struct** @wrk5, align 8
  %3912 = getelementptr inbounds %struct.wrk5_struct* %3911, i32 0, i32 0
  %3913 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3912, i32 0, i64 0
  %3914 = getelementptr inbounds [258 x [258 x double]]* %3913, i32 0, i64 %3910
  %3915 = getelementptr inbounds [258 x double]* %3914, i32 0, i64 %3909
  %3916 = load double* %3915, align 8
  %3917 = fmul double %3908, %3916
  %3918 = fadd double %3905, %3917
  %3919 = load double* @lf, align 8
  %3920 = load double* %hh3, align 8
  %3921 = fmul double %3919, %3920
  %3922 = load i64* %iindex, align 8
  %3923 = load i64* %i, align 8
  %3924 = load %struct.wrk5_struct** @wrk5, align 8
  %3925 = getelementptr inbounds %struct.wrk5_struct* %3924, i32 0, i32 0
  %3926 = getelementptr inbounds [2 x [258 x [258 x double]]]* %3925, i32 0, i64 1
  %3927 = getelementptr inbounds [258 x [258 x double]]* %3926, i32 0, i64 %3923
  %3928 = getelementptr inbounds [258 x double]* %3927, i32 0, i64 %3922
  %3929 = load double* %3928, align 8
  %3930 = fmul double %3921, %3929
  %3931 = fadd double %3918, %3930
  %3932 = load i64* %iindex, align 8
  %3933 = load i64* %i, align 8
  %3934 = load %struct.wrk1_struct** @wrk1, align 8
  %3935 = getelementptr inbounds %struct.wrk1_struct* %3934, i32 0, i32 2
  %3936 = getelementptr inbounds [258 x [258 x double]]* %3935, i32 0, i64 %3933
  %3937 = getelementptr inbounds [258 x double]* %3936, i32 0, i64 %3932
  store double %3931, double* %3937, align 8
  br label %3938

; <label>:3938                                    ; preds = %3809
  %3939 = load i64* %iindex, align 8
  %3940 = add nsw i64 %3939, 1
  store i64 %3940, i64* %iindex, align 8
  br label %3805

; <label>:3941                                    ; preds = %3805
  br label %3942

; <label>:3942                                    ; preds = %3941
  %3943 = load i64* %i, align 8
  %3944 = add nsw i64 %3943, 1
  store i64 %3944, i64* %i, align 8
  br label %3799

; <label>:3945                                    ; preds = %3799
  %3946 = load %struct.bars_struct** @bars, align 8
  %3947 = getelementptr inbounds %struct.bars_struct* %3946, i32 0, i32 0
  %3948 = getelementptr inbounds %struct.anon* %3947, i32 0, i32 0
  %3949 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %3948) #6
  %3950 = sext i32 %3949 to i64
  store i64 %3950, i64* %Error13, align 8
  %3951 = load i64* %Error13, align 8
  %3952 = icmp ne i64 %3951, 0
  br i1 %3952, label %3953, label %3955

; <label>:3953                                    ; preds = %3945
  %3954 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str41, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:3955                                    ; preds = %3945
  %3956 = load %struct.bars_struct** @bars, align 8
  %3957 = getelementptr inbounds %struct.bars_struct* %3956, i32 0, i32 0
  %3958 = getelementptr inbounds %struct.anon* %3957, i32 0, i32 3
  %3959 = load i64* %3958, align 8
  store i64 %3959, i64* %Cycle14, align 8
  %3960 = load %struct.bars_struct** @bars, align 8
  %3961 = getelementptr inbounds %struct.bars_struct* %3960, i32 0, i32 0
  %3962 = getelementptr inbounds %struct.anon* %3961, i32 0, i32 2
  %3963 = load i64* %3962, align 8
  %3964 = add i64 %3963, 1
  store i64 %3964, i64* %3962, align 8
  %3965 = load i64* @nprocs, align 8
  %3966 = icmp ne i64 %3964, %3965
  br i1 %3966, label %3967, label %3995

; <label>:3967                                    ; preds = %3955
  %3968 = bitcast i64* %Cancel15 to i32*
  %3969 = call i32 @pthread_setcancelstate(i32 1, i32* %3968)
  br label %3970

; <label>:3970                                    ; preds = %3989, %3967
  %3971 = load i64* %Cycle14, align 8
  %3972 = load %struct.bars_struct** @bars, align 8
  %3973 = getelementptr inbounds %struct.bars_struct* %3972, i32 0, i32 0
  %3974 = getelementptr inbounds %struct.anon* %3973, i32 0, i32 3
  %3975 = load i64* %3974, align 8
  %3976 = icmp eq i64 %3971, %3975
  br i1 %3976, label %3977, label %3990

; <label>:3977                                    ; preds = %3970
  %3978 = load %struct.bars_struct** @bars, align 8
  %3979 = getelementptr inbounds %struct.bars_struct* %3978, i32 0, i32 0
  %3980 = getelementptr inbounds %struct.anon* %3979, i32 0, i32 1
  %3981 = load %struct.bars_struct** @bars, align 8
  %3982 = getelementptr inbounds %struct.bars_struct* %3981, i32 0, i32 0
  %3983 = getelementptr inbounds %struct.anon* %3982, i32 0, i32 0
  %3984 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %3980, %union.pthread_mutex_t* %3983)
  %3985 = sext i32 %3984 to i64
  store i64 %3985, i64* %Error13, align 8
  %3986 = load i64* %Error13, align 8
  %3987 = icmp ne i64 %3986, 0
  br i1 %3987, label %3988, label %3989

; <label>:3988                                    ; preds = %3977
  br label %3990

; <label>:3989                                    ; preds = %3977
  br label %3970

; <label>:3990                                    ; preds = %3988, %3970
  %3991 = load i64* %Cancel15, align 8
  %3992 = trunc i64 %3991 to i32
  %3993 = bitcast i64* %Temp16 to i32*
  %3994 = call i32 @pthread_setcancelstate(i32 %3992, i32* %3993)
  br label %4015

; <label>:3995                                    ; preds = %3955
  %3996 = load %struct.bars_struct** @bars, align 8
  %3997 = getelementptr inbounds %struct.bars_struct* %3996, i32 0, i32 0
  %3998 = getelementptr inbounds %struct.anon* %3997, i32 0, i32 3
  %3999 = load i64* %3998, align 8
  %4000 = icmp ne i64 %3999, 0
  %4001 = xor i1 %4000, true
  %4002 = zext i1 %4001 to i32
  %4003 = sext i32 %4002 to i64
  %4004 = load %struct.bars_struct** @bars, align 8
  %4005 = getelementptr inbounds %struct.bars_struct* %4004, i32 0, i32 0
  %4006 = getelementptr inbounds %struct.anon* %4005, i32 0, i32 3
  store i64 %4003, i64* %4006, align 8
  %4007 = load %struct.bars_struct** @bars, align 8
  %4008 = getelementptr inbounds %struct.bars_struct* %4007, i32 0, i32 0
  %4009 = getelementptr inbounds %struct.anon* %4008, i32 0, i32 2
  store i64 0, i64* %4009, align 8
  %4010 = load %struct.bars_struct** @bars, align 8
  %4011 = getelementptr inbounds %struct.bars_struct* %4010, i32 0, i32 0
  %4012 = getelementptr inbounds %struct.anon* %4011, i32 0, i32 1
  %4013 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %4012) #6
  %4014 = sext i32 %4013 to i64
  store i64 %4014, i64* %Error13, align 8
  br label %4015

; <label>:4015                                    ; preds = %3995, %3990
  %4016 = load %struct.bars_struct** @bars, align 8
  %4017 = getelementptr inbounds %struct.bars_struct* %4016, i32 0, i32 0
  %4018 = getelementptr inbounds %struct.anon* %4017, i32 0, i32 0
  %4019 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %4018) #6
  %4020 = load i64* @numlev, align 8
  %4021 = sub nsw i64 %4020, 1
  %4022 = load i64* %1, align 8
  %4023 = load %struct.Global_Private** @gp, align 8
  %4024 = getelementptr inbounds %struct.Global_Private* %4023, i64 %4022
  %4025 = getelementptr inbounds %struct.Global_Private* %4024, i32 0, i32 4
  %4026 = getelementptr inbounds [9 x i64]* %4025, i32 0, i64 %4021
  %4027 = load i64* %4026, align 8
  store i64 %4027, i64* %istart, align 8
  %4028 = load i64* %istart, align 8
  %4029 = load i64* @numlev, align 8
  %4030 = sub nsw i64 %4029, 1
  %4031 = load i64* %1, align 8
  %4032 = load %struct.Global_Private** @gp, align 8
  %4033 = getelementptr inbounds %struct.Global_Private* %4032, i64 %4031
  %4034 = getelementptr inbounds %struct.Global_Private* %4033, i32 0, i32 6
  %4035 = getelementptr inbounds [9 x i64]* %4034, i32 0, i64 %4030
  %4036 = load i64* %4035, align 8
  %4037 = add nsw i64 %4028, %4036
  %4038 = sub nsw i64 %4037, 1
  store i64 %4038, i64* %iend, align 8
  %4039 = load i64* @numlev, align 8
  %4040 = sub nsw i64 %4039, 1
  %4041 = load i64* %1, align 8
  %4042 = load %struct.Global_Private** @gp, align 8
  %4043 = getelementptr inbounds %struct.Global_Private* %4042, i64 %4041
  %4044 = getelementptr inbounds %struct.Global_Private* %4043, i32 0, i32 3
  %4045 = getelementptr inbounds [9 x i64]* %4044, i32 0, i64 %4040
  %4046 = load i64* %4045, align 8
  store i64 %4046, i64* %jstart, align 8
  %4047 = load i64* %jstart, align 8
  %4048 = load i64* @numlev, align 8
  %4049 = sub nsw i64 %4048, 1
  %4050 = load i64* %1, align 8
  %4051 = load %struct.Global_Private** @gp, align 8
  %4052 = getelementptr inbounds %struct.Global_Private* %4051, i64 %4050
  %4053 = getelementptr inbounds %struct.Global_Private* %4052, i32 0, i32 5
  %4054 = getelementptr inbounds [9 x i64]* %4053, i32 0, i64 %4049
  %4055 = load i64* %4054, align 8
  %4056 = add nsw i64 %4047, %4055
  %4057 = sub nsw i64 %4056, 1
  store i64 %4057, i64* %jend, align 8
  %4058 = load i64* %istart, align 8
  store i64 %4058, i64* %ist, align 8
  %4059 = load i64* %iend, align 8
  store i64 %4059, i64* %ien, align 8
  %4060 = load i64* %jstart, align 8
  store i64 %4060, i64* %jst, align 8
  %4061 = load i64* %jend, align 8
  store i64 %4061, i64* %jen, align 8
  %4062 = load i64* %istart, align 8
  %4063 = icmp eq i64 %4062, 1
  br i1 %4063, label %4064, label %4065

; <label>:4064                                    ; preds = %4015
  store i64 0, i64* %istart, align 8
  br label %4065

; <label>:4065                                    ; preds = %4064, %4015
  %4066 = load i64* %jstart, align 8
  %4067 = icmp eq i64 %4066, 1
  br i1 %4067, label %4068, label %4069

; <label>:4068                                    ; preds = %4065
  store i64 0, i64* %jstart, align 8
  br label %4069

; <label>:4069                                    ; preds = %4068, %4065
  %4070 = load i64* %iend, align 8
  %4071 = load i64* @im, align 8
  %4072 = sub nsw i64 %4071, 2
  %4073 = icmp eq i64 %4070, %4072
  br i1 %4073, label %4074, label %4077

; <label>:4074                                    ; preds = %4069
  %4075 = load i64* @im, align 8
  %4076 = sub nsw i64 %4075, 1
  store i64 %4076, i64* %iend, align 8
  br label %4077

; <label>:4077                                    ; preds = %4074, %4069
  %4078 = load i64* %jend, align 8
  %4079 = load i64* @jm, align 8
  %4080 = sub nsw i64 %4079, 2
  %4081 = icmp eq i64 %4078, %4080
  br i1 %4081, label %4082, label %4085

; <label>:4082                                    ; preds = %4077
  %4083 = load i64* @jm, align 8
  %4084 = sub nsw i64 %4083, 1
  store i64 %4084, i64* %jend, align 8
  br label %4085

; <label>:4085                                    ; preds = %4082, %4077
  %4086 = load i64* %istart, align 8
  store i64 %4086, i64* %i, align 8
  br label %4087

; <label>:4087                                    ; preds = %4120, %4085
  %4088 = load i64* %i, align 8
  %4089 = load i64* %iend, align 8
  %4090 = icmp sle i64 %4088, %4089
  br i1 %4090, label %4091, label %4123

; <label>:4091                                    ; preds = %4087
  %4092 = load i64* %jstart, align 8
  store i64 %4092, i64* %j, align 8
  br label %4093

; <label>:4093                                    ; preds = %4116, %4091
  %4094 = load i64* %j, align 8
  %4095 = load i64* %jend, align 8
  %4096 = icmp sle i64 %4094, %4095
  br i1 %4096, label %4097, label %4119

; <label>:4097                                    ; preds = %4093
  %4098 = load i64* %j, align 8
  %4099 = load i64* %i, align 8
  %4100 = load %struct.wrk1_struct** @wrk1, align 8
  %4101 = getelementptr inbounds %struct.wrk1_struct* %4100, i32 0, i32 1
  %4102 = getelementptr inbounds [258 x [258 x double]]* %4101, i32 0, i64 %4099
  %4103 = getelementptr inbounds [258 x double]* %4102, i32 0, i64 %4098
  %4104 = load double* %4103, align 8
  %4105 = load double* %ressqr, align 8
  %4106 = fmul double %4104, %4105
  %4107 = load i64* %j, align 8
  %4108 = load i64* %i, align 8
  %4109 = load i64* @numlev, align 8
  %4110 = sub nsw i64 %4109, 1
  %4111 = load %struct.multi_struct** @multi, align 8
  %4112 = getelementptr inbounds %struct.multi_struct* %4111, i32 0, i32 1
  %4113 = getelementptr inbounds [9 x [258 x [258 x double]]]* %4112, i32 0, i64 %4110
  %4114 = getelementptr inbounds [258 x [258 x double]]* %4113, i32 0, i64 %4108
  %4115 = getelementptr inbounds [258 x double]* %4114, i32 0, i64 %4107
  store double %4106, double* %4115, align 8
  br label %4116

; <label>:4116                                    ; preds = %4097
  %4117 = load i64* %j, align 8
  %4118 = add nsw i64 %4117, 1
  store i64 %4118, i64* %j, align 8
  br label %4093

; <label>:4119                                    ; preds = %4093
  br label %4120

; <label>:4120                                    ; preds = %4119
  %4121 = load i64* %i, align 8
  %4122 = add nsw i64 %4121, 1
  store i64 %4122, i64* %i, align 8
  br label %4087

; <label>:4123                                    ; preds = %4087
  %4124 = load i64* %istart, align 8
  %4125 = icmp eq i64 %4124, 0
  br i1 %4125, label %4126, label %4151

; <label>:4126                                    ; preds = %4123
  %4127 = load i64* %jstart, align 8
  store i64 %4127, i64* %j, align 8
  br label %4128

; <label>:4128                                    ; preds = %4147, %4126
  %4129 = load i64* %j, align 8
  %4130 = load i64* %jend, align 8
  %4131 = icmp sle i64 %4129, %4130
  br i1 %4131, label %4132, label %4150

; <label>:4132                                    ; preds = %4128
  %4133 = load i64* %j, align 8
  %4134 = load %struct.wrk1_struct** @wrk1, align 8
  %4135 = getelementptr inbounds %struct.wrk1_struct* %4134, i32 0, i32 1
  %4136 = getelementptr inbounds [258 x [258 x double]]* %4135, i32 0, i64 0
  %4137 = getelementptr inbounds [258 x double]* %4136, i32 0, i64 %4133
  %4138 = load double* %4137, align 8
  %4139 = load i64* %j, align 8
  %4140 = load i64* @numlev, align 8
  %4141 = sub nsw i64 %4140, 1
  %4142 = load %struct.multi_struct** @multi, align 8
  %4143 = getelementptr inbounds %struct.multi_struct* %4142, i32 0, i32 0
  %4144 = getelementptr inbounds [9 x [258 x [258 x double]]]* %4143, i32 0, i64 %4141
  %4145 = getelementptr inbounds [258 x [258 x double]]* %4144, i32 0, i64 0
  %4146 = getelementptr inbounds [258 x double]* %4145, i32 0, i64 %4139
  store double %4138, double* %4146, align 8
  br label %4147

; <label>:4147                                    ; preds = %4132
  %4148 = load i64* %j, align 8
  %4149 = add nsw i64 %4148, 1
  store i64 %4149, i64* %j, align 8
  br label %4128

; <label>:4150                                    ; preds = %4128
  br label %4151

; <label>:4151                                    ; preds = %4150, %4123
  %4152 = load i64* %iend, align 8
  %4153 = load i64* @im, align 8
  %4154 = sub nsw i64 %4153, 1
  %4155 = icmp eq i64 %4152, %4154
  br i1 %4155, label %4156, label %4185

; <label>:4156                                    ; preds = %4151
  %4157 = load i64* %jstart, align 8
  store i64 %4157, i64* %j, align 8
  br label %4158

; <label>:4158                                    ; preds = %4181, %4156
  %4159 = load i64* %j, align 8
  %4160 = load i64* %jend, align 8
  %4161 = icmp sle i64 %4159, %4160
  br i1 %4161, label %4162, label %4184

; <label>:4162                                    ; preds = %4158
  %4163 = load i64* %j, align 8
  %4164 = load i64* @im, align 8
  %4165 = sub nsw i64 %4164, 1
  %4166 = load %struct.wrk1_struct** @wrk1, align 8
  %4167 = getelementptr inbounds %struct.wrk1_struct* %4166, i32 0, i32 1
  %4168 = getelementptr inbounds [258 x [258 x double]]* %4167, i32 0, i64 %4165
  %4169 = getelementptr inbounds [258 x double]* %4168, i32 0, i64 %4163
  %4170 = load double* %4169, align 8
  %4171 = load i64* %j, align 8
  %4172 = load i64* @im, align 8
  %4173 = sub nsw i64 %4172, 1
  %4174 = load i64* @numlev, align 8
  %4175 = sub nsw i64 %4174, 1
  %4176 = load %struct.multi_struct** @multi, align 8
  %4177 = getelementptr inbounds %struct.multi_struct* %4176, i32 0, i32 0
  %4178 = getelementptr inbounds [9 x [258 x [258 x double]]]* %4177, i32 0, i64 %4175
  %4179 = getelementptr inbounds [258 x [258 x double]]* %4178, i32 0, i64 %4173
  %4180 = getelementptr inbounds [258 x double]* %4179, i32 0, i64 %4171
  store double %4170, double* %4180, align 8
  br label %4181

; <label>:4181                                    ; preds = %4162
  %4182 = load i64* %j, align 8
  %4183 = add nsw i64 %4182, 1
  store i64 %4183, i64* %j, align 8
  br label %4158

; <label>:4184                                    ; preds = %4158
  br label %4185

; <label>:4185                                    ; preds = %4184, %4151
  %4186 = load i64* %jstart, align 8
  %4187 = icmp eq i64 %4186, 0
  br i1 %4187, label %4188, label %4213

; <label>:4188                                    ; preds = %4185
  %4189 = load i64* %istart, align 8
  store i64 %4189, i64* %i, align 8
  br label %4190

; <label>:4190                                    ; preds = %4209, %4188
  %4191 = load i64* %i, align 8
  %4192 = load i64* %iend, align 8
  %4193 = icmp sle i64 %4191, %4192
  br i1 %4193, label %4194, label %4212

; <label>:4194                                    ; preds = %4190
  %4195 = load i64* %i, align 8
  %4196 = load %struct.wrk1_struct** @wrk1, align 8
  %4197 = getelementptr inbounds %struct.wrk1_struct* %4196, i32 0, i32 1
  %4198 = getelementptr inbounds [258 x [258 x double]]* %4197, i32 0, i64 %4195
  %4199 = getelementptr inbounds [258 x double]* %4198, i32 0, i64 0
  %4200 = load double* %4199, align 8
  %4201 = load i64* %i, align 8
  %4202 = load i64* @numlev, align 8
  %4203 = sub nsw i64 %4202, 1
  %4204 = load %struct.multi_struct** @multi, align 8
  %4205 = getelementptr inbounds %struct.multi_struct* %4204, i32 0, i32 0
  %4206 = getelementptr inbounds [9 x [258 x [258 x double]]]* %4205, i32 0, i64 %4203
  %4207 = getelementptr inbounds [258 x [258 x double]]* %4206, i32 0, i64 %4201
  %4208 = getelementptr inbounds [258 x double]* %4207, i32 0, i64 0
  store double %4200, double* %4208, align 8
  br label %4209

; <label>:4209                                    ; preds = %4194
  %4210 = load i64* %i, align 8
  %4211 = add nsw i64 %4210, 1
  store i64 %4211, i64* %i, align 8
  br label %4190

; <label>:4212                                    ; preds = %4190
  br label %4213

; <label>:4213                                    ; preds = %4212, %4185
  %4214 = load i64* %jend, align 8
  %4215 = load i64* @jm, align 8
  %4216 = sub nsw i64 %4215, 1
  %4217 = icmp eq i64 %4214, %4216
  br i1 %4217, label %4218, label %4247

; <label>:4218                                    ; preds = %4213
  %4219 = load i64* %istart, align 8
  store i64 %4219, i64* %i, align 8
  br label %4220

; <label>:4220                                    ; preds = %4243, %4218
  %4221 = load i64* %i, align 8
  %4222 = load i64* %iend, align 8
  %4223 = icmp sle i64 %4221, %4222
  br i1 %4223, label %4224, label %4246

; <label>:4224                                    ; preds = %4220
  %4225 = load i64* @jm, align 8
  %4226 = sub nsw i64 %4225, 1
  %4227 = load i64* %i, align 8
  %4228 = load %struct.wrk1_struct** @wrk1, align 8
  %4229 = getelementptr inbounds %struct.wrk1_struct* %4228, i32 0, i32 1
  %4230 = getelementptr inbounds [258 x [258 x double]]* %4229, i32 0, i64 %4227
  %4231 = getelementptr inbounds [258 x double]* %4230, i32 0, i64 %4226
  %4232 = load double* %4231, align 8
  %4233 = load i64* @jm, align 8
  %4234 = sub nsw i64 %4233, 1
  %4235 = load i64* %i, align 8
  %4236 = load i64* @numlev, align 8
  %4237 = sub nsw i64 %4236, 1
  %4238 = load %struct.multi_struct** @multi, align 8
  %4239 = getelementptr inbounds %struct.multi_struct* %4238, i32 0, i32 0
  %4240 = getelementptr inbounds [9 x [258 x [258 x double]]]* %4239, i32 0, i64 %4237
  %4241 = getelementptr inbounds [258 x [258 x double]]* %4240, i32 0, i64 %4235
  %4242 = getelementptr inbounds [258 x double]* %4241, i32 0, i64 %4234
  store double %4232, double* %4242, align 8
  br label %4243

; <label>:4243                                    ; preds = %4224
  %4244 = load i64* %i, align 8
  %4245 = add nsw i64 %4244, 1
  store i64 %4245, i64* %i, align 8
  br label %4220

; <label>:4246                                    ; preds = %4220
  br label %4247

; <label>:4247                                    ; preds = %4246, %4213
  %4248 = load double* %ressqr, align 8
  %4249 = load double* @eig2, align 8
  %4250 = fmul double %4248, %4249
  %4251 = fsub double 4.000000e+00, %4250
  %4252 = fdiv double 1.000000e+00, %4251
  store double %4252, double* %fac, align 8
  %4253 = load i64* %ist, align 8
  store i64 %4253, i64* %i, align 8
  br label %4254

; <label>:4254                                    ; preds = %4285, %4247
  %4255 = load i64* %i, align 8
  %4256 = load i64* %ien, align 8
  %4257 = icmp sle i64 %4255, %4256
  br i1 %4257, label %4258, label %4288

; <label>:4258                                    ; preds = %4254
  %4259 = load i64* %jst, align 8
  store i64 %4259, i64* %j, align 8
  br label %4260

; <label>:4260                                    ; preds = %4281, %4258
  %4261 = load i64* %j, align 8
  %4262 = load i64* %jen, align 8
  %4263 = icmp sle i64 %4261, %4262
  br i1 %4263, label %4264, label %4284

; <label>:4264                                    ; preds = %4260
  %4265 = load i64* %j, align 8
  %4266 = load i64* %i, align 8
  %4267 = load %struct.guess_struct** @guess, align 8
  %4268 = getelementptr inbounds %struct.guess_struct* %4267, i32 0, i32 0
  %4269 = getelementptr inbounds [258 x [258 x double]]* %4268, i32 0, i64 %4266
  %4270 = getelementptr inbounds [258 x double]* %4269, i32 0, i64 %4265
  %4271 = load double* %4270, align 8
  %4272 = load i64* %j, align 8
  %4273 = load i64* %i, align 8
  %4274 = load i64* @numlev, align 8
  %4275 = sub nsw i64 %4274, 1
  %4276 = load %struct.multi_struct** @multi, align 8
  %4277 = getelementptr inbounds %struct.multi_struct* %4276, i32 0, i32 0
  %4278 = getelementptr inbounds [9 x [258 x [258 x double]]]* %4277, i32 0, i64 %4275
  %4279 = getelementptr inbounds [258 x [258 x double]]* %4278, i32 0, i64 %4273
  %4280 = getelementptr inbounds [258 x double]* %4279, i32 0, i64 %4272
  store double %4271, double* %4280, align 8
  br label %4281

; <label>:4281                                    ; preds = %4264
  %4282 = load i64* %j, align 8
  %4283 = add nsw i64 %4282, 1
  store i64 %4283, i64* %j, align 8
  br label %4260

; <label>:4284                                    ; preds = %4260
  br label %4285

; <label>:4285                                    ; preds = %4284
  %4286 = load i64* %i, align 8
  %4287 = add nsw i64 %4286, 1
  store i64 %4287, i64* %i, align 8
  br label %4254

; <label>:4288                                    ; preds = %4254
  %4289 = load i64* %1, align 8
  %4290 = icmp eq i64 %4289, 0
  br i1 %4290, label %4294, label %4291

; <label>:4291                                    ; preds = %4288
  %4292 = load i64* @do_stats, align 8
  %4293 = icmp ne i64 %4292, 0
  br i1 %4293, label %4294, label %4302

; <label>:4294                                    ; preds = %4291, %4288
  %4295 = call i32 @gettimeofday(%struct.timeval* %FullTime, %struct.timezone* null) #6
  %4296 = getelementptr inbounds %struct.timeval* %FullTime, i32 0, i32 1
  %4297 = load i64* %4296, align 8
  %4298 = getelementptr inbounds %struct.timeval* %FullTime, i32 0, i32 0
  %4299 = load i64* %4298, align 8
  %4300 = mul nsw i64 %4299, 1000000
  %4301 = add nsw i64 %4297, %4300
  store i64 %4301, i64* %multi_start, align 8
  br label %4302

; <label>:4302                                    ; preds = %4294, %4291
  %4303 = load i64* %1, align 8
  call void @multig(i64 %4303)
  %4304 = load i64* %1, align 8
  %4305 = icmp eq i64 %4304, 0
  br i1 %4305, label %4309, label %4306

; <label>:4306                                    ; preds = %4302
  %4307 = load i64* @do_stats, align 8
  %4308 = icmp ne i64 %4307, 0
  br i1 %4308, label %4309, label %4327

; <label>:4309                                    ; preds = %4306, %4302
  %4310 = call i32 @gettimeofday(%struct.timeval* %FullTime17, %struct.timezone* null) #6
  %4311 = getelementptr inbounds %struct.timeval* %FullTime17, i32 0, i32 1
  %4312 = load i64* %4311, align 8
  %4313 = getelementptr inbounds %struct.timeval* %FullTime17, i32 0, i32 0
  %4314 = load i64* %4313, align 8
  %4315 = mul nsw i64 %4314, 1000000
  %4316 = add nsw i64 %4312, %4315
  store i64 %4316, i64* %multi_end, align 8
  %4317 = load i64* %multi_end, align 8
  %4318 = load i64* %multi_start, align 8
  %4319 = sub nsw i64 %4317, %4318
  %4320 = sitofp i64 %4319 to double
  %4321 = load i64* %1, align 8
  %4322 = load %struct.Global_Private** @gp, align 8
  %4323 = getelementptr inbounds %struct.Global_Private* %4322, i64 %4321
  %4324 = getelementptr inbounds %struct.Global_Private* %4323, i32 0, i32 1
  %4325 = load double* %4324, align 8
  %4326 = fadd double %4325, %4320
  store double %4326, double* %4324, align 8
  br label %4327

; <label>:4327                                    ; preds = %4309, %4306
  %4328 = load i64* %1, align 8
  %4329 = icmp eq i64 %4328, 0
  br i1 %4329, label %4330, label %4333

; <label>:4330                                    ; preds = %4327
  %4331 = load %struct.global_struct** @global, align 8
  %4332 = getelementptr inbounds %struct.global_struct* %4331, i32 0, i32 3
  store double 0.000000e+00, double* %4332, align 8
  br label %4333

; <label>:4333                                    ; preds = %4330, %4327
  %4334 = load i64* %istart, align 8
  store i64 %4334, i64* %i, align 8
  br label %4335

; <label>:4335                                    ; preds = %4382, %4333
  %4336 = load i64* %i, align 8
  %4337 = load i64* %iend, align 8
  %4338 = icmp sle i64 %4336, %4337
  br i1 %4338, label %4339, label %4385

; <label>:4339                                    ; preds = %4335
  %4340 = load i64* %jstart, align 8
  store i64 %4340, i64* %j, align 8
  br label %4341

; <label>:4341                                    ; preds = %4378, %4339
  %4342 = load i64* %j, align 8
  %4343 = load i64* %jend, align 8
  %4344 = icmp sle i64 %4342, %4343
  br i1 %4344, label %4345, label %4381

; <label>:4345                                    ; preds = %4341
  %4346 = load i64* %j, align 8
  %4347 = load i64* %i, align 8
  %4348 = load i64* @numlev, align 8
  %4349 = sub nsw i64 %4348, 1
  %4350 = load %struct.multi_struct** @multi, align 8
  %4351 = getelementptr inbounds %struct.multi_struct* %4350, i32 0, i32 0
  %4352 = getelementptr inbounds [9 x [258 x [258 x double]]]* %4351, i32 0, i64 %4349
  %4353 = getelementptr inbounds [258 x [258 x double]]* %4352, i32 0, i64 %4347
  %4354 = getelementptr inbounds [258 x double]* %4353, i32 0, i64 %4346
  %4355 = load double* %4354, align 8
  %4356 = load i64* %j, align 8
  %4357 = load i64* %i, align 8
  %4358 = load %struct.wrk1_struct** @wrk1, align 8
  %4359 = getelementptr inbounds %struct.wrk1_struct* %4358, i32 0, i32 1
  %4360 = getelementptr inbounds [258 x [258 x double]]* %4359, i32 0, i64 %4357
  %4361 = getelementptr inbounds [258 x double]* %4360, i32 0, i64 %4356
  store double %4355, double* %4361, align 8
  %4362 = load i64* %j, align 8
  %4363 = load i64* %i, align 8
  %4364 = load i64* @numlev, align 8
  %4365 = sub nsw i64 %4364, 1
  %4366 = load %struct.multi_struct** @multi, align 8
  %4367 = getelementptr inbounds %struct.multi_struct* %4366, i32 0, i32 0
  %4368 = getelementptr inbounds [9 x [258 x [258 x double]]]* %4367, i32 0, i64 %4365
  %4369 = getelementptr inbounds [258 x [258 x double]]* %4368, i32 0, i64 %4363
  %4370 = getelementptr inbounds [258 x double]* %4369, i32 0, i64 %4362
  %4371 = load double* %4370, align 8
  %4372 = load i64* %j, align 8
  %4373 = load i64* %i, align 8
  %4374 = load %struct.guess_struct** @guess, align 8
  %4375 = getelementptr inbounds %struct.guess_struct* %4374, i32 0, i32 0
  %4376 = getelementptr inbounds [258 x [258 x double]]* %4375, i32 0, i64 %4373
  %4377 = getelementptr inbounds [258 x double]* %4376, i32 0, i64 %4372
  store double %4371, double* %4377, align 8
  br label %4378

; <label>:4378                                    ; preds = %4345
  %4379 = load i64* %j, align 8
  %4380 = add nsw i64 %4379, 1
  store i64 %4380, i64* %j, align 8
  br label %4341

; <label>:4381                                    ; preds = %4341
  br label %4382

; <label>:4382                                    ; preds = %4381
  %4383 = load i64* %i, align 8
  %4384 = add nsw i64 %4383, 1
  store i64 %4384, i64* %i, align 8
  br label %4335

; <label>:4385                                    ; preds = %4335
  %4386 = load %struct.bars_struct** @bars, align 8
  %4387 = getelementptr inbounds %struct.bars_struct* %4386, i32 0, i32 0
  %4388 = getelementptr inbounds %struct.anon* %4387, i32 0, i32 0
  %4389 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %4388) #6
  %4390 = sext i32 %4389 to i64
  store i64 %4390, i64* %Error18, align 8
  %4391 = load i64* %Error18, align 8
  %4392 = icmp ne i64 %4391, 0
  br i1 %4392, label %4393, label %4395

; <label>:4393                                    ; preds = %4385
  %4394 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str41, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:4395                                    ; preds = %4385
  %4396 = load %struct.bars_struct** @bars, align 8
  %4397 = getelementptr inbounds %struct.bars_struct* %4396, i32 0, i32 0
  %4398 = getelementptr inbounds %struct.anon* %4397, i32 0, i32 3
  %4399 = load i64* %4398, align 8
  store i64 %4399, i64* %Cycle19, align 8
  %4400 = load %struct.bars_struct** @bars, align 8
  %4401 = getelementptr inbounds %struct.bars_struct* %4400, i32 0, i32 0
  %4402 = getelementptr inbounds %struct.anon* %4401, i32 0, i32 2
  %4403 = load i64* %4402, align 8
  %4404 = add i64 %4403, 1
  store i64 %4404, i64* %4402, align 8
  %4405 = load i64* @nprocs, align 8
  %4406 = icmp ne i64 %4404, %4405
  br i1 %4406, label %4407, label %4435

; <label>:4407                                    ; preds = %4395
  %4408 = bitcast i64* %Cancel20 to i32*
  %4409 = call i32 @pthread_setcancelstate(i32 1, i32* %4408)
  br label %4410

; <label>:4410                                    ; preds = %4429, %4407
  %4411 = load i64* %Cycle19, align 8
  %4412 = load %struct.bars_struct** @bars, align 8
  %4413 = getelementptr inbounds %struct.bars_struct* %4412, i32 0, i32 0
  %4414 = getelementptr inbounds %struct.anon* %4413, i32 0, i32 3
  %4415 = load i64* %4414, align 8
  %4416 = icmp eq i64 %4411, %4415
  br i1 %4416, label %4417, label %4430

; <label>:4417                                    ; preds = %4410
  %4418 = load %struct.bars_struct** @bars, align 8
  %4419 = getelementptr inbounds %struct.bars_struct* %4418, i32 0, i32 0
  %4420 = getelementptr inbounds %struct.anon* %4419, i32 0, i32 1
  %4421 = load %struct.bars_struct** @bars, align 8
  %4422 = getelementptr inbounds %struct.bars_struct* %4421, i32 0, i32 0
  %4423 = getelementptr inbounds %struct.anon* %4422, i32 0, i32 0
  %4424 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %4420, %union.pthread_mutex_t* %4423)
  %4425 = sext i32 %4424 to i64
  store i64 %4425, i64* %Error18, align 8
  %4426 = load i64* %Error18, align 8
  %4427 = icmp ne i64 %4426, 0
  br i1 %4427, label %4428, label %4429

; <label>:4428                                    ; preds = %4417
  br label %4430

; <label>:4429                                    ; preds = %4417
  br label %4410

; <label>:4430                                    ; preds = %4428, %4410
  %4431 = load i64* %Cancel20, align 8
  %4432 = trunc i64 %4431 to i32
  %4433 = bitcast i64* %Temp21 to i32*
  %4434 = call i32 @pthread_setcancelstate(i32 %4432, i32* %4433)
  br label %4455

; <label>:4435                                    ; preds = %4395
  %4436 = load %struct.bars_struct** @bars, align 8
  %4437 = getelementptr inbounds %struct.bars_struct* %4436, i32 0, i32 0
  %4438 = getelementptr inbounds %struct.anon* %4437, i32 0, i32 3
  %4439 = load i64* %4438, align 8
  %4440 = icmp ne i64 %4439, 0
  %4441 = xor i1 %4440, true
  %4442 = zext i1 %4441 to i32
  %4443 = sext i32 %4442 to i64
  %4444 = load %struct.bars_struct** @bars, align 8
  %4445 = getelementptr inbounds %struct.bars_struct* %4444, i32 0, i32 0
  %4446 = getelementptr inbounds %struct.anon* %4445, i32 0, i32 3
  store i64 %4443, i64* %4446, align 8
  %4447 = load %struct.bars_struct** @bars, align 8
  %4448 = getelementptr inbounds %struct.bars_struct* %4447, i32 0, i32 0
  %4449 = getelementptr inbounds %struct.anon* %4448, i32 0, i32 2
  store i64 0, i64* %4449, align 8
  %4450 = load %struct.bars_struct** @bars, align 8
  %4451 = getelementptr inbounds %struct.bars_struct* %4450, i32 0, i32 0
  %4452 = getelementptr inbounds %struct.anon* %4451, i32 0, i32 1
  %4453 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %4452) #6
  %4454 = sext i32 %4453 to i64
  store i64 %4454, i64* %Error18, align 8
  br label %4455

; <label>:4455                                    ; preds = %4435, %4430
  %4456 = load %struct.bars_struct** @bars, align 8
  %4457 = getelementptr inbounds %struct.bars_struct* %4456, i32 0, i32 0
  %4458 = getelementptr inbounds %struct.anon* %4457, i32 0, i32 0
  %4459 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %4458) #6
  store double 0.000000e+00, double* %psiaipriv, align 8
  %4460 = load i64* %1, align 8
  %4461 = icmp eq i64 %4460, 0
  br i1 %4461, label %4462, label %4471

; <label>:4462                                    ; preds = %4455
  %4463 = load double* %psiaipriv, align 8
  %4464 = load %struct.wrk1_struct** @wrk1, align 8
  %4465 = getelementptr inbounds %struct.wrk1_struct* %4464, i32 0, i32 1
  %4466 = getelementptr inbounds [258 x [258 x double]]* %4465, i32 0, i64 0
  %4467 = getelementptr inbounds [258 x double]* %4466, i32 0, i64 0
  %4468 = load double* %4467, align 8
  %4469 = fmul double 2.500000e-01, %4468
  %4470 = fadd double %4463, %4469
  store double %4470, double* %psiaipriv, align 8
  br label %4471

; <label>:4471                                    ; preds = %4462, %4455
  %4472 = load i64* %1, align 8
  %4473 = load i64* @xprocs, align 8
  %4474 = sub nsw i64 %4473, 1
  %4475 = icmp eq i64 %4472, %4474
  br i1 %4475, label %4476, label %4487

; <label>:4476                                    ; preds = %4471
  %4477 = load double* %psiaipriv, align 8
  %4478 = load i64* @jm, align 8
  %4479 = sub nsw i64 %4478, 1
  %4480 = load %struct.wrk1_struct** @wrk1, align 8
  %4481 = getelementptr inbounds %struct.wrk1_struct* %4480, i32 0, i32 1
  %4482 = getelementptr inbounds [258 x [258 x double]]* %4481, i32 0, i64 0
  %4483 = getelementptr inbounds [258 x double]* %4482, i32 0, i64 %4479
  %4484 = load double* %4483, align 8
  %4485 = fmul double 2.500000e-01, %4484
  %4486 = fadd double %4477, %4485
  store double %4486, double* %psiaipriv, align 8
  br label %4487

; <label>:4487                                    ; preds = %4476, %4471
  %4488 = load i64* %1, align 8
  %4489 = load i64* @nprocs, align 8
  %4490 = load i64* @xprocs, align 8
  %4491 = sub nsw i64 %4489, %4490
  %4492 = icmp eq i64 %4488, %4491
  br i1 %4492, label %4493, label %4504

; <label>:4493                                    ; preds = %4487
  %4494 = load double* %psiaipriv, align 8
  %4495 = load i64* @im, align 8
  %4496 = sub nsw i64 %4495, 1
  %4497 = load %struct.wrk1_struct** @wrk1, align 8
  %4498 = getelementptr inbounds %struct.wrk1_struct* %4497, i32 0, i32 1
  %4499 = getelementptr inbounds [258 x [258 x double]]* %4498, i32 0, i64 %4496
  %4500 = getelementptr inbounds [258 x double]* %4499, i32 0, i64 0
  %4501 = load double* %4500, align 8
  %4502 = fmul double 2.500000e-01, %4501
  %4503 = fadd double %4494, %4502
  store double %4503, double* %psiaipriv, align 8
  br label %4504

; <label>:4504                                    ; preds = %4493, %4487
  %4505 = load i64* %1, align 8
  %4506 = load i64* @nprocs, align 8
  %4507 = sub nsw i64 %4506, 1
  %4508 = icmp eq i64 %4505, %4507
  br i1 %4508, label %4509, label %4522

; <label>:4509                                    ; preds = %4504
  %4510 = load double* %psiaipriv, align 8
  %4511 = load i64* @jm, align 8
  %4512 = sub nsw i64 %4511, 1
  %4513 = load i64* @im, align 8
  %4514 = sub nsw i64 %4513, 1
  %4515 = load %struct.wrk1_struct** @wrk1, align 8
  %4516 = getelementptr inbounds %struct.wrk1_struct* %4515, i32 0, i32 1
  %4517 = getelementptr inbounds [258 x [258 x double]]* %4516, i32 0, i64 %4514
  %4518 = getelementptr inbounds [258 x double]* %4517, i32 0, i64 %4512
  %4519 = load double* %4518, align 8
  %4520 = fmul double 2.500000e-01, %4519
  %4521 = fadd double %4510, %4520
  store double %4521, double* %psiaipriv, align 8
  br label %4522

; <label>:4522                                    ; preds = %4509, %4504
  %4523 = load i64* %2, align 8
  %4524 = icmp eq i64 %4523, 1
  br i1 %4524, label %4525, label %4545

; <label>:4525                                    ; preds = %4522
  %4526 = load i64* %5, align 8
  store i64 %4526, i64* %j, align 8
  br label %4527

; <label>:4527                                    ; preds = %4541, %4525
  %4528 = load i64* %j, align 8
  %4529 = load i64* %6, align 8
  %4530 = icmp sle i64 %4528, %4529
  br i1 %4530, label %4531, label %4544

; <label>:4531                                    ; preds = %4527
  %4532 = load double* %psiaipriv, align 8
  %4533 = load i64* %j, align 8
  %4534 = load %struct.wrk1_struct** @wrk1, align 8
  %4535 = getelementptr inbounds %struct.wrk1_struct* %4534, i32 0, i32 1
  %4536 = getelementptr inbounds [258 x [258 x double]]* %4535, i32 0, i64 0
  %4537 = getelementptr inbounds [258 x double]* %4536, i32 0, i64 %4533
  %4538 = load double* %4537, align 8
  %4539 = fmul double 5.000000e-01, %4538
  %4540 = fadd double %4532, %4539
  store double %4540, double* %psiaipriv, align 8
  br label %4541

; <label>:4541                                    ; preds = %4531
  %4542 = load i64* %j, align 8
  %4543 = add nsw i64 %4542, 1
  store i64 %4543, i64* %j, align 8
  br label %4527

; <label>:4544                                    ; preds = %4527
  br label %4545

; <label>:4545                                    ; preds = %4544, %4522
  %4546 = load i64* %2, align 8
  %4547 = load i64* %4, align 8
  %4548 = add nsw i64 %4546, %4547
  %4549 = load i64* @im, align 8
  %4550 = sub nsw i64 %4549, 1
  %4551 = icmp eq i64 %4548, %4550
  br i1 %4551, label %4552, label %4574

; <label>:4552                                    ; preds = %4545
  %4553 = load i64* %5, align 8
  store i64 %4553, i64* %j, align 8
  br label %4554

; <label>:4554                                    ; preds = %4570, %4552
  %4555 = load i64* %j, align 8
  %4556 = load i64* %6, align 8
  %4557 = icmp sle i64 %4555, %4556
  br i1 %4557, label %4558, label %4573

; <label>:4558                                    ; preds = %4554
  %4559 = load double* %psiaipriv, align 8
  %4560 = load i64* %j, align 8
  %4561 = load i64* @im, align 8
  %4562 = sub nsw i64 %4561, 1
  %4563 = load %struct.wrk1_struct** @wrk1, align 8
  %4564 = getelementptr inbounds %struct.wrk1_struct* %4563, i32 0, i32 1
  %4565 = getelementptr inbounds [258 x [258 x double]]* %4564, i32 0, i64 %4562
  %4566 = getelementptr inbounds [258 x double]* %4565, i32 0, i64 %4560
  %4567 = load double* %4566, align 8
  %4568 = fmul double 5.000000e-01, %4567
  %4569 = fadd double %4559, %4568
  store double %4569, double* %psiaipriv, align 8
  br label %4570

; <label>:4570                                    ; preds = %4558
  %4571 = load i64* %j, align 8
  %4572 = add nsw i64 %4571, 1
  store i64 %4572, i64* %j, align 8
  br label %4554

; <label>:4573                                    ; preds = %4554
  br label %4574

; <label>:4574                                    ; preds = %4573, %4545
  %4575 = load i64* %5, align 8
  %4576 = icmp eq i64 %4575, 1
  br i1 %4576, label %4577, label %4597

; <label>:4577                                    ; preds = %4574
  %4578 = load i64* %2, align 8
  store i64 %4578, i64* %j, align 8
  br label %4579

; <label>:4579                                    ; preds = %4593, %4577
  %4580 = load i64* %j, align 8
  %4581 = load i64* %3, align 8
  %4582 = icmp sle i64 %4580, %4581
  br i1 %4582, label %4583, label %4596

; <label>:4583                                    ; preds = %4579
  %4584 = load double* %psiaipriv, align 8
  %4585 = load i64* %j, align 8
  %4586 = load %struct.wrk1_struct** @wrk1, align 8
  %4587 = getelementptr inbounds %struct.wrk1_struct* %4586, i32 0, i32 1
  %4588 = getelementptr inbounds [258 x [258 x double]]* %4587, i32 0, i64 %4585
  %4589 = getelementptr inbounds [258 x double]* %4588, i32 0, i64 0
  %4590 = load double* %4589, align 8
  %4591 = fmul double 5.000000e-01, %4590
  %4592 = fadd double %4584, %4591
  store double %4592, double* %psiaipriv, align 8
  br label %4593

; <label>:4593                                    ; preds = %4583
  %4594 = load i64* %j, align 8
  %4595 = add nsw i64 %4594, 1
  store i64 %4595, i64* %j, align 8
  br label %4579

; <label>:4596                                    ; preds = %4579
  br label %4597

; <label>:4597                                    ; preds = %4596, %4574
  %4598 = load i64* %5, align 8
  %4599 = load i64* %7, align 8
  %4600 = add nsw i64 %4598, %4599
  %4601 = load i64* @jm, align 8
  %4602 = sub nsw i64 %4601, 1
  %4603 = icmp eq i64 %4600, %4602
  br i1 %4603, label %4604, label %4626

; <label>:4604                                    ; preds = %4597
  %4605 = load i64* %2, align 8
  store i64 %4605, i64* %j, align 8
  br label %4606

; <label>:4606                                    ; preds = %4622, %4604
  %4607 = load i64* %j, align 8
  %4608 = load i64* %3, align 8
  %4609 = icmp sle i64 %4607, %4608
  br i1 %4609, label %4610, label %4625

; <label>:4610                                    ; preds = %4606
  %4611 = load double* %psiaipriv, align 8
  %4612 = load i64* @jm, align 8
  %4613 = sub nsw i64 %4612, 1
  %4614 = load i64* %j, align 8
  %4615 = load %struct.wrk1_struct** @wrk1, align 8
  %4616 = getelementptr inbounds %struct.wrk1_struct* %4615, i32 0, i32 1
  %4617 = getelementptr inbounds [258 x [258 x double]]* %4616, i32 0, i64 %4614
  %4618 = getelementptr inbounds [258 x double]* %4617, i32 0, i64 %4613
  %4619 = load double* %4618, align 8
  %4620 = fmul double 5.000000e-01, %4619
  %4621 = fadd double %4611, %4620
  store double %4621, double* %psiaipriv, align 8
  br label %4622

; <label>:4622                                    ; preds = %4610
  %4623 = load i64* %j, align 8
  %4624 = add nsw i64 %4623, 1
  store i64 %4624, i64* %j, align 8
  br label %4606

; <label>:4625                                    ; preds = %4606
  br label %4626

; <label>:4626                                    ; preds = %4625, %4597
  %4627 = load i64* %5, align 8
  store i64 %4627, i64* %iindex, align 8
  br label %4628

; <label>:4628                                    ; preds = %4652, %4626
  %4629 = load i64* %iindex, align 8
  %4630 = load i64* %6, align 8
  %4631 = icmp sle i64 %4629, %4630
  br i1 %4631, label %4632, label %4655

; <label>:4632                                    ; preds = %4628
  %4633 = load i64* %2, align 8
  store i64 %4633, i64* %i, align 8
  br label %4634

; <label>:4634                                    ; preds = %4648, %4632
  %4635 = load i64* %i, align 8
  %4636 = load i64* %3, align 8
  %4637 = icmp sle i64 %4635, %4636
  br i1 %4637, label %4638, label %4651

; <label>:4638                                    ; preds = %4634
  %4639 = load double* %psiaipriv, align 8
  %4640 = load i64* %iindex, align 8
  %4641 = load i64* %i, align 8
  %4642 = load %struct.wrk1_struct** @wrk1, align 8
  %4643 = getelementptr inbounds %struct.wrk1_struct* %4642, i32 0, i32 1
  %4644 = getelementptr inbounds [258 x [258 x double]]* %4643, i32 0, i64 %4641
  %4645 = getelementptr inbounds [258 x double]* %4644, i32 0, i64 %4640
  %4646 = load double* %4645, align 8
  %4647 = fadd double %4639, %4646
  store double %4647, double* %psiaipriv, align 8
  br label %4648

; <label>:4648                                    ; preds = %4638
  %4649 = load i64* %i, align 8
  %4650 = add nsw i64 %4649, 1
  store i64 %4650, i64* %i, align 8
  br label %4634

; <label>:4651                                    ; preds = %4634
  br label %4652

; <label>:4652                                    ; preds = %4651
  %4653 = load i64* %iindex, align 8
  %4654 = add nsw i64 %4653, 1
  store i64 %4654, i64* %iindex, align 8
  br label %4628

; <label>:4655                                    ; preds = %4628
  %4656 = load %struct.locks_struct** @locks, align 8
  %4657 = getelementptr inbounds %struct.locks_struct* %4656, i32 0, i32 2
  %4658 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %4657) #6
  %4659 = load %struct.global_struct** @global, align 8
  %4660 = getelementptr inbounds %struct.global_struct* %4659, i32 0, i32 3
  %4661 = load double* %4660, align 8
  %4662 = load double* %psiaipriv, align 8
  %4663 = fadd double %4661, %4662
  %4664 = load %struct.global_struct** @global, align 8
  %4665 = getelementptr inbounds %struct.global_struct* %4664, i32 0, i32 3
  store double %4663, double* %4665, align 8
  %4666 = load %struct.locks_struct** @locks, align 8
  %4667 = getelementptr inbounds %struct.locks_struct* %4666, i32 0, i32 2
  %4668 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %4667) #6
  %4669 = load %struct.bars_struct** @bars, align 8
  %4670 = getelementptr inbounds %struct.bars_struct* %4669, i32 0, i32 0
  %4671 = getelementptr inbounds %struct.anon* %4670, i32 0, i32 0
  %4672 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %4671) #6
  %4673 = sext i32 %4672 to i64
  store i64 %4673, i64* %Error22, align 8
  %4674 = load i64* %Error22, align 8
  %4675 = icmp ne i64 %4674, 0
  br i1 %4675, label %4676, label %4678

; <label>:4676                                    ; preds = %4655
  %4677 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str41, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:4678                                    ; preds = %4655
  %4679 = load %struct.bars_struct** @bars, align 8
  %4680 = getelementptr inbounds %struct.bars_struct* %4679, i32 0, i32 0
  %4681 = getelementptr inbounds %struct.anon* %4680, i32 0, i32 3
  %4682 = load i64* %4681, align 8
  store i64 %4682, i64* %Cycle23, align 8
  %4683 = load %struct.bars_struct** @bars, align 8
  %4684 = getelementptr inbounds %struct.bars_struct* %4683, i32 0, i32 0
  %4685 = getelementptr inbounds %struct.anon* %4684, i32 0, i32 2
  %4686 = load i64* %4685, align 8
  %4687 = add i64 %4686, 1
  store i64 %4687, i64* %4685, align 8
  %4688 = load i64* @nprocs, align 8
  %4689 = icmp ne i64 %4687, %4688
  br i1 %4689, label %4690, label %4718

; <label>:4690                                    ; preds = %4678
  %4691 = bitcast i64* %Cancel24 to i32*
  %4692 = call i32 @pthread_setcancelstate(i32 1, i32* %4691)
  br label %4693

; <label>:4693                                    ; preds = %4712, %4690
  %4694 = load i64* %Cycle23, align 8
  %4695 = load %struct.bars_struct** @bars, align 8
  %4696 = getelementptr inbounds %struct.bars_struct* %4695, i32 0, i32 0
  %4697 = getelementptr inbounds %struct.anon* %4696, i32 0, i32 3
  %4698 = load i64* %4697, align 8
  %4699 = icmp eq i64 %4694, %4698
  br i1 %4699, label %4700, label %4713

; <label>:4700                                    ; preds = %4693
  %4701 = load %struct.bars_struct** @bars, align 8
  %4702 = getelementptr inbounds %struct.bars_struct* %4701, i32 0, i32 0
  %4703 = getelementptr inbounds %struct.anon* %4702, i32 0, i32 1
  %4704 = load %struct.bars_struct** @bars, align 8
  %4705 = getelementptr inbounds %struct.bars_struct* %4704, i32 0, i32 0
  %4706 = getelementptr inbounds %struct.anon* %4705, i32 0, i32 0
  %4707 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %4703, %union.pthread_mutex_t* %4706)
  %4708 = sext i32 %4707 to i64
  store i64 %4708, i64* %Error22, align 8
  %4709 = load i64* %Error22, align 8
  %4710 = icmp ne i64 %4709, 0
  br i1 %4710, label %4711, label %4712

; <label>:4711                                    ; preds = %4700
  br label %4713

; <label>:4712                                    ; preds = %4700
  br label %4693

; <label>:4713                                    ; preds = %4711, %4693
  %4714 = load i64* %Cancel24, align 8
  %4715 = trunc i64 %4714 to i32
  %4716 = bitcast i64* %Temp25 to i32*
  %4717 = call i32 @pthread_setcancelstate(i32 %4715, i32* %4716)
  br label %4738

; <label>:4718                                    ; preds = %4678
  %4719 = load %struct.bars_struct** @bars, align 8
  %4720 = getelementptr inbounds %struct.bars_struct* %4719, i32 0, i32 0
  %4721 = getelementptr inbounds %struct.anon* %4720, i32 0, i32 3
  %4722 = load i64* %4721, align 8
  %4723 = icmp ne i64 %4722, 0
  %4724 = xor i1 %4723, true
  %4725 = zext i1 %4724 to i32
  %4726 = sext i32 %4725 to i64
  %4727 = load %struct.bars_struct** @bars, align 8
  %4728 = getelementptr inbounds %struct.bars_struct* %4727, i32 0, i32 0
  %4729 = getelementptr inbounds %struct.anon* %4728, i32 0, i32 3
  store i64 %4726, i64* %4729, align 8
  %4730 = load %struct.bars_struct** @bars, align 8
  %4731 = getelementptr inbounds %struct.bars_struct* %4730, i32 0, i32 0
  %4732 = getelementptr inbounds %struct.anon* %4731, i32 0, i32 2
  store i64 0, i64* %4732, align 8
  %4733 = load %struct.bars_struct** @bars, align 8
  %4734 = getelementptr inbounds %struct.bars_struct* %4733, i32 0, i32 0
  %4735 = getelementptr inbounds %struct.anon* %4734, i32 0, i32 1
  %4736 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %4735) #6
  %4737 = sext i32 %4736 to i64
  store i64 %4737, i64* %Error22, align 8
  br label %4738

; <label>:4738                                    ; preds = %4718, %4713
  %4739 = load %struct.bars_struct** @bars, align 8
  %4740 = getelementptr inbounds %struct.bars_struct* %4739, i32 0, i32 0
  %4741 = getelementptr inbounds %struct.anon* %4740, i32 0, i32 0
  %4742 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %4741) #6
  %4743 = load %struct.global_struct** @global, align 8
  %4744 = getelementptr inbounds %struct.global_struct* %4743, i32 0, i32 3
  %4745 = load double* %4744, align 8
  %4746 = fsub double -0.000000e+00, %4745
  %4747 = load %struct.global_struct** @global, align 8
  %4748 = getelementptr inbounds %struct.global_struct* %4747, i32 0, i32 4
  %4749 = load double* %4748, align 8
  %4750 = fdiv double %4746, %4749
  store double %4750, double* %f4, align 8
  %4751 = load i64* %1, align 8
  %4752 = icmp eq i64 %4751, 0
  br i1 %4752, label %4753, label %4771

; <label>:4753                                    ; preds = %4738
  %4754 = load %struct.wrk1_struct** @wrk1, align 8
  %4755 = getelementptr inbounds %struct.wrk1_struct* %4754, i32 0, i32 1
  %4756 = getelementptr inbounds [258 x [258 x double]]* %4755, i32 0, i64 0
  %4757 = getelementptr inbounds [258 x double]* %4756, i32 0, i64 0
  %4758 = load double* %4757, align 8
  %4759 = load double* %f4, align 8
  %4760 = load %struct.wrk1_struct** @wrk1, align 8
  %4761 = getelementptr inbounds %struct.wrk1_struct* %4760, i32 0, i32 0
  %4762 = getelementptr inbounds [258 x [258 x double]]* %4761, i32 0, i64 0
  %4763 = getelementptr inbounds [258 x double]* %4762, i32 0, i64 0
  %4764 = load double* %4763, align 8
  %4765 = fmul double %4759, %4764
  %4766 = fadd double %4758, %4765
  %4767 = load %struct.wrk1_struct** @wrk1, align 8
  %4768 = getelementptr inbounds %struct.wrk1_struct* %4767, i32 0, i32 1
  %4769 = getelementptr inbounds [258 x [258 x double]]* %4768, i32 0, i64 0
  %4770 = getelementptr inbounds [258 x double]* %4769, i32 0, i64 0
  store double %4766, double* %4770, align 8
  br label %4771

; <label>:4771                                    ; preds = %4753, %4738
  %4772 = load i64* %1, align 8
  %4773 = load i64* @nprocs, align 8
  %4774 = load i64* @xprocs, align 8
  %4775 = sub nsw i64 %4773, %4774
  %4776 = icmp eq i64 %4772, %4775
  br i1 %4776, label %4777, label %4801

; <label>:4777                                    ; preds = %4771
  %4778 = load i64* @im, align 8
  %4779 = sub nsw i64 %4778, 1
  %4780 = load %struct.wrk1_struct** @wrk1, align 8
  %4781 = getelementptr inbounds %struct.wrk1_struct* %4780, i32 0, i32 1
  %4782 = getelementptr inbounds [258 x [258 x double]]* %4781, i32 0, i64 %4779
  %4783 = getelementptr inbounds [258 x double]* %4782, i32 0, i64 0
  %4784 = load double* %4783, align 8
  %4785 = load double* %f4, align 8
  %4786 = load i64* @im, align 8
  %4787 = sub nsw i64 %4786, 1
  %4788 = load %struct.wrk1_struct** @wrk1, align 8
  %4789 = getelementptr inbounds %struct.wrk1_struct* %4788, i32 0, i32 0
  %4790 = getelementptr inbounds [258 x [258 x double]]* %4789, i32 0, i64 %4787
  %4791 = getelementptr inbounds [258 x double]* %4790, i32 0, i64 0
  %4792 = load double* %4791, align 8
  %4793 = fmul double %4785, %4792
  %4794 = fadd double %4784, %4793
  %4795 = load i64* @im, align 8
  %4796 = sub nsw i64 %4795, 1
  %4797 = load %struct.wrk1_struct** @wrk1, align 8
  %4798 = getelementptr inbounds %struct.wrk1_struct* %4797, i32 0, i32 1
  %4799 = getelementptr inbounds [258 x [258 x double]]* %4798, i32 0, i64 %4796
  %4800 = getelementptr inbounds [258 x double]* %4799, i32 0, i64 0
  store double %4794, double* %4800, align 8
  br label %4801

; <label>:4801                                    ; preds = %4777, %4771
  %4802 = load i64* %1, align 8
  %4803 = load i64* @xprocs, align 8
  %4804 = sub nsw i64 %4803, 1
  %4805 = icmp eq i64 %4802, %4804
  br i1 %4805, label %4806, label %4830

; <label>:4806                                    ; preds = %4801
  %4807 = load i64* @jm, align 8
  %4808 = sub nsw i64 %4807, 1
  %4809 = load %struct.wrk1_struct** @wrk1, align 8
  %4810 = getelementptr inbounds %struct.wrk1_struct* %4809, i32 0, i32 1
  %4811 = getelementptr inbounds [258 x [258 x double]]* %4810, i32 0, i64 0
  %4812 = getelementptr inbounds [258 x double]* %4811, i32 0, i64 %4808
  %4813 = load double* %4812, align 8
  %4814 = load double* %f4, align 8
  %4815 = load i64* @jm, align 8
  %4816 = sub nsw i64 %4815, 1
  %4817 = load %struct.wrk1_struct** @wrk1, align 8
  %4818 = getelementptr inbounds %struct.wrk1_struct* %4817, i32 0, i32 0
  %4819 = getelementptr inbounds [258 x [258 x double]]* %4818, i32 0, i64 0
  %4820 = getelementptr inbounds [258 x double]* %4819, i32 0, i64 %4816
  %4821 = load double* %4820, align 8
  %4822 = fmul double %4814, %4821
  %4823 = fadd double %4813, %4822
  %4824 = load i64* @jm, align 8
  %4825 = sub nsw i64 %4824, 1
  %4826 = load %struct.wrk1_struct** @wrk1, align 8
  %4827 = getelementptr inbounds %struct.wrk1_struct* %4826, i32 0, i32 1
  %4828 = getelementptr inbounds [258 x [258 x double]]* %4827, i32 0, i64 0
  %4829 = getelementptr inbounds [258 x double]* %4828, i32 0, i64 %4825
  store double %4823, double* %4829, align 8
  br label %4830

; <label>:4830                                    ; preds = %4806, %4801
  %4831 = load i64* %1, align 8
  %4832 = load i64* @nprocs, align 8
  %4833 = sub nsw i64 %4832, 1
  %4834 = icmp eq i64 %4831, %4833
  br i1 %4834, label %4835, label %4865

; <label>:4835                                    ; preds = %4830
  %4836 = load i64* @jm, align 8
  %4837 = sub nsw i64 %4836, 1
  %4838 = load i64* @im, align 8
  %4839 = sub nsw i64 %4838, 1
  %4840 = load %struct.wrk1_struct** @wrk1, align 8
  %4841 = getelementptr inbounds %struct.wrk1_struct* %4840, i32 0, i32 1
  %4842 = getelementptr inbounds [258 x [258 x double]]* %4841, i32 0, i64 %4839
  %4843 = getelementptr inbounds [258 x double]* %4842, i32 0, i64 %4837
  %4844 = load double* %4843, align 8
  %4845 = load double* %f4, align 8
  %4846 = load i64* @jm, align 8
  %4847 = sub nsw i64 %4846, 1
  %4848 = load i64* @im, align 8
  %4849 = sub nsw i64 %4848, 1
  %4850 = load %struct.wrk1_struct** @wrk1, align 8
  %4851 = getelementptr inbounds %struct.wrk1_struct* %4850, i32 0, i32 0
  %4852 = getelementptr inbounds [258 x [258 x double]]* %4851, i32 0, i64 %4849
  %4853 = getelementptr inbounds [258 x double]* %4852, i32 0, i64 %4847
  %4854 = load double* %4853, align 8
  %4855 = fmul double %4845, %4854
  %4856 = fadd double %4844, %4855
  %4857 = load i64* @jm, align 8
  %4858 = sub nsw i64 %4857, 1
  %4859 = load i64* @im, align 8
  %4860 = sub nsw i64 %4859, 1
  %4861 = load %struct.wrk1_struct** @wrk1, align 8
  %4862 = getelementptr inbounds %struct.wrk1_struct* %4861, i32 0, i32 1
  %4863 = getelementptr inbounds [258 x [258 x double]]* %4862, i32 0, i64 %4860
  %4864 = getelementptr inbounds [258 x double]* %4863, i32 0, i64 %4858
  store double %4856, double* %4864, align 8
  br label %4865

; <label>:4865                                    ; preds = %4835, %4830
  %4866 = load i64* %2, align 8
  %4867 = icmp eq i64 %4866, 1
  br i1 %4867, label %4868, label %4899

; <label>:4868                                    ; preds = %4865
  %4869 = load i64* %5, align 8
  store i64 %4869, i64* %j, align 8
  br label %4870

; <label>:4870                                    ; preds = %4895, %4868
  %4871 = load i64* %j, align 8
  %4872 = load i64* %6, align 8
  %4873 = icmp sle i64 %4871, %4872
  br i1 %4873, label %4874, label %4898

; <label>:4874                                    ; preds = %4870
  %4875 = load i64* %j, align 8
  %4876 = load %struct.wrk1_struct** @wrk1, align 8
  %4877 = getelementptr inbounds %struct.wrk1_struct* %4876, i32 0, i32 1
  %4878 = getelementptr inbounds [258 x [258 x double]]* %4877, i32 0, i64 0
  %4879 = getelementptr inbounds [258 x double]* %4878, i32 0, i64 %4875
  %4880 = load double* %4879, align 8
  %4881 = load double* %f4, align 8
  %4882 = load i64* %j, align 8
  %4883 = load %struct.wrk1_struct** @wrk1, align 8
  %4884 = getelementptr inbounds %struct.wrk1_struct* %4883, i32 0, i32 0
  %4885 = getelementptr inbounds [258 x [258 x double]]* %4884, i32 0, i64 0
  %4886 = getelementptr inbounds [258 x double]* %4885, i32 0, i64 %4882
  %4887 = load double* %4886, align 8
  %4888 = fmul double %4881, %4887
  %4889 = fadd double %4880, %4888
  %4890 = load i64* %j, align 8
  %4891 = load %struct.wrk1_struct** @wrk1, align 8
  %4892 = getelementptr inbounds %struct.wrk1_struct* %4891, i32 0, i32 1
  %4893 = getelementptr inbounds [258 x [258 x double]]* %4892, i32 0, i64 0
  %4894 = getelementptr inbounds [258 x double]* %4893, i32 0, i64 %4890
  store double %4889, double* %4894, align 8
  br label %4895

; <label>:4895                                    ; preds = %4874
  %4896 = load i64* %j, align 8
  %4897 = add nsw i64 %4896, 1
  store i64 %4897, i64* %j, align 8
  br label %4870

; <label>:4898                                    ; preds = %4870
  br label %4899

; <label>:4899                                    ; preds = %4898, %4865
  %4900 = load i64* %2, align 8
  %4901 = load i64* %4, align 8
  %4902 = add nsw i64 %4900, %4901
  %4903 = load i64* @im, align 8
  %4904 = sub nsw i64 %4903, 1
  %4905 = icmp eq i64 %4902, %4904
  br i1 %4905, label %4906, label %4943

; <label>:4906                                    ; preds = %4899
  %4907 = load i64* %5, align 8
  store i64 %4907, i64* %j, align 8
  br label %4908

; <label>:4908                                    ; preds = %4939, %4906
  %4909 = load i64* %j, align 8
  %4910 = load i64* %6, align 8
  %4911 = icmp sle i64 %4909, %4910
  br i1 %4911, label %4912, label %4942

; <label>:4912                                    ; preds = %4908
  %4913 = load i64* %j, align 8
  %4914 = load i64* @im, align 8
  %4915 = sub nsw i64 %4914, 1
  %4916 = load %struct.wrk1_struct** @wrk1, align 8
  %4917 = getelementptr inbounds %struct.wrk1_struct* %4916, i32 0, i32 1
  %4918 = getelementptr inbounds [258 x [258 x double]]* %4917, i32 0, i64 %4915
  %4919 = getelementptr inbounds [258 x double]* %4918, i32 0, i64 %4913
  %4920 = load double* %4919, align 8
  %4921 = load double* %f4, align 8
  %4922 = load i64* %j, align 8
  %4923 = load i64* @im, align 8
  %4924 = sub nsw i64 %4923, 1
  %4925 = load %struct.wrk1_struct** @wrk1, align 8
  %4926 = getelementptr inbounds %struct.wrk1_struct* %4925, i32 0, i32 0
  %4927 = getelementptr inbounds [258 x [258 x double]]* %4926, i32 0, i64 %4924
  %4928 = getelementptr inbounds [258 x double]* %4927, i32 0, i64 %4922
  %4929 = load double* %4928, align 8
  %4930 = fmul double %4921, %4929
  %4931 = fadd double %4920, %4930
  %4932 = load i64* %j, align 8
  %4933 = load i64* @im, align 8
  %4934 = sub nsw i64 %4933, 1
  %4935 = load %struct.wrk1_struct** @wrk1, align 8
  %4936 = getelementptr inbounds %struct.wrk1_struct* %4935, i32 0, i32 1
  %4937 = getelementptr inbounds [258 x [258 x double]]* %4936, i32 0, i64 %4934
  %4938 = getelementptr inbounds [258 x double]* %4937, i32 0, i64 %4932
  store double %4931, double* %4938, align 8
  br label %4939

; <label>:4939                                    ; preds = %4912
  %4940 = load i64* %j, align 8
  %4941 = add nsw i64 %4940, 1
  store i64 %4941, i64* %j, align 8
  br label %4908

; <label>:4942                                    ; preds = %4908
  br label %4943

; <label>:4943                                    ; preds = %4942, %4899
  %4944 = load i64* %5, align 8
  %4945 = icmp eq i64 %4944, 1
  br i1 %4945, label %4946, label %4977

; <label>:4946                                    ; preds = %4943
  %4947 = load i64* %2, align 8
  store i64 %4947, i64* %j, align 8
  br label %4948

; <label>:4948                                    ; preds = %4973, %4946
  %4949 = load i64* %j, align 8
  %4950 = load i64* %3, align 8
  %4951 = icmp sle i64 %4949, %4950
  br i1 %4951, label %4952, label %4976

; <label>:4952                                    ; preds = %4948
  %4953 = load i64* %j, align 8
  %4954 = load %struct.wrk1_struct** @wrk1, align 8
  %4955 = getelementptr inbounds %struct.wrk1_struct* %4954, i32 0, i32 1
  %4956 = getelementptr inbounds [258 x [258 x double]]* %4955, i32 0, i64 %4953
  %4957 = getelementptr inbounds [258 x double]* %4956, i32 0, i64 0
  %4958 = load double* %4957, align 8
  %4959 = load double* %f4, align 8
  %4960 = load i64* %j, align 8
  %4961 = load %struct.wrk1_struct** @wrk1, align 8
  %4962 = getelementptr inbounds %struct.wrk1_struct* %4961, i32 0, i32 0
  %4963 = getelementptr inbounds [258 x [258 x double]]* %4962, i32 0, i64 %4960
  %4964 = getelementptr inbounds [258 x double]* %4963, i32 0, i64 0
  %4965 = load double* %4964, align 8
  %4966 = fmul double %4959, %4965
  %4967 = fadd double %4958, %4966
  %4968 = load i64* %j, align 8
  %4969 = load %struct.wrk1_struct** @wrk1, align 8
  %4970 = getelementptr inbounds %struct.wrk1_struct* %4969, i32 0, i32 1
  %4971 = getelementptr inbounds [258 x [258 x double]]* %4970, i32 0, i64 %4968
  %4972 = getelementptr inbounds [258 x double]* %4971, i32 0, i64 0
  store double %4967, double* %4972, align 8
  br label %4973

; <label>:4973                                    ; preds = %4952
  %4974 = load i64* %j, align 8
  %4975 = add nsw i64 %4974, 1
  store i64 %4975, i64* %j, align 8
  br label %4948

; <label>:4976                                    ; preds = %4948
  br label %4977

; <label>:4977                                    ; preds = %4976, %4943
  %4978 = load i64* %5, align 8
  %4979 = load i64* %7, align 8
  %4980 = add nsw i64 %4978, %4979
  %4981 = load i64* @jm, align 8
  %4982 = sub nsw i64 %4981, 1
  %4983 = icmp eq i64 %4980, %4982
  br i1 %4983, label %4984, label %5021

; <label>:4984                                    ; preds = %4977
  %4985 = load i64* %2, align 8
  store i64 %4985, i64* %j, align 8
  br label %4986

; <label>:4986                                    ; preds = %5017, %4984
  %4987 = load i64* %j, align 8
  %4988 = load i64* %3, align 8
  %4989 = icmp sle i64 %4987, %4988
  br i1 %4989, label %4990, label %5020

; <label>:4990                                    ; preds = %4986
  %4991 = load i64* @jm, align 8
  %4992 = sub nsw i64 %4991, 1
  %4993 = load i64* %j, align 8
  %4994 = load %struct.wrk1_struct** @wrk1, align 8
  %4995 = getelementptr inbounds %struct.wrk1_struct* %4994, i32 0, i32 1
  %4996 = getelementptr inbounds [258 x [258 x double]]* %4995, i32 0, i64 %4993
  %4997 = getelementptr inbounds [258 x double]* %4996, i32 0, i64 %4992
  %4998 = load double* %4997, align 8
  %4999 = load double* %f4, align 8
  %5000 = load i64* @jm, align 8
  %5001 = sub nsw i64 %5000, 1
  %5002 = load i64* %j, align 8
  %5003 = load %struct.wrk1_struct** @wrk1, align 8
  %5004 = getelementptr inbounds %struct.wrk1_struct* %5003, i32 0, i32 0
  %5005 = getelementptr inbounds [258 x [258 x double]]* %5004, i32 0, i64 %5002
  %5006 = getelementptr inbounds [258 x double]* %5005, i32 0, i64 %5001
  %5007 = load double* %5006, align 8
  %5008 = fmul double %4999, %5007
  %5009 = fadd double %4998, %5008
  %5010 = load i64* @jm, align 8
  %5011 = sub nsw i64 %5010, 1
  %5012 = load i64* %j, align 8
  %5013 = load %struct.wrk1_struct** @wrk1, align 8
  %5014 = getelementptr inbounds %struct.wrk1_struct* %5013, i32 0, i32 1
  %5015 = getelementptr inbounds [258 x [258 x double]]* %5014, i32 0, i64 %5012
  %5016 = getelementptr inbounds [258 x double]* %5015, i32 0, i64 %5011
  store double %5009, double* %5016, align 8
  br label %5017

; <label>:5017                                    ; preds = %4990
  %5018 = load i64* %j, align 8
  %5019 = add nsw i64 %5018, 1
  store i64 %5019, i64* %j, align 8
  br label %4986

; <label>:5020                                    ; preds = %4986
  br label %5021

; <label>:5021                                    ; preds = %5020, %4977
  %5022 = load i64* %2, align 8
  store i64 %5022, i64* %i, align 8
  br label %5023

; <label>:5023                                    ; preds = %5061, %5021
  %5024 = load i64* %i, align 8
  %5025 = load i64* %3, align 8
  %5026 = icmp sle i64 %5024, %5025
  br i1 %5026, label %5027, label %5064

; <label>:5027                                    ; preds = %5023
  %5028 = load i64* %5, align 8
  store i64 %5028, i64* %iindex, align 8
  br label %5029

; <label>:5029                                    ; preds = %5057, %5027
  %5030 = load i64* %iindex, align 8
  %5031 = load i64* %6, align 8
  %5032 = icmp sle i64 %5030, %5031
  br i1 %5032, label %5033, label %5060

; <label>:5033                                    ; preds = %5029
  %5034 = load i64* %iindex, align 8
  %5035 = load i64* %i, align 8
  %5036 = load %struct.wrk1_struct** @wrk1, align 8
  %5037 = getelementptr inbounds %struct.wrk1_struct* %5036, i32 0, i32 1
  %5038 = getelementptr inbounds [258 x [258 x double]]* %5037, i32 0, i64 %5035
  %5039 = getelementptr inbounds [258 x double]* %5038, i32 0, i64 %5034
  %5040 = load double* %5039, align 8
  %5041 = load double* %f4, align 8
  %5042 = load i64* %iindex, align 8
  %5043 = load i64* %i, align 8
  %5044 = load %struct.wrk1_struct** @wrk1, align 8
  %5045 = getelementptr inbounds %struct.wrk1_struct* %5044, i32 0, i32 0
  %5046 = getelementptr inbounds [258 x [258 x double]]* %5045, i32 0, i64 %5043
  %5047 = getelementptr inbounds [258 x double]* %5046, i32 0, i64 %5042
  %5048 = load double* %5047, align 8
  %5049 = fmul double %5041, %5048
  %5050 = fadd double %5040, %5049
  %5051 = load i64* %iindex, align 8
  %5052 = load i64* %i, align 8
  %5053 = load %struct.wrk1_struct** @wrk1, align 8
  %5054 = getelementptr inbounds %struct.wrk1_struct* %5053, i32 0, i32 1
  %5055 = getelementptr inbounds [258 x [258 x double]]* %5054, i32 0, i64 %5052
  %5056 = getelementptr inbounds [258 x double]* %5055, i32 0, i64 %5051
  store double %5050, double* %5056, align 8
  br label %5057

; <label>:5057                                    ; preds = %5033
  %5058 = load i64* %iindex, align 8
  %5059 = add nsw i64 %5058, 1
  store i64 %5059, i64* %iindex, align 8
  br label %5029

; <label>:5060                                    ; preds = %5029
  br label %5061

; <label>:5061                                    ; preds = %5060
  %5062 = load i64* %i, align 8
  %5063 = add nsw i64 %5062, 1
  store i64 %5063, i64* %i, align 8
  br label %5023

; <label>:5064                                    ; preds = %5023
  %5065 = load %struct.bars_struct** @bars, align 8
  %5066 = getelementptr inbounds %struct.bars_struct* %5065, i32 0, i32 0
  %5067 = getelementptr inbounds %struct.anon* %5066, i32 0, i32 0
  %5068 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %5067) #6
  %5069 = sext i32 %5068 to i64
  store i64 %5069, i64* %Error26, align 8
  %5070 = load i64* %Error26, align 8
  %5071 = icmp ne i64 %5070, 0
  br i1 %5071, label %5072, label %5074

; <label>:5072                                    ; preds = %5064
  %5073 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str41, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:5074                                    ; preds = %5064
  %5075 = load %struct.bars_struct** @bars, align 8
  %5076 = getelementptr inbounds %struct.bars_struct* %5075, i32 0, i32 0
  %5077 = getelementptr inbounds %struct.anon* %5076, i32 0, i32 3
  %5078 = load i64* %5077, align 8
  store i64 %5078, i64* %Cycle27, align 8
  %5079 = load %struct.bars_struct** @bars, align 8
  %5080 = getelementptr inbounds %struct.bars_struct* %5079, i32 0, i32 0
  %5081 = getelementptr inbounds %struct.anon* %5080, i32 0, i32 2
  %5082 = load i64* %5081, align 8
  %5083 = add i64 %5082, 1
  store i64 %5083, i64* %5081, align 8
  %5084 = load i64* @nprocs, align 8
  %5085 = icmp ne i64 %5083, %5084
  br i1 %5085, label %5086, label %5114

; <label>:5086                                    ; preds = %5074
  %5087 = bitcast i64* %Cancel28 to i32*
  %5088 = call i32 @pthread_setcancelstate(i32 1, i32* %5087)
  br label %5089

; <label>:5089                                    ; preds = %5108, %5086
  %5090 = load i64* %Cycle27, align 8
  %5091 = load %struct.bars_struct** @bars, align 8
  %5092 = getelementptr inbounds %struct.bars_struct* %5091, i32 0, i32 0
  %5093 = getelementptr inbounds %struct.anon* %5092, i32 0, i32 3
  %5094 = load i64* %5093, align 8
  %5095 = icmp eq i64 %5090, %5094
  br i1 %5095, label %5096, label %5109

; <label>:5096                                    ; preds = %5089
  %5097 = load %struct.bars_struct** @bars, align 8
  %5098 = getelementptr inbounds %struct.bars_struct* %5097, i32 0, i32 0
  %5099 = getelementptr inbounds %struct.anon* %5098, i32 0, i32 1
  %5100 = load %struct.bars_struct** @bars, align 8
  %5101 = getelementptr inbounds %struct.bars_struct* %5100, i32 0, i32 0
  %5102 = getelementptr inbounds %struct.anon* %5101, i32 0, i32 0
  %5103 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %5099, %union.pthread_mutex_t* %5102)
  %5104 = sext i32 %5103 to i64
  store i64 %5104, i64* %Error26, align 8
  %5105 = load i64* %Error26, align 8
  %5106 = icmp ne i64 %5105, 0
  br i1 %5106, label %5107, label %5108

; <label>:5107                                    ; preds = %5096
  br label %5109

; <label>:5108                                    ; preds = %5096
  br label %5089

; <label>:5109                                    ; preds = %5107, %5089
  %5110 = load i64* %Cancel28, align 8
  %5111 = trunc i64 %5110 to i32
  %5112 = bitcast i64* %Temp29 to i32*
  %5113 = call i32 @pthread_setcancelstate(i32 %5111, i32* %5112)
  br label %5134

; <label>:5114                                    ; preds = %5074
  %5115 = load %struct.bars_struct** @bars, align 8
  %5116 = getelementptr inbounds %struct.bars_struct* %5115, i32 0, i32 0
  %5117 = getelementptr inbounds %struct.anon* %5116, i32 0, i32 3
  %5118 = load i64* %5117, align 8
  %5119 = icmp ne i64 %5118, 0
  %5120 = xor i1 %5119, true
  %5121 = zext i1 %5120 to i32
  %5122 = sext i32 %5121 to i64
  %5123 = load %struct.bars_struct** @bars, align 8
  %5124 = getelementptr inbounds %struct.bars_struct* %5123, i32 0, i32 0
  %5125 = getelementptr inbounds %struct.anon* %5124, i32 0, i32 3
  store i64 %5122, i64* %5125, align 8
  %5126 = load %struct.bars_struct** @bars, align 8
  %5127 = getelementptr inbounds %struct.bars_struct* %5126, i32 0, i32 0
  %5128 = getelementptr inbounds %struct.anon* %5127, i32 0, i32 2
  store i64 0, i64* %5128, align 8
  %5129 = load %struct.bars_struct** @bars, align 8
  %5130 = getelementptr inbounds %struct.bars_struct* %5129, i32 0, i32 0
  %5131 = getelementptr inbounds %struct.anon* %5130, i32 0, i32 1
  %5132 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %5131) #6
  %5133 = sext i32 %5132 to i64
  store i64 %5133, i64* %Error26, align 8
  br label %5134

; <label>:5134                                    ; preds = %5114, %5109
  %5135 = load %struct.bars_struct** @bars, align 8
  %5136 = getelementptr inbounds %struct.bars_struct* %5135, i32 0, i32 0
  %5137 = getelementptr inbounds %struct.anon* %5136, i32 0, i32 0
  %5138 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %5137) #6
  %5139 = load i64* %istart, align 8
  store i64 %5139, i64* %i, align 8
  br label %5140

; <label>:5140                                    ; preds = %5173, %5134
  %5141 = load i64* %i, align 8
  %5142 = load i64* %iend, align 8
  %5143 = icmp sle i64 %5141, %5142
  br i1 %5143, label %5144, label %5176

; <label>:5144                                    ; preds = %5140
  %5145 = load i64* %jstart, align 8
  store i64 %5145, i64* %j, align 8
  br label %5146

; <label>:5146                                    ; preds = %5169, %5144
  %5147 = load i64* %j, align 8
  %5148 = load i64* %jend, align 8
  %5149 = icmp sle i64 %5147, %5148
  br i1 %5149, label %5150, label %5172

; <label>:5150                                    ; preds = %5146
  %5151 = load i64* %j, align 8
  %5152 = load i64* %i, align 8
  %5153 = load %struct.wrk1_struct** @wrk1, align 8
  %5154 = getelementptr inbounds %struct.wrk1_struct* %5153, i32 0, i32 2
  %5155 = getelementptr inbounds [258 x [258 x double]]* %5154, i32 0, i64 %5152
  %5156 = getelementptr inbounds [258 x double]* %5155, i32 0, i64 %5151
  %5157 = load double* %5156, align 8
  %5158 = load double* %ressqr, align 8
  %5159 = fmul double %5157, %5158
  %5160 = load i64* %j, align 8
  %5161 = load i64* %i, align 8
  %5162 = load i64* @numlev, align 8
  %5163 = sub nsw i64 %5162, 1
  %5164 = load %struct.multi_struct** @multi, align 8
  %5165 = getelementptr inbounds %struct.multi_struct* %5164, i32 0, i32 1
  %5166 = getelementptr inbounds [9 x [258 x [258 x double]]]* %5165, i32 0, i64 %5163
  %5167 = getelementptr inbounds [258 x [258 x double]]* %5166, i32 0, i64 %5161
  %5168 = getelementptr inbounds [258 x double]* %5167, i32 0, i64 %5160
  store double %5159, double* %5168, align 8
  br label %5169

; <label>:5169                                    ; preds = %5150
  %5170 = load i64* %j, align 8
  %5171 = add nsw i64 %5170, 1
  store i64 %5171, i64* %j, align 8
  br label %5146

; <label>:5172                                    ; preds = %5146
  br label %5173

; <label>:5173                                    ; preds = %5172
  %5174 = load i64* %i, align 8
  %5175 = add nsw i64 %5174, 1
  store i64 %5175, i64* %i, align 8
  br label %5140

; <label>:5176                                    ; preds = %5140
  %5177 = load i64* %istart, align 8
  %5178 = icmp eq i64 %5177, 0
  br i1 %5178, label %5179, label %5204

; <label>:5179                                    ; preds = %5176
  %5180 = load i64* %jstart, align 8
  store i64 %5180, i64* %j, align 8
  br label %5181

; <label>:5181                                    ; preds = %5200, %5179
  %5182 = load i64* %j, align 8
  %5183 = load i64* %jend, align 8
  %5184 = icmp sle i64 %5182, %5183
  br i1 %5184, label %5185, label %5203

; <label>:5185                                    ; preds = %5181
  %5186 = load i64* %j, align 8
  %5187 = load %struct.wrk1_struct** @wrk1, align 8
  %5188 = getelementptr inbounds %struct.wrk1_struct* %5187, i32 0, i32 2
  %5189 = getelementptr inbounds [258 x [258 x double]]* %5188, i32 0, i64 0
  %5190 = getelementptr inbounds [258 x double]* %5189, i32 0, i64 %5186
  %5191 = load double* %5190, align 8
  %5192 = load i64* %j, align 8
  %5193 = load i64* @numlev, align 8
  %5194 = sub nsw i64 %5193, 1
  %5195 = load %struct.multi_struct** @multi, align 8
  %5196 = getelementptr inbounds %struct.multi_struct* %5195, i32 0, i32 0
  %5197 = getelementptr inbounds [9 x [258 x [258 x double]]]* %5196, i32 0, i64 %5194
  %5198 = getelementptr inbounds [258 x [258 x double]]* %5197, i32 0, i64 0
  %5199 = getelementptr inbounds [258 x double]* %5198, i32 0, i64 %5192
  store double %5191, double* %5199, align 8
  br label %5200

; <label>:5200                                    ; preds = %5185
  %5201 = load i64* %j, align 8
  %5202 = add nsw i64 %5201, 1
  store i64 %5202, i64* %j, align 8
  br label %5181

; <label>:5203                                    ; preds = %5181
  br label %5204

; <label>:5204                                    ; preds = %5203, %5176
  %5205 = load i64* %iend, align 8
  %5206 = load i64* @im, align 8
  %5207 = sub nsw i64 %5206, 1
  %5208 = icmp eq i64 %5205, %5207
  br i1 %5208, label %5209, label %5238

; <label>:5209                                    ; preds = %5204
  %5210 = load i64* %jstart, align 8
  store i64 %5210, i64* %j, align 8
  br label %5211

; <label>:5211                                    ; preds = %5234, %5209
  %5212 = load i64* %j, align 8
  %5213 = load i64* %jend, align 8
  %5214 = icmp sle i64 %5212, %5213
  br i1 %5214, label %5215, label %5237

; <label>:5215                                    ; preds = %5211
  %5216 = load i64* %j, align 8
  %5217 = load i64* @im, align 8
  %5218 = sub nsw i64 %5217, 1
  %5219 = load %struct.wrk1_struct** @wrk1, align 8
  %5220 = getelementptr inbounds %struct.wrk1_struct* %5219, i32 0, i32 2
  %5221 = getelementptr inbounds [258 x [258 x double]]* %5220, i32 0, i64 %5218
  %5222 = getelementptr inbounds [258 x double]* %5221, i32 0, i64 %5216
  %5223 = load double* %5222, align 8
  %5224 = load i64* %j, align 8
  %5225 = load i64* @im, align 8
  %5226 = sub nsw i64 %5225, 1
  %5227 = load i64* @numlev, align 8
  %5228 = sub nsw i64 %5227, 1
  %5229 = load %struct.multi_struct** @multi, align 8
  %5230 = getelementptr inbounds %struct.multi_struct* %5229, i32 0, i32 0
  %5231 = getelementptr inbounds [9 x [258 x [258 x double]]]* %5230, i32 0, i64 %5228
  %5232 = getelementptr inbounds [258 x [258 x double]]* %5231, i32 0, i64 %5226
  %5233 = getelementptr inbounds [258 x double]* %5232, i32 0, i64 %5224
  store double %5223, double* %5233, align 8
  br label %5234

; <label>:5234                                    ; preds = %5215
  %5235 = load i64* %j, align 8
  %5236 = add nsw i64 %5235, 1
  store i64 %5236, i64* %j, align 8
  br label %5211

; <label>:5237                                    ; preds = %5211
  br label %5238

; <label>:5238                                    ; preds = %5237, %5204
  %5239 = load i64* %jstart, align 8
  %5240 = icmp eq i64 %5239, 0
  br i1 %5240, label %5241, label %5266

; <label>:5241                                    ; preds = %5238
  %5242 = load i64* %istart, align 8
  store i64 %5242, i64* %i, align 8
  br label %5243

; <label>:5243                                    ; preds = %5262, %5241
  %5244 = load i64* %i, align 8
  %5245 = load i64* %iend, align 8
  %5246 = icmp sle i64 %5244, %5245
  br i1 %5246, label %5247, label %5265

; <label>:5247                                    ; preds = %5243
  %5248 = load i64* %i, align 8
  %5249 = load %struct.wrk1_struct** @wrk1, align 8
  %5250 = getelementptr inbounds %struct.wrk1_struct* %5249, i32 0, i32 2
  %5251 = getelementptr inbounds [258 x [258 x double]]* %5250, i32 0, i64 %5248
  %5252 = getelementptr inbounds [258 x double]* %5251, i32 0, i64 0
  %5253 = load double* %5252, align 8
  %5254 = load i64* %i, align 8
  %5255 = load i64* @numlev, align 8
  %5256 = sub nsw i64 %5255, 1
  %5257 = load %struct.multi_struct** @multi, align 8
  %5258 = getelementptr inbounds %struct.multi_struct* %5257, i32 0, i32 0
  %5259 = getelementptr inbounds [9 x [258 x [258 x double]]]* %5258, i32 0, i64 %5256
  %5260 = getelementptr inbounds [258 x [258 x double]]* %5259, i32 0, i64 %5254
  %5261 = getelementptr inbounds [258 x double]* %5260, i32 0, i64 0
  store double %5253, double* %5261, align 8
  br label %5262

; <label>:5262                                    ; preds = %5247
  %5263 = load i64* %i, align 8
  %5264 = add nsw i64 %5263, 1
  store i64 %5264, i64* %i, align 8
  br label %5243

; <label>:5265                                    ; preds = %5243
  br label %5266

; <label>:5266                                    ; preds = %5265, %5238
  %5267 = load i64* %jend, align 8
  %5268 = load i64* @jm, align 8
  %5269 = sub nsw i64 %5268, 1
  %5270 = icmp eq i64 %5267, %5269
  br i1 %5270, label %5271, label %5300

; <label>:5271                                    ; preds = %5266
  %5272 = load i64* %istart, align 8
  store i64 %5272, i64* %i, align 8
  br label %5273

; <label>:5273                                    ; preds = %5296, %5271
  %5274 = load i64* %i, align 8
  %5275 = load i64* %iend, align 8
  %5276 = icmp sle i64 %5274, %5275
  br i1 %5276, label %5277, label %5299

; <label>:5277                                    ; preds = %5273
  %5278 = load i64* @jm, align 8
  %5279 = sub nsw i64 %5278, 1
  %5280 = load i64* %i, align 8
  %5281 = load %struct.wrk1_struct** @wrk1, align 8
  %5282 = getelementptr inbounds %struct.wrk1_struct* %5281, i32 0, i32 2
  %5283 = getelementptr inbounds [258 x [258 x double]]* %5282, i32 0, i64 %5280
  %5284 = getelementptr inbounds [258 x double]* %5283, i32 0, i64 %5279
  %5285 = load double* %5284, align 8
  %5286 = load i64* @jm, align 8
  %5287 = sub nsw i64 %5286, 1
  %5288 = load i64* %i, align 8
  %5289 = load i64* @numlev, align 8
  %5290 = sub nsw i64 %5289, 1
  %5291 = load %struct.multi_struct** @multi, align 8
  %5292 = getelementptr inbounds %struct.multi_struct* %5291, i32 0, i32 0
  %5293 = getelementptr inbounds [9 x [258 x [258 x double]]]* %5292, i32 0, i64 %5290
  %5294 = getelementptr inbounds [258 x [258 x double]]* %5293, i32 0, i64 %5288
  %5295 = getelementptr inbounds [258 x double]* %5294, i32 0, i64 %5287
  store double %5285, double* %5295, align 8
  br label %5296

; <label>:5296                                    ; preds = %5277
  %5297 = load i64* %i, align 8
  %5298 = add nsw i64 %5297, 1
  store i64 %5298, i64* %i, align 8
  br label %5273

; <label>:5299                                    ; preds = %5273
  br label %5300

; <label>:5300                                    ; preds = %5299, %5266
  %5301 = load double* %ressqr, align 8
  %5302 = load double* @eig2, align 8
  %5303 = fmul double %5301, %5302
  %5304 = fsub double 4.000000e+00, %5303
  %5305 = fdiv double 1.000000e+00, %5304
  store double %5305, double* %fac, align 8
  %5306 = load i64* %ist, align 8
  store i64 %5306, i64* %i, align 8
  br label %5307

; <label>:5307                                    ; preds = %5338, %5300
  %5308 = load i64* %i, align 8
  %5309 = load i64* %ien, align 8
  %5310 = icmp sle i64 %5308, %5309
  br i1 %5310, label %5311, label %5341

; <label>:5311                                    ; preds = %5307
  %5312 = load i64* %jst, align 8
  store i64 %5312, i64* %j, align 8
  br label %5313

; <label>:5313                                    ; preds = %5334, %5311
  %5314 = load i64* %j, align 8
  %5315 = load i64* %jen, align 8
  %5316 = icmp sle i64 %5314, %5315
  br i1 %5316, label %5317, label %5337

; <label>:5317                                    ; preds = %5313
  %5318 = load i64* %j, align 8
  %5319 = load i64* %i, align 8
  %5320 = load %struct.guess_struct** @guess, align 8
  %5321 = getelementptr inbounds %struct.guess_struct* %5320, i32 0, i32 1
  %5322 = getelementptr inbounds [258 x [258 x double]]* %5321, i32 0, i64 %5319
  %5323 = getelementptr inbounds [258 x double]* %5322, i32 0, i64 %5318
  %5324 = load double* %5323, align 8
  %5325 = load i64* %j, align 8
  %5326 = load i64* %i, align 8
  %5327 = load i64* @numlev, align 8
  %5328 = sub nsw i64 %5327, 1
  %5329 = load %struct.multi_struct** @multi, align 8
  %5330 = getelementptr inbounds %struct.multi_struct* %5329, i32 0, i32 0
  %5331 = getelementptr inbounds [9 x [258 x [258 x double]]]* %5330, i32 0, i64 %5328
  %5332 = getelementptr inbounds [258 x [258 x double]]* %5331, i32 0, i64 %5326
  %5333 = getelementptr inbounds [258 x double]* %5332, i32 0, i64 %5325
  store double %5324, double* %5333, align 8
  br label %5334

; <label>:5334                                    ; preds = %5317
  %5335 = load i64* %j, align 8
  %5336 = add nsw i64 %5335, 1
  store i64 %5336, i64* %j, align 8
  br label %5313

; <label>:5337                                    ; preds = %5313
  br label %5338

; <label>:5338                                    ; preds = %5337
  %5339 = load i64* %i, align 8
  %5340 = add nsw i64 %5339, 1
  store i64 %5340, i64* %i, align 8
  br label %5307

; <label>:5341                                    ; preds = %5307
  %5342 = load i64* %1, align 8
  %5343 = icmp eq i64 %5342, 0
  br i1 %5343, label %5347, label %5344

; <label>:5344                                    ; preds = %5341
  %5345 = load i64* @do_stats, align 8
  %5346 = icmp ne i64 %5345, 0
  br i1 %5346, label %5347, label %5355

; <label>:5347                                    ; preds = %5344, %5341
  %5348 = call i32 @gettimeofday(%struct.timeval* %FullTime30, %struct.timezone* null) #6
  %5349 = getelementptr inbounds %struct.timeval* %FullTime30, i32 0, i32 1
  %5350 = load i64* %5349, align 8
  %5351 = getelementptr inbounds %struct.timeval* %FullTime30, i32 0, i32 0
  %5352 = load i64* %5351, align 8
  %5353 = mul nsw i64 %5352, 1000000
  %5354 = add nsw i64 %5350, %5353
  store i64 %5354, i64* %multi_start, align 8
  br label %5355

; <label>:5355                                    ; preds = %5347, %5344
  %5356 = load i64* %1, align 8
  call void @multig(i64 %5356)
  %5357 = load i64* %1, align 8
  %5358 = icmp eq i64 %5357, 0
  br i1 %5358, label %5362, label %5359

; <label>:5359                                    ; preds = %5355
  %5360 = load i64* @do_stats, align 8
  %5361 = icmp ne i64 %5360, 0
  br i1 %5361, label %5362, label %5380

; <label>:5362                                    ; preds = %5359, %5355
  %5363 = call i32 @gettimeofday(%struct.timeval* %FullTime31, %struct.timezone* null) #6
  %5364 = getelementptr inbounds %struct.timeval* %FullTime31, i32 0, i32 1
  %5365 = load i64* %5364, align 8
  %5366 = getelementptr inbounds %struct.timeval* %FullTime31, i32 0, i32 0
  %5367 = load i64* %5366, align 8
  %5368 = mul nsw i64 %5367, 1000000
  %5369 = add nsw i64 %5365, %5368
  store i64 %5369, i64* %multi_end, align 8
  %5370 = load i64* %multi_end, align 8
  %5371 = load i64* %multi_start, align 8
  %5372 = sub nsw i64 %5370, %5371
  %5373 = sitofp i64 %5372 to double
  %5374 = load i64* %1, align 8
  %5375 = load %struct.Global_Private** @gp, align 8
  %5376 = getelementptr inbounds %struct.Global_Private* %5375, i64 %5374
  %5377 = getelementptr inbounds %struct.Global_Private* %5376, i32 0, i32 1
  %5378 = load double* %5377, align 8
  %5379 = fadd double %5378, %5373
  store double %5379, double* %5377, align 8
  br label %5380

; <label>:5380                                    ; preds = %5362, %5359
  %5381 = load i64* %istart, align 8
  store i64 %5381, i64* %i, align 8
  br label %5382

; <label>:5382                                    ; preds = %5429, %5380
  %5383 = load i64* %i, align 8
  %5384 = load i64* %iend, align 8
  %5385 = icmp sle i64 %5383, %5384
  br i1 %5385, label %5386, label %5432

; <label>:5386                                    ; preds = %5382
  %5387 = load i64* %jstart, align 8
  store i64 %5387, i64* %j, align 8
  br label %5388

; <label>:5388                                    ; preds = %5425, %5386
  %5389 = load i64* %j, align 8
  %5390 = load i64* %jend, align 8
  %5391 = icmp sle i64 %5389, %5390
  br i1 %5391, label %5392, label %5428

; <label>:5392                                    ; preds = %5388
  %5393 = load i64* %j, align 8
  %5394 = load i64* %i, align 8
  %5395 = load i64* @numlev, align 8
  %5396 = sub nsw i64 %5395, 1
  %5397 = load %struct.multi_struct** @multi, align 8
  %5398 = getelementptr inbounds %struct.multi_struct* %5397, i32 0, i32 0
  %5399 = getelementptr inbounds [9 x [258 x [258 x double]]]* %5398, i32 0, i64 %5396
  %5400 = getelementptr inbounds [258 x [258 x double]]* %5399, i32 0, i64 %5394
  %5401 = getelementptr inbounds [258 x double]* %5400, i32 0, i64 %5393
  %5402 = load double* %5401, align 8
  %5403 = load i64* %j, align 8
  %5404 = load i64* %i, align 8
  %5405 = load %struct.wrk1_struct** @wrk1, align 8
  %5406 = getelementptr inbounds %struct.wrk1_struct* %5405, i32 0, i32 2
  %5407 = getelementptr inbounds [258 x [258 x double]]* %5406, i32 0, i64 %5404
  %5408 = getelementptr inbounds [258 x double]* %5407, i32 0, i64 %5403
  store double %5402, double* %5408, align 8
  %5409 = load i64* %j, align 8
  %5410 = load i64* %i, align 8
  %5411 = load i64* @numlev, align 8
  %5412 = sub nsw i64 %5411, 1
  %5413 = load %struct.multi_struct** @multi, align 8
  %5414 = getelementptr inbounds %struct.multi_struct* %5413, i32 0, i32 0
  %5415 = getelementptr inbounds [9 x [258 x [258 x double]]]* %5414, i32 0, i64 %5412
  %5416 = getelementptr inbounds [258 x [258 x double]]* %5415, i32 0, i64 %5410
  %5417 = getelementptr inbounds [258 x double]* %5416, i32 0, i64 %5409
  %5418 = load double* %5417, align 8
  %5419 = load i64* %j, align 8
  %5420 = load i64* %i, align 8
  %5421 = load %struct.guess_struct** @guess, align 8
  %5422 = getelementptr inbounds %struct.guess_struct* %5421, i32 0, i32 1
  %5423 = getelementptr inbounds [258 x [258 x double]]* %5422, i32 0, i64 %5420
  %5424 = getelementptr inbounds [258 x double]* %5423, i32 0, i64 %5419
  store double %5418, double* %5424, align 8
  br label %5425

; <label>:5425                                    ; preds = %5392
  %5426 = load i64* %j, align 8
  %5427 = add nsw i64 %5426, 1
  store i64 %5427, i64* %j, align 8
  br label %5388

; <label>:5428                                    ; preds = %5388
  br label %5429

; <label>:5429                                    ; preds = %5428
  %5430 = load i64* %i, align 8
  %5431 = add nsw i64 %5430, 1
  store i64 %5431, i64* %i, align 8
  br label %5382

; <label>:5432                                    ; preds = %5382
  %5433 = load %struct.bars_struct** @bars, align 8
  %5434 = getelementptr inbounds %struct.bars_struct* %5433, i32 0, i32 0
  %5435 = getelementptr inbounds %struct.anon* %5434, i32 0, i32 0
  %5436 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %5435) #6
  %5437 = sext i32 %5436 to i64
  store i64 %5437, i64* %Error32, align 8
  %5438 = load i64* %Error32, align 8
  %5439 = icmp ne i64 %5438, 0
  br i1 %5439, label %5440, label %5442

; <label>:5440                                    ; preds = %5432
  %5441 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str41, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:5442                                    ; preds = %5432
  %5443 = load %struct.bars_struct** @bars, align 8
  %5444 = getelementptr inbounds %struct.bars_struct* %5443, i32 0, i32 0
  %5445 = getelementptr inbounds %struct.anon* %5444, i32 0, i32 3
  %5446 = load i64* %5445, align 8
  store i64 %5446, i64* %Cycle33, align 8
  %5447 = load %struct.bars_struct** @bars, align 8
  %5448 = getelementptr inbounds %struct.bars_struct* %5447, i32 0, i32 0
  %5449 = getelementptr inbounds %struct.anon* %5448, i32 0, i32 2
  %5450 = load i64* %5449, align 8
  %5451 = add i64 %5450, 1
  store i64 %5451, i64* %5449, align 8
  %5452 = load i64* @nprocs, align 8
  %5453 = icmp ne i64 %5451, %5452
  br i1 %5453, label %5454, label %5482

; <label>:5454                                    ; preds = %5442
  %5455 = bitcast i64* %Cancel34 to i32*
  %5456 = call i32 @pthread_setcancelstate(i32 1, i32* %5455)
  br label %5457

; <label>:5457                                    ; preds = %5476, %5454
  %5458 = load i64* %Cycle33, align 8
  %5459 = load %struct.bars_struct** @bars, align 8
  %5460 = getelementptr inbounds %struct.bars_struct* %5459, i32 0, i32 0
  %5461 = getelementptr inbounds %struct.anon* %5460, i32 0, i32 3
  %5462 = load i64* %5461, align 8
  %5463 = icmp eq i64 %5458, %5462
  br i1 %5463, label %5464, label %5477

; <label>:5464                                    ; preds = %5457
  %5465 = load %struct.bars_struct** @bars, align 8
  %5466 = getelementptr inbounds %struct.bars_struct* %5465, i32 0, i32 0
  %5467 = getelementptr inbounds %struct.anon* %5466, i32 0, i32 1
  %5468 = load %struct.bars_struct** @bars, align 8
  %5469 = getelementptr inbounds %struct.bars_struct* %5468, i32 0, i32 0
  %5470 = getelementptr inbounds %struct.anon* %5469, i32 0, i32 0
  %5471 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %5467, %union.pthread_mutex_t* %5470)
  %5472 = sext i32 %5471 to i64
  store i64 %5472, i64* %Error32, align 8
  %5473 = load i64* %Error32, align 8
  %5474 = icmp ne i64 %5473, 0
  br i1 %5474, label %5475, label %5476

; <label>:5475                                    ; preds = %5464
  br label %5477

; <label>:5476                                    ; preds = %5464
  br label %5457

; <label>:5477                                    ; preds = %5475, %5457
  %5478 = load i64* %Cancel34, align 8
  %5479 = trunc i64 %5478 to i32
  %5480 = bitcast i64* %Temp35 to i32*
  %5481 = call i32 @pthread_setcancelstate(i32 %5479, i32* %5480)
  br label %5502

; <label>:5482                                    ; preds = %5442
  %5483 = load %struct.bars_struct** @bars, align 8
  %5484 = getelementptr inbounds %struct.bars_struct* %5483, i32 0, i32 0
  %5485 = getelementptr inbounds %struct.anon* %5484, i32 0, i32 3
  %5486 = load i64* %5485, align 8
  %5487 = icmp ne i64 %5486, 0
  %5488 = xor i1 %5487, true
  %5489 = zext i1 %5488 to i32
  %5490 = sext i32 %5489 to i64
  %5491 = load %struct.bars_struct** @bars, align 8
  %5492 = getelementptr inbounds %struct.bars_struct* %5491, i32 0, i32 0
  %5493 = getelementptr inbounds %struct.anon* %5492, i32 0, i32 3
  store i64 %5490, i64* %5493, align 8
  %5494 = load %struct.bars_struct** @bars, align 8
  %5495 = getelementptr inbounds %struct.bars_struct* %5494, i32 0, i32 0
  %5496 = getelementptr inbounds %struct.anon* %5495, i32 0, i32 2
  store i64 0, i64* %5496, align 8
  %5497 = load %struct.bars_struct** @bars, align 8
  %5498 = getelementptr inbounds %struct.bars_struct* %5497, i32 0, i32 0
  %5499 = getelementptr inbounds %struct.anon* %5498, i32 0, i32 1
  %5500 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %5499) #6
  %5501 = sext i32 %5500 to i64
  store i64 %5501, i64* %Error32, align 8
  br label %5502

; <label>:5502                                    ; preds = %5482, %5477
  %5503 = load %struct.bars_struct** @bars, align 8
  %5504 = getelementptr inbounds %struct.bars_struct* %5503, i32 0, i32 0
  %5505 = getelementptr inbounds %struct.anon* %5504, i32 0, i32 0
  %5506 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %5505) #6
  %5507 = load i64* %1, align 8
  %5508 = icmp eq i64 %5507, 0
  br i1 %5508, label %5509, label %5544

; <label>:5509                                    ; preds = %5502
  %5510 = load %struct.wrk1_struct** @wrk1, align 8
  %5511 = getelementptr inbounds %struct.wrk1_struct* %5510, i32 0, i32 2
  %5512 = getelementptr inbounds [258 x [258 x double]]* %5511, i32 0, i64 0
  %5513 = getelementptr inbounds [258 x double]* %5512, i32 0, i64 0
  %5514 = load double* %5513, align 8
  %5515 = load double* %hh1, align 8
  %5516 = load %struct.wrk1_struct** @wrk1, align 8
  %5517 = getelementptr inbounds %struct.wrk1_struct* %5516, i32 0, i32 1
  %5518 = getelementptr inbounds [258 x [258 x double]]* %5517, i32 0, i64 0
  %5519 = getelementptr inbounds [258 x double]* %5518, i32 0, i64 0
  %5520 = load double* %5519, align 8
  %5521 = fmul double %5515, %5520
  %5522 = fsub double %5514, %5521
  %5523 = load %struct.wrk3_struct** @wrk3, align 8
  %5524 = getelementptr inbounds %struct.wrk3_struct* %5523, i32 0, i32 1
  %5525 = getelementptr inbounds [258 x [258 x double]]* %5524, i32 0, i64 0
  %5526 = getelementptr inbounds [258 x double]* %5525, i32 0, i64 0
  store double %5522, double* %5526, align 8
  %5527 = load %struct.wrk1_struct** @wrk1, align 8
  %5528 = getelementptr inbounds %struct.wrk1_struct* %5527, i32 0, i32 2
  %5529 = getelementptr inbounds [258 x [258 x double]]* %5528, i32 0, i64 0
  %5530 = getelementptr inbounds [258 x double]* %5529, i32 0, i64 0
  %5531 = load double* %5530, align 8
  %5532 = load double* %hh3, align 8
  %5533 = load %struct.wrk1_struct** @wrk1, align 8
  %5534 = getelementptr inbounds %struct.wrk1_struct* %5533, i32 0, i32 1
  %5535 = getelementptr inbounds [258 x [258 x double]]* %5534, i32 0, i64 0
  %5536 = getelementptr inbounds [258 x double]* %5535, i32 0, i64 0
  %5537 = load double* %5536, align 8
  %5538 = fmul double %5532, %5537
  %5539 = fadd double %5531, %5538
  %5540 = load %struct.wrk2_struct** @wrk2, align 8
  %5541 = getelementptr inbounds %struct.wrk2_struct* %5540, i32 0, i32 0
  %5542 = getelementptr inbounds [258 x [258 x double]]* %5541, i32 0, i64 0
  %5543 = getelementptr inbounds [258 x double]* %5542, i32 0, i64 0
  store double %5539, double* %5543, align 8
  br label %5544

; <label>:5544                                    ; preds = %5509, %5502
  %5545 = load i64* %1, align 8
  %5546 = load i64* @nprocs, align 8
  %5547 = load i64* @xprocs, align 8
  %5548 = sub nsw i64 %5546, %5547
  %5549 = icmp eq i64 %5545, %5548
  br i1 %5549, label %5550, label %5597

; <label>:5550                                    ; preds = %5544
  %5551 = load i64* @im, align 8
  %5552 = sub nsw i64 %5551, 1
  %5553 = load %struct.wrk1_struct** @wrk1, align 8
  %5554 = getelementptr inbounds %struct.wrk1_struct* %5553, i32 0, i32 2
  %5555 = getelementptr inbounds [258 x [258 x double]]* %5554, i32 0, i64 %5552
  %5556 = getelementptr inbounds [258 x double]* %5555, i32 0, i64 0
  %5557 = load double* %5556, align 8
  %5558 = load double* %hh1, align 8
  %5559 = load i64* @im, align 8
  %5560 = sub nsw i64 %5559, 1
  %5561 = load %struct.wrk1_struct** @wrk1, align 8
  %5562 = getelementptr inbounds %struct.wrk1_struct* %5561, i32 0, i32 1
  %5563 = getelementptr inbounds [258 x [258 x double]]* %5562, i32 0, i64 %5560
  %5564 = getelementptr inbounds [258 x double]* %5563, i32 0, i64 0
  %5565 = load double* %5564, align 8
  %5566 = fmul double %5558, %5565
  %5567 = fsub double %5557, %5566
  %5568 = load i64* @im, align 8
  %5569 = sub nsw i64 %5568, 1
  %5570 = load %struct.wrk3_struct** @wrk3, align 8
  %5571 = getelementptr inbounds %struct.wrk3_struct* %5570, i32 0, i32 1
  %5572 = getelementptr inbounds [258 x [258 x double]]* %5571, i32 0, i64 %5569
  %5573 = getelementptr inbounds [258 x double]* %5572, i32 0, i64 0
  store double %5567, double* %5573, align 8
  %5574 = load i64* @im, align 8
  %5575 = sub nsw i64 %5574, 1
  %5576 = load %struct.wrk1_struct** @wrk1, align 8
  %5577 = getelementptr inbounds %struct.wrk1_struct* %5576, i32 0, i32 2
  %5578 = getelementptr inbounds [258 x [258 x double]]* %5577, i32 0, i64 %5575
  %5579 = getelementptr inbounds [258 x double]* %5578, i32 0, i64 0
  %5580 = load double* %5579, align 8
  %5581 = load double* %hh3, align 8
  %5582 = load i64* @im, align 8
  %5583 = sub nsw i64 %5582, 1
  %5584 = load %struct.wrk1_struct** @wrk1, align 8
  %5585 = getelementptr inbounds %struct.wrk1_struct* %5584, i32 0, i32 1
  %5586 = getelementptr inbounds [258 x [258 x double]]* %5585, i32 0, i64 %5583
  %5587 = getelementptr inbounds [258 x double]* %5586, i32 0, i64 0
  %5588 = load double* %5587, align 8
  %5589 = fmul double %5581, %5588
  %5590 = fadd double %5580, %5589
  %5591 = load i64* @im, align 8
  %5592 = sub nsw i64 %5591, 1
  %5593 = load %struct.wrk2_struct** @wrk2, align 8
  %5594 = getelementptr inbounds %struct.wrk2_struct* %5593, i32 0, i32 0
  %5595 = getelementptr inbounds [258 x [258 x double]]* %5594, i32 0, i64 %5592
  %5596 = getelementptr inbounds [258 x double]* %5595, i32 0, i64 0
  store double %5590, double* %5596, align 8
  br label %5597

; <label>:5597                                    ; preds = %5550, %5544
  %5598 = load i64* %1, align 8
  %5599 = load i64* @xprocs, align 8
  %5600 = sub nsw i64 %5599, 1
  %5601 = icmp eq i64 %5598, %5600
  br i1 %5601, label %5602, label %5649

; <label>:5602                                    ; preds = %5597
  %5603 = load i64* @jm, align 8
  %5604 = sub nsw i64 %5603, 1
  %5605 = load %struct.wrk1_struct** @wrk1, align 8
  %5606 = getelementptr inbounds %struct.wrk1_struct* %5605, i32 0, i32 2
  %5607 = getelementptr inbounds [258 x [258 x double]]* %5606, i32 0, i64 0
  %5608 = getelementptr inbounds [258 x double]* %5607, i32 0, i64 %5604
  %5609 = load double* %5608, align 8
  %5610 = load double* %hh1, align 8
  %5611 = load i64* @jm, align 8
  %5612 = sub nsw i64 %5611, 1
  %5613 = load %struct.wrk1_struct** @wrk1, align 8
  %5614 = getelementptr inbounds %struct.wrk1_struct* %5613, i32 0, i32 1
  %5615 = getelementptr inbounds [258 x [258 x double]]* %5614, i32 0, i64 0
  %5616 = getelementptr inbounds [258 x double]* %5615, i32 0, i64 %5612
  %5617 = load double* %5616, align 8
  %5618 = fmul double %5610, %5617
  %5619 = fsub double %5609, %5618
  %5620 = load i64* @jm, align 8
  %5621 = sub nsw i64 %5620, 1
  %5622 = load %struct.wrk3_struct** @wrk3, align 8
  %5623 = getelementptr inbounds %struct.wrk3_struct* %5622, i32 0, i32 1
  %5624 = getelementptr inbounds [258 x [258 x double]]* %5623, i32 0, i64 0
  %5625 = getelementptr inbounds [258 x double]* %5624, i32 0, i64 %5621
  store double %5619, double* %5625, align 8
  %5626 = load i64* @jm, align 8
  %5627 = sub nsw i64 %5626, 1
  %5628 = load %struct.wrk1_struct** @wrk1, align 8
  %5629 = getelementptr inbounds %struct.wrk1_struct* %5628, i32 0, i32 2
  %5630 = getelementptr inbounds [258 x [258 x double]]* %5629, i32 0, i64 0
  %5631 = getelementptr inbounds [258 x double]* %5630, i32 0, i64 %5627
  %5632 = load double* %5631, align 8
  %5633 = load double* %hh3, align 8
  %5634 = load i64* @jm, align 8
  %5635 = sub nsw i64 %5634, 1
  %5636 = load %struct.wrk1_struct** @wrk1, align 8
  %5637 = getelementptr inbounds %struct.wrk1_struct* %5636, i32 0, i32 1
  %5638 = getelementptr inbounds [258 x [258 x double]]* %5637, i32 0, i64 0
  %5639 = getelementptr inbounds [258 x double]* %5638, i32 0, i64 %5635
  %5640 = load double* %5639, align 8
  %5641 = fmul double %5633, %5640
  %5642 = fadd double %5632, %5641
  %5643 = load i64* @jm, align 8
  %5644 = sub nsw i64 %5643, 1
  %5645 = load %struct.wrk2_struct** @wrk2, align 8
  %5646 = getelementptr inbounds %struct.wrk2_struct* %5645, i32 0, i32 0
  %5647 = getelementptr inbounds [258 x [258 x double]]* %5646, i32 0, i64 0
  %5648 = getelementptr inbounds [258 x double]* %5647, i32 0, i64 %5644
  store double %5642, double* %5648, align 8
  br label %5649

; <label>:5649                                    ; preds = %5602, %5597
  %5650 = load i64* %1, align 8
  %5651 = load i64* @nprocs, align 8
  %5652 = sub nsw i64 %5651, 1
  %5653 = icmp eq i64 %5650, %5652
  br i1 %5653, label %5654, label %5713

; <label>:5654                                    ; preds = %5649
  %5655 = load i64* @jm, align 8
  %5656 = sub nsw i64 %5655, 1
  %5657 = load i64* @im, align 8
  %5658 = sub nsw i64 %5657, 1
  %5659 = load %struct.wrk1_struct** @wrk1, align 8
  %5660 = getelementptr inbounds %struct.wrk1_struct* %5659, i32 0, i32 2
  %5661 = getelementptr inbounds [258 x [258 x double]]* %5660, i32 0, i64 %5658
  %5662 = getelementptr inbounds [258 x double]* %5661, i32 0, i64 %5656
  %5663 = load double* %5662, align 8
  %5664 = load double* %hh1, align 8
  %5665 = load i64* @jm, align 8
  %5666 = sub nsw i64 %5665, 1
  %5667 = load i64* @im, align 8
  %5668 = sub nsw i64 %5667, 1
  %5669 = load %struct.wrk1_struct** @wrk1, align 8
  %5670 = getelementptr inbounds %struct.wrk1_struct* %5669, i32 0, i32 1
  %5671 = getelementptr inbounds [258 x [258 x double]]* %5670, i32 0, i64 %5668
  %5672 = getelementptr inbounds [258 x double]* %5671, i32 0, i64 %5666
  %5673 = load double* %5672, align 8
  %5674 = fmul double %5664, %5673
  %5675 = fsub double %5663, %5674
  %5676 = load i64* @jm, align 8
  %5677 = sub nsw i64 %5676, 1
  %5678 = load i64* @im, align 8
  %5679 = sub nsw i64 %5678, 1
  %5680 = load %struct.wrk3_struct** @wrk3, align 8
  %5681 = getelementptr inbounds %struct.wrk3_struct* %5680, i32 0, i32 1
  %5682 = getelementptr inbounds [258 x [258 x double]]* %5681, i32 0, i64 %5679
  %5683 = getelementptr inbounds [258 x double]* %5682, i32 0, i64 %5677
  store double %5675, double* %5683, align 8
  %5684 = load i64* @jm, align 8
  %5685 = sub nsw i64 %5684, 1
  %5686 = load i64* @im, align 8
  %5687 = sub nsw i64 %5686, 1
  %5688 = load %struct.wrk1_struct** @wrk1, align 8
  %5689 = getelementptr inbounds %struct.wrk1_struct* %5688, i32 0, i32 2
  %5690 = getelementptr inbounds [258 x [258 x double]]* %5689, i32 0, i64 %5687
  %5691 = getelementptr inbounds [258 x double]* %5690, i32 0, i64 %5685
  %5692 = load double* %5691, align 8
  %5693 = load double* %hh3, align 8
  %5694 = load i64* @jm, align 8
  %5695 = sub nsw i64 %5694, 1
  %5696 = load i64* @im, align 8
  %5697 = sub nsw i64 %5696, 1
  %5698 = load %struct.wrk1_struct** @wrk1, align 8
  %5699 = getelementptr inbounds %struct.wrk1_struct* %5698, i32 0, i32 1
  %5700 = getelementptr inbounds [258 x [258 x double]]* %5699, i32 0, i64 %5697
  %5701 = getelementptr inbounds [258 x double]* %5700, i32 0, i64 %5695
  %5702 = load double* %5701, align 8
  %5703 = fmul double %5693, %5702
  %5704 = fadd double %5692, %5703
  %5705 = load i64* @jm, align 8
  %5706 = sub nsw i64 %5705, 1
  %5707 = load i64* @im, align 8
  %5708 = sub nsw i64 %5707, 1
  %5709 = load %struct.wrk2_struct** @wrk2, align 8
  %5710 = getelementptr inbounds %struct.wrk2_struct* %5709, i32 0, i32 0
  %5711 = getelementptr inbounds [258 x [258 x double]]* %5710, i32 0, i64 %5708
  %5712 = getelementptr inbounds [258 x double]* %5711, i32 0, i64 %5706
  store double %5704, double* %5712, align 8
  br label %5713

; <label>:5713                                    ; preds = %5654, %5649
  %5714 = load i64* %2, align 8
  %5715 = icmp eq i64 %5714, 1
  br i1 %5715, label %5716, label %5767

; <label>:5716                                    ; preds = %5713
  %5717 = load i64* %5, align 8
  store i64 %5717, i64* %j, align 8
  br label %5718

; <label>:5718                                    ; preds = %5763, %5716
  %5719 = load i64* %j, align 8
  %5720 = load i64* %6, align 8
  %5721 = icmp sle i64 %5719, %5720
  br i1 %5721, label %5722, label %5766

; <label>:5722                                    ; preds = %5718
  %5723 = load i64* %j, align 8
  %5724 = load %struct.wrk1_struct** @wrk1, align 8
  %5725 = getelementptr inbounds %struct.wrk1_struct* %5724, i32 0, i32 2
  %5726 = getelementptr inbounds [258 x [258 x double]]* %5725, i32 0, i64 0
  %5727 = getelementptr inbounds [258 x double]* %5726, i32 0, i64 %5723
  %5728 = load double* %5727, align 8
  %5729 = load double* %hh3, align 8
  %5730 = load i64* %j, align 8
  %5731 = load %struct.wrk1_struct** @wrk1, align 8
  %5732 = getelementptr inbounds %struct.wrk1_struct* %5731, i32 0, i32 1
  %5733 = getelementptr inbounds [258 x [258 x double]]* %5732, i32 0, i64 0
  %5734 = getelementptr inbounds [258 x double]* %5733, i32 0, i64 %5730
  %5735 = load double* %5734, align 8
  %5736 = fmul double %5729, %5735
  %5737 = fadd double %5728, %5736
  %5738 = load i64* %j, align 8
  %5739 = load %struct.wrk2_struct** @wrk2, align 8
  %5740 = getelementptr inbounds %struct.wrk2_struct* %5739, i32 0, i32 0
  %5741 = getelementptr inbounds [258 x [258 x double]]* %5740, i32 0, i64 0
  %5742 = getelementptr inbounds [258 x double]* %5741, i32 0, i64 %5738
  store double %5737, double* %5742, align 8
  %5743 = load i64* %j, align 8
  %5744 = load %struct.wrk1_struct** @wrk1, align 8
  %5745 = getelementptr inbounds %struct.wrk1_struct* %5744, i32 0, i32 2
  %5746 = getelementptr inbounds [258 x [258 x double]]* %5745, i32 0, i64 0
  %5747 = getelementptr inbounds [258 x double]* %5746, i32 0, i64 %5743
  %5748 = load double* %5747, align 8
  %5749 = load double* %hh1, align 8
  %5750 = load i64* %j, align 8
  %5751 = load %struct.wrk1_struct** @wrk1, align 8
  %5752 = getelementptr inbounds %struct.wrk1_struct* %5751, i32 0, i32 1
  %5753 = getelementptr inbounds [258 x [258 x double]]* %5752, i32 0, i64 0
  %5754 = getelementptr inbounds [258 x double]* %5753, i32 0, i64 %5750
  %5755 = load double* %5754, align 8
  %5756 = fmul double %5749, %5755
  %5757 = fsub double %5748, %5756
  %5758 = load i64* %j, align 8
  %5759 = load %struct.wrk3_struct** @wrk3, align 8
  %5760 = getelementptr inbounds %struct.wrk3_struct* %5759, i32 0, i32 1
  %5761 = getelementptr inbounds [258 x [258 x double]]* %5760, i32 0, i64 0
  %5762 = getelementptr inbounds [258 x double]* %5761, i32 0, i64 %5758
  store double %5757, double* %5762, align 8
  br label %5763

; <label>:5763                                    ; preds = %5722
  %5764 = load i64* %j, align 8
  %5765 = add nsw i64 %5764, 1
  store i64 %5765, i64* %j, align 8
  br label %5718

; <label>:5766                                    ; preds = %5718
  br label %5767

; <label>:5767                                    ; preds = %5766, %5713
  %5768 = load i64* %2, align 8
  %5769 = load i64* %4, align 8
  %5770 = add nsw i64 %5768, %5769
  %5771 = load i64* @im, align 8
  %5772 = sub nsw i64 %5771, 1
  %5773 = icmp eq i64 %5770, %5772
  br i1 %5773, label %5774, label %5837

; <label>:5774                                    ; preds = %5767
  %5775 = load i64* %5, align 8
  store i64 %5775, i64* %j, align 8
  br label %5776

; <label>:5776                                    ; preds = %5833, %5774
  %5777 = load i64* %j, align 8
  %5778 = load i64* %6, align 8
  %5779 = icmp sle i64 %5777, %5778
  br i1 %5779, label %5780, label %5836

; <label>:5780                                    ; preds = %5776
  %5781 = load i64* %j, align 8
  %5782 = load i64* @im, align 8
  %5783 = sub nsw i64 %5782, 1
  %5784 = load %struct.wrk1_struct** @wrk1, align 8
  %5785 = getelementptr inbounds %struct.wrk1_struct* %5784, i32 0, i32 2
  %5786 = getelementptr inbounds [258 x [258 x double]]* %5785, i32 0, i64 %5783
  %5787 = getelementptr inbounds [258 x double]* %5786, i32 0, i64 %5781
  %5788 = load double* %5787, align 8
  %5789 = load double* %hh3, align 8
  %5790 = load i64* %j, align 8
  %5791 = load i64* @im, align 8
  %5792 = sub nsw i64 %5791, 1
  %5793 = load %struct.wrk1_struct** @wrk1, align 8
  %5794 = getelementptr inbounds %struct.wrk1_struct* %5793, i32 0, i32 1
  %5795 = getelementptr inbounds [258 x [258 x double]]* %5794, i32 0, i64 %5792
  %5796 = getelementptr inbounds [258 x double]* %5795, i32 0, i64 %5790
  %5797 = load double* %5796, align 8
  %5798 = fmul double %5789, %5797
  %5799 = fadd double %5788, %5798
  %5800 = load i64* %j, align 8
  %5801 = load i64* @im, align 8
  %5802 = sub nsw i64 %5801, 1
  %5803 = load %struct.wrk2_struct** @wrk2, align 8
  %5804 = getelementptr inbounds %struct.wrk2_struct* %5803, i32 0, i32 0
  %5805 = getelementptr inbounds [258 x [258 x double]]* %5804, i32 0, i64 %5802
  %5806 = getelementptr inbounds [258 x double]* %5805, i32 0, i64 %5800
  store double %5799, double* %5806, align 8
  %5807 = load i64* %j, align 8
  %5808 = load i64* @im, align 8
  %5809 = sub nsw i64 %5808, 1
  %5810 = load %struct.wrk1_struct** @wrk1, align 8
  %5811 = getelementptr inbounds %struct.wrk1_struct* %5810, i32 0, i32 2
  %5812 = getelementptr inbounds [258 x [258 x double]]* %5811, i32 0, i64 %5809
  %5813 = getelementptr inbounds [258 x double]* %5812, i32 0, i64 %5807
  %5814 = load double* %5813, align 8
  %5815 = load double* %hh1, align 8
  %5816 = load i64* %j, align 8
  %5817 = load i64* @im, align 8
  %5818 = sub nsw i64 %5817, 1
  %5819 = load %struct.wrk1_struct** @wrk1, align 8
  %5820 = getelementptr inbounds %struct.wrk1_struct* %5819, i32 0, i32 1
  %5821 = getelementptr inbounds [258 x [258 x double]]* %5820, i32 0, i64 %5818
  %5822 = getelementptr inbounds [258 x double]* %5821, i32 0, i64 %5816
  %5823 = load double* %5822, align 8
  %5824 = fmul double %5815, %5823
  %5825 = fsub double %5814, %5824
  %5826 = load i64* %j, align 8
  %5827 = load i64* @im, align 8
  %5828 = sub nsw i64 %5827, 1
  %5829 = load %struct.wrk3_struct** @wrk3, align 8
  %5830 = getelementptr inbounds %struct.wrk3_struct* %5829, i32 0, i32 1
  %5831 = getelementptr inbounds [258 x [258 x double]]* %5830, i32 0, i64 %5828
  %5832 = getelementptr inbounds [258 x double]* %5831, i32 0, i64 %5826
  store double %5825, double* %5832, align 8
  br label %5833

; <label>:5833                                    ; preds = %5780
  %5834 = load i64* %j, align 8
  %5835 = add nsw i64 %5834, 1
  store i64 %5835, i64* %j, align 8
  br label %5776

; <label>:5836                                    ; preds = %5776
  br label %5837

; <label>:5837                                    ; preds = %5836, %5767
  %5838 = load i64* %5, align 8
  %5839 = icmp eq i64 %5838, 1
  br i1 %5839, label %5840, label %5891

; <label>:5840                                    ; preds = %5837
  %5841 = load i64* %2, align 8
  store i64 %5841, i64* %j, align 8
  br label %5842

; <label>:5842                                    ; preds = %5887, %5840
  %5843 = load i64* %j, align 8
  %5844 = load i64* %3, align 8
  %5845 = icmp sle i64 %5843, %5844
  br i1 %5845, label %5846, label %5890

; <label>:5846                                    ; preds = %5842
  %5847 = load i64* %j, align 8
  %5848 = load %struct.wrk1_struct** @wrk1, align 8
  %5849 = getelementptr inbounds %struct.wrk1_struct* %5848, i32 0, i32 2
  %5850 = getelementptr inbounds [258 x [258 x double]]* %5849, i32 0, i64 %5847
  %5851 = getelementptr inbounds [258 x double]* %5850, i32 0, i64 0
  %5852 = load double* %5851, align 8
  %5853 = load double* %hh3, align 8
  %5854 = load i64* %j, align 8
  %5855 = load %struct.wrk1_struct** @wrk1, align 8
  %5856 = getelementptr inbounds %struct.wrk1_struct* %5855, i32 0, i32 1
  %5857 = getelementptr inbounds [258 x [258 x double]]* %5856, i32 0, i64 %5854
  %5858 = getelementptr inbounds [258 x double]* %5857, i32 0, i64 0
  %5859 = load double* %5858, align 8
  %5860 = fmul double %5853, %5859
  %5861 = fadd double %5852, %5860
  %5862 = load i64* %j, align 8
  %5863 = load %struct.wrk2_struct** @wrk2, align 8
  %5864 = getelementptr inbounds %struct.wrk2_struct* %5863, i32 0, i32 0
  %5865 = getelementptr inbounds [258 x [258 x double]]* %5864, i32 0, i64 %5862
  %5866 = getelementptr inbounds [258 x double]* %5865, i32 0, i64 0
  store double %5861, double* %5866, align 8
  %5867 = load i64* %j, align 8
  %5868 = load %struct.wrk1_struct** @wrk1, align 8
  %5869 = getelementptr inbounds %struct.wrk1_struct* %5868, i32 0, i32 2
  %5870 = getelementptr inbounds [258 x [258 x double]]* %5869, i32 0, i64 %5867
  %5871 = getelementptr inbounds [258 x double]* %5870, i32 0, i64 0
  %5872 = load double* %5871, align 8
  %5873 = load double* %hh1, align 8
  %5874 = load i64* %j, align 8
  %5875 = load %struct.wrk1_struct** @wrk1, align 8
  %5876 = getelementptr inbounds %struct.wrk1_struct* %5875, i32 0, i32 1
  %5877 = getelementptr inbounds [258 x [258 x double]]* %5876, i32 0, i64 %5874
  %5878 = getelementptr inbounds [258 x double]* %5877, i32 0, i64 0
  %5879 = load double* %5878, align 8
  %5880 = fmul double %5873, %5879
  %5881 = fsub double %5872, %5880
  %5882 = load i64* %j, align 8
  %5883 = load %struct.wrk3_struct** @wrk3, align 8
  %5884 = getelementptr inbounds %struct.wrk3_struct* %5883, i32 0, i32 1
  %5885 = getelementptr inbounds [258 x [258 x double]]* %5884, i32 0, i64 %5882
  %5886 = getelementptr inbounds [258 x double]* %5885, i32 0, i64 0
  store double %5881, double* %5886, align 8
  br label %5887

; <label>:5887                                    ; preds = %5846
  %5888 = load i64* %j, align 8
  %5889 = add nsw i64 %5888, 1
  store i64 %5889, i64* %j, align 8
  br label %5842

; <label>:5890                                    ; preds = %5842
  br label %5891

; <label>:5891                                    ; preds = %5890, %5837
  %5892 = load i64* %5, align 8
  %5893 = load i64* %7, align 8
  %5894 = add nsw i64 %5892, %5893
  %5895 = load i64* @jm, align 8
  %5896 = sub nsw i64 %5895, 1
  %5897 = icmp eq i64 %5894, %5896
  br i1 %5897, label %5898, label %5961

; <label>:5898                                    ; preds = %5891
  %5899 = load i64* %2, align 8
  store i64 %5899, i64* %j, align 8
  br label %5900

; <label>:5900                                    ; preds = %5957, %5898
  %5901 = load i64* %j, align 8
  %5902 = load i64* %3, align 8
  %5903 = icmp sle i64 %5901, %5902
  br i1 %5903, label %5904, label %5960

; <label>:5904                                    ; preds = %5900
  %5905 = load i64* @jm, align 8
  %5906 = sub nsw i64 %5905, 1
  %5907 = load i64* %j, align 8
  %5908 = load %struct.wrk1_struct** @wrk1, align 8
  %5909 = getelementptr inbounds %struct.wrk1_struct* %5908, i32 0, i32 2
  %5910 = getelementptr inbounds [258 x [258 x double]]* %5909, i32 0, i64 %5907
  %5911 = getelementptr inbounds [258 x double]* %5910, i32 0, i64 %5906
  %5912 = load double* %5911, align 8
  %5913 = load double* %hh3, align 8
  %5914 = load i64* @jm, align 8
  %5915 = sub nsw i64 %5914, 1
  %5916 = load i64* %j, align 8
  %5917 = load %struct.wrk1_struct** @wrk1, align 8
  %5918 = getelementptr inbounds %struct.wrk1_struct* %5917, i32 0, i32 1
  %5919 = getelementptr inbounds [258 x [258 x double]]* %5918, i32 0, i64 %5916
  %5920 = getelementptr inbounds [258 x double]* %5919, i32 0, i64 %5915
  %5921 = load double* %5920, align 8
  %5922 = fmul double %5913, %5921
  %5923 = fadd double %5912, %5922
  %5924 = load i64* @jm, align 8
  %5925 = sub nsw i64 %5924, 1
  %5926 = load i64* %j, align 8
  %5927 = load %struct.wrk2_struct** @wrk2, align 8
  %5928 = getelementptr inbounds %struct.wrk2_struct* %5927, i32 0, i32 0
  %5929 = getelementptr inbounds [258 x [258 x double]]* %5928, i32 0, i64 %5926
  %5930 = getelementptr inbounds [258 x double]* %5929, i32 0, i64 %5925
  store double %5923, double* %5930, align 8
  %5931 = load i64* @jm, align 8
  %5932 = sub nsw i64 %5931, 1
  %5933 = load i64* %j, align 8
  %5934 = load %struct.wrk1_struct** @wrk1, align 8
  %5935 = getelementptr inbounds %struct.wrk1_struct* %5934, i32 0, i32 2
  %5936 = getelementptr inbounds [258 x [258 x double]]* %5935, i32 0, i64 %5933
  %5937 = getelementptr inbounds [258 x double]* %5936, i32 0, i64 %5932
  %5938 = load double* %5937, align 8
  %5939 = load double* %hh1, align 8
  %5940 = load i64* @jm, align 8
  %5941 = sub nsw i64 %5940, 1
  %5942 = load i64* %j, align 8
  %5943 = load %struct.wrk1_struct** @wrk1, align 8
  %5944 = getelementptr inbounds %struct.wrk1_struct* %5943, i32 0, i32 1
  %5945 = getelementptr inbounds [258 x [258 x double]]* %5944, i32 0, i64 %5942
  %5946 = getelementptr inbounds [258 x double]* %5945, i32 0, i64 %5941
  %5947 = load double* %5946, align 8
  %5948 = fmul double %5939, %5947
  %5949 = fsub double %5938, %5948
  %5950 = load i64* @jm, align 8
  %5951 = sub nsw i64 %5950, 1
  %5952 = load i64* %j, align 8
  %5953 = load %struct.wrk3_struct** @wrk3, align 8
  %5954 = getelementptr inbounds %struct.wrk3_struct* %5953, i32 0, i32 1
  %5955 = getelementptr inbounds [258 x [258 x double]]* %5954, i32 0, i64 %5952
  %5956 = getelementptr inbounds [258 x double]* %5955, i32 0, i64 %5951
  store double %5949, double* %5956, align 8
  br label %5957

; <label>:5957                                    ; preds = %5904
  %5958 = load i64* %j, align 8
  %5959 = add nsw i64 %5958, 1
  store i64 %5959, i64* %j, align 8
  br label %5900

; <label>:5960                                    ; preds = %5900
  br label %5961

; <label>:5961                                    ; preds = %5960, %5891
  %5962 = load i64* %2, align 8
  store i64 %5962, i64* %i, align 8
  br label %5963

; <label>:5963                                    ; preds = %6024, %5961
  %5964 = load i64* %i, align 8
  %5965 = load i64* %3, align 8
  %5966 = icmp sle i64 %5964, %5965
  br i1 %5966, label %5967, label %6027

; <label>:5967                                    ; preds = %5963
  %5968 = load i64* %5, align 8
  store i64 %5968, i64* %iindex, align 8
  br label %5969

; <label>:5969                                    ; preds = %6020, %5967
  %5970 = load i64* %iindex, align 8
  %5971 = load i64* %6, align 8
  %5972 = icmp sle i64 %5970, %5971
  br i1 %5972, label %5973, label %6023

; <label>:5973                                    ; preds = %5969
  %5974 = load i64* %iindex, align 8
  %5975 = load i64* %i, align 8
  %5976 = load %struct.wrk1_struct** @wrk1, align 8
  %5977 = getelementptr inbounds %struct.wrk1_struct* %5976, i32 0, i32 2
  %5978 = getelementptr inbounds [258 x [258 x double]]* %5977, i32 0, i64 %5975
  %5979 = getelementptr inbounds [258 x double]* %5978, i32 0, i64 %5974
  %5980 = load double* %5979, align 8
  %5981 = load double* %hh3, align 8
  %5982 = load i64* %iindex, align 8
  %5983 = load i64* %i, align 8
  %5984 = load %struct.wrk1_struct** @wrk1, align 8
  %5985 = getelementptr inbounds %struct.wrk1_struct* %5984, i32 0, i32 1
  %5986 = getelementptr inbounds [258 x [258 x double]]* %5985, i32 0, i64 %5983
  %5987 = getelementptr inbounds [258 x double]* %5986, i32 0, i64 %5982
  %5988 = load double* %5987, align 8
  %5989 = fmul double %5981, %5988
  %5990 = fadd double %5980, %5989
  %5991 = load i64* %iindex, align 8
  %5992 = load i64* %i, align 8
  %5993 = load %struct.wrk2_struct** @wrk2, align 8
  %5994 = getelementptr inbounds %struct.wrk2_struct* %5993, i32 0, i32 0
  %5995 = getelementptr inbounds [258 x [258 x double]]* %5994, i32 0, i64 %5992
  %5996 = getelementptr inbounds [258 x double]* %5995, i32 0, i64 %5991
  store double %5990, double* %5996, align 8
  %5997 = load i64* %iindex, align 8
  %5998 = load i64* %i, align 8
  %5999 = load %struct.wrk1_struct** @wrk1, align 8
  %6000 = getelementptr inbounds %struct.wrk1_struct* %5999, i32 0, i32 2
  %6001 = getelementptr inbounds [258 x [258 x double]]* %6000, i32 0, i64 %5998
  %6002 = getelementptr inbounds [258 x double]* %6001, i32 0, i64 %5997
  %6003 = load double* %6002, align 8
  %6004 = load double* %hh1, align 8
  %6005 = load i64* %iindex, align 8
  %6006 = load i64* %i, align 8
  %6007 = load %struct.wrk1_struct** @wrk1, align 8
  %6008 = getelementptr inbounds %struct.wrk1_struct* %6007, i32 0, i32 1
  %6009 = getelementptr inbounds [258 x [258 x double]]* %6008, i32 0, i64 %6006
  %6010 = getelementptr inbounds [258 x double]* %6009, i32 0, i64 %6005
  %6011 = load double* %6010, align 8
  %6012 = fmul double %6004, %6011
  %6013 = fsub double %6003, %6012
  %6014 = load i64* %iindex, align 8
  %6015 = load i64* %i, align 8
  %6016 = load %struct.wrk3_struct** @wrk3, align 8
  %6017 = getelementptr inbounds %struct.wrk3_struct* %6016, i32 0, i32 1
  %6018 = getelementptr inbounds [258 x [258 x double]]* %6017, i32 0, i64 %6015
  %6019 = getelementptr inbounds [258 x double]* %6018, i32 0, i64 %6014
  store double %6013, double* %6019, align 8
  br label %6020

; <label>:6020                                    ; preds = %5973
  %6021 = load i64* %iindex, align 8
  %6022 = add nsw i64 %6021, 1
  store i64 %6022, i64* %iindex, align 8
  br label %5969

; <label>:6023                                    ; preds = %5969
  br label %6024

; <label>:6024                                    ; preds = %6023
  %6025 = load i64* %i, align 8
  %6026 = add nsw i64 %6025, 1
  store i64 %6026, i64* %i, align 8
  br label %5963

; <label>:6027                                    ; preds = %5963
  %6028 = load %struct.bars_struct** @bars, align 8
  %6029 = getelementptr inbounds %struct.bars_struct* %6028, i32 0, i32 0
  %6030 = getelementptr inbounds %struct.anon* %6029, i32 0, i32 0
  %6031 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %6030) #6
  %6032 = sext i32 %6031 to i64
  store i64 %6032, i64* %Error36, align 8
  %6033 = load i64* %Error36, align 8
  %6034 = icmp ne i64 %6033, 0
  br i1 %6034, label %6035, label %6037

; <label>:6035                                    ; preds = %6027
  %6036 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str41, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:6037                                    ; preds = %6027
  %6038 = load %struct.bars_struct** @bars, align 8
  %6039 = getelementptr inbounds %struct.bars_struct* %6038, i32 0, i32 0
  %6040 = getelementptr inbounds %struct.anon* %6039, i32 0, i32 3
  %6041 = load i64* %6040, align 8
  store i64 %6041, i64* %Cycle37, align 8
  %6042 = load %struct.bars_struct** @bars, align 8
  %6043 = getelementptr inbounds %struct.bars_struct* %6042, i32 0, i32 0
  %6044 = getelementptr inbounds %struct.anon* %6043, i32 0, i32 2
  %6045 = load i64* %6044, align 8
  %6046 = add i64 %6045, 1
  store i64 %6046, i64* %6044, align 8
  %6047 = load i64* @nprocs, align 8
  %6048 = icmp ne i64 %6046, %6047
  br i1 %6048, label %6049, label %6077

; <label>:6049                                    ; preds = %6037
  %6050 = bitcast i64* %Cancel38 to i32*
  %6051 = call i32 @pthread_setcancelstate(i32 1, i32* %6050)
  br label %6052

; <label>:6052                                    ; preds = %6071, %6049
  %6053 = load i64* %Cycle37, align 8
  %6054 = load %struct.bars_struct** @bars, align 8
  %6055 = getelementptr inbounds %struct.bars_struct* %6054, i32 0, i32 0
  %6056 = getelementptr inbounds %struct.anon* %6055, i32 0, i32 3
  %6057 = load i64* %6056, align 8
  %6058 = icmp eq i64 %6053, %6057
  br i1 %6058, label %6059, label %6072

; <label>:6059                                    ; preds = %6052
  %6060 = load %struct.bars_struct** @bars, align 8
  %6061 = getelementptr inbounds %struct.bars_struct* %6060, i32 0, i32 0
  %6062 = getelementptr inbounds %struct.anon* %6061, i32 0, i32 1
  %6063 = load %struct.bars_struct** @bars, align 8
  %6064 = getelementptr inbounds %struct.bars_struct* %6063, i32 0, i32 0
  %6065 = getelementptr inbounds %struct.anon* %6064, i32 0, i32 0
  %6066 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %6062, %union.pthread_mutex_t* %6065)
  %6067 = sext i32 %6066 to i64
  store i64 %6067, i64* %Error36, align 8
  %6068 = load i64* %Error36, align 8
  %6069 = icmp ne i64 %6068, 0
  br i1 %6069, label %6070, label %6071

; <label>:6070                                    ; preds = %6059
  br label %6072

; <label>:6071                                    ; preds = %6059
  br label %6052

; <label>:6072                                    ; preds = %6070, %6052
  %6073 = load i64* %Cancel38, align 8
  %6074 = trunc i64 %6073 to i32
  %6075 = bitcast i64* %Temp39 to i32*
  %6076 = call i32 @pthread_setcancelstate(i32 %6074, i32* %6075)
  br label %6097

; <label>:6077                                    ; preds = %6037
  %6078 = load %struct.bars_struct** @bars, align 8
  %6079 = getelementptr inbounds %struct.bars_struct* %6078, i32 0, i32 0
  %6080 = getelementptr inbounds %struct.anon* %6079, i32 0, i32 3
  %6081 = load i64* %6080, align 8
  %6082 = icmp ne i64 %6081, 0
  %6083 = xor i1 %6082, true
  %6084 = zext i1 %6083 to i32
  %6085 = sext i32 %6084 to i64
  %6086 = load %struct.bars_struct** @bars, align 8
  %6087 = getelementptr inbounds %struct.bars_struct* %6086, i32 0, i32 0
  %6088 = getelementptr inbounds %struct.anon* %6087, i32 0, i32 3
  store i64 %6085, i64* %6088, align 8
  %6089 = load %struct.bars_struct** @bars, align 8
  %6090 = getelementptr inbounds %struct.bars_struct* %6089, i32 0, i32 0
  %6091 = getelementptr inbounds %struct.anon* %6090, i32 0, i32 2
  store i64 0, i64* %6091, align 8
  %6092 = load %struct.bars_struct** @bars, align 8
  %6093 = getelementptr inbounds %struct.bars_struct* %6092, i32 0, i32 0
  %6094 = getelementptr inbounds %struct.anon* %6093, i32 0, i32 1
  %6095 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %6094) #6
  %6096 = sext i32 %6095 to i64
  store i64 %6096, i64* %Error36, align 8
  br label %6097

; <label>:6097                                    ; preds = %6077, %6072
  %6098 = load %struct.bars_struct** @bars, align 8
  %6099 = getelementptr inbounds %struct.bars_struct* %6098, i32 0, i32 0
  %6100 = getelementptr inbounds %struct.anon* %6099, i32 0, i32 0
  %6101 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %6100) #6
  %6102 = load double* @dtau, align 8
  %6103 = fmul double 2.000000e+00, %6102
  store double %6103, double* %timst, align 8
  %6104 = load i64* %1, align 8
  %6105 = icmp eq i64 %6104, 0
  br i1 %6105, label %6106, label %6126

; <label>:6106                                    ; preds = %6097
  %6107 = load %struct.fields_struct** @fields, align 8
  %6108 = getelementptr inbounds %struct.fields_struct* %6107, i32 0, i32 0
  %6109 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6108, i32 0, i64 0
  %6110 = getelementptr inbounds [258 x [258 x double]]* %6109, i32 0, i64 0
  %6111 = getelementptr inbounds [258 x double]* %6110, i32 0, i64 0
  %6112 = load double* %6111, align 8
  %6113 = load double* %timst, align 8
  %6114 = load %struct.wrk2_struct** @wrk2, align 8
  %6115 = getelementptr inbounds %struct.wrk2_struct* %6114, i32 0, i32 0
  %6116 = getelementptr inbounds [258 x [258 x double]]* %6115, i32 0, i64 0
  %6117 = getelementptr inbounds [258 x double]* %6116, i32 0, i64 0
  %6118 = load double* %6117, align 8
  %6119 = fmul double %6113, %6118
  %6120 = fadd double %6112, %6119
  %6121 = load %struct.fields_struct** @fields, align 8
  %6122 = getelementptr inbounds %struct.fields_struct* %6121, i32 0, i32 0
  %6123 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6122, i32 0, i64 0
  %6124 = getelementptr inbounds [258 x [258 x double]]* %6123, i32 0, i64 0
  %6125 = getelementptr inbounds [258 x double]* %6124, i32 0, i64 0
  store double %6120, double* %6125, align 8
  br label %6126

; <label>:6126                                    ; preds = %6106, %6097
  %6127 = load i64* %1, align 8
  %6128 = load i64* @nprocs, align 8
  %6129 = load i64* @xprocs, align 8
  %6130 = sub nsw i64 %6128, %6129
  %6131 = icmp eq i64 %6127, %6130
  br i1 %6131, label %6132, label %6158

; <label>:6132                                    ; preds = %6126
  %6133 = load i64* @im, align 8
  %6134 = sub nsw i64 %6133, 1
  %6135 = load %struct.fields_struct** @fields, align 8
  %6136 = getelementptr inbounds %struct.fields_struct* %6135, i32 0, i32 0
  %6137 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6136, i32 0, i64 0
  %6138 = getelementptr inbounds [258 x [258 x double]]* %6137, i32 0, i64 %6134
  %6139 = getelementptr inbounds [258 x double]* %6138, i32 0, i64 0
  %6140 = load double* %6139, align 8
  %6141 = load double* %timst, align 8
  %6142 = load i64* @im, align 8
  %6143 = sub nsw i64 %6142, 1
  %6144 = load %struct.wrk2_struct** @wrk2, align 8
  %6145 = getelementptr inbounds %struct.wrk2_struct* %6144, i32 0, i32 0
  %6146 = getelementptr inbounds [258 x [258 x double]]* %6145, i32 0, i64 %6143
  %6147 = getelementptr inbounds [258 x double]* %6146, i32 0, i64 0
  %6148 = load double* %6147, align 8
  %6149 = fmul double %6141, %6148
  %6150 = fadd double %6140, %6149
  %6151 = load i64* @im, align 8
  %6152 = sub nsw i64 %6151, 1
  %6153 = load %struct.fields_struct** @fields, align 8
  %6154 = getelementptr inbounds %struct.fields_struct* %6153, i32 0, i32 0
  %6155 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6154, i32 0, i64 0
  %6156 = getelementptr inbounds [258 x [258 x double]]* %6155, i32 0, i64 %6152
  %6157 = getelementptr inbounds [258 x double]* %6156, i32 0, i64 0
  store double %6150, double* %6157, align 8
  br label %6158

; <label>:6158                                    ; preds = %6132, %6126
  %6159 = load i64* %1, align 8
  %6160 = load i64* @xprocs, align 8
  %6161 = sub nsw i64 %6160, 1
  %6162 = icmp eq i64 %6159, %6161
  br i1 %6162, label %6163, label %6189

; <label>:6163                                    ; preds = %6158
  %6164 = load i64* @jm, align 8
  %6165 = sub nsw i64 %6164, 1
  %6166 = load %struct.fields_struct** @fields, align 8
  %6167 = getelementptr inbounds %struct.fields_struct* %6166, i32 0, i32 0
  %6168 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6167, i32 0, i64 0
  %6169 = getelementptr inbounds [258 x [258 x double]]* %6168, i32 0, i64 0
  %6170 = getelementptr inbounds [258 x double]* %6169, i32 0, i64 %6165
  %6171 = load double* %6170, align 8
  %6172 = load double* %timst, align 8
  %6173 = load i64* @jm, align 8
  %6174 = sub nsw i64 %6173, 1
  %6175 = load %struct.wrk2_struct** @wrk2, align 8
  %6176 = getelementptr inbounds %struct.wrk2_struct* %6175, i32 0, i32 0
  %6177 = getelementptr inbounds [258 x [258 x double]]* %6176, i32 0, i64 0
  %6178 = getelementptr inbounds [258 x double]* %6177, i32 0, i64 %6174
  %6179 = load double* %6178, align 8
  %6180 = fmul double %6172, %6179
  %6181 = fadd double %6171, %6180
  %6182 = load i64* @jm, align 8
  %6183 = sub nsw i64 %6182, 1
  %6184 = load %struct.fields_struct** @fields, align 8
  %6185 = getelementptr inbounds %struct.fields_struct* %6184, i32 0, i32 0
  %6186 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6185, i32 0, i64 0
  %6187 = getelementptr inbounds [258 x [258 x double]]* %6186, i32 0, i64 0
  %6188 = getelementptr inbounds [258 x double]* %6187, i32 0, i64 %6183
  store double %6181, double* %6188, align 8
  br label %6189

; <label>:6189                                    ; preds = %6163, %6158
  %6190 = load i64* %1, align 8
  %6191 = load i64* @nprocs, align 8
  %6192 = sub nsw i64 %6191, 1
  %6193 = icmp eq i64 %6190, %6192
  br i1 %6193, label %6194, label %6226

; <label>:6194                                    ; preds = %6189
  %6195 = load i64* @jm, align 8
  %6196 = sub nsw i64 %6195, 1
  %6197 = load i64* @im, align 8
  %6198 = sub nsw i64 %6197, 1
  %6199 = load %struct.fields_struct** @fields, align 8
  %6200 = getelementptr inbounds %struct.fields_struct* %6199, i32 0, i32 0
  %6201 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6200, i32 0, i64 0
  %6202 = getelementptr inbounds [258 x [258 x double]]* %6201, i32 0, i64 %6198
  %6203 = getelementptr inbounds [258 x double]* %6202, i32 0, i64 %6196
  %6204 = load double* %6203, align 8
  %6205 = load double* %timst, align 8
  %6206 = load i64* @jm, align 8
  %6207 = sub nsw i64 %6206, 1
  %6208 = load i64* @im, align 8
  %6209 = sub nsw i64 %6208, 1
  %6210 = load %struct.wrk2_struct** @wrk2, align 8
  %6211 = getelementptr inbounds %struct.wrk2_struct* %6210, i32 0, i32 0
  %6212 = getelementptr inbounds [258 x [258 x double]]* %6211, i32 0, i64 %6209
  %6213 = getelementptr inbounds [258 x double]* %6212, i32 0, i64 %6207
  %6214 = load double* %6213, align 8
  %6215 = fmul double %6205, %6214
  %6216 = fadd double %6204, %6215
  %6217 = load i64* @jm, align 8
  %6218 = sub nsw i64 %6217, 1
  %6219 = load i64* @im, align 8
  %6220 = sub nsw i64 %6219, 1
  %6221 = load %struct.fields_struct** @fields, align 8
  %6222 = getelementptr inbounds %struct.fields_struct* %6221, i32 0, i32 0
  %6223 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6222, i32 0, i64 0
  %6224 = getelementptr inbounds [258 x [258 x double]]* %6223, i32 0, i64 %6220
  %6225 = getelementptr inbounds [258 x double]* %6224, i32 0, i64 %6218
  store double %6216, double* %6225, align 8
  br label %6226

; <label>:6226                                    ; preds = %6194, %6189
  %6227 = load i64* %2, align 8
  %6228 = icmp eq i64 %6227, 1
  br i1 %6228, label %6229, label %6262

; <label>:6229                                    ; preds = %6226
  %6230 = load i64* %5, align 8
  store i64 %6230, i64* %j, align 8
  br label %6231

; <label>:6231                                    ; preds = %6258, %6229
  %6232 = load i64* %j, align 8
  %6233 = load i64* %6, align 8
  %6234 = icmp sle i64 %6232, %6233
  br i1 %6234, label %6235, label %6261

; <label>:6235                                    ; preds = %6231
  %6236 = load i64* %j, align 8
  %6237 = load %struct.fields_struct** @fields, align 8
  %6238 = getelementptr inbounds %struct.fields_struct* %6237, i32 0, i32 0
  %6239 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6238, i32 0, i64 0
  %6240 = getelementptr inbounds [258 x [258 x double]]* %6239, i32 0, i64 0
  %6241 = getelementptr inbounds [258 x double]* %6240, i32 0, i64 %6236
  %6242 = load double* %6241, align 8
  %6243 = load double* %timst, align 8
  %6244 = load i64* %j, align 8
  %6245 = load %struct.wrk2_struct** @wrk2, align 8
  %6246 = getelementptr inbounds %struct.wrk2_struct* %6245, i32 0, i32 0
  %6247 = getelementptr inbounds [258 x [258 x double]]* %6246, i32 0, i64 0
  %6248 = getelementptr inbounds [258 x double]* %6247, i32 0, i64 %6244
  %6249 = load double* %6248, align 8
  %6250 = fmul double %6243, %6249
  %6251 = fadd double %6242, %6250
  %6252 = load i64* %j, align 8
  %6253 = load %struct.fields_struct** @fields, align 8
  %6254 = getelementptr inbounds %struct.fields_struct* %6253, i32 0, i32 0
  %6255 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6254, i32 0, i64 0
  %6256 = getelementptr inbounds [258 x [258 x double]]* %6255, i32 0, i64 0
  %6257 = getelementptr inbounds [258 x double]* %6256, i32 0, i64 %6252
  store double %6251, double* %6257, align 8
  br label %6258

; <label>:6258                                    ; preds = %6235
  %6259 = load i64* %j, align 8
  %6260 = add nsw i64 %6259, 1
  store i64 %6260, i64* %j, align 8
  br label %6231

; <label>:6261                                    ; preds = %6231
  br label %6262

; <label>:6262                                    ; preds = %6261, %6226
  %6263 = load i64* %2, align 8
  %6264 = load i64* %4, align 8
  %6265 = add nsw i64 %6263, %6264
  %6266 = load i64* @im, align 8
  %6267 = sub nsw i64 %6266, 1
  %6268 = icmp eq i64 %6265, %6267
  br i1 %6268, label %6269, label %6308

; <label>:6269                                    ; preds = %6262
  %6270 = load i64* %5, align 8
  store i64 %6270, i64* %j, align 8
  br label %6271

; <label>:6271                                    ; preds = %6304, %6269
  %6272 = load i64* %j, align 8
  %6273 = load i64* %6, align 8
  %6274 = icmp sle i64 %6272, %6273
  br i1 %6274, label %6275, label %6307

; <label>:6275                                    ; preds = %6271
  %6276 = load i64* %j, align 8
  %6277 = load i64* @im, align 8
  %6278 = sub nsw i64 %6277, 1
  %6279 = load %struct.fields_struct** @fields, align 8
  %6280 = getelementptr inbounds %struct.fields_struct* %6279, i32 0, i32 0
  %6281 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6280, i32 0, i64 0
  %6282 = getelementptr inbounds [258 x [258 x double]]* %6281, i32 0, i64 %6278
  %6283 = getelementptr inbounds [258 x double]* %6282, i32 0, i64 %6276
  %6284 = load double* %6283, align 8
  %6285 = load double* %timst, align 8
  %6286 = load i64* %j, align 8
  %6287 = load i64* @im, align 8
  %6288 = sub nsw i64 %6287, 1
  %6289 = load %struct.wrk2_struct** @wrk2, align 8
  %6290 = getelementptr inbounds %struct.wrk2_struct* %6289, i32 0, i32 0
  %6291 = getelementptr inbounds [258 x [258 x double]]* %6290, i32 0, i64 %6288
  %6292 = getelementptr inbounds [258 x double]* %6291, i32 0, i64 %6286
  %6293 = load double* %6292, align 8
  %6294 = fmul double %6285, %6293
  %6295 = fadd double %6284, %6294
  %6296 = load i64* %j, align 8
  %6297 = load i64* @im, align 8
  %6298 = sub nsw i64 %6297, 1
  %6299 = load %struct.fields_struct** @fields, align 8
  %6300 = getelementptr inbounds %struct.fields_struct* %6299, i32 0, i32 0
  %6301 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6300, i32 0, i64 0
  %6302 = getelementptr inbounds [258 x [258 x double]]* %6301, i32 0, i64 %6298
  %6303 = getelementptr inbounds [258 x double]* %6302, i32 0, i64 %6296
  store double %6295, double* %6303, align 8
  br label %6304

; <label>:6304                                    ; preds = %6275
  %6305 = load i64* %j, align 8
  %6306 = add nsw i64 %6305, 1
  store i64 %6306, i64* %j, align 8
  br label %6271

; <label>:6307                                    ; preds = %6271
  br label %6308

; <label>:6308                                    ; preds = %6307, %6262
  %6309 = load i64* %5, align 8
  %6310 = icmp eq i64 %6309, 1
  br i1 %6310, label %6311, label %6344

; <label>:6311                                    ; preds = %6308
  %6312 = load i64* %2, align 8
  store i64 %6312, i64* %j, align 8
  br label %6313

; <label>:6313                                    ; preds = %6340, %6311
  %6314 = load i64* %j, align 8
  %6315 = load i64* %3, align 8
  %6316 = icmp sle i64 %6314, %6315
  br i1 %6316, label %6317, label %6343

; <label>:6317                                    ; preds = %6313
  %6318 = load i64* %j, align 8
  %6319 = load %struct.fields_struct** @fields, align 8
  %6320 = getelementptr inbounds %struct.fields_struct* %6319, i32 0, i32 0
  %6321 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6320, i32 0, i64 0
  %6322 = getelementptr inbounds [258 x [258 x double]]* %6321, i32 0, i64 %6318
  %6323 = getelementptr inbounds [258 x double]* %6322, i32 0, i64 0
  %6324 = load double* %6323, align 8
  %6325 = load double* %timst, align 8
  %6326 = load i64* %j, align 8
  %6327 = load %struct.wrk2_struct** @wrk2, align 8
  %6328 = getelementptr inbounds %struct.wrk2_struct* %6327, i32 0, i32 0
  %6329 = getelementptr inbounds [258 x [258 x double]]* %6328, i32 0, i64 %6326
  %6330 = getelementptr inbounds [258 x double]* %6329, i32 0, i64 0
  %6331 = load double* %6330, align 8
  %6332 = fmul double %6325, %6331
  %6333 = fadd double %6324, %6332
  %6334 = load i64* %j, align 8
  %6335 = load %struct.fields_struct** @fields, align 8
  %6336 = getelementptr inbounds %struct.fields_struct* %6335, i32 0, i32 0
  %6337 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6336, i32 0, i64 0
  %6338 = getelementptr inbounds [258 x [258 x double]]* %6337, i32 0, i64 %6334
  %6339 = getelementptr inbounds [258 x double]* %6338, i32 0, i64 0
  store double %6333, double* %6339, align 8
  br label %6340

; <label>:6340                                    ; preds = %6317
  %6341 = load i64* %j, align 8
  %6342 = add nsw i64 %6341, 1
  store i64 %6342, i64* %j, align 8
  br label %6313

; <label>:6343                                    ; preds = %6313
  br label %6344

; <label>:6344                                    ; preds = %6343, %6308
  %6345 = load i64* %5, align 8
  %6346 = load i64* %7, align 8
  %6347 = add nsw i64 %6345, %6346
  %6348 = load i64* @jm, align 8
  %6349 = sub nsw i64 %6348, 1
  %6350 = icmp eq i64 %6347, %6349
  br i1 %6350, label %6351, label %6390

; <label>:6351                                    ; preds = %6344
  %6352 = load i64* %2, align 8
  store i64 %6352, i64* %j, align 8
  br label %6353

; <label>:6353                                    ; preds = %6386, %6351
  %6354 = load i64* %j, align 8
  %6355 = load i64* %3, align 8
  %6356 = icmp sle i64 %6354, %6355
  br i1 %6356, label %6357, label %6389

; <label>:6357                                    ; preds = %6353
  %6358 = load i64* @jm, align 8
  %6359 = sub nsw i64 %6358, 1
  %6360 = load i64* %j, align 8
  %6361 = load %struct.fields_struct** @fields, align 8
  %6362 = getelementptr inbounds %struct.fields_struct* %6361, i32 0, i32 0
  %6363 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6362, i32 0, i64 0
  %6364 = getelementptr inbounds [258 x [258 x double]]* %6363, i32 0, i64 %6360
  %6365 = getelementptr inbounds [258 x double]* %6364, i32 0, i64 %6359
  %6366 = load double* %6365, align 8
  %6367 = load double* %timst, align 8
  %6368 = load i64* @jm, align 8
  %6369 = sub nsw i64 %6368, 1
  %6370 = load i64* %j, align 8
  %6371 = load %struct.wrk2_struct** @wrk2, align 8
  %6372 = getelementptr inbounds %struct.wrk2_struct* %6371, i32 0, i32 0
  %6373 = getelementptr inbounds [258 x [258 x double]]* %6372, i32 0, i64 %6370
  %6374 = getelementptr inbounds [258 x double]* %6373, i32 0, i64 %6369
  %6375 = load double* %6374, align 8
  %6376 = fmul double %6367, %6375
  %6377 = fadd double %6366, %6376
  %6378 = load i64* @jm, align 8
  %6379 = sub nsw i64 %6378, 1
  %6380 = load i64* %j, align 8
  %6381 = load %struct.fields_struct** @fields, align 8
  %6382 = getelementptr inbounds %struct.fields_struct* %6381, i32 0, i32 0
  %6383 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6382, i32 0, i64 0
  %6384 = getelementptr inbounds [258 x [258 x double]]* %6383, i32 0, i64 %6380
  %6385 = getelementptr inbounds [258 x double]* %6384, i32 0, i64 %6379
  store double %6377, double* %6385, align 8
  br label %6386

; <label>:6386                                    ; preds = %6357
  %6387 = load i64* %j, align 8
  %6388 = add nsw i64 %6387, 1
  store i64 %6388, i64* %j, align 8
  br label %6353

; <label>:6389                                    ; preds = %6353
  br label %6390

; <label>:6390                                    ; preds = %6389, %6344
  %6391 = load i64* %2, align 8
  store i64 %6391, i64* %i, align 8
  br label %6392

; <label>:6392                                    ; preds = %6432, %6390
  %6393 = load i64* %i, align 8
  %6394 = load i64* %3, align 8
  %6395 = icmp sle i64 %6393, %6394
  br i1 %6395, label %6396, label %6435

; <label>:6396                                    ; preds = %6392
  %6397 = load i64* %5, align 8
  store i64 %6397, i64* %iindex, align 8
  br label %6398

; <label>:6398                                    ; preds = %6428, %6396
  %6399 = load i64* %iindex, align 8
  %6400 = load i64* %6, align 8
  %6401 = icmp sle i64 %6399, %6400
  br i1 %6401, label %6402, label %6431

; <label>:6402                                    ; preds = %6398
  %6403 = load i64* %iindex, align 8
  %6404 = load i64* %i, align 8
  %6405 = load %struct.fields_struct** @fields, align 8
  %6406 = getelementptr inbounds %struct.fields_struct* %6405, i32 0, i32 0
  %6407 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6406, i32 0, i64 0
  %6408 = getelementptr inbounds [258 x [258 x double]]* %6407, i32 0, i64 %6404
  %6409 = getelementptr inbounds [258 x double]* %6408, i32 0, i64 %6403
  %6410 = load double* %6409, align 8
  %6411 = load double* %timst, align 8
  %6412 = load i64* %iindex, align 8
  %6413 = load i64* %i, align 8
  %6414 = load %struct.wrk2_struct** @wrk2, align 8
  %6415 = getelementptr inbounds %struct.wrk2_struct* %6414, i32 0, i32 0
  %6416 = getelementptr inbounds [258 x [258 x double]]* %6415, i32 0, i64 %6413
  %6417 = getelementptr inbounds [258 x double]* %6416, i32 0, i64 %6412
  %6418 = load double* %6417, align 8
  %6419 = fmul double %6411, %6418
  %6420 = fadd double %6410, %6419
  %6421 = load i64* %iindex, align 8
  %6422 = load i64* %i, align 8
  %6423 = load %struct.fields_struct** @fields, align 8
  %6424 = getelementptr inbounds %struct.fields_struct* %6423, i32 0, i32 0
  %6425 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6424, i32 0, i64 0
  %6426 = getelementptr inbounds [258 x [258 x double]]* %6425, i32 0, i64 %6422
  %6427 = getelementptr inbounds [258 x double]* %6426, i32 0, i64 %6421
  store double %6420, double* %6427, align 8
  br label %6428

; <label>:6428                                    ; preds = %6402
  %6429 = load i64* %iindex, align 8
  %6430 = add nsw i64 %6429, 1
  store i64 %6430, i64* %iindex, align 8
  br label %6398

; <label>:6431                                    ; preds = %6398
  br label %6432

; <label>:6432                                    ; preds = %6431
  %6433 = load i64* %i, align 8
  %6434 = add nsw i64 %6433, 1
  store i64 %6434, i64* %i, align 8
  br label %6392

; <label>:6435                                    ; preds = %6392
  %6436 = load i64* %1, align 8
  %6437 = icmp eq i64 %6436, 0
  br i1 %6437, label %6438, label %6458

; <label>:6438                                    ; preds = %6435
  %6439 = load %struct.fields_struct** @fields, align 8
  %6440 = getelementptr inbounds %struct.fields_struct* %6439, i32 0, i32 0
  %6441 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6440, i32 0, i64 1
  %6442 = getelementptr inbounds [258 x [258 x double]]* %6441, i32 0, i64 0
  %6443 = getelementptr inbounds [258 x double]* %6442, i32 0, i64 0
  %6444 = load double* %6443, align 8
  %6445 = load double* %timst, align 8
  %6446 = load %struct.wrk3_struct** @wrk3, align 8
  %6447 = getelementptr inbounds %struct.wrk3_struct* %6446, i32 0, i32 1
  %6448 = getelementptr inbounds [258 x [258 x double]]* %6447, i32 0, i64 0
  %6449 = getelementptr inbounds [258 x double]* %6448, i32 0, i64 0
  %6450 = load double* %6449, align 8
  %6451 = fmul double %6445, %6450
  %6452 = fadd double %6444, %6451
  %6453 = load %struct.fields_struct** @fields, align 8
  %6454 = getelementptr inbounds %struct.fields_struct* %6453, i32 0, i32 0
  %6455 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6454, i32 0, i64 1
  %6456 = getelementptr inbounds [258 x [258 x double]]* %6455, i32 0, i64 0
  %6457 = getelementptr inbounds [258 x double]* %6456, i32 0, i64 0
  store double %6452, double* %6457, align 8
  br label %6458

; <label>:6458                                    ; preds = %6438, %6435
  %6459 = load i64* %1, align 8
  %6460 = load i64* @nprocs, align 8
  %6461 = load i64* @xprocs, align 8
  %6462 = sub nsw i64 %6460, %6461
  %6463 = icmp eq i64 %6459, %6462
  br i1 %6463, label %6464, label %6490

; <label>:6464                                    ; preds = %6458
  %6465 = load i64* @im, align 8
  %6466 = sub nsw i64 %6465, 1
  %6467 = load %struct.fields_struct** @fields, align 8
  %6468 = getelementptr inbounds %struct.fields_struct* %6467, i32 0, i32 0
  %6469 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6468, i32 0, i64 1
  %6470 = getelementptr inbounds [258 x [258 x double]]* %6469, i32 0, i64 %6466
  %6471 = getelementptr inbounds [258 x double]* %6470, i32 0, i64 0
  %6472 = load double* %6471, align 8
  %6473 = load double* %timst, align 8
  %6474 = load i64* @im, align 8
  %6475 = sub nsw i64 %6474, 1
  %6476 = load %struct.wrk3_struct** @wrk3, align 8
  %6477 = getelementptr inbounds %struct.wrk3_struct* %6476, i32 0, i32 1
  %6478 = getelementptr inbounds [258 x [258 x double]]* %6477, i32 0, i64 %6475
  %6479 = getelementptr inbounds [258 x double]* %6478, i32 0, i64 0
  %6480 = load double* %6479, align 8
  %6481 = fmul double %6473, %6480
  %6482 = fadd double %6472, %6481
  %6483 = load i64* @im, align 8
  %6484 = sub nsw i64 %6483, 1
  %6485 = load %struct.fields_struct** @fields, align 8
  %6486 = getelementptr inbounds %struct.fields_struct* %6485, i32 0, i32 0
  %6487 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6486, i32 0, i64 1
  %6488 = getelementptr inbounds [258 x [258 x double]]* %6487, i32 0, i64 %6484
  %6489 = getelementptr inbounds [258 x double]* %6488, i32 0, i64 0
  store double %6482, double* %6489, align 8
  br label %6490

; <label>:6490                                    ; preds = %6464, %6458
  %6491 = load i64* %1, align 8
  %6492 = load i64* @xprocs, align 8
  %6493 = sub nsw i64 %6492, 1
  %6494 = icmp eq i64 %6491, %6493
  br i1 %6494, label %6495, label %6521

; <label>:6495                                    ; preds = %6490
  %6496 = load i64* @jm, align 8
  %6497 = sub nsw i64 %6496, 1
  %6498 = load %struct.fields_struct** @fields, align 8
  %6499 = getelementptr inbounds %struct.fields_struct* %6498, i32 0, i32 0
  %6500 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6499, i32 0, i64 1
  %6501 = getelementptr inbounds [258 x [258 x double]]* %6500, i32 0, i64 0
  %6502 = getelementptr inbounds [258 x double]* %6501, i32 0, i64 %6497
  %6503 = load double* %6502, align 8
  %6504 = load double* %timst, align 8
  %6505 = load i64* @jm, align 8
  %6506 = sub nsw i64 %6505, 1
  %6507 = load %struct.wrk3_struct** @wrk3, align 8
  %6508 = getelementptr inbounds %struct.wrk3_struct* %6507, i32 0, i32 1
  %6509 = getelementptr inbounds [258 x [258 x double]]* %6508, i32 0, i64 0
  %6510 = getelementptr inbounds [258 x double]* %6509, i32 0, i64 %6506
  %6511 = load double* %6510, align 8
  %6512 = fmul double %6504, %6511
  %6513 = fadd double %6503, %6512
  %6514 = load i64* @jm, align 8
  %6515 = sub nsw i64 %6514, 1
  %6516 = load %struct.fields_struct** @fields, align 8
  %6517 = getelementptr inbounds %struct.fields_struct* %6516, i32 0, i32 0
  %6518 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6517, i32 0, i64 1
  %6519 = getelementptr inbounds [258 x [258 x double]]* %6518, i32 0, i64 0
  %6520 = getelementptr inbounds [258 x double]* %6519, i32 0, i64 %6515
  store double %6513, double* %6520, align 8
  br label %6521

; <label>:6521                                    ; preds = %6495, %6490
  %6522 = load i64* %1, align 8
  %6523 = load i64* @nprocs, align 8
  %6524 = sub nsw i64 %6523, 1
  %6525 = icmp eq i64 %6522, %6524
  br i1 %6525, label %6526, label %6558

; <label>:6526                                    ; preds = %6521
  %6527 = load i64* @jm, align 8
  %6528 = sub nsw i64 %6527, 1
  %6529 = load i64* @im, align 8
  %6530 = sub nsw i64 %6529, 1
  %6531 = load %struct.fields_struct** @fields, align 8
  %6532 = getelementptr inbounds %struct.fields_struct* %6531, i32 0, i32 0
  %6533 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6532, i32 0, i64 1
  %6534 = getelementptr inbounds [258 x [258 x double]]* %6533, i32 0, i64 %6530
  %6535 = getelementptr inbounds [258 x double]* %6534, i32 0, i64 %6528
  %6536 = load double* %6535, align 8
  %6537 = load double* %timst, align 8
  %6538 = load i64* @jm, align 8
  %6539 = sub nsw i64 %6538, 1
  %6540 = load i64* @im, align 8
  %6541 = sub nsw i64 %6540, 1
  %6542 = load %struct.wrk3_struct** @wrk3, align 8
  %6543 = getelementptr inbounds %struct.wrk3_struct* %6542, i32 0, i32 1
  %6544 = getelementptr inbounds [258 x [258 x double]]* %6543, i32 0, i64 %6541
  %6545 = getelementptr inbounds [258 x double]* %6544, i32 0, i64 %6539
  %6546 = load double* %6545, align 8
  %6547 = fmul double %6537, %6546
  %6548 = fadd double %6536, %6547
  %6549 = load i64* @jm, align 8
  %6550 = sub nsw i64 %6549, 1
  %6551 = load i64* @im, align 8
  %6552 = sub nsw i64 %6551, 1
  %6553 = load %struct.fields_struct** @fields, align 8
  %6554 = getelementptr inbounds %struct.fields_struct* %6553, i32 0, i32 0
  %6555 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6554, i32 0, i64 1
  %6556 = getelementptr inbounds [258 x [258 x double]]* %6555, i32 0, i64 %6552
  %6557 = getelementptr inbounds [258 x double]* %6556, i32 0, i64 %6550
  store double %6548, double* %6557, align 8
  br label %6558

; <label>:6558                                    ; preds = %6526, %6521
  %6559 = load i64* %2, align 8
  %6560 = icmp eq i64 %6559, 1
  br i1 %6560, label %6561, label %6594

; <label>:6561                                    ; preds = %6558
  %6562 = load i64* %5, align 8
  store i64 %6562, i64* %j, align 8
  br label %6563

; <label>:6563                                    ; preds = %6590, %6561
  %6564 = load i64* %j, align 8
  %6565 = load i64* %6, align 8
  %6566 = icmp sle i64 %6564, %6565
  br i1 %6566, label %6567, label %6593

; <label>:6567                                    ; preds = %6563
  %6568 = load i64* %j, align 8
  %6569 = load %struct.fields_struct** @fields, align 8
  %6570 = getelementptr inbounds %struct.fields_struct* %6569, i32 0, i32 0
  %6571 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6570, i32 0, i64 1
  %6572 = getelementptr inbounds [258 x [258 x double]]* %6571, i32 0, i64 0
  %6573 = getelementptr inbounds [258 x double]* %6572, i32 0, i64 %6568
  %6574 = load double* %6573, align 8
  %6575 = load double* %timst, align 8
  %6576 = load i64* %j, align 8
  %6577 = load %struct.wrk3_struct** @wrk3, align 8
  %6578 = getelementptr inbounds %struct.wrk3_struct* %6577, i32 0, i32 1
  %6579 = getelementptr inbounds [258 x [258 x double]]* %6578, i32 0, i64 0
  %6580 = getelementptr inbounds [258 x double]* %6579, i32 0, i64 %6576
  %6581 = load double* %6580, align 8
  %6582 = fmul double %6575, %6581
  %6583 = fadd double %6574, %6582
  %6584 = load i64* %j, align 8
  %6585 = load %struct.fields_struct** @fields, align 8
  %6586 = getelementptr inbounds %struct.fields_struct* %6585, i32 0, i32 0
  %6587 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6586, i32 0, i64 1
  %6588 = getelementptr inbounds [258 x [258 x double]]* %6587, i32 0, i64 0
  %6589 = getelementptr inbounds [258 x double]* %6588, i32 0, i64 %6584
  store double %6583, double* %6589, align 8
  br label %6590

; <label>:6590                                    ; preds = %6567
  %6591 = load i64* %j, align 8
  %6592 = add nsw i64 %6591, 1
  store i64 %6592, i64* %j, align 8
  br label %6563

; <label>:6593                                    ; preds = %6563
  br label %6594

; <label>:6594                                    ; preds = %6593, %6558
  %6595 = load i64* %2, align 8
  %6596 = load i64* %4, align 8
  %6597 = add nsw i64 %6595, %6596
  %6598 = load i64* @im, align 8
  %6599 = sub nsw i64 %6598, 1
  %6600 = icmp eq i64 %6597, %6599
  br i1 %6600, label %6601, label %6640

; <label>:6601                                    ; preds = %6594
  %6602 = load i64* %5, align 8
  store i64 %6602, i64* %j, align 8
  br label %6603

; <label>:6603                                    ; preds = %6636, %6601
  %6604 = load i64* %j, align 8
  %6605 = load i64* %6, align 8
  %6606 = icmp sle i64 %6604, %6605
  br i1 %6606, label %6607, label %6639

; <label>:6607                                    ; preds = %6603
  %6608 = load i64* %j, align 8
  %6609 = load i64* @im, align 8
  %6610 = sub nsw i64 %6609, 1
  %6611 = load %struct.fields_struct** @fields, align 8
  %6612 = getelementptr inbounds %struct.fields_struct* %6611, i32 0, i32 0
  %6613 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6612, i32 0, i64 1
  %6614 = getelementptr inbounds [258 x [258 x double]]* %6613, i32 0, i64 %6610
  %6615 = getelementptr inbounds [258 x double]* %6614, i32 0, i64 %6608
  %6616 = load double* %6615, align 8
  %6617 = load double* %timst, align 8
  %6618 = load i64* %j, align 8
  %6619 = load i64* @im, align 8
  %6620 = sub nsw i64 %6619, 1
  %6621 = load %struct.wrk3_struct** @wrk3, align 8
  %6622 = getelementptr inbounds %struct.wrk3_struct* %6621, i32 0, i32 1
  %6623 = getelementptr inbounds [258 x [258 x double]]* %6622, i32 0, i64 %6620
  %6624 = getelementptr inbounds [258 x double]* %6623, i32 0, i64 %6618
  %6625 = load double* %6624, align 8
  %6626 = fmul double %6617, %6625
  %6627 = fadd double %6616, %6626
  %6628 = load i64* %j, align 8
  %6629 = load i64* @im, align 8
  %6630 = sub nsw i64 %6629, 1
  %6631 = load %struct.fields_struct** @fields, align 8
  %6632 = getelementptr inbounds %struct.fields_struct* %6631, i32 0, i32 0
  %6633 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6632, i32 0, i64 1
  %6634 = getelementptr inbounds [258 x [258 x double]]* %6633, i32 0, i64 %6630
  %6635 = getelementptr inbounds [258 x double]* %6634, i32 0, i64 %6628
  store double %6627, double* %6635, align 8
  br label %6636

; <label>:6636                                    ; preds = %6607
  %6637 = load i64* %j, align 8
  %6638 = add nsw i64 %6637, 1
  store i64 %6638, i64* %j, align 8
  br label %6603

; <label>:6639                                    ; preds = %6603
  br label %6640

; <label>:6640                                    ; preds = %6639, %6594
  %6641 = load i64* %5, align 8
  %6642 = icmp eq i64 %6641, 1
  br i1 %6642, label %6643, label %6676

; <label>:6643                                    ; preds = %6640
  %6644 = load i64* %2, align 8
  store i64 %6644, i64* %j, align 8
  br label %6645

; <label>:6645                                    ; preds = %6672, %6643
  %6646 = load i64* %j, align 8
  %6647 = load i64* %3, align 8
  %6648 = icmp sle i64 %6646, %6647
  br i1 %6648, label %6649, label %6675

; <label>:6649                                    ; preds = %6645
  %6650 = load i64* %j, align 8
  %6651 = load %struct.fields_struct** @fields, align 8
  %6652 = getelementptr inbounds %struct.fields_struct* %6651, i32 0, i32 0
  %6653 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6652, i32 0, i64 1
  %6654 = getelementptr inbounds [258 x [258 x double]]* %6653, i32 0, i64 %6650
  %6655 = getelementptr inbounds [258 x double]* %6654, i32 0, i64 0
  %6656 = load double* %6655, align 8
  %6657 = load double* %timst, align 8
  %6658 = load i64* %j, align 8
  %6659 = load %struct.wrk3_struct** @wrk3, align 8
  %6660 = getelementptr inbounds %struct.wrk3_struct* %6659, i32 0, i32 1
  %6661 = getelementptr inbounds [258 x [258 x double]]* %6660, i32 0, i64 %6658
  %6662 = getelementptr inbounds [258 x double]* %6661, i32 0, i64 0
  %6663 = load double* %6662, align 8
  %6664 = fmul double %6657, %6663
  %6665 = fadd double %6656, %6664
  %6666 = load i64* %j, align 8
  %6667 = load %struct.fields_struct** @fields, align 8
  %6668 = getelementptr inbounds %struct.fields_struct* %6667, i32 0, i32 0
  %6669 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6668, i32 0, i64 1
  %6670 = getelementptr inbounds [258 x [258 x double]]* %6669, i32 0, i64 %6666
  %6671 = getelementptr inbounds [258 x double]* %6670, i32 0, i64 0
  store double %6665, double* %6671, align 8
  br label %6672

; <label>:6672                                    ; preds = %6649
  %6673 = load i64* %j, align 8
  %6674 = add nsw i64 %6673, 1
  store i64 %6674, i64* %j, align 8
  br label %6645

; <label>:6675                                    ; preds = %6645
  br label %6676

; <label>:6676                                    ; preds = %6675, %6640
  %6677 = load i64* %5, align 8
  %6678 = load i64* %7, align 8
  %6679 = add nsw i64 %6677, %6678
  %6680 = load i64* @jm, align 8
  %6681 = sub nsw i64 %6680, 1
  %6682 = icmp eq i64 %6679, %6681
  br i1 %6682, label %6683, label %6722

; <label>:6683                                    ; preds = %6676
  %6684 = load i64* %2, align 8
  store i64 %6684, i64* %j, align 8
  br label %6685

; <label>:6685                                    ; preds = %6718, %6683
  %6686 = load i64* %j, align 8
  %6687 = load i64* %3, align 8
  %6688 = icmp sle i64 %6686, %6687
  br i1 %6688, label %6689, label %6721

; <label>:6689                                    ; preds = %6685
  %6690 = load i64* @jm, align 8
  %6691 = sub nsw i64 %6690, 1
  %6692 = load i64* %j, align 8
  %6693 = load %struct.fields_struct** @fields, align 8
  %6694 = getelementptr inbounds %struct.fields_struct* %6693, i32 0, i32 0
  %6695 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6694, i32 0, i64 1
  %6696 = getelementptr inbounds [258 x [258 x double]]* %6695, i32 0, i64 %6692
  %6697 = getelementptr inbounds [258 x double]* %6696, i32 0, i64 %6691
  %6698 = load double* %6697, align 8
  %6699 = load double* %timst, align 8
  %6700 = load i64* @jm, align 8
  %6701 = sub nsw i64 %6700, 1
  %6702 = load i64* %j, align 8
  %6703 = load %struct.wrk3_struct** @wrk3, align 8
  %6704 = getelementptr inbounds %struct.wrk3_struct* %6703, i32 0, i32 1
  %6705 = getelementptr inbounds [258 x [258 x double]]* %6704, i32 0, i64 %6702
  %6706 = getelementptr inbounds [258 x double]* %6705, i32 0, i64 %6701
  %6707 = load double* %6706, align 8
  %6708 = fmul double %6699, %6707
  %6709 = fadd double %6698, %6708
  %6710 = load i64* @jm, align 8
  %6711 = sub nsw i64 %6710, 1
  %6712 = load i64* %j, align 8
  %6713 = load %struct.fields_struct** @fields, align 8
  %6714 = getelementptr inbounds %struct.fields_struct* %6713, i32 0, i32 0
  %6715 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6714, i32 0, i64 1
  %6716 = getelementptr inbounds [258 x [258 x double]]* %6715, i32 0, i64 %6712
  %6717 = getelementptr inbounds [258 x double]* %6716, i32 0, i64 %6711
  store double %6709, double* %6717, align 8
  br label %6718

; <label>:6718                                    ; preds = %6689
  %6719 = load i64* %j, align 8
  %6720 = add nsw i64 %6719, 1
  store i64 %6720, i64* %j, align 8
  br label %6685

; <label>:6721                                    ; preds = %6685
  br label %6722

; <label>:6722                                    ; preds = %6721, %6676
  %6723 = load i64* %2, align 8
  store i64 %6723, i64* %i, align 8
  br label %6724

; <label>:6724                                    ; preds = %6764, %6722
  %6725 = load i64* %i, align 8
  %6726 = load i64* %3, align 8
  %6727 = icmp sle i64 %6725, %6726
  br i1 %6727, label %6728, label %6767

; <label>:6728                                    ; preds = %6724
  %6729 = load i64* %5, align 8
  store i64 %6729, i64* %iindex, align 8
  br label %6730

; <label>:6730                                    ; preds = %6760, %6728
  %6731 = load i64* %iindex, align 8
  %6732 = load i64* %6, align 8
  %6733 = icmp sle i64 %6731, %6732
  br i1 %6733, label %6734, label %6763

; <label>:6734                                    ; preds = %6730
  %6735 = load i64* %iindex, align 8
  %6736 = load i64* %i, align 8
  %6737 = load %struct.fields_struct** @fields, align 8
  %6738 = getelementptr inbounds %struct.fields_struct* %6737, i32 0, i32 0
  %6739 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6738, i32 0, i64 1
  %6740 = getelementptr inbounds [258 x [258 x double]]* %6739, i32 0, i64 %6736
  %6741 = getelementptr inbounds [258 x double]* %6740, i32 0, i64 %6735
  %6742 = load double* %6741, align 8
  %6743 = load double* %timst, align 8
  %6744 = load i64* %iindex, align 8
  %6745 = load i64* %i, align 8
  %6746 = load %struct.wrk3_struct** @wrk3, align 8
  %6747 = getelementptr inbounds %struct.wrk3_struct* %6746, i32 0, i32 1
  %6748 = getelementptr inbounds [258 x [258 x double]]* %6747, i32 0, i64 %6745
  %6749 = getelementptr inbounds [258 x double]* %6748, i32 0, i64 %6744
  %6750 = load double* %6749, align 8
  %6751 = fmul double %6743, %6750
  %6752 = fadd double %6742, %6751
  %6753 = load i64* %iindex, align 8
  %6754 = load i64* %i, align 8
  %6755 = load %struct.fields_struct** @fields, align 8
  %6756 = getelementptr inbounds %struct.fields_struct* %6755, i32 0, i32 0
  %6757 = getelementptr inbounds [2 x [258 x [258 x double]]]* %6756, i32 0, i64 1
  %6758 = getelementptr inbounds [258 x [258 x double]]* %6757, i32 0, i64 %6754
  %6759 = getelementptr inbounds [258 x double]* %6758, i32 0, i64 %6753
  store double %6752, double* %6759, align 8
  br label %6760

; <label>:6760                                    ; preds = %6734
  %6761 = load i64* %iindex, align 8
  %6762 = add nsw i64 %6761, 1
  store i64 %6762, i64* %iindex, align 8
  br label %6730

; <label>:6763                                    ; preds = %6730
  br label %6764

; <label>:6764                                    ; preds = %6763
  %6765 = load i64* %i, align 8
  %6766 = add nsw i64 %6765, 1
  store i64 %6766, i64* %i, align 8
  br label %6724

; <label>:6767                                    ; preds = %6724
  %6768 = load %struct.bars_struct** @bars, align 8
  %6769 = getelementptr inbounds %struct.bars_struct* %6768, i32 0, i32 0
  %6770 = getelementptr inbounds %struct.anon* %6769, i32 0, i32 0
  %6771 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %6770) #6
  %6772 = sext i32 %6771 to i64
  store i64 %6772, i64* %Error40, align 8
  %6773 = load i64* %Error40, align 8
  %6774 = icmp ne i64 %6773, 0
  br i1 %6774, label %6775, label %6777

; <label>:6775                                    ; preds = %6767
  %6776 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str41, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:6777                                    ; preds = %6767
  %6778 = load %struct.bars_struct** @bars, align 8
  %6779 = getelementptr inbounds %struct.bars_struct* %6778, i32 0, i32 0
  %6780 = getelementptr inbounds %struct.anon* %6779, i32 0, i32 3
  %6781 = load i64* %6780, align 8
  store i64 %6781, i64* %Cycle41, align 8
  %6782 = load %struct.bars_struct** @bars, align 8
  %6783 = getelementptr inbounds %struct.bars_struct* %6782, i32 0, i32 0
  %6784 = getelementptr inbounds %struct.anon* %6783, i32 0, i32 2
  %6785 = load i64* %6784, align 8
  %6786 = add i64 %6785, 1
  store i64 %6786, i64* %6784, align 8
  %6787 = load i64* @nprocs, align 8
  %6788 = icmp ne i64 %6786, %6787
  br i1 %6788, label %6789, label %6817

; <label>:6789                                    ; preds = %6777
  %6790 = bitcast i64* %Cancel42 to i32*
  %6791 = call i32 @pthread_setcancelstate(i32 1, i32* %6790)
  br label %6792

; <label>:6792                                    ; preds = %6811, %6789
  %6793 = load i64* %Cycle41, align 8
  %6794 = load %struct.bars_struct** @bars, align 8
  %6795 = getelementptr inbounds %struct.bars_struct* %6794, i32 0, i32 0
  %6796 = getelementptr inbounds %struct.anon* %6795, i32 0, i32 3
  %6797 = load i64* %6796, align 8
  %6798 = icmp eq i64 %6793, %6797
  br i1 %6798, label %6799, label %6812

; <label>:6799                                    ; preds = %6792
  %6800 = load %struct.bars_struct** @bars, align 8
  %6801 = getelementptr inbounds %struct.bars_struct* %6800, i32 0, i32 0
  %6802 = getelementptr inbounds %struct.anon* %6801, i32 0, i32 1
  %6803 = load %struct.bars_struct** @bars, align 8
  %6804 = getelementptr inbounds %struct.bars_struct* %6803, i32 0, i32 0
  %6805 = getelementptr inbounds %struct.anon* %6804, i32 0, i32 0
  %6806 = call i32 @pthread_cond_wait(%union.pthread_cond_t* %6802, %union.pthread_mutex_t* %6805)
  %6807 = sext i32 %6806 to i64
  store i64 %6807, i64* %Error40, align 8
  %6808 = load i64* %Error40, align 8
  %6809 = icmp ne i64 %6808, 0
  br i1 %6809, label %6810, label %6811

; <label>:6810                                    ; preds = %6799
  br label %6812

; <label>:6811                                    ; preds = %6799
  br label %6792

; <label>:6812                                    ; preds = %6810, %6792
  %6813 = load i64* %Cancel42, align 8
  %6814 = trunc i64 %6813 to i32
  %6815 = bitcast i64* %Temp43 to i32*
  %6816 = call i32 @pthread_setcancelstate(i32 %6814, i32* %6815)
  br label %6837

; <label>:6817                                    ; preds = %6777
  %6818 = load %struct.bars_struct** @bars, align 8
  %6819 = getelementptr inbounds %struct.bars_struct* %6818, i32 0, i32 0
  %6820 = getelementptr inbounds %struct.anon* %6819, i32 0, i32 3
  %6821 = load i64* %6820, align 8
  %6822 = icmp ne i64 %6821, 0
  %6823 = xor i1 %6822, true
  %6824 = zext i1 %6823 to i32
  %6825 = sext i32 %6824 to i64
  %6826 = load %struct.bars_struct** @bars, align 8
  %6827 = getelementptr inbounds %struct.bars_struct* %6826, i32 0, i32 0
  %6828 = getelementptr inbounds %struct.anon* %6827, i32 0, i32 3
  store i64 %6825, i64* %6828, align 8
  %6829 = load %struct.bars_struct** @bars, align 8
  %6830 = getelementptr inbounds %struct.bars_struct* %6829, i32 0, i32 0
  %6831 = getelementptr inbounds %struct.anon* %6830, i32 0, i32 2
  store i64 0, i64* %6831, align 8
  %6832 = load %struct.bars_struct** @bars, align 8
  %6833 = getelementptr inbounds %struct.bars_struct* %6832, i32 0, i32 0
  %6834 = getelementptr inbounds %struct.anon* %6833, i32 0, i32 1
  %6835 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %6834) #6
  %6836 = sext i32 %6835 to i64
  store i64 %6836, i64* %Error40, align 8
  br label %6837

; <label>:6837                                    ; preds = %6817, %6812
  %6838 = load %struct.bars_struct** @bars, align 8
  %6839 = getelementptr inbounds %struct.bars_struct* %6838, i32 0, i32 0
  %6840 = getelementptr inbounds %struct.anon* %6839, i32 0, i32 0
  %6841 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %6840) #6
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0, !0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
