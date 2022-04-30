; ModuleID = '/home/foo/edc-predictor/benchmarks/knn/llfi/nn-llfi_index.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.neighbor = type { [49 x i8], double }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [26 x i8] c"Invalid set of arguments\0A\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str2 = private unnamed_addr constant [21 x i8] c"error opening flist\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"no room for neighbors\0A\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str5 = private unnamed_addr constant [24 x i8] c"error reading filelist\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"error opening a db\0A\00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"Error\00", align 1
@.str8 = private unnamed_addr constant [6 x i8] c"%f %f\00", align 1
@.str9 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str10 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"The %d nearest neighbors are:\0A\00", align 1
@.str12 = private unnamed_addr constant [11 x i8] c"%s --> %f\0A\00", align 1
@call_namestr = internal constant [5 x i8] c"call\00"
@load_namestr = internal constant [5 x i8] c"load\00"
@getelementptr_namestr = internal constant [14 x i8] c"getelementptr\00"
@alloca_namestr = internal constant [7 x i8] c"alloca\00"
@icmp_namestr = internal constant [5 x i8] c"icmp\00"
@fptrunc_namestr = internal constant [8 x i8] c"fptrunc\00"
@sext_namestr = internal constant [5 x i8] c"sext\00"
@mul_namestr = internal constant [4 x i8] c"mul\00"
@bitcast_namestr = internal constant [8 x i8] c"bitcast\00"
@add_namestr = internal constant [4 x i8] c"add\00"
@fsub_namestr = internal constant [5 x i8] c"fsub\00"
@fmul_namestr = internal constant [5 x i8] c"fmul\00"
@fadd_namestr = internal constant [5 x i8] c"fadd\00"
@fpext_namestr = internal constant [6 x i8] c"fpext\00"
@xor_namestr = internal constant [4 x i8] c"xor\00"
@trunc_namestr = internal constant [6 x i8] c"trunc\00"
@sub_namestr = internal constant [4 x i8] c"sub\00"
@fcmp_namestr = internal constant [5 x i8] c"fcmp\00"

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  call void @initInjections()
  %1 = alloca i32, align 4, !llfi_index !1
  %fi14 = call i32* @injectFault5(i64 1, i32* %1, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %2 = alloca i32, align 4, !llfi_index !3
  %fi15 = call i32* @injectFault5(i64 2, i32* %2, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %3 = alloca i8**, align 8, !llfi_index !4
  %fi16 = call i8*** @injectFault7(i64 3, i8*** %3, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %flist = alloca %struct._IO_FILE*, align 8, !llfi_index !5
  %fi17 = call %struct._IO_FILE** @injectFault6(i64 4, %struct._IO_FILE** %flist, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %fp = alloca %struct._IO_FILE*, align 8, !llfi_index !6
  %fi18 = call %struct._IO_FILE** @injectFault6(i64 5, %struct._IO_FILE** %fp, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %i = alloca i32, align 4, !llfi_index !7
  %fi19 = call i32* @injectFault5(i64 6, i32* %i, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %j = alloca i32, align 4, !llfi_index !8
  %fi51 = call i32* @injectFault5(i64 7, i32* %j, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %k = alloca i32, align 4, !llfi_index !9
  %fi52 = call i32* @injectFault5(i64 8, i32* %k, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %rec_count = alloca i32, align 4, !llfi_index !10
  %fi53 = call i32* @injectFault5(i64 9, i32* %rec_count, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %done = alloca i32, align 4, !llfi_index !11
  %fi54 = call i32* @injectFault5(i64 10, i32* %done, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %sandbox = alloca [490 x i8], align 16, !llfi_index !12
  %fi55 = call [490 x i8]* @injectFault13(i64 11, [490 x i8]* %sandbox, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %rec_iter = alloca i8*, align 8, !llfi_index !13
  %fi56 = call i8** @injectFault1(i64 12, i8** %rec_iter, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %dbname = alloca [64 x i8], align 16, !llfi_index !14
  %fi57 = call [64 x i8]* @injectFault14(i64 13, [64 x i8]* %dbname, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %neighbors = alloca %struct.neighbor*, align 8, !llfi_index !15
  %fi58 = call %struct.neighbor** @injectFault15(i64 14, %struct.neighbor** %neighbors, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %target_lat = alloca float, align 4, !llfi_index !16
  %fi13 = call float* @injectFault3(i64 15, float* %target_lat, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %target_long = alloca float, align 4, !llfi_index !17
  %fi4 = call float* @injectFault3(i64 16, float* %target_long, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %tmp_lat = alloca float, align 4, !llfi_index !18
  %fi5 = call float* @injectFault3(i64 17, float* %tmp_lat, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %tmp_long = alloca float, align 4, !llfi_index !19
  %fi6 = call float* @injectFault3(i64 18, float* %tmp_long, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %z = alloca float*, align 8, !llfi_index !20
  %fi7 = call float** @injectFault4(i64 19, float** %z, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %max_dist = alloca float, align 4, !llfi_index !21
  %fi8 = call float* @injectFault3(i64 20, float* %max_dist, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %max_idx = alloca i32, align 4, !llfi_index !22
  %fi9 = call i32* @injectFault5(i64 21, i32* %max_idx, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %out = alloca %struct._IO_FILE*, align 8, !llfi_index !23
  %fi10 = call %struct._IO_FILE** @injectFault6(i64 22, %struct._IO_FILE** %out, i32 26, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([7 x i8]* @alloca_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 0, i32* %fi14, !llfi_index !24
  store i32 %argc, i32* %fi15, align 4, !llfi_index !25
  store i8** %argv, i8*** %fi16, align 8, !llfi_index !26
  store i32 0, i32* %fi19, align 4, !llfi_index !27
  store i32 0, i32* %fi51, align 4, !llfi_index !28
  store i32 0, i32* %fi52, align 4, !llfi_index !29
  store i32 0, i32* %fi53, align 4, !llfi_index !30
  store i32 0, i32* %fi54, align 4, !llfi_index !31
  store %struct.neighbor* null, %struct.neighbor** %fi58, align 8, !llfi_index !32
  store float 0.000000e+00, float* %fi5, align 4, !llfi_index !33
  store float 0.000000e+00, float* %fi6, align 4, !llfi_index !34
  %4 = load i32* %fi15, align 4, !llfi_index !35
  %fi11 = call i32 @injectFault0(i64 34, i32 %4, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %5 = icmp slt i32 %fi11, 5, !llfi_index !36
  %fi20 = call i1 @injectFault8(i64 35, i1 %5, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi20, label %6, label %9, !llfi_index !37

; <label>:6                                       ; preds = %0
  %7 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !38
  %fi21 = call %struct._IO_FILE* @injectFault9(i64 37, %struct._IO_FILE* %7, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %fi21, i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0)), !llfi_index !39
  %fi22 = call i32 @injectFault0(i64 38, i32 %8, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 -1) #5, !llfi_index !40
  unreachable, !llfi_index !41

; <label>:9                                       ; preds = %0
  %10 = load i8*** %fi16, align 8, !llfi_index !42
  %fi23 = call i8** @injectFault1(i64 41, i8** %10, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %11 = getelementptr i8** %fi23, i64 1, !llfi_index !43
  %fi24 = call i8** @injectFault1(i64 42, i8** %11, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %12 = load i8** %fi24, align 8, !llfi_index !44
  %fi25 = call i8* @injectFault2(i64 43, i8* %12, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %13 = call %struct._IO_FILE* @fopen(i8* %fi25, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !llfi_index !45
  %fi26 = call %struct._IO_FILE* @injectFault9(i64 44, %struct._IO_FILE* %13, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store %struct._IO_FILE* %fi26, %struct._IO_FILE** %fi17, align 8, !llfi_index !46
  %14 = load %struct._IO_FILE** %fi17, align 8, !llfi_index !47
  %fi27 = call %struct._IO_FILE* @injectFault9(i64 46, %struct._IO_FILE* %14, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %15 = icmp ne %struct._IO_FILE* %fi27, null, !llfi_index !48
  %fi28 = call i1 @injectFault8(i64 47, i1 %15, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi28, label %18, label %16, !llfi_index !49

; <label>:16                                      ; preds = %9
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0)), !llfi_index !50
  %fi = call i32 @injectFault0(i64 49, i32 %17, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #5, !llfi_index !51
  unreachable, !llfi_index !52

; <label>:18                                      ; preds = %9
  %19 = load i8*** %fi16, align 8, !llfi_index !53
  %fi1 = call i8** @injectFault1(i64 52, i8** %19, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %20 = getelementptr i8** %fi1, i64 2, !llfi_index !54
  %fi2 = call i8** @injectFault1(i64 53, i8** %20, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %21 = load i8** %fi2, align 8, !llfi_index !55
  %fi3 = call i8* @injectFault2(i64 54, i8* %21, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %22 = call i32 @atoi(i8* %fi3) #6, !llfi_index !56
  %fi38 = call i32 @injectFault0(i64 55, i32 %22, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi38, i32* %fi52, align 4, !llfi_index !57
  %23 = load i8*** %fi16, align 8, !llfi_index !58
  %fi39 = call i8** @injectFault1(i64 57, i8** %23, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %24 = getelementptr i8** %fi39, i64 3, !llfi_index !59
  %fi40 = call i8** @injectFault1(i64 58, i8** %24, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %25 = load i8** %fi40, align 8, !llfi_index !60
  %fi41 = call i8* @injectFault2(i64 59, i8* %25, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %26 = call double @atof(i8* %fi41) #6, !llfi_index !61
  %fi42 = call double @injectFault10(i64 60, double %26, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %27 = fptrunc double %fi42 to float, !llfi_index !62
  %fi43 = call float @injectFault11(i64 61, float %27, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi43, float* %fi13, align 4, !llfi_index !63
  %28 = load i8*** %fi16, align 8, !llfi_index !64
  %fi44 = call i8** @injectFault1(i64 63, i8** %28, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %29 = getelementptr i8** %fi44, i64 4, !llfi_index !65
  %fi45 = call i8** @injectFault1(i64 64, i8** %29, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %30 = load i8** %fi45, align 8, !llfi_index !66
  %fi46 = call i8* @injectFault2(i64 65, i8* %30, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %31 = call double @atof(i8* %fi46) #6, !llfi_index !67
  %fi47 = call double @injectFault10(i64 66, double %31, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %32 = fptrunc double %fi47 to float, !llfi_index !68
  %fi48 = call float @injectFault11(i64 67, float %32, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi48, float* %fi4, align 4, !llfi_index !69
  %33 = load i32* %fi52, align 4, !llfi_index !70
  %fi49 = call i32 @injectFault0(i64 69, i32 %33, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %34 = sext i32 %fi49 to i64, !llfi_index !71
  %fi50 = call i64 @injectFault12(i64 70, i64 %34, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %35 = mul i64 %fi50, 64, !llfi_index !72
  %fi60 = call i64 @injectFault12(i64 71, i64 %35, i32 12, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @mul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %36 = call noalias i8* @malloc(i64 %fi60) #7, !llfi_index !73
  %fi61 = call i8* @injectFault2(i64 72, i8* %36, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %37 = bitcast i8* %fi61 to %struct.neighbor*, !llfi_index !74
  %fi62 = call %struct.neighbor* @injectFault16(i64 73, %struct.neighbor* %37, i32 44, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @bitcast_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store %struct.neighbor* %fi62, %struct.neighbor** %fi58, align 8, !llfi_index !75
  %38 = load %struct.neighbor** %fi58, align 8, !llfi_index !76
  %fi63 = call %struct.neighbor* @injectFault16(i64 75, %struct.neighbor* %38, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %39 = icmp eq %struct.neighbor* %fi63, null, !llfi_index !77
  %fi64 = call i1 @injectFault8(i64 76, i1 %39, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi64, label %40, label %43, !llfi_index !78

; <label>:40                                      ; preds = %18
  %41 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !79
  %fi65 = call %struct._IO_FILE* @injectFault9(i64 78, %struct._IO_FILE* %41, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %42 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %fi65, i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0)), !llfi_index !80
  %fi66 = call i32 @injectFault0(i64 79, i32 %42, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 0) #5, !llfi_index !81
  unreachable, !llfi_index !82

; <label>:43                                      ; preds = %18
  store i32 0, i32* %fi51, align 4, !llfi_index !83
  br label %44, !llfi_index !84

; <label>:44                                      ; preds = %54, %43
  %45 = load i32* %fi51, align 4, !llfi_index !85
  %fi67 = call i32 @injectFault0(i64 84, i32 %45, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %46 = load i32* %fi52, align 4, !llfi_index !86
  %fi68 = call i32 @injectFault0(i64 85, i32 %46, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %47 = icmp slt i32 %fi67, %fi68, !llfi_index !87
  %fi69 = call i1 @injectFault8(i64 86, i1 %47, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi69, label %48, label %57, !llfi_index !88

; <label>:48                                      ; preds = %44
  %49 = load i32* %fi51, align 4, !llfi_index !89
  %fi70 = call i32 @injectFault0(i64 88, i32 %49, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %50 = sext i32 %fi70 to i64, !llfi_index !90
  %fi71 = call i64 @injectFault12(i64 89, i64 %50, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %51 = load %struct.neighbor** %fi58, align 8, !llfi_index !91
  %fi72 = call %struct.neighbor* @injectFault16(i64 90, %struct.neighbor* %51, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %52 = getelementptr %struct.neighbor* %fi72, i64 %fi71, !llfi_index !92
  %fi73 = call %struct.neighbor* @injectFault16(i64 91, %struct.neighbor* %52, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %53 = getelementptr %struct.neighbor* %fi73, i32 0, i32 1, !llfi_index !93
  %fi74 = call double* @injectFault17(i64 92, double* %53, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store double 1.000000e+04, double* %fi74, align 8, !llfi_index !94
  br label %54, !llfi_index !95

; <label>:54                                      ; preds = %48
  %55 = load i32* %fi51, align 4, !llfi_index !96
  %fi75 = call i32 @injectFault0(i64 95, i32 %55, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %56 = add nsw i32 %fi75, 1, !llfi_index !97
  %fi76 = call i32 @injectFault0(i64 96, i32 %56, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi76, i32* %fi51, align 4, !llfi_index !98
  br label %44, !llfi_index !99

; <label>:57                                      ; preds = %44
  %58 = load %struct._IO_FILE** %fi17, align 8, !llfi_index !100
  %fi29 = call %struct._IO_FILE* @injectFault9(i64 99, %struct._IO_FILE* %58, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %59 = getelementptr [64 x i8]* %fi57, i32 0, i32 0, !llfi_index !101
  %fi30 = call i8* @injectFault2(i64 100, i8* %59, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %60 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %fi29, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i8* %fi30), !llfi_index !102
  %fi31 = call i32 @injectFault0(i64 101, i32 %60, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %61 = icmp ne i32 %fi31, 1, !llfi_index !103
  %fi32 = call i1 @injectFault8(i64 102, i1 %61, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi32, label %62, label %65, !llfi_index !104

; <label>:62                                      ; preds = %57
  %63 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !105
  %fi33 = call %struct._IO_FILE* @injectFault9(i64 104, %struct._IO_FILE* %63, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %64 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %fi33, i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0)), !llfi_index !106
  %fi34 = call i32 @injectFault0(i64 105, i32 %64, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 0) #5, !llfi_index !107
  unreachable, !llfi_index !108

; <label>:65                                      ; preds = %57
  %66 = getelementptr [64 x i8]* %fi57, i32 0, i32 0, !llfi_index !109
  %fi59 = call i8* @injectFault2(i64 108, i8* %66, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %67 = call %struct._IO_FILE* @fopen(i8* %fi59, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !llfi_index !110
  %fi35 = call %struct._IO_FILE* @injectFault9(i64 109, %struct._IO_FILE* %67, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store %struct._IO_FILE* %fi35, %struct._IO_FILE** %fi18, align 8, !llfi_index !111
  %68 = load %struct._IO_FILE** %fi18, align 8, !llfi_index !112
  %fi36 = call %struct._IO_FILE* @injectFault9(i64 111, %struct._IO_FILE* %68, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %69 = icmp ne %struct._IO_FILE* %fi36, null, !llfi_index !113
  %fi37 = call i1 @injectFault8(i64 112, i1 %69, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi37, label %72, label %70, !llfi_index !114

; <label>:70                                      ; preds = %65
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0)), !llfi_index !115
  %fi106 = call i32 @injectFault0(i64 114, i32 %71, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #5, !llfi_index !116
  unreachable, !llfi_index !117

; <label>:72                                      ; preds = %65
  %73 = call noalias i8* @malloc(i64 40) #7, !llfi_index !118
  %fi107 = call i8* @injectFault2(i64 117, i8* %73, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %74 = bitcast i8* %fi107 to float*, !llfi_index !119
  %fi108 = call float* @injectFault3(i64 118, float* %74, i32 44, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @bitcast_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float* %fi108, float** %fi7, align 8, !llfi_index !120
  br label %75, !llfi_index !121

; <label>:75                                      ; preds = %237, %72
  %76 = load i32* %fi54, align 4, !llfi_index !122
  %fi109 = call i32 @injectFault0(i64 121, i32 %76, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %77 = icmp ne i32 %fi109, 0, !llfi_index !123
  %fi110 = call i1 @injectFault8(i64 122, i1 %77, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %78 = xor i1 %fi110, true, !llfi_index !124
  %fi111 = call i1 @injectFault8(i64 123, i1 %78, i32 25, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @xor_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi111, label %79, label %238, !llfi_index !125

; <label>:79                                      ; preds = %75
  %80 = getelementptr [490 x i8]* %fi55, i32 0, i32 0, !llfi_index !126
  %fi112 = call i8* @injectFault2(i64 125, i8* %80, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %81 = load %struct._IO_FILE** %fi18, align 8, !llfi_index !127
  %fi113 = call %struct._IO_FILE* @injectFault9(i64 126, %struct._IO_FILE* %81, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %82 = call i64 @fread(i8* %fi112, i64 49, i64 10, %struct._IO_FILE* %fi113), !llfi_index !128
  %fi114 = call i64 @injectFault12(i64 127, i64 %82, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %83 = trunc i64 %fi114 to i32, !llfi_index !129
  %fi115 = call i32 @injectFault0(i64 128, i32 %83, i32 33, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @trunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi115, i32* %fi53, align 4, !llfi_index !130
  %84 = load i32* %fi53, align 4, !llfi_index !131
  %fi116 = call i32 @injectFault0(i64 130, i32 %84, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %85 = icmp ne i32 %fi116, 10, !llfi_index !132
  %fi117 = call i1 @injectFault8(i64 131, i1 %85, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi117, label %86, label %116, !llfi_index !133

; <label>:86                                      ; preds = %79
  %87 = load %struct._IO_FILE** %fi17, align 8, !llfi_index !134
  %fi118 = call %struct._IO_FILE* @injectFault9(i64 133, %struct._IO_FILE* %87, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %88 = call i32 @ferror(%struct._IO_FILE* %fi118) #7, !llfi_index !135
  %fi12 = call i32 @injectFault0(i64 134, i32 %88, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %89 = icmp ne i32 %fi12, 0, !llfi_index !136
  %fi119 = call i1 @injectFault8(i64 135, i1 %89, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi119, label %114, label %90, !llfi_index !137

; <label>:90                                      ; preds = %86
  %91 = load %struct._IO_FILE** %fi18, align 8, !llfi_index !138
  %fi120 = call %struct._IO_FILE* @injectFault9(i64 137, %struct._IO_FILE* %91, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %92 = call i32 @fclose(%struct._IO_FILE* %fi120), !llfi_index !139
  %fi121 = call i32 @injectFault0(i64 138, i32 %92, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %93 = load %struct._IO_FILE** %fi17, align 8, !llfi_index !140
  %fi122 = call %struct._IO_FILE* @injectFault9(i64 139, %struct._IO_FILE* %93, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %94 = call i32 @feof(%struct._IO_FILE* %fi122) #7, !llfi_index !141
  %fi123 = call i32 @injectFault0(i64 140, i32 %94, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %95 = icmp ne i32 %fi123, 0, !llfi_index !142
  %fi124 = call i1 @injectFault8(i64 141, i1 %95, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi124, label %96, label %97, !llfi_index !143

; <label>:96                                      ; preds = %90
  store i32 1, i32* %fi54, align 4, !llfi_index !144
  br label %113, !llfi_index !145

; <label>:97                                      ; preds = %90
  %98 = load %struct._IO_FILE** %fi17, align 8, !llfi_index !146
  %fi125 = call %struct._IO_FILE* @injectFault9(i64 145, %struct._IO_FILE* %98, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %99 = getelementptr [64 x i8]* %fi57, i32 0, i32 0, !llfi_index !147
  %fi126 = call i8* @injectFault2(i64 146, i8* %99, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %100 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %fi125, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i8* %fi126), !llfi_index !148
  %fi127 = call i32 @injectFault0(i64 147, i32 %100, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %101 = icmp ne i32 %fi127, 1, !llfi_index !149
  %fi128 = call i1 @injectFault8(i64 148, i1 %101, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi128, label %102, label %105, !llfi_index !150

; <label>:102                                     ; preds = %97
  %103 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !151
  %fi129 = call %struct._IO_FILE* @injectFault9(i64 150, %struct._IO_FILE* %103, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %104 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %fi129, i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0)), !llfi_index !152
  %fi130 = call i32 @injectFault0(i64 151, i32 %104, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 0) #5, !llfi_index !153
  unreachable, !llfi_index !154

; <label>:105                                     ; preds = %97
  %106 = getelementptr [64 x i8]* %fi57, i32 0, i32 0, !llfi_index !155
  %fi131 = call i8* @injectFault2(i64 154, i8* %106, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %107 = call %struct._IO_FILE* @fopen(i8* %fi131, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !llfi_index !156
  %fi132 = call %struct._IO_FILE* @injectFault9(i64 155, %struct._IO_FILE* %107, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store %struct._IO_FILE* %fi132, %struct._IO_FILE** %fi18, align 8, !llfi_index !157
  %108 = load %struct._IO_FILE** %fi18, align 8, !llfi_index !158
  %fi133 = call %struct._IO_FILE* @injectFault9(i64 157, %struct._IO_FILE* %108, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %109 = icmp ne %struct._IO_FILE* %fi133, null, !llfi_index !159
  %fi134 = call i1 @injectFault8(i64 158, i1 %109, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi134, label %112, label %110, !llfi_index !160

; <label>:110                                     ; preds = %105
  %111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0)), !llfi_index !161
  %fi135 = call i32 @injectFault0(i64 160, i32 %111, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  call void @exit(i32 1) #5, !llfi_index !162
  unreachable, !llfi_index !163

; <label>:112                                     ; preds = %105
  br label %113, !llfi_index !164

; <label>:113                                     ; preds = %112, %96
  br label %115, !llfi_index !165

; <label>:114                                     ; preds = %86
  call void @perror(i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0)), !llfi_index !166
  call void @postInjections()
  call void @exit(i32 0) #5, !llfi_index !167
  unreachable, !llfi_index !168

; <label>:115                                     ; preds = %113
  br label %116, !llfi_index !169

; <label>:116                                     ; preds = %115, %79
  store i32 0, i32* %fi19, align 4, !llfi_index !170
  br label %117, !llfi_index !171

; <label>:117                                     ; preds = %153, %116
  %118 = load i32* %fi19, align 4, !llfi_index !172
  %fi136 = call i32 @injectFault0(i64 171, i32 %118, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %119 = load i32* %fi53, align 4, !llfi_index !173
  %fi137 = call i32 @injectFault0(i64 172, i32 %119, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %120 = icmp slt i32 %fi136, %fi137, !llfi_index !174
  %fi138 = call i1 @injectFault8(i64 173, i1 %120, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi138, label %121, label %156, !llfi_index !175

; <label>:121                                     ; preds = %117
  %122 = getelementptr [490 x i8]* %fi55, i32 0, i32 0, !llfi_index !176
  %fi139 = call i8* @injectFault2(i64 175, i8* %122, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %123 = load i32* %fi19, align 4, !llfi_index !177
  %fi140 = call i32 @injectFault0(i64 176, i32 %123, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %124 = mul nsw i32 %fi140, 49, !llfi_index !178
  %fi141 = call i32 @injectFault0(i64 177, i32 %124, i32 12, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @mul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %125 = add nsw i32 %fi141, 28, !llfi_index !179
  %fi142 = call i32 @injectFault0(i64 178, i32 %125, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %126 = sub nsw i32 %fi142, 1, !llfi_index !180
  %fi143 = call i32 @injectFault0(i64 179, i32 %126, i32 10, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @sub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %127 = sext i32 %fi143 to i64, !llfi_index !181
  %fi144 = call i64 @injectFault12(i64 180, i64 %127, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %128 = getelementptr i8* %fi139, i64 %fi144, !llfi_index !182
  %fi145 = call i8* @injectFault2(i64 181, i8* %128, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i8* %fi145, i8** %fi56, align 8, !llfi_index !183
  %129 = load i8** %fi56, align 8, !llfi_index !184
  %fi105 = call i8* @injectFault2(i64 183, i8* %129, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %130 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %fi105, i8* getelementptr inbounds ([6 x i8]* @.str8, i32 0, i32 0), float* %fi5, float* %fi6) #7, !llfi_index !185
  %fi158 = call i32 @injectFault0(i64 184, i32 %130, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %131 = load float* %fi5, align 4, !llfi_index !186
  %fi159 = call float @injectFault11(i64 185, float %131, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %132 = load float* %fi13, align 4, !llfi_index !187
  %fi160 = call float @injectFault11(i64 186, float %132, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %133 = fsub float %fi159, %fi160, !llfi_index !188
  %fi161 = call float @injectFault11(i64 187, float %133, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %134 = load float* %fi5, align 4, !llfi_index !189
  %fi162 = call float @injectFault11(i64 188, float %134, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %135 = load float* %fi13, align 4, !llfi_index !190
  %fi163 = call float @injectFault11(i64 189, float %135, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %136 = fsub float %fi162, %fi163, !llfi_index !191
  %fi164 = call float @injectFault11(i64 190, float %136, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %137 = fmul float %fi161, %fi164, !llfi_index !192
  %fi165 = call float @injectFault11(i64 191, float %137, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %138 = load float* %fi6, align 4, !llfi_index !193
  %fi166 = call float @injectFault11(i64 192, float %138, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %139 = load float* %fi4, align 4, !llfi_index !194
  %fi77 = call float @injectFault11(i64 193, float %139, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %140 = fsub float %fi166, %fi77, !llfi_index !195
  %fi78 = call float @injectFault11(i64 194, float %140, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %141 = load float* %fi6, align 4, !llfi_index !196
  %fi79 = call float @injectFault11(i64 195, float %141, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %142 = load float* %fi4, align 4, !llfi_index !197
  %fi80 = call float @injectFault11(i64 196, float %142, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %143 = fsub float %fi79, %fi80, !llfi_index !198
  %fi81 = call float @injectFault11(i64 197, float %143, i32 11, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fsub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %144 = fmul float %fi78, %fi81, !llfi_index !199
  %fi82 = call float @injectFault11(i64 198, float %144, i32 13, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fmul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %145 = fadd float %fi165, %fi82, !llfi_index !200
  %fi83 = call float @injectFault11(i64 199, float %145, i32 9, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fadd_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %146 = fpext float %fi83 to double, !llfi_index !201
  %fi84 = call double @injectFault10(i64 200, double %146, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %147 = call double @sqrt(double %fi84) #7, !llfi_index !202
  %fi85 = call double @injectFault10(i64 201, double %147, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %148 = fptrunc double %fi85 to float, !llfi_index !203
  %fi86 = call float @injectFault11(i64 202, float %148, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %149 = load i32* %fi19, align 4, !llfi_index !204
  %fi87 = call i32 @injectFault0(i64 203, i32 %149, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %150 = sext i32 %fi87 to i64, !llfi_index !205
  %fi88 = call i64 @injectFault12(i64 204, i64 %150, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %151 = load float** %fi7, align 8, !llfi_index !206
  %fi89 = call float* @injectFault3(i64 205, float* %151, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %152 = getelementptr float* %fi89, i64 %fi88, !llfi_index !207
  %fi90 = call float* @injectFault3(i64 206, float* %152, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi86, float* %fi90, align 4, !llfi_index !208
  br label %153, !llfi_index !209

; <label>:153                                     ; preds = %121
  %154 = load i32* %fi19, align 4, !llfi_index !210
  %fi91 = call i32 @injectFault0(i64 209, i32 %154, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %155 = add nsw i32 %fi91, 1, !llfi_index !211
  %fi92 = call i32 @injectFault0(i64 210, i32 %155, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi92, i32* %fi19, align 4, !llfi_index !212
  br label %117, !llfi_index !213

; <label>:156                                     ; preds = %117
  store i32 0, i32* %fi19, align 4, !llfi_index !214
  br label %157, !llfi_index !215

; <label>:157                                     ; preds = %234, %156
  %158 = load i32* %fi19, align 4, !llfi_index !216
  %fi93 = call i32 @injectFault0(i64 215, i32 %158, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %159 = load i32* %fi53, align 4, !llfi_index !217
  %fi94 = call i32 @injectFault0(i64 216, i32 %159, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %160 = icmp slt i32 %fi93, %fi94, !llfi_index !218
  %fi95 = call i1 @injectFault8(i64 217, i1 %160, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi95, label %161, label %237, !llfi_index !219

; <label>:161                                     ; preds = %157
  store float -1.000000e+00, float* %fi8, align 4, !llfi_index !220
  store i32 0, i32* %fi9, align 4, !llfi_index !221
  store i32 0, i32* %fi51, align 4, !llfi_index !222
  br label %162, !llfi_index !223

; <label>:162                                     ; preds = %186, %161
  %163 = load i32* %fi51, align 4, !llfi_index !224
  %fi96 = call i32 @injectFault0(i64 223, i32 %163, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %164 = load i32* %fi52, align 4, !llfi_index !225
  %fi97 = call i32 @injectFault0(i64 224, i32 %164, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %165 = icmp slt i32 %fi96, %fi97, !llfi_index !226
  %fi98 = call i1 @injectFault8(i64 225, i1 %165, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi98, label %166, label %189, !llfi_index !227

; <label>:166                                     ; preds = %162
  %167 = load i32* %fi51, align 4, !llfi_index !228
  %fi99 = call i32 @injectFault0(i64 227, i32 %167, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %168 = sext i32 %fi99 to i64, !llfi_index !229
  %fi100 = call i64 @injectFault12(i64 228, i64 %168, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %169 = load %struct.neighbor** %fi58, align 8, !llfi_index !230
  %fi101 = call %struct.neighbor* @injectFault16(i64 229, %struct.neighbor* %169, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %170 = getelementptr %struct.neighbor* %fi101, i64 %fi100, !llfi_index !231
  %fi102 = call %struct.neighbor* @injectFault16(i64 230, %struct.neighbor* %170, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %171 = getelementptr %struct.neighbor* %fi102, i32 0, i32 1, !llfi_index !232
  %fi103 = call double* @injectFault17(i64 231, double* %171, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %172 = load double* %fi103, align 8, !llfi_index !233
  %fi104 = call double @injectFault10(i64 232, double %172, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %173 = load float* %fi8, align 4, !llfi_index !234
  %fi167 = call float @injectFault11(i64 233, float %173, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %174 = fpext float %fi167 to double, !llfi_index !235
  %fi168 = call double @injectFault10(i64 234, double %174, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %175 = fcmp ogt double %fi104, %fi168, !llfi_index !236
  %fi169 = call i1 @injectFault8(i64 235, i1 %175, i32 47, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fcmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi169, label %176, label %185, !llfi_index !237

; <label>:176                                     ; preds = %166
  %177 = load i32* %fi51, align 4, !llfi_index !238
  %fi170 = call i32 @injectFault0(i64 237, i32 %177, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %178 = sext i32 %fi170 to i64, !llfi_index !239
  %fi171 = call i64 @injectFault12(i64 238, i64 %178, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %179 = load %struct.neighbor** %fi58, align 8, !llfi_index !240
  %fi172 = call %struct.neighbor* @injectFault16(i64 239, %struct.neighbor* %179, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %180 = getelementptr %struct.neighbor* %fi172, i64 %fi171, !llfi_index !241
  %fi173 = call %struct.neighbor* @injectFault16(i64 240, %struct.neighbor* %180, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %181 = getelementptr %struct.neighbor* %fi173, i32 0, i32 1, !llfi_index !242
  %fi174 = call double* @injectFault17(i64 241, double* %181, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %182 = load double* %fi174, align 8, !llfi_index !243
  %fi175 = call double @injectFault10(i64 242, double %182, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %183 = fptrunc double %fi175 to float, !llfi_index !244
  %fi176 = call float @injectFault11(i64 243, float %183, i32 40, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([8 x i8]* @fptrunc_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store float %fi176, float* %fi8, align 4, !llfi_index !245
  %184 = load i32* %fi51, align 4, !llfi_index !246
  %fi177 = call i32 @injectFault0(i64 245, i32 %184, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi177, i32* %fi9, align 4, !llfi_index !247
  br label %185, !llfi_index !248

; <label>:185                                     ; preds = %176, %166
  br label %186, !llfi_index !249

; <label>:186                                     ; preds = %185
  %187 = load i32* %fi51, align 4, !llfi_index !250
  %fi178 = call i32 @injectFault0(i64 249, i32 %187, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %188 = add nsw i32 %fi178, 1, !llfi_index !251
  %fi179 = call i32 @injectFault0(i64 250, i32 %188, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi179, i32* %fi51, align 4, !llfi_index !252
  br label %162, !llfi_index !253

; <label>:189                                     ; preds = %162
  %190 = load i32* %fi19, align 4, !llfi_index !254
  %fi180 = call i32 @injectFault0(i64 253, i32 %190, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %191 = sext i32 %fi180 to i64, !llfi_index !255
  %fi181 = call i64 @injectFault12(i64 254, i64 %191, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %192 = load float** %fi7, align 8, !llfi_index !256
  %fi182 = call float* @injectFault3(i64 255, float* %192, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %193 = getelementptr float* %fi182, i64 %fi181, !llfi_index !257
  %fi183 = call float* @injectFault3(i64 256, float* %193, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %194 = load float* %fi183, align 4, !llfi_index !258
  %fi184 = call float @injectFault11(i64 257, float %194, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %195 = fpext float %fi184 to double, !llfi_index !259
  %fi185 = call double @injectFault10(i64 258, double %195, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %196 = load i32* %fi9, align 4, !llfi_index !260
  %fi186 = call i32 @injectFault0(i64 259, i32 %196, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %197 = sext i32 %fi186 to i64, !llfi_index !261
  %fi187 = call i64 @injectFault12(i64 260, i64 %197, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %198 = load %struct.neighbor** %fi58, align 8, !llfi_index !262
  %fi188 = call %struct.neighbor* @injectFault16(i64 261, %struct.neighbor* %198, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %199 = getelementptr %struct.neighbor* %fi188, i64 %fi187, !llfi_index !263
  %fi189 = call %struct.neighbor* @injectFault16(i64 262, %struct.neighbor* %199, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %200 = getelementptr %struct.neighbor* %fi189, i32 0, i32 1, !llfi_index !264
  %fi190 = call double* @injectFault17(i64 263, double* %200, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %201 = load double* %fi190, align 8, !llfi_index !265
  %fi191 = call double @injectFault10(i64 264, double %201, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %202 = fcmp olt double %fi185, %fi191, !llfi_index !266
  %fi192 = call i1 @injectFault8(i64 265, i1 %202, i32 47, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fcmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi192, label %203, label %233, !llfi_index !267

; <label>:203                                     ; preds = %189
  %204 = load i32* %fi19, align 4, !llfi_index !268
  %fi193 = call i32 @injectFault0(i64 267, i32 %204, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %205 = add nsw i32 %fi193, 1, !llfi_index !269
  %fi194 = call i32 @injectFault0(i64 268, i32 %205, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %206 = mul nsw i32 %fi194, 49, !llfi_index !270
  %fi195 = call i32 @injectFault0(i64 269, i32 %206, i32 12, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @mul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %207 = sub nsw i32 %fi195, 1, !llfi_index !271
  %fi196 = call i32 @injectFault0(i64 270, i32 %207, i32 10, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @sub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %208 = sext i32 %fi196 to i64, !llfi_index !272
  %fi197 = call i64 @injectFault12(i64 271, i64 %208, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %209 = getelementptr [490 x i8]* %fi55, i32 0, i64 %fi197, !llfi_index !273
  %fi198 = call i8* @injectFault2(i64 272, i8* %209, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i8 0, i8* %fi198, align 1, !llfi_index !274
  %210 = load i32* %fi9, align 4, !llfi_index !275
  %fi199 = call i32 @injectFault0(i64 274, i32 %210, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %211 = sext i32 %fi199 to i64, !llfi_index !276
  %fi200 = call i64 @injectFault12(i64 275, i64 %211, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %212 = load %struct.neighbor** %fi58, align 8, !llfi_index !277
  %fi201 = call %struct.neighbor* @injectFault16(i64 276, %struct.neighbor* %212, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %213 = getelementptr %struct.neighbor* %fi201, i64 %fi200, !llfi_index !278
  %fi202 = call %struct.neighbor* @injectFault16(i64 277, %struct.neighbor* %213, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %214 = getelementptr %struct.neighbor* %fi202, i32 0, i32 0, !llfi_index !279
  %fi203 = call [49 x i8]* @injectFault18(i64 278, [49 x i8]* %214, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %215 = getelementptr [49 x i8]* %fi203, i32 0, i32 0, !llfi_index !280
  %fi204 = call i8* @injectFault2(i64 279, i8* %215, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %216 = getelementptr [490 x i8]* %fi55, i32 0, i32 0, !llfi_index !281
  %fi205 = call i8* @injectFault2(i64 280, i8* %216, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %217 = load i32* %fi19, align 4, !llfi_index !282
  %fi206 = call i32 @injectFault0(i64 281, i32 %217, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %218 = mul nsw i32 %fi206, 49, !llfi_index !283
  %fi207 = call i32 @injectFault0(i64 282, i32 %218, i32 12, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @mul_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %219 = sext i32 %fi207 to i64, !llfi_index !284
  %fi208 = call i64 @injectFault12(i64 283, i64 %219, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %220 = getelementptr i8* %fi205, i64 %fi208, !llfi_index !285
  %fi209 = call i8* @injectFault2(i64 284, i8* %220, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %221 = call i8* @strcpy(i8* %fi204, i8* %fi209) #7, !llfi_index !286
  %fi210 = call i8* @injectFault2(i64 285, i8* %221, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %222 = load i32* %fi19, align 4, !llfi_index !287
  %fi211 = call i32 @injectFault0(i64 286, i32 %222, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %223 = sext i32 %fi211 to i64, !llfi_index !288
  %fi212 = call i64 @injectFault12(i64 287, i64 %223, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %224 = load float** %fi7, align 8, !llfi_index !289
  %fi213 = call float* @injectFault3(i64 288, float* %224, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %225 = getelementptr float* %fi213, i64 %fi212, !llfi_index !290
  %fi214 = call float* @injectFault3(i64 289, float* %225, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %226 = load float* %fi214, align 4, !llfi_index !291
  %fi215 = call float @injectFault11(i64 290, float %226, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %227 = fpext float %fi215 to double, !llfi_index !292
  %fi216 = call double @injectFault10(i64 291, double %227, i32 41, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([6 x i8]* @fpext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %228 = load i32* %fi9, align 4, !llfi_index !293
  %fi217 = call i32 @injectFault0(i64 292, i32 %228, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %229 = sext i32 %fi217 to i64, !llfi_index !294
  %fi218 = call i64 @injectFault12(i64 293, i64 %229, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %230 = load %struct.neighbor** %fi58, align 8, !llfi_index !295
  %fi219 = call %struct.neighbor* @injectFault16(i64 294, %struct.neighbor* %230, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %231 = getelementptr %struct.neighbor* %fi219, i64 %fi218, !llfi_index !296
  %fi220 = call %struct.neighbor* @injectFault16(i64 295, %struct.neighbor* %231, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %232 = getelementptr %struct.neighbor* %fi220, i32 0, i32 1, !llfi_index !297
  %fi221 = call double* @injectFault17(i64 296, double* %232, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store double %fi216, double* %fi221, align 8, !llfi_index !298
  br label %233, !llfi_index !299

; <label>:233                                     ; preds = %203, %189
  br label %234, !llfi_index !300

; <label>:234                                     ; preds = %233
  %235 = load i32* %fi19, align 4, !llfi_index !301
  %fi222 = call i32 @injectFault0(i64 300, i32 %235, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %236 = add nsw i32 %fi222, 1, !llfi_index !302
  %fi223 = call i32 @injectFault0(i64 301, i32 %236, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi223, i32* %fi19, align 4, !llfi_index !303
  br label %157, !llfi_index !304

; <label>:237                                     ; preds = %157
  br label %75, !llfi_index !305

; <label>:238                                     ; preds = %75
  %239 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str10, i32 0, i32 0)), !llfi_index !306
  %fi224 = call %struct._IO_FILE* @injectFault9(i64 305, %struct._IO_FILE* %239, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store %struct._IO_FILE* %fi224, %struct._IO_FILE** %fi10, align 8, !llfi_index !307
  %240 = load %struct._IO_FILE** %fi10, align 8, !llfi_index !308
  %fi225 = call %struct._IO_FILE* @injectFault9(i64 307, %struct._IO_FILE* %240, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %241 = load i32* %fi52, align 4, !llfi_index !309
  %fi226 = call i32 @injectFault0(i64 308, i32 %241, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %242 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %fi225, i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %fi226), !llfi_index !310
  %fi227 = call i32 @injectFault0(i64 309, i32 %242, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %243 = load i32* %fi52, align 4, !llfi_index !311
  %fi228 = call i32 @injectFault0(i64 310, i32 %243, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %244 = sub nsw i32 %fi228, 1, !llfi_index !312
  %fi229 = call i32 @injectFault0(i64 311, i32 %244, i32 10, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @sub_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi229, i32* %fi51, align 4, !llfi_index !313
  br label %245, !llfi_index !314

; <label>:245                                     ; preds = %272, %238
  %246 = load i32* %fi51, align 4, !llfi_index !315
  %fi230 = call i32 @injectFault0(i64 314, i32 %246, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %247 = icmp sge i32 %fi230, 0, !llfi_index !316
  %fi231 = call i1 @injectFault8(i64 315, i1 %247, i32 46, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @icmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi231, label %248, label %275, !llfi_index !317

; <label>:248                                     ; preds = %245
  %249 = load i32* %fi51, align 4, !llfi_index !318
  %fi232 = call i32 @injectFault0(i64 317, i32 %249, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %250 = sext i32 %fi232 to i64, !llfi_index !319
  %fi233 = call i64 @injectFault12(i64 318, i64 %250, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %251 = load %struct.neighbor** %fi58, align 8, !llfi_index !320
  %fi234 = call %struct.neighbor* @injectFault16(i64 319, %struct.neighbor* %251, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %252 = getelementptr %struct.neighbor* %fi234, i64 %fi233, !llfi_index !321
  %fi235 = call %struct.neighbor* @injectFault16(i64 320, %struct.neighbor* %252, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %253 = getelementptr %struct.neighbor* %fi235, i32 0, i32 1, !llfi_index !322
  %fi236 = call double* @injectFault17(i64 321, double* %253, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %254 = load double* %fi236, align 8, !llfi_index !323
  %fi237 = call double @injectFault10(i64 322, double %254, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %255 = fcmp oeq double %fi237, 1.000000e+04, !llfi_index !324
  %fi238 = call i1 @injectFault8(i64 323, i1 %255, i32 47, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @fcmp_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br i1 %fi238, label %271, label %256, !llfi_index !325

; <label>:256                                     ; preds = %248
  %257 = load %struct._IO_FILE** %fi10, align 8, !llfi_index !326
  %fi146 = call %struct._IO_FILE* @injectFault9(i64 325, %struct._IO_FILE* %257, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %258 = load i32* %fi51, align 4, !llfi_index !327
  %fi147 = call i32 @injectFault0(i64 326, i32 %258, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %259 = sext i32 %fi147 to i64, !llfi_index !328
  %fi148 = call i64 @injectFault12(i64 327, i64 %259, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %260 = load %struct.neighbor** %fi58, align 8, !llfi_index !329
  %fi149 = call %struct.neighbor* @injectFault16(i64 328, %struct.neighbor* %260, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %261 = getelementptr %struct.neighbor* %fi149, i64 %fi148, !llfi_index !330
  %fi150 = call %struct.neighbor* @injectFault16(i64 329, %struct.neighbor* %261, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %262 = getelementptr %struct.neighbor* %fi150, i32 0, i32 0, !llfi_index !331
  %fi151 = call [49 x i8]* @injectFault18(i64 330, [49 x i8]* %262, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %263 = getelementptr [49 x i8]* %fi151, i32 0, i32 0, !llfi_index !332
  %fi152 = call i8* @injectFault2(i64 331, i8* %263, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %264 = load i32* %fi51, align 4, !llfi_index !333
  %fi153 = call i32 @injectFault0(i64 332, i32 %264, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %265 = sext i32 %fi153 to i64, !llfi_index !334
  %fi154 = call i64 @injectFault12(i64 333, i64 %265, i32 35, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @sext_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %266 = load %struct.neighbor** %fi58, align 8, !llfi_index !335
  %fi155 = call %struct.neighbor* @injectFault16(i64 334, %struct.neighbor* %266, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %267 = getelementptr %struct.neighbor* %fi155, i64 %fi154, !llfi_index !336
  %fi156 = call %struct.neighbor* @injectFault16(i64 335, %struct.neighbor* %267, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %268 = getelementptr %struct.neighbor* %fi156, i32 0, i32 1, !llfi_index !337
  %fi157 = call double* @injectFault17(i64 336, double* %268, i32 29, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([14 x i8]* @getelementptr_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %269 = load double* %fi157, align 8, !llfi_index !338
  %fi239 = call double @injectFault10(i64 337, double %269, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %270 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %fi146, i8* getelementptr inbounds ([11 x i8]* @.str12, i32 0, i32 0), i8* %fi152, double %fi239), !llfi_index !339
  %fi240 = call i32 @injectFault0(i64 338, i32 %270, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  br label %271, !llfi_index !340

; <label>:271                                     ; preds = %256, %248
  br label %272, !llfi_index !341

; <label>:272                                     ; preds = %271
  %273 = load i32* %fi51, align 4, !llfi_index !342
  %fi241 = call i32 @injectFault0(i64 341, i32 %273, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %274 = add nsw i32 %fi241, -1, !llfi_index !343
  %fi242 = call i32 @injectFault0(i64 342, i32 %274, i32 8, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([4 x i8]* @add_namestr, i32 0, i32 0)), !llfi_injectfault !2
  store i32 %fi242, i32* %fi51, align 4, !llfi_index !344
  br label %245, !llfi_index !345

; <label>:275                                     ; preds = %245
  %276 = load %struct._IO_FILE** %fi10, align 8, !llfi_index !346
  %fi243 = call %struct._IO_FILE* @injectFault9(i64 345, %struct._IO_FILE* %276, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %277 = call i32 @fclose(%struct._IO_FILE* %fi243), !llfi_index !347
  %fi244 = call i32 @injectFault0(i64 346, i32 %277, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %278 = load %struct._IO_FILE** %fi17, align 8, !llfi_index !348
  %fi245 = call %struct._IO_FILE* @injectFault9(i64 347, %struct._IO_FILE* %278, i32 27, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @load_namestr, i32 0, i32 0)), !llfi_injectfault !2
  %279 = call i32 @fclose(%struct._IO_FILE* %fi245), !llfi_index !349
  %fi246 = call i32 @injectFault0(i64 348, i32 %279, i32 49, i32 0, i32 1, i32 0, i8* getelementptr inbounds ([5 x i8]* @call_namestr, i32 0, i32 0)), !llfi_injectfault !2
  call void @postInjections()
  ret i32 0, !llfi_index !350
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

; Function Attrs: nounwind readonly
declare double @atof(i8*) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #4

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #4

declare void @perror(i8*) #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #4

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #4

define i32 @injectFault0(i64, i32, i32, i32, i32, i32, i8*) {
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

define i8** @injectFault1(i64, i8**, i32, i32, i32, i32, i8*) {
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

define i8* @injectFault2(i64, i8*, i32, i32, i32, i32, i8*) {
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

define float* @injectFault3(i64, float*, i32, i32, i32, i32, i8*) {
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

define float** @injectFault4(i64, float**, i32, i32, i32, i32, i8*) {
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

define i32* @injectFault5(i64, i32*, i32, i32, i32, i32, i8*) {
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

define %struct._IO_FILE** @injectFault6(i64, %struct._IO_FILE**, i32, i32, i32, i32, i8*) {
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

define i8*** @injectFault7(i64, i8***, i32, i32, i32, i32, i8*) {
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

define i1 @injectFault8(i64, i1, i32, i32, i32, i32, i8*) {
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

define %struct._IO_FILE* @injectFault9(i64, %struct._IO_FILE*, i32, i32, i32, i32, i8*) {
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

define double @injectFault10(i64, double, i32, i32, i32, i32, i8*) {
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

define float @injectFault11(i64, float, i32, i32, i32, i32, i8*) {
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

define i64 @injectFault12(i64, i64, i32, i32, i32, i32, i8*) {
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

define [490 x i8]* @injectFault13(i64, [490 x i8]*, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca [490 x i8]*
  store [490 x i8]* %1, [490 x i8]** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast [490 x i8]** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load [490 x i8]** %tmploc
  ret [490 x i8]* %updateval
}

define [64 x i8]* @injectFault14(i64, [64 x i8]*, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca [64 x i8]*
  store [64 x i8]* %1, [64 x i8]** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast [64 x i8]** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load [64 x i8]** %tmploc
  ret [64 x i8]* %updateval
}

define %struct.neighbor** @injectFault15(i64, %struct.neighbor**, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca %struct.neighbor**
  store %struct.neighbor** %1, %struct.neighbor*** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast %struct.neighbor*** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load %struct.neighbor*** %tmploc
  ret %struct.neighbor** %updateval
}

define %struct.neighbor* @injectFault16(i64, %struct.neighbor*, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca %struct.neighbor*
  store %struct.neighbor* %1, %struct.neighbor** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast %struct.neighbor** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load %struct.neighbor** %tmploc
  ret %struct.neighbor* %updateval
}

define double* @injectFault17(i64, double*, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca double*
  store double* %1, double** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast double** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load double** %tmploc
  ret double* %updateval
}

define [49 x i8]* @injectFault18(i64, [49 x i8]*, i32, i32, i32, i32, i8*) {
entry:
  %tmploc = alloca [49 x i8]*
  store [49 x i8]* %1, [49 x i8]** %tmploc
  %pre_cond = call i1 @preFunc(i64 %0, i32 %2, i32 %3, i32 %4)
  br i1 %pre_cond, label %inject, label %exit

inject:                                           ; preds = %entry
  %tmploc_cast = bitcast [49 x i8]** %tmploc to i8*
  call void @injectFunc(i64 %0, i32 64, i8* %tmploc_cast, i32 %3, i32 %5, i8* %6)
  br label %exit

exit:                                             ; preds = %inject, %entry
  %updateval = load [49 x i8]** %tmploc
  ret [49 x i8]* %updateval
}

declare void @initInjections()

declare void @postInjections()

declare i1 @preFunc(i64, i32, i32, i32)

declare void @injectFunc(i64, i32, i8*, i32, i32, i8*)

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

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
