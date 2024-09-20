; ModuleID = 'app'
source_filename = "builtins-host"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-macosx11.7.1-unknown"

%macho.mach_header_64 = type { i32, i32, i32, i32, i32, i32, i32, i32 }

@_mh_execute_header = weak_odr dso_local local_unnamed_addr global %macho.mach_header_64 undef, align 4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i128, i1 } @llvm.smul.with.overflow.i128(i128, i128) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #0

; Function Attrs: nounwind uwtable
define weak_odr dso_local i32 @__roc_force_setjmp(ptr align 4 %0) local_unnamed_addr #1 {
  %2 = tail call i32 @setjmp(ptr align 4 %0)
  ret i32 %2
}

; Function Attrs: nounwind uwtable
declare i32 @setjmp(ptr align 4) local_unnamed_addr #1

; Function Attrs: noreturn nounwind uwtable
define weak_odr dso_local void @__roc_force_longjmp(ptr align 4 %0, i32 %1) local_unnamed_addr #2 {
  tail call void @longjmp(ptr align 4 %0, i32 %1)
  unreachable
}

; Function Attrs: noreturn nounwind uwtable
declare void @longjmp(ptr align 4, i32) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define weak_odr dso_local i128 @__divti3(i128 %0, i128 %1) local_unnamed_addr #1 {
  %3 = ashr i128 %0, 127
  %4 = ashr i128 %1, 127
  %5 = xor i128 %3, %0
  %6 = sub i128 %5, %3
  %7 = xor i128 %4, %1
  %8 = sub i128 %7, %4
  %9 = tail call fastcc i128 @compiler_rt.udivmod.udivmod__anon_12849(i128 %6, i128 %8, ptr align 16 null)
  %10 = xor i128 %4, %3
  %11 = xor i128 %9, %10
  %12 = sub i128 %11, %10
  ret i128 %12
}

; Function Attrs: nofree nosync nounwind memory(argmem: write) uwtable
define private fastcc i128 @compiler_rt.udivmod.udivmod__anon_12849(i128 %0, i128 %1, ptr writeonly align 16 %2) unnamed_addr #3 {
  %4 = icmp ugt i128 %1, %0
  br i1 %4, label %5, label %6

5:                                                ; preds = %3
  %.not47 = icmp eq ptr %2, null
  br i1 %.not47, label %common.ret, label %8

6:                                                ; preds = %3
  %.sroa.07.0.extract.trunc = trunc i128 %0 to i64
  %.sroa.2.0.extract.shift = lshr i128 %0, 64
  %.sroa.2.0.extract.trunc = trunc i128 %.sroa.2.0.extract.shift to i64
  %.sroa.015.0.extract.trunc = trunc i128 %1 to i64
  %.sroa.216.0.extract.shift = lshr i128 %1, 64
  %.sroa.216.0.extract.trunc = trunc i128 %.sroa.216.0.extract.shift to i64
  %7 = icmp eq i64 %.sroa.216.0.extract.trunc, 0
  br i1 %7, label %9, label %11

common.ret:                                       ; preds = %142, %129, %8, %5
  %common.ret.op = phi i128 [ %.sroa.017.0.insert.insert, %129 ], [ %.sroa.017.0.insert.ext21, %142 ], [ 0, %8 ], [ 0, %5 ]
  ret i128 %common.ret.op

8:                                                ; preds = %5
  store i128 %0, ptr %2, align 16
  br label %common.ret

9:                                                ; preds = %6
  %10 = icmp ult i64 %.sroa.2.0.extract.trunc, %.sroa.015.0.extract.trunc
  br i1 %10, label %24, label %75

11:                                               ; preds = %6
  %12 = tail call i64 @llvm.ctlz.i64(i64 %.sroa.216.0.extract.trunc, i1 true), !range !5
  %13 = trunc i64 %12 to i7
  %14 = tail call i64 @llvm.ctlz.i64(i64 %.sroa.2.0.extract.trunc, i1 false), !range !5
  %15 = trunc i64 %14 to i7
  %16 = sub nuw i7 %13, %15
  %17 = zext i7 %16 to i128
  %18 = shl i128 %1, %17
  %19 = add nuw i7 %16, 1
  %20 = zext i7 %19 to i64
  br label %131

21:                                               ; preds = %compiler_rt.udivmod.divwide__anon_14189.exit60, %compiler_rt.udivmod.divwide__anon_14189.exit
  %.037.i.i52.sink = phi i64 [ %.037.i.i52, %compiler_rt.udivmod.divwide__anon_14189.exit60 ], [ %.037.i.i, %compiler_rt.udivmod.divwide__anon_14189.exit ]
  %.040.i.i59.sink = phi i64 [ %.040.i.i59, %compiler_rt.udivmod.divwide__anon_14189.exit60 ], [ %.040.i.i, %compiler_rt.udivmod.divwide__anon_14189.exit ]
  %.sroa.0.0 = phi i64 [ %128, %compiler_rt.udivmod.divwide__anon_14189.exit60 ], [ %74, %compiler_rt.udivmod.divwide__anon_14189.exit ]
  %.sroa.10.0 = phi i64 [ %76, %compiler_rt.udivmod.divwide__anon_14189.exit60 ], [ 0, %compiler_rt.udivmod.divwide__anon_14189.exit ]
  %22 = shl i64 %.037.i.i52.sink, 32
  %23 = add i64 %.040.i.i59.sink, %22
  %.not46 = icmp eq ptr %2, null
  br i1 %.not46, label %129, label %130

24:                                               ; preds = %9
  %25 = tail call i64 @llvm.ctlz.i64(i64 %.sroa.015.0.extract.trunc, i1 true), !range !5
  %.not.i.i = icmp eq i64 %25, 0
  br i1 %.not.i.i, label %26, label %34

26:                                               ; preds = %34, %24
  %.036.i.i = phi i64 [ %41, %34 ], [ %.sroa.07.0.extract.trunc, %24 ]
  %.035.i.i = phi i64 [ %40, %34 ], [ %.sroa.2.0.extract.trunc, %24 ]
  %.0.i.i = phi i64 [ %35, %34 ], [ %.sroa.015.0.extract.trunc, %24 ]
  %27 = lshr i64 %.0.i.i, 32
  %28 = and i64 %.0.i.i, 4294967295
  %29 = lshr i64 %.036.i.i, 32
  %30 = and i64 %.036.i.i, 4294967295
  %31 = udiv i64 %.035.i.i, %27
  %32 = mul i64 %31, %27
  %33 = sub i64 %.035.i.i, %32
  br label %50

34:                                               ; preds = %24
  %35 = shl i64 %.sroa.015.0.extract.trunc, %25
  %36 = shl i64 %.sroa.2.0.extract.trunc, %25
  %37 = sub nsw i64 0, %25
  %38 = and i64 %37, 63
  %39 = lshr i64 %.sroa.07.0.extract.trunc, %38
  %40 = or i64 %39, %36
  %41 = shl i64 %.sroa.07.0.extract.trunc, %25
  br label %26

42:                                               ; preds = %.critedge.i.i, %52
  %.037.i.i = phi i64 [ %57, %.critedge.i.i ], [ %.1.i.i, %52 ]
  %43 = shl i64 %.035.i.i, 32
  %44 = or i64 %43, %29
  %45 = mul i64 %.037.i.i, %.0.i.i
  %46 = sub i64 %44, %45
  %47 = udiv i64 %46, %27
  %48 = mul i64 %47, %27
  %49 = sub i64 %46, %48
  br label %60

50:                                               ; preds = %.critedge.i.i, %26
  %.038.i.i = phi i64 [ %33, %26 ], [ %58, %.critedge.i.i ]
  %.1.i.i = phi i64 [ %31, %26 ], [ %57, %.critedge.i.i ]
  %51 = icmp ugt i64 %.1.i.i, 4294967295
  br i1 %51, label %.critedge.i.i, label %52

52:                                               ; preds = %50
  %53 = mul nuw i64 %.1.i.i, %28
  %54 = shl nuw i64 %.038.i.i, 32
  %55 = or i64 %54, %29
  %56 = icmp ugt i64 %53, %55
  br i1 %56, label %.critedge.i.i, label %42

.critedge.i.i:                                    ; preds = %52, %50
  %57 = add i64 %.1.i.i, -1
  %58 = add nuw i64 %.038.i.i, %27
  %59 = icmp ugt i64 %58, 4294967295
  br i1 %59, label %42, label %50

60:                                               ; preds = %.critedge2.i.i, %42
  %.141.i.i = phi i64 [ %47, %42 ], [ %67, %.critedge2.i.i ]
  %.139.i.i = phi i64 [ %49, %42 ], [ %68, %.critedge2.i.i ]
  %61 = icmp ugt i64 %.141.i.i, 4294967295
  br i1 %61, label %.critedge2.i.i, label %62

62:                                               ; preds = %60
  %63 = mul nuw i64 %.141.i.i, %28
  %64 = shl nuw i64 %.139.i.i, 32
  %65 = or i64 %64, %30
  %66 = icmp ugt i64 %63, %65
  br i1 %66, label %.critedge2.i.i, label %compiler_rt.udivmod.divwide__anon_14189.exit

.critedge2.i.i:                                   ; preds = %62, %60
  %67 = add i64 %.141.i.i, -1
  %68 = add nuw i64 %.139.i.i, %27
  %69 = icmp ugt i64 %68, 4294967295
  br i1 %69, label %compiler_rt.udivmod.divwide__anon_14189.exit, label %60

compiler_rt.udivmod.divwide__anon_14189.exit:     ; preds = %.critedge2.i.i, %62
  %.040.i.i = phi i64 [ %67, %.critedge2.i.i ], [ %.141.i.i, %62 ]
  %70 = shl i64 %46, 32
  %71 = or i64 %70, %30
  %72 = mul i64 %.040.i.i, %.0.i.i
  %73 = sub i64 %71, %72
  %74 = lshr i64 %73, %25
  br label %21

75:                                               ; preds = %9
  %.sroa.2.0.extract.trunc.frozen = freeze i64 %.sroa.2.0.extract.trunc
  %.sroa.015.0.extract.trunc.frozen = freeze i64 %.sroa.015.0.extract.trunc
  %76 = udiv i64 %.sroa.2.0.extract.trunc.frozen, %.sroa.015.0.extract.trunc.frozen
  %77 = mul i64 %76, %.sroa.015.0.extract.trunc.frozen
  %.decomposed = sub i64 %.sroa.2.0.extract.trunc.frozen, %77
  %78 = tail call i64 @llvm.ctlz.i64(i64 %.sroa.015.0.extract.trunc, i1 false), !range !5
  %79 = and i64 %78, 63
  %.not.i.i48 = icmp eq i64 %79, 0
  br i1 %.not.i.i48, label %80, label %88

80:                                               ; preds = %88, %75
  %.036.i.i49 = phi i64 [ %95, %88 ], [ %.sroa.07.0.extract.trunc, %75 ]
  %.035.i.i50 = phi i64 [ %94, %88 ], [ %.decomposed, %75 ]
  %.0.i.i51 = phi i64 [ %89, %88 ], [ %.sroa.015.0.extract.trunc, %75 ]
  %81 = lshr i64 %.0.i.i51, 32
  %82 = and i64 %.0.i.i51, 4294967295
  %83 = lshr i64 %.036.i.i49, 32
  %84 = and i64 %.036.i.i49, 4294967295
  %85 = udiv i64 %.035.i.i50, %81
  %86 = mul i64 %85, %81
  %87 = sub i64 %.035.i.i50, %86
  br label %104

88:                                               ; preds = %75
  %89 = shl i64 %.sroa.015.0.extract.trunc, %79
  %90 = shl i64 %.decomposed, %79
  %91 = sub nsw i64 0, %78
  %92 = and i64 %91, 63
  %93 = lshr i64 %.sroa.07.0.extract.trunc, %92
  %94 = or i64 %90, %93
  %95 = shl i64 %.sroa.07.0.extract.trunc, %79
  br label %80

96:                                               ; preds = %.critedge.i.i55, %106
  %.037.i.i52 = phi i64 [ %111, %.critedge.i.i55 ], [ %.1.i.i54, %106 ]
  %97 = shl i64 %.035.i.i50, 32
  %98 = or i64 %97, %83
  %99 = mul i64 %.037.i.i52, %.0.i.i51
  %100 = sub i64 %98, %99
  %101 = udiv i64 %100, %81
  %102 = mul i64 %101, %81
  %103 = sub i64 %100, %102
  br label %114

104:                                              ; preds = %.critedge.i.i55, %80
  %.038.i.i53 = phi i64 [ %87, %80 ], [ %112, %.critedge.i.i55 ]
  %.1.i.i54 = phi i64 [ %85, %80 ], [ %111, %.critedge.i.i55 ]
  %105 = icmp ugt i64 %.1.i.i54, 4294967295
  br i1 %105, label %.critedge.i.i55, label %106

106:                                              ; preds = %104
  %107 = mul nuw i64 %.1.i.i54, %82
  %108 = shl nuw i64 %.038.i.i53, 32
  %109 = or i64 %108, %83
  %110 = icmp ugt i64 %107, %109
  br i1 %110, label %.critedge.i.i55, label %96

.critedge.i.i55:                                  ; preds = %106, %104
  %111 = add i64 %.1.i.i54, -1
  %112 = add nuw i64 %.038.i.i53, %81
  %113 = icmp ugt i64 %112, 4294967295
  br i1 %113, label %96, label %104

114:                                              ; preds = %.critedge2.i.i58, %96
  %.141.i.i56 = phi i64 [ %101, %96 ], [ %121, %.critedge2.i.i58 ]
  %.139.i.i57 = phi i64 [ %103, %96 ], [ %122, %.critedge2.i.i58 ]
  %115 = icmp ugt i64 %.141.i.i56, 4294967295
  br i1 %115, label %.critedge2.i.i58, label %116

116:                                              ; preds = %114
  %117 = mul nuw i64 %.141.i.i56, %82
  %118 = shl nuw i64 %.139.i.i57, 32
  %119 = or i64 %118, %84
  %120 = icmp ugt i64 %117, %119
  br i1 %120, label %.critedge2.i.i58, label %compiler_rt.udivmod.divwide__anon_14189.exit60

.critedge2.i.i58:                                 ; preds = %116, %114
  %121 = add i64 %.141.i.i56, -1
  %122 = add nuw i64 %.139.i.i57, %81
  %123 = icmp ugt i64 %122, 4294967295
  br i1 %123, label %compiler_rt.udivmod.divwide__anon_14189.exit60, label %114

compiler_rt.udivmod.divwide__anon_14189.exit60:   ; preds = %.critedge2.i.i58, %116
  %.040.i.i59 = phi i64 [ %121, %.critedge2.i.i58 ], [ %.141.i.i56, %116 ]
  %124 = shl i64 %100, 32
  %125 = or i64 %124, %84
  %126 = mul i64 %.040.i.i59, %.0.i.i51
  %127 = sub i64 %125, %126
  %128 = lshr i64 %127, %79
  br label %21

129:                                              ; preds = %130, %21
  %.sroa.10.0.insert.ext = zext i64 %.sroa.10.0 to i128
  %.sroa.10.0.insert.shift = shl nuw i128 %.sroa.10.0.insert.ext, 64
  %.sroa.017.0.insert.ext = zext i64 %23 to i128
  %.sroa.017.0.insert.insert = or i128 %.sroa.10.0.insert.shift, %.sroa.017.0.insert.ext
  br label %common.ret

130:                                              ; preds = %21
  %.sroa.0.0.insert.ext = zext i64 %.sroa.0.0 to i128
  store i128 %.sroa.0.0.insert.ext, ptr %2, align 16
  br label %129

131:                                              ; preds = %131, %11
  %lsr.iv = phi i64 [ %20, %11 ], [ %lsr.iv.next, %131 ]
  %.04066 = phi i128 [ %18, %11 ], [ %140, %131 ]
  %.04165 = phi i128 [ %0, %11 ], [ %139, %131 ]
  %.sroa.017.164 = phi i64 [ 0, %11 ], [ %137, %131 ]
  %132 = shl i64 %.sroa.017.164, 1
  %133 = xor i128 %.04165, -1
  %134 = add i128 %.04066, %133
  %135 = lshr i128 %134, 127
  %136 = trunc i128 %135 to i64
  %137 = or i64 %132, %136
  %isneg = icmp slt i128 %134, 0
  %138 = select i1 %isneg, i128 %.04066, i128 0
  %139 = sub nuw i128 %.04165, %138
  %140 = lshr i128 %.04066, 1
  %lsr.iv.next = add i64 %lsr.iv, -1
  %exitcond.not = icmp eq i64 %lsr.iv.next, 0
  br i1 %exitcond.not, label %141, label %131

141:                                              ; preds = %131
  %.not = icmp eq ptr %2, null
  br i1 %.not, label %142, label %143

142:                                              ; preds = %143, %141
  %.sroa.017.0.insert.ext21 = zext i64 %137 to i128
  br label %common.ret

143:                                              ; preds = %141
  store i128 %139, ptr %2, align 16
  br label %142
}

; Function Attrs: nounwind uwtable
define weak_odr dso_local i128 @__udivti3(i128 %0, i128 %1) local_unnamed_addr #1 {
  %3 = tail call fastcc i128 @compiler_rt.udivmod.udivmod__anon_12849(i128 %0, i128 %1, ptr align 16 null)
  ret i128 %3
}

; Function Attrs: nounwind uwtable
define weak_odr dso_local i128 @__modti3(i128 %0, i128 %1) local_unnamed_addr #1 {
  %3 = alloca i128, align 16
  %4 = ashr i128 %0, 127
  %5 = xor i128 %4, %0
  %6 = sub i128 %5, %4
  %7 = tail call i128 @llvm.abs.i128(i128 %1, i1 false)
  %8 = call fastcc i128 @compiler_rt.udivmod.udivmod__anon_12849(i128 %6, i128 %7, ptr nonnull align 16 %3)
  %9 = load i128, ptr %3, align 16
  %10 = xor i128 %9, %4
  %11 = sub i128 %10, %4
  ret i128 %11
}

; Function Attrs: nounwind uwtable
define weak_odr dso_local i128 @__muloti4(i128 %0, i128 %1, ptr nonnull align 4 %2) local_unnamed_addr #1 {
  %.fr = freeze i128 %1
  store i32 0, ptr %2, align 4
  %mul = tail call { i128, i1 } @llvm.smul.with.overflow.i128(i128 %0, i128 %.fr)
  %4 = icmp slt i128 %0, 0
  %5 = icmp eq i128 %.fr, -170141183460469231731687303715884105728
  %6 = and i1 %4, %5
  br i1 %6, label %.critedge, label %7

.critedge2:                                       ; preds = %.critedge, %7
  %mul.val = extractvalue { i128, i1 } %mul, 0
  ret i128 %mul.val

7:                                                ; preds = %3
  %mul.ov = extractvalue { i128, i1 } %mul, 1
  br i1 %mul.ov, label %.critedge, label %.critedge2

.critedge:                                        ; preds = %7, %3
  store i32 1, ptr %2, align 4
  br label %.critedge2
}

; Function Attrs: nounwind uwtable
define weak_odr dso_local float @floorf(float %0) local_unnamed_addr #1 {
  %2 = bitcast float %0 to i32
  %3 = lshr i32 %2, 23
  %4 = and i32 %3, 255
  %5 = add nuw nsw i32 %3, 1
  %6 = fcmp oeq float %0, 0.000000e+00
  %7 = icmp ugt i32 %4, 149
  %or.cond = select i1 %6, i1 true, i1 %7
  br i1 %or.cond, label %common.ret, label %8

common.ret:                                       ; preds = %18, %15, %10, %1
  %common.ret.op = phi float [ %23, %18 ], [ %0, %1 ], [ %., %15 ], [ %0, %10 ]
  ret float %common.ret.op

8:                                                ; preds = %1
  %9 = icmp ugt i32 %4, 126
  br i1 %9, label %10, label %15

10:                                               ; preds = %8
  %11 = and i32 %5, 31
  %12 = lshr i32 8388607, %11
  %13 = and i32 %12, %2
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %common.ret, label %18

15:                                               ; preds = %8
  %16 = fadd float %0, 0x4770000000000000
  tail call void asm sideeffect "", "rm"(float %16) #4
  %17 = icmp sgt i32 %2, -1
  %. = select i1 %17, float 0.000000e+00, float -1.000000e+00
  br label %common.ret

18:                                               ; preds = %10
  %19 = fadd float %0, 0x4770000000000000
  tail call void asm sideeffect "", "rm"(float %19) #4
  %.not11 = icmp slt i32 %2, 0
  %20 = select i1 %.not11, i32 %12, i32 0
  %spec.select = add nuw i32 %20, %2
  %21 = ashr i32 -8388608, %11
  %22 = and i32 %spec.select, %21
  %23 = bitcast i32 %22 to float
  br label %common.ret
}

; Function Attrs: nounwind uwtable
define weak_odr dso_local ptr @memcpy(ptr noalias align 1 %0, ptr noalias readonly align 1 %1, i64 %2) local_unnamed_addr #1 {
  %.not = icmp eq i64 %2, 0
  br i1 %.not, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %3
  %4 = load i8, ptr %1, align 1
  store i8 %4, ptr %0, align 1
  %5 = add i64 %2, -1
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %.loopexit, label %iter.check

iter.check:                                       ; preds = %.preheader
  %min.iters.check = icmp ult i64 %2, 9
  br i1 %min.iters.check, label %.lr.ph.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check11 = icmp ult i64 %2, 33
  br i1 %min.iters.check11, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %5, -32
  %uglygep50 = getelementptr i8, ptr %1, i64 17
  %uglygep54 = getelementptr i8, ptr %0, i64 17
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %lsr.iv58 = phi i64 [ %lsr.iv.next59, %vector.body ], [ %n.vec, %vector.ph ]
  %lsr.iv55 = phi ptr [ %uglygep56, %vector.body ], [ %uglygep54, %vector.ph ]
  %lsr.iv51 = phi ptr [ %uglygep52, %vector.body ], [ %uglygep50, %vector.ph ]
  %uglygep57 = getelementptr i8, ptr %lsr.iv55, i64 -16
  %uglygep53 = getelementptr i8, ptr %lsr.iv51, i64 -16
  %wide.load = load <16 x i8>, ptr %uglygep53, align 1
  %wide.load15 = load <16 x i8>, ptr %lsr.iv51, align 1
  store <16 x i8> %wide.load, ptr %uglygep57, align 1
  store <16 x i8> %wide.load15, ptr %lsr.iv55, align 1
  %uglygep52 = getelementptr i8, ptr %lsr.iv51, i64 32
  %uglygep56 = getelementptr i8, ptr %lsr.iv55, i64 32
  %lsr.iv.next59 = add i64 %lsr.iv58, -32
  %7 = icmp eq i64 %lsr.iv.next59, 0
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %5, %n.vec
  br i1 %cmp.n, label %.loopexit, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %ind.end27 = getelementptr i8, ptr %1, i64 %n.vec
  %ind.end24 = getelementptr i8, ptr %0, i64 %n.vec
  %ind.end21 = and i64 %5, 31
  %n.vec.remaining = and i64 %5, 24
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %.lr.ph.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vec.epilog.iter.check, %vector.main.loop.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec19 = and i64 %5, -8
  %ind.end20 = and i64 %5, 7
  %ind.end23 = getelementptr i8, ptr %0, i64 %n.vec19
  %ind.end26 = getelementptr i8, ptr %1, i64 %n.vec19
  %8 = add nuw nsw i64 %vec.epilog.resume.val, 1
  %uglygep43 = getelementptr i8, ptr %1, i64 %8
  %uglygep46 = getelementptr i8, ptr %0, i64 %8
  %9 = sub i64 %vec.epilog.resume.val, %n.vec19
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %lsr.iv49 = phi i64 [ %lsr.iv.next, %vec.epilog.vector.body ], [ %9, %vec.epilog.ph ]
  %lsr.iv47 = phi ptr [ %uglygep48, %vec.epilog.vector.body ], [ %uglygep46, %vec.epilog.ph ]
  %lsr.iv44 = phi ptr [ %uglygep45, %vec.epilog.vector.body ], [ %uglygep43, %vec.epilog.ph ]
  %wide.load33 = load <8 x i8>, ptr %lsr.iv44, align 1
  store <8 x i8> %wide.load33, ptr %lsr.iv47, align 1
  %uglygep45 = getelementptr i8, ptr %lsr.iv44, i64 8
  %uglygep48 = getelementptr i8, ptr %lsr.iv47, i64 8
  %lsr.iv.next = add i64 %lsr.iv49, 8
  %10 = icmp eq i64 %lsr.iv.next, 0
  br i1 %10, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !9

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n29 = icmp eq i64 %5, %n.vec19
  br i1 %cmp.n29, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %vec.epilog.middle.block, %vec.epilog.iter.check, %iter.check
  %.ph = phi i64 [ %ind.end20, %vec.epilog.middle.block ], [ %ind.end21, %vec.epilog.iter.check ], [ %5, %iter.check ]
  %.010.ph = phi ptr [ %ind.end23, %vec.epilog.middle.block ], [ %ind.end24, %vec.epilog.iter.check ], [ %0, %iter.check ]
  %.059.ph = phi ptr [ %ind.end26, %vec.epilog.middle.block ], [ %ind.end27, %vec.epilog.iter.check ], [ %1, %iter.check ]
  %uglygep = getelementptr i8, ptr %.010.ph, i64 1
  %uglygep40 = getelementptr i8, ptr %.059.ph, i64 1
  br label %.lr.ph

.loopexit:                                        ; preds = %.lr.ph, %vec.epilog.middle.block, %middle.block, %.preheader, %3
  ret ptr %0

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %lsr.iv41 = phi ptr [ %uglygep40, %.lr.ph.preheader ], [ %uglygep42, %.lr.ph ]
  %lsr.iv = phi ptr [ %uglygep, %.lr.ph.preheader ], [ %uglygep39, %.lr.ph ]
  %11 = phi i64 [ %13, %.lr.ph ], [ %.ph, %.lr.ph.preheader ]
  %12 = load i8, ptr %lsr.iv41, align 1
  store i8 %12, ptr %lsr.iv, align 1
  %13 = add i64 %11, -1
  %uglygep39 = getelementptr i8, ptr %lsr.iv, i64 1
  %uglygep42 = getelementptr i8, ptr %lsr.iv41, i64 1
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %.loopexit, label %.lr.ph, !llvm.loop !10
}

; Function Attrs: nounwind uwtable
define weak_odr dso_local ptr @memset(ptr align 1 %0, i8 zeroext %1, i64 %2) local_unnamed_addr #1 {
  %.not = icmp eq i64 %2, 0
  br i1 %.not, label %.loopexit, label %iter.check

iter.check:                                       ; preds = %3
  %min.iters.check = icmp ult i64 %2, 8
  br i1 %min.iters.check, label %.preheader.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check6 = icmp ult i64 %2, 32
  br i1 %min.iters.check6, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %2, -32
  %broadcast.splatinsert = insertelement <16 x i8> poison, i8 %1, i64 0
  %broadcast.splat = shufflevector <16 x i8> %broadcast.splatinsert, <16 x i8> poison, <16 x i32> zeroinitializer
  %broadcast.splatinsert8 = insertelement <16 x i8> poison, i8 %1, i64 0
  %broadcast.splat9 = shufflevector <16 x i8> %broadcast.splatinsert8, <16 x i8> poison, <16 x i32> zeroinitializer
  %uglygep26 = getelementptr i8, ptr %0, i64 16
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %lsr.iv30 = phi i64 [ %lsr.iv.next31, %vector.body ], [ %n.vec, %vector.ph ]
  %lsr.iv27 = phi ptr [ %uglygep28, %vector.body ], [ %uglygep26, %vector.ph ]
  %uglygep29 = getelementptr i8, ptr %lsr.iv27, i64 -16
  store <16 x i8> %broadcast.splat, ptr %uglygep29, align 1
  store <16 x i8> %broadcast.splat9, ptr %lsr.iv27, align 1
  %uglygep28 = getelementptr i8, ptr %lsr.iv27, i64 32
  %lsr.iv.next31 = add i64 %lsr.iv30, -32
  %4 = icmp eq i64 %lsr.iv.next31, 0
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %2
  br i1 %cmp.n, label %.loopexit, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %ind.end16 = getelementptr i8, ptr %0, i64 %n.vec
  %ind.end13 = and i64 %2, 31
  %n.vec.remaining = and i64 %2, 24
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %.preheader.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vec.epilog.iter.check, %vector.main.loop.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec11 = and i64 %2, -8
  %ind.end12 = and i64 %2, 7
  %ind.end15 = getelementptr i8, ptr %0, i64 %n.vec11
  %broadcast.splatinsert21 = insertelement <8 x i8> poison, i8 %1, i64 0
  %broadcast.splat22 = shufflevector <8 x i8> %broadcast.splatinsert21, <8 x i8> poison, <8 x i32> zeroinitializer
  %uglygep = getelementptr i8, ptr %0, i64 %vec.epilog.resume.val
  %5 = sub i64 %vec.epilog.resume.val, %n.vec11
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %lsr.iv25 = phi i64 [ %lsr.iv.next, %vec.epilog.vector.body ], [ %5, %vec.epilog.ph ]
  %lsr.iv = phi ptr [ %uglygep24, %vec.epilog.vector.body ], [ %uglygep, %vec.epilog.ph ]
  store <8 x i8> %broadcast.splat22, ptr %lsr.iv, align 1
  %uglygep24 = getelementptr i8, ptr %lsr.iv, i64 8
  %lsr.iv.next = add i64 %lsr.iv25, 8
  %6 = icmp eq i64 %lsr.iv.next, 0
  br i1 %6, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !12

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n18 = icmp eq i64 %n.vec11, %2
  br i1 %cmp.n18, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %vec.epilog.middle.block, %vec.epilog.iter.check, %iter.check
  %.03.ph = phi i64 [ %ind.end12, %vec.epilog.middle.block ], [ %ind.end13, %vec.epilog.iter.check ], [ %2, %iter.check ]
  %.0.ph = phi ptr [ %ind.end15, %vec.epilog.middle.block ], [ %ind.end16, %vec.epilog.iter.check ], [ %0, %iter.check ]
  br label %.preheader

.loopexit:                                        ; preds = %.preheader, %vec.epilog.middle.block, %middle.block, %3
  ret ptr %0

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %.03 = phi i64 [ %7, %.preheader ], [ %.03.ph, %.preheader.preheader ]
  %.0 = phi ptr [ %8, %.preheader ], [ %.0.ph, %.preheader.preheader ]
  store i8 %1, ptr %.0, align 1
  %7 = add i64 %.03, -1
  %8 = getelementptr inbounds i8, ptr %.0, i64 1
  %9 = icmp eq i64 %7, 0
  br i1 %9, label %.loopexit, label %.preheader, !llvm.loop !13
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.abs.i128(i128, i1 immarg) #0

define internal fastcc {} @_mainForHost_c610e85212d0697cb161d4ba431ba63f273feee7dcb7927c9ff5d74ae6cbfa3() !dbg !14 {
entry:
  ret {} zeroinitializer, !dbg !19
}

define void @roc__mainForHost_1_exposed_generic(ptr %0) !dbg !21 {
entry:
  %call = call fastcc {} @_mainForHost_c610e85212d0697cb161d4ba431ba63f273feee7dcb7927c9ff5d74ae6cbfa3(), !dbg !22
  store {} %call, ptr %0, align 1, !dbg !22
  ret void, !dbg !22
}

define void @roc__mainForHost_1_exposed() !dbg !24 {
entry:
  %call = call fastcc {} @_mainForHost_c610e85212d0697cb161d4ba431ba63f273feee7dcb7927c9ff5d74ae6cbfa3(), !dbg !25
  ret void, !dbg !25
}

define i64 @roc__mainForHost_1_exposed_size() !dbg !27 {
entry:
  ret i64 ptrtoint (ptr getelementptr ({}, ptr null, i32 1) to i64), !dbg !28
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nounwind uwtable "frame-pointer"="none" "target-cpu"="generic" "target-features"="-a510,-a65,-a710,-a76,-a78,-a78c,-aes,-aggressive-fma,-alternate-sextload-cvt-f32-pattern,-altnzcv,-am,-amvs,-arith-bcc-fusion,-arith-cbz-fusion,-ascend-store-address,-b16b16,-balance-fp-ops,-bf16,-brbe,-bti,-call-saved-x10,-call-saved-x11,-call-saved-x12,-call-saved-x13,-call-saved-x14,-call-saved-x15,-call-saved-x18,-call-saved-x8,-call-saved-x9,-ccdp,-ccidx,-ccpp,-clrbhb,-cmp-bcc-fusion,-complxnum,-CONTEXTIDREL2,-cortex-r82,-crc,-crypto,-cssc,-custom-cheap-as-move,-d128,-disable-latency-sched-heuristic,-dit,-dotprod,-ecv,-el2vmsa,-el3,+enable-select-opt,+ete,-exynos-cheap-as-move,-f32mm,-f64mm,-fgt,-fix-cortex-a53-835769,-flagm,-fmv,-force-32bit-jump-tables,-fp16fml,+fp-armv8,-fptoint,-fullfp16,-fuse-address,+fuse-adrp-add,+fuse-aes,-fuse-arith-logic,-fuse-crypto-eor,-fuse-csel,-fuse-literals,-harden-sls-blr,-harden-sls-nocomdat,-harden-sls-retbr,-hbc,-hcx,-i8mm,-ite,-jsconv,-lor,-ls64,-lse,-lse128,-lse2,-lsl-fast,-mec,-mops,-mpam,-mte,+neon,-nmi,-no-bti-at-return-twice,-no-neg-immediates,-no-zcz-fp,-nv,-outline-atomics,-pan,-pan-rwv,-pauth,-perfmon,-predictable-select-expensive,-predres,-prfm-slc-target,-rand,-ras,-rasv2,-rcpc,-rcpc3,-rcpc-immo,-rdm,-reserve-x1,-reserve-x10,-reserve-x11,-reserve-x12,-reserve-x13,-reserve-x14,-reserve-x15,-reserve-x18,-reserve-x2,-reserve-x20,-reserve-x21,-reserve-x22,-reserve-x23,-reserve-x24,-reserve-x25,-reserve-x26,-reserve-x27,-reserve-x28,-reserve-x3,-reserve-x30,-reserve-x4,-reserve-x5,-reserve-x6,-reserve-x7,-reserve-x9,-rme,-sb,-sel2,-sha2,-sha3,-slow-misaligned-128store,-slow-paired-128,-slow-strqro-store,-sm4,-sme,-sme2,-sme2p1,-sme-f16f16,-sme-f64f64,-sme-i16i64,-spe,-spe-eef,-specres2,-specrestrict,-ssbs,-strict-align,-sve,-sve2,-sve2-aes,-sve2-bitperm,-sve2-sha3,-sve2-sm4,-sve2p1,-tagged-globals,-the,-tlb-rmi,-tme,-tpidr-el1,-tpidr-el2,-tpidr-el3,-tracev8.4,+trbe,-uaops,-use-experimental-zeroing-pseudos,+use-postra-scheduler,-use-reciprocal-square-root,-use-scalar-inc-vl,-v8.1a,-v8.2a,-v8.3a,-v8.4a,-v8.5a,-v8.6a,-v8.7a,-v8.8a,-v8.9a,-v8a,-v8r,-v9.1a,-v9.2a,-v9.3a,-v9.4a,-v9a,-vh,-wfxt,-xs,-zcm,-zcz,-zcz-fp-workaround,-zcz-gp" }
attributes #2 = { noreturn nounwind uwtable "frame-pointer"="none" "target-cpu"="generic" "target-features"="-a510,-a65,-a710,-a76,-a78,-a78c,-aes,-aggressive-fma,-alternate-sextload-cvt-f32-pattern,-altnzcv,-am,-amvs,-arith-bcc-fusion,-arith-cbz-fusion,-ascend-store-address,-b16b16,-balance-fp-ops,-bf16,-brbe,-bti,-call-saved-x10,-call-saved-x11,-call-saved-x12,-call-saved-x13,-call-saved-x14,-call-saved-x15,-call-saved-x18,-call-saved-x8,-call-saved-x9,-ccdp,-ccidx,-ccpp,-clrbhb,-cmp-bcc-fusion,-complxnum,-CONTEXTIDREL2,-cortex-r82,-crc,-crypto,-cssc,-custom-cheap-as-move,-d128,-disable-latency-sched-heuristic,-dit,-dotprod,-ecv,-el2vmsa,-el3,+enable-select-opt,+ete,-exynos-cheap-as-move,-f32mm,-f64mm,-fgt,-fix-cortex-a53-835769,-flagm,-fmv,-force-32bit-jump-tables,-fp16fml,+fp-armv8,-fptoint,-fullfp16,-fuse-address,+fuse-adrp-add,+fuse-aes,-fuse-arith-logic,-fuse-crypto-eor,-fuse-csel,-fuse-literals,-harden-sls-blr,-harden-sls-nocomdat,-harden-sls-retbr,-hbc,-hcx,-i8mm,-ite,-jsconv,-lor,-ls64,-lse,-lse128,-lse2,-lsl-fast,-mec,-mops,-mpam,-mte,+neon,-nmi,-no-bti-at-return-twice,-no-neg-immediates,-no-zcz-fp,-nv,-outline-atomics,-pan,-pan-rwv,-pauth,-perfmon,-predictable-select-expensive,-predres,-prfm-slc-target,-rand,-ras,-rasv2,-rcpc,-rcpc3,-rcpc-immo,-rdm,-reserve-x1,-reserve-x10,-reserve-x11,-reserve-x12,-reserve-x13,-reserve-x14,-reserve-x15,-reserve-x18,-reserve-x2,-reserve-x20,-reserve-x21,-reserve-x22,-reserve-x23,-reserve-x24,-reserve-x25,-reserve-x26,-reserve-x27,-reserve-x28,-reserve-x3,-reserve-x30,-reserve-x4,-reserve-x5,-reserve-x6,-reserve-x7,-reserve-x9,-rme,-sb,-sel2,-sha2,-sha3,-slow-misaligned-128store,-slow-paired-128,-slow-strqro-store,-sm4,-sme,-sme2,-sme2p1,-sme-f16f16,-sme-f64f64,-sme-i16i64,-spe,-spe-eef,-specres2,-specrestrict,-ssbs,-strict-align,-sve,-sve2,-sve2-aes,-sve2-bitperm,-sve2-sha3,-sve2-sm4,-sve2p1,-tagged-globals,-the,-tlb-rmi,-tme,-tpidr-el1,-tpidr-el2,-tpidr-el3,-tracev8.4,+trbe,-uaops,-use-experimental-zeroing-pseudos,+use-postra-scheduler,-use-reciprocal-square-root,-use-scalar-inc-vl,-v8.1a,-v8.2a,-v8.3a,-v8.4a,-v8.5a,-v8.6a,-v8.7a,-v8.8a,-v8.9a,-v8a,-v8r,-v9.1a,-v9.2a,-v9.3a,-v9.4a,-v9a,-vh,-wfxt,-xs,-zcm,-zcz,-zcz-fp-workaround,-zcz-gp" }
attributes #3 = { nofree nosync nounwind memory(argmem: write) uwtable "frame-pointer"="none" "target-cpu"="generic" "target-features"="-a510,-a65,-a710,-a76,-a78,-a78c,-aes,-aggressive-fma,-alternate-sextload-cvt-f32-pattern,-altnzcv,-am,-amvs,-arith-bcc-fusion,-arith-cbz-fusion,-ascend-store-address,-b16b16,-balance-fp-ops,-bf16,-brbe,-bti,-call-saved-x10,-call-saved-x11,-call-saved-x12,-call-saved-x13,-call-saved-x14,-call-saved-x15,-call-saved-x18,-call-saved-x8,-call-saved-x9,-ccdp,-ccidx,-ccpp,-clrbhb,-cmp-bcc-fusion,-complxnum,-CONTEXTIDREL2,-cortex-r82,-crc,-crypto,-cssc,-custom-cheap-as-move,-d128,-disable-latency-sched-heuristic,-dit,-dotprod,-ecv,-el2vmsa,-el3,+enable-select-opt,+ete,-exynos-cheap-as-move,-f32mm,-f64mm,-fgt,-fix-cortex-a53-835769,-flagm,-fmv,-force-32bit-jump-tables,-fp16fml,+fp-armv8,-fptoint,-fullfp16,-fuse-address,+fuse-adrp-add,+fuse-aes,-fuse-arith-logic,-fuse-crypto-eor,-fuse-csel,-fuse-literals,-harden-sls-blr,-harden-sls-nocomdat,-harden-sls-retbr,-hbc,-hcx,-i8mm,-ite,-jsconv,-lor,-ls64,-lse,-lse128,-lse2,-lsl-fast,-mec,-mops,-mpam,-mte,+neon,-nmi,-no-bti-at-return-twice,-no-neg-immediates,-no-zcz-fp,-nv,-outline-atomics,-pan,-pan-rwv,-pauth,-perfmon,-predictable-select-expensive,-predres,-prfm-slc-target,-rand,-ras,-rasv2,-rcpc,-rcpc3,-rcpc-immo,-rdm,-reserve-x1,-reserve-x10,-reserve-x11,-reserve-x12,-reserve-x13,-reserve-x14,-reserve-x15,-reserve-x18,-reserve-x2,-reserve-x20,-reserve-x21,-reserve-x22,-reserve-x23,-reserve-x24,-reserve-x25,-reserve-x26,-reserve-x27,-reserve-x28,-reserve-x3,-reserve-x30,-reserve-x4,-reserve-x5,-reserve-x6,-reserve-x7,-reserve-x9,-rme,-sb,-sel2,-sha2,-sha3,-slow-misaligned-128store,-slow-paired-128,-slow-strqro-store,-sm4,-sme,-sme2,-sme2p1,-sme-f16f16,-sme-f64f64,-sme-i16i64,-spe,-spe-eef,-specres2,-specrestrict,-ssbs,-strict-align,-sve,-sve2,-sve2-aes,-sve2-bitperm,-sve2-sha3,-sve2-sm4,-sve2p1,-tagged-globals,-the,-tlb-rmi,-tme,-tpidr-el1,-tpidr-el2,-tpidr-el3,-tracev8.4,+trbe,-uaops,-use-experimental-zeroing-pseudos,+use-postra-scheduler,-use-reciprocal-square-root,-use-scalar-inc-vl,-v8.1a,-v8.2a,-v8.3a,-v8.4a,-v8.5a,-v8.6a,-v8.7a,-v8.8a,-v8.9a,-v8a,-v8r,-v9.1a,-v9.2a,-v9.3a,-v9.4a,-v9a,-vh,-wfxt,-xs,-zcm,-zcz,-zcz-fp-workaround,-zcz-gp" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.dbg.cu = !{!3}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DICompileUnit(language: DW_LANG_C, file: !4, producer: "my llvm compiler frontend", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false)
!4 = !DIFile(filename: "roc_app", directory: ".")
!5 = !{i64 0, i64 65}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.isvectorized", i32 1}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !8, !7}
!11 = distinct !{!11, !7, !8}
!12 = distinct !{!12, !7, !8}
!13 = distinct !{!13, !8, !7}
!14 = distinct !DISubprogram(name: "_mainForHost_c610e85212d0697cb161d4ba431ba63f273feee7dcb7927c9ff5d74ae6cbfa3", linkageName: "_mainForHost_c610e85212d0697cb161d4ba431ba63f273feee7dcb7927c9ff5d74ae6cbfa3", scope: !4, file: !4, type: !15, flags: DIFlagPublic, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !18)
!15 = !DISubroutineType(flags: DIFlagPublic, types: !16)
!16 = !{!17}
!17 = !DIBasicType(name: "type_name", flags: DIFlagPublic)
!18 = !{}
!19 = !DILocation(line: 0, scope: !20)
!20 = distinct !DILexicalBlock(scope: !14, file: !4)
!21 = distinct !DISubprogram(name: "roc__mainForHost_1_exposed_generic", linkageName: "roc__mainForHost_1_exposed_generic", scope: !4, file: !4, type: !15, flags: DIFlagPublic, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !18)
!22 = !DILocation(line: 0, scope: !23)
!23 = distinct !DILexicalBlock(scope: !21, file: !4)
!24 = distinct !DISubprogram(name: "roc__mainForHost_1_exposed", linkageName: "roc__mainForHost_1_exposed", scope: !4, file: !4, type: !15, flags: DIFlagPublic, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !18)
!25 = !DILocation(line: 0, scope: !26)
!26 = distinct !DILexicalBlock(scope: !24, file: !4)
!27 = distinct !DISubprogram(name: "roc__mainForHost_1_exposed_size", linkageName: "roc__mainForHost_1_exposed_size", scope: !4, file: !4, type: !15, flags: DIFlagPublic, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !18)
!28 = !DILocation(line: 0, scope: !29)
!29 = distinct !DILexicalBlock(scope: !27, file: !4)
