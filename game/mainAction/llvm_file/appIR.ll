; ModuleID = '/home/alexwsl/study/MIPT/llvm-course/game/mainAction/app.c'
source_filename = "/home/alexwsl/study/MIPT/llvm-course/game/mainAction/app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.calc_neighborhood.arr_movement_x = private unnamed_addr constant [8 x i32] [i32 -1, i32 -1, i32 1, i32 1, i32 1, i32 0, i32 1, i32 0], align 16
@__const.calc_neighborhood.arr_movement_y = private unnamed_addr constant [8 x i32] [i32 0, i32 -1, i32 0, i32 -1, i32 -1, i32 0, i32 -1, i32 -1], align 16

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read) uwtable
define dso_local i32 @calc_neighborhood(i32 noundef %0, i32 noundef %1, ptr nocapture noundef readonly %2) local_unnamed_addr #0 {
  br label %5

4:                                                ; preds = %27
  ret i32 %28

5:                                                ; preds = %3, %27
  %6 = phi i64 [ 0, %3 ], [ %29, %27 ]
  %7 = phi i32 [ 0, %3 ], [ %28, %27 ]
  %8 = getelementptr inbounds [8 x i32], ptr @__const.calc_neighborhood.arr_movement_x, i64 0, i64 %6
  %9 = load i32, ptr %8, align 4, !tbaa !5
  %10 = add nsw i32 %9, %0
  %11 = getelementptr inbounds [8 x i32], ptr @__const.calc_neighborhood.arr_movement_y, i64 0, i64 %6
  %12 = load i32, ptr %11, align 4, !tbaa !5
  %13 = add nsw i32 %12, %1
  %14 = icmp sgt i32 %13, -1
  %15 = icmp ult i32 %10, 40
  %16 = select i1 %15, i1 %14, i1 false
  %17 = icmp slt i32 %13, 40
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %27

19:                                               ; preds = %5
  %20 = zext i32 %10 to i64
  %21 = zext i32 %13 to i64
  %22 = getelementptr inbounds [40 x [40 x i32]], ptr %2, i64 0, i64 %20, i64 %21
  %23 = load i32, ptr %22, align 4, !tbaa !5
  %24 = icmp eq i32 %23, 1
  %25 = zext i1 %24 to i32
  %26 = add nsw i32 %7, %25
  br label %27

27:                                               ; preds = %19, %5
  %28 = phi i32 [ %7, %5 ], [ %26, %19 ]
  %29 = add nuw nsw i64 %6, 1
  %30 = icmp eq i64 %29, 32
  br i1 %30, label %4, label %5, !llvm.loop !9
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @fill_next(ptr nocapture noundef %0, ptr nocapture noundef %1) local_unnamed_addr #3 {
  %3 = ptrtoint ptr %1 to i64
  %4 = ptrtoint ptr %0 to i64
  br label %5

5:                                                ; preds = %2, %11
  %6 = phi i64 [ 0, %2 ], [ %12, %11 ]
  %7 = trunc i64 %6 to i32
  br label %8

8:                                                ; preds = %5, %40
  %9 = phi i64 [ 0, %5 ], [ %45, %40 ]
  %10 = trunc i64 %9 to i32
  br label %14

11:                                               ; preds = %40
  %12 = add nuw nsw i64 %6, 1
  %13 = icmp eq i64 %12, 40
  br i1 %13, label %47, label %5, !llvm.loop !11

14:                                               ; preds = %8, %36
  %15 = phi i64 [ %38, %36 ], [ 0, %8 ]
  %16 = phi i32 [ %37, %36 ], [ 0, %8 ]
  %17 = getelementptr inbounds [8 x i32], ptr @__const.calc_neighborhood.arr_movement_x, i64 0, i64 %15
  %18 = load i32, ptr %17, align 4, !tbaa !5
  %19 = add nsw i32 %18, %7
  %20 = getelementptr inbounds [8 x i32], ptr @__const.calc_neighborhood.arr_movement_y, i64 0, i64 %15
  %21 = load i32, ptr %20, align 4, !tbaa !5
  %22 = add nsw i32 %21, %10
  %23 = icmp sgt i32 %22, -1
  %24 = icmp ult i32 %19, 40
  %25 = select i1 %24, i1 %23, i1 false
  %26 = icmp slt i32 %22, 40
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %36

28:                                               ; preds = %14
  %29 = zext i32 %19 to i64
  %30 = zext i32 %22 to i64
  %31 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %29, i64 %30
  %32 = load i32, ptr %31, align 4, !tbaa !5
  %33 = icmp eq i32 %32, 1
  %34 = zext i1 %33 to i32
  %35 = add nsw i32 %16, %34
  br label %36

36:                                               ; preds = %28, %14
  %37 = phi i32 [ %16, %14 ], [ %35, %28 ]
  %38 = add nuw nsw i64 %15, 1
  %39 = icmp eq i64 %38, 32
  br i1 %39, label %40, label %14, !llvm.loop !9

40:                                               ; preds = %36
  %41 = and i32 %37, -2
  %42 = icmp eq i32 %41, 2
  %43 = zext i1 %42 to i32
  %44 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %6, i64 %9
  store i32 %43, ptr %44, align 4
  %45 = add nuw nsw i64 %9, 1
  %46 = icmp eq i64 %45, 40
  br i1 %46, label %11, label %8, !llvm.loop !12

47:                                               ; preds = %11, %86
  %48 = phi i64 [ %87, %86 ], [ 0, %11 ]
  %49 = mul nuw nsw i64 %48, 160
  %50 = add i64 %49, %3
  %51 = add i64 %49, %4
  %52 = sub i64 %51, %50
  %53 = icmp ult i64 %52, 16
  br i1 %53, label %89, label %54

54:                                               ; preds = %47
  %55 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 0
  %56 = load <4 x i32>, ptr %55, align 4, !tbaa !5
  %57 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 0
  store <4 x i32> %56, ptr %57, align 4, !tbaa !5
  %58 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 4
  %59 = load <4 x i32>, ptr %58, align 4, !tbaa !5
  %60 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 4
  store <4 x i32> %59, ptr %60, align 4, !tbaa !5
  %61 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 8
  %62 = load <4 x i32>, ptr %61, align 4, !tbaa !5
  %63 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 8
  store <4 x i32> %62, ptr %63, align 4, !tbaa !5
  %64 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 12
  %65 = load <4 x i32>, ptr %64, align 4, !tbaa !5
  %66 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 12
  store <4 x i32> %65, ptr %66, align 4, !tbaa !5
  %67 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 16
  %68 = load <4 x i32>, ptr %67, align 4, !tbaa !5
  %69 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 16
  store <4 x i32> %68, ptr %69, align 4, !tbaa !5
  %70 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 20
  %71 = load <4 x i32>, ptr %70, align 4, !tbaa !5
  %72 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 20
  store <4 x i32> %71, ptr %72, align 4, !tbaa !5
  %73 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 24
  %74 = load <4 x i32>, ptr %73, align 4, !tbaa !5
  %75 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 24
  store <4 x i32> %74, ptr %75, align 4, !tbaa !5
  %76 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 28
  %77 = load <4 x i32>, ptr %76, align 4, !tbaa !5
  %78 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 28
  store <4 x i32> %77, ptr %78, align 4, !tbaa !5
  %79 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 32
  %80 = load <4 x i32>, ptr %79, align 4, !tbaa !5
  %81 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 32
  store <4 x i32> %80, ptr %81, align 4, !tbaa !5
  %82 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 36
  %83 = load <4 x i32>, ptr %82, align 4, !tbaa !5
  %84 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 36
  store <4 x i32> %83, ptr %84, align 4, !tbaa !5
  br label %86

85:                                               ; preds = %86
  ret void

86:                                               ; preds = %89, %54
  %87 = add nuw nsw i64 %48, 1
  %88 = icmp eq i64 %87, 40
  br i1 %88, label %85, label %47, !llvm.loop !13

89:                                               ; preds = %47, %89
  %90 = phi i64 [ %106, %89 ], [ 0, %47 ]
  %91 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 %90
  %92 = load i32, ptr %91, align 4, !tbaa !5
  %93 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 %90
  store i32 %92, ptr %93, align 4, !tbaa !5
  %94 = or i64 %90, 1
  %95 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 %94
  %96 = load i32, ptr %95, align 4, !tbaa !5
  %97 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 %94
  store i32 %96, ptr %97, align 4, !tbaa !5
  %98 = or i64 %90, 2
  %99 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 %98
  %100 = load i32, ptr %99, align 4, !tbaa !5
  %101 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 %98
  store i32 %100, ptr %101, align 4, !tbaa !5
  %102 = or i64 %90, 3
  %103 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %48, i64 %102
  %104 = load i32, ptr %103, align 4, !tbaa !5
  %105 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %48, i64 %102
  store i32 %104, ptr %105, align 4, !tbaa !5
  %106 = add nuw nsw i64 %90, 4
  %107 = icmp eq i64 %106, 40
  br i1 %107, label %86, label %89, !llvm.loop !14
}

; Function Attrs: nounwind uwtable
define dso_local void @printSquare(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = sext i32 %1 to i64
  %5 = sext i32 %2 to i64
  %6 = getelementptr inbounds [40 x [40 x i32]], ptr %0, i64 0, i64 %4, i64 %5
  %7 = load i32, ptr %6, align 4, !tbaa !5
  %8 = icmp eq i32 %7, 1
  %9 = mul nsw i32 %1, 10
  %10 = mul nsw i32 %2, 10
  %11 = or i32 %10, 1
  %12 = add nsw i32 %10, 2
  %13 = add nsw i32 %10, 3
  %14 = add nsw i32 %10, 4
  %15 = add nsw i32 %10, 5
  %16 = add nsw i32 %10, 6
  %17 = add nsw i32 %10, 7
  %18 = add nsw i32 %10, 8
  %19 = add nsw i32 %10, 9
  br i1 %8, label %20, label %25

20:                                               ; preds = %3, %20
  %21 = phi i32 [ %23, %20 ], [ 0, %3 ]
  %22 = add nsw i32 %21, %9
  tail call void @simPutPixel(i32 noundef %22, i32 noundef %10, i32 noundef 10040012) #6
  tail call void @simPutPixel(i32 noundef %22, i32 noundef %11, i32 noundef 10040012) #6
  tail call void @simPutPixel(i32 noundef %22, i32 noundef %12, i32 noundef 10040012) #6
  tail call void @simPutPixel(i32 noundef %22, i32 noundef %13, i32 noundef 10040012) #6
  tail call void @simPutPixel(i32 noundef %22, i32 noundef %14, i32 noundef 10040012) #6
  tail call void @simPutPixel(i32 noundef %22, i32 noundef %15, i32 noundef 10040012) #6
  tail call void @simPutPixel(i32 noundef %22, i32 noundef %16, i32 noundef 10040012) #6
  tail call void @simPutPixel(i32 noundef %22, i32 noundef %17, i32 noundef 10040012) #6
  tail call void @simPutPixel(i32 noundef %22, i32 noundef %18, i32 noundef 10040012) #6
  tail call void @simPutPixel(i32 noundef %22, i32 noundef %19, i32 noundef 10040012) #6
  %23 = add nuw nsw i32 %21, 1
  %24 = icmp eq i32 %23, 10
  br i1 %24, label %30, label %20, !llvm.loop !16

25:                                               ; preds = %3, %25
  %26 = phi i32 [ %28, %25 ], [ 0, %3 ]
  %27 = add nsw i32 %26, %9
  tail call void @simPutPixel(i32 noundef %27, i32 noundef %10, i32 noundef 0) #6
  tail call void @simPutPixel(i32 noundef %27, i32 noundef %11, i32 noundef 0) #6
  tail call void @simPutPixel(i32 noundef %27, i32 noundef %12, i32 noundef 0) #6
  tail call void @simPutPixel(i32 noundef %27, i32 noundef %13, i32 noundef 0) #6
  tail call void @simPutPixel(i32 noundef %27, i32 noundef %14, i32 noundef 0) #6
  tail call void @simPutPixel(i32 noundef %27, i32 noundef %15, i32 noundef 0) #6
  tail call void @simPutPixel(i32 noundef %27, i32 noundef %16, i32 noundef 0) #6
  tail call void @simPutPixel(i32 noundef %27, i32 noundef %17, i32 noundef 0) #6
  tail call void @simPutPixel(i32 noundef %27, i32 noundef %18, i32 noundef 0) #6
  tail call void @simPutPixel(i32 noundef %27, i32 noundef %19, i32 noundef 0) #6
  %28 = add nuw nsw i32 %26, 1
  %29 = icmp eq i32 %28, 10
  br i1 %29, label %30, label %25, !llvm.loop !17

30:                                               ; preds = %25, %20
  ret void
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #4 {
  %1 = alloca [40 x [40 x i32]], align 16
  %2 = alloca [40 x [40 x i32]], align 16
  call void @llvm.lifetime.start.p0(i64 6400, ptr nonnull %1) #6
  call void @llvm.lifetime.start.p0(i64 6400, ptr nonnull %2) #6
  br label %3

3:                                                ; preds = %0, %5
  %4 = phi i64 [ 0, %0 ], [ %6, %5 ]
  br label %8

5:                                                ; preds = %8
  %6 = add nuw nsw i64 %4, 1
  %7 = icmp eq i64 %6, 40
  br i1 %7, label %17, label %3, !llvm.loop !18

8:                                                ; preds = %3, %8
  %9 = phi i64 [ 0, %3 ], [ %15, %8 ]
  %10 = tail call i32 (...) @simRand() #6
  %11 = srem i32 %10, 100
  %12 = icmp slt i32 %11, 1
  %13 = zext i1 %12 to i32
  %14 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %4, i64 %9
  store i32 %13, ptr %14, align 4
  %15 = add nuw nsw i64 %9, 1
  %16 = icmp eq i64 %15, 40
  br i1 %16, label %5, label %8, !llvm.loop !19

17:                                               ; preds = %5, %31
  %18 = phi i32 [ %32, %31 ], [ 0, %5 ]
  br label %20

19:                                               ; preds = %31
  call void @llvm.lifetime.end.p0(i64 6400, ptr nonnull %2) #6
  call void @llvm.lifetime.end.p0(i64 6400, ptr nonnull %1) #6
  ret void

20:                                               ; preds = %17, %67
  %21 = phi i32 [ 0, %17 ], [ %68, %67 ]
  br label %70

22:                                               ; preds = %67, %28
  %23 = phi i64 [ %29, %28 ], [ 0, %67 ]
  %24 = trunc i64 %23 to i32
  br label %25

25:                                               ; preds = %60, %22
  %26 = phi i64 [ 0, %22 ], [ %65, %60 ]
  %27 = trunc i64 %26 to i32
  br label %34

28:                                               ; preds = %60
  %29 = add nuw nsw i64 %23, 1
  %30 = icmp eq i64 %29, 40
  br i1 %30, label %31, label %22, !llvm.loop !11

31:                                               ; preds = %28
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(6400) %1, ptr noundef nonnull align 16 dereferenceable(6400) %2, i64 6400, i1 false), !tbaa !5
  tail call void (...) @simFlush() #6
  %32 = add nuw nsw i32 %18, 1
  %33 = icmp eq i32 %32, 1000
  br i1 %33, label %19, label %17, !llvm.loop !20

34:                                               ; preds = %56, %25
  %35 = phi i64 [ %58, %56 ], [ 0, %25 ]
  %36 = phi i32 [ %57, %56 ], [ 0, %25 ]
  %37 = getelementptr inbounds [8 x i32], ptr @__const.calc_neighborhood.arr_movement_x, i64 0, i64 %35
  %38 = load i32, ptr %37, align 4, !tbaa !5
  %39 = add nsw i32 %38, %24
  %40 = getelementptr inbounds [8 x i32], ptr @__const.calc_neighborhood.arr_movement_y, i64 0, i64 %35
  %41 = load i32, ptr %40, align 4, !tbaa !5
  %42 = add nsw i32 %41, %27
  %43 = icmp sgt i32 %42, -1
  %44 = icmp ult i32 %39, 40
  %45 = select i1 %44, i1 %43, i1 false
  %46 = icmp slt i32 %42, 40
  %47 = select i1 %45, i1 %46, i1 false
  br i1 %47, label %48, label %56

48:                                               ; preds = %34
  %49 = zext i32 %39 to i64
  %50 = zext i32 %42 to i64
  %51 = getelementptr inbounds [40 x [40 x i32]], ptr %1, i64 0, i64 %49, i64 %50
  %52 = load i32, ptr %51, align 4, !tbaa !5
  %53 = icmp eq i32 %52, 1
  %54 = zext i1 %53 to i32
  %55 = add nsw i32 %36, %54
  br label %56

56:                                               ; preds = %48, %34
  %57 = phi i32 [ %36, %34 ], [ %55, %48 ]
  %58 = add nuw nsw i64 %35, 1
  %59 = icmp eq i64 %58, 32
  br i1 %59, label %60, label %34, !llvm.loop !9

60:                                               ; preds = %56
  %61 = and i32 %57, -2
  %62 = icmp eq i32 %61, 2
  %63 = zext i1 %62 to i32
  %64 = getelementptr inbounds [40 x [40 x i32]], ptr %2, i64 0, i64 %23, i64 %26
  store i32 %63, ptr %64, align 4
  %65 = add nuw nsw i64 %26, 1
  %66 = icmp eq i64 %65, 40
  br i1 %66, label %28, label %25, !llvm.loop !12

67:                                               ; preds = %70
  %68 = add nuw nsw i32 %21, 1
  %69 = icmp eq i32 %68, 40
  br i1 %69, label %22, label %20, !llvm.loop !21

70:                                               ; preds = %20, %70
  %71 = phi i32 [ 0, %20 ], [ %72, %70 ]
  call void @printSquare(ptr noundef nonnull %1, i32 noundef %71, i32 noundef %21)
  %72 = add nuw nsw i32 %71, 1
  %73 = icmp eq i32 %72, 40
  br i1 %73, label %67, label %70, !llvm.loop !22
}

declare i32 @simRand(...) local_unnamed_addr #5

declare void @simFlush(...) local_unnamed_addr #5

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 16.0.6 (++20231112100455+7cbf1a259152-1~exp1~20231112100542.106)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10, !15}
!15 = !{!"llvm.loop.isvectorized", i32 1}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !10}
!18 = distinct !{!18, !10}
!19 = distinct !{!19, !10}
!20 = distinct !{!20, !10}
!21 = distinct !{!21, !10}
!22 = distinct !{!22, !10}
