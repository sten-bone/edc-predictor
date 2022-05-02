; ModuleID = 'DICount_external.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@init_flag = global i32 0, align 4
@instCountList = common global [100000 x i64] zeroinitializer, align 16
@.str = private unnamed_addr constant [30 x i8] c"dynamic-instruction-count.txt\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str2 = private unnamed_addr constant [11 x i8] c"%ld: %lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @profileCount(i64 %llfiIndex) #0 {
  %1 = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %llfiIndex, i64* %1, align 8
  %2 = load i32* @init_flag, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %16

; <label>:4                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %12, %4
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 100000
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100000 x i64]* @instCountList, i32 0, i64 %10
  store i64 0, i64* %11, align 8
  br label %12

; <label>:12                                      ; preds = %8
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %5

; <label>:15                                      ; preds = %5
  store i32 1, i32* @init_flag, align 4
  br label %16

; <label>:16                                      ; preds = %15, %0
  %17 = load i64* %1, align 8
  %18 = getelementptr inbounds [100000 x i64]* @instCountList, i32 0, i64 %17
  %19 = load i64* %18, align 8
  %20 = add nsw i64 %19, 1
  store i64 %20, i64* %18, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @dumpResult() #0 {
  %f = alloca %struct._IO_FILE*, align 8
  %i = alloca i64, align 8
  %1 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([30 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  store %struct._IO_FILE* %1, %struct._IO_FILE** %f, align 8
  store i64 0, i64* %i, align 8
  br label %2

; <label>:2                                       ; preds = %18, %0
  %3 = load i64* %i, align 8
  %4 = icmp slt i64 %3, 100000
  br i1 %4, label %5, label %21

; <label>:5                                       ; preds = %2
  %6 = load i64* %i, align 8
  %7 = getelementptr inbounds [100000 x i64]* @instCountList, i32 0, i64 %6
  %8 = load i64* %7, align 8
  %9 = icmp ne i64 %8, 0
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %5
  %11 = load %struct._IO_FILE** %f, align 8
  %12 = load i64* %i, align 8
  %13 = load i64* %i, align 8
  %14 = getelementptr inbounds [100000 x i64]* @instCountList, i32 0, i64 %13
  %15 = load i64* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0), i64 %12, i64 %15)
  br label %17

; <label>:17                                      ; preds = %10, %5
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load i64* %i, align 8
  %20 = add nsw i64 %19, 1
  store i64 %20, i64* %i, align 8
  br label %2

; <label>:21                                      ; preds = %2
  %22 = load %struct._IO_FILE** %f, align 8
  %23 = call i32 @fclose(%struct._IO_FILE* %22)
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fclose(%struct._IO_FILE*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
