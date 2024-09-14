import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';

class CustomThumbShape extends SliderComponentShape {
  final Color checkColor;

  CustomThumbShape({required this.checkColor});
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(18.w, 18.h);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter? labelPainter,
    required RenderBox? parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()..color = checkColor;
    final borderPaint = Paint()
      ..color = MyColors.bgLight
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.w;

    canvas.drawCircle(center, 9.r, paint);
    canvas.drawCircle(center, 9.r, borderPaint);
  }
}
