import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';

class HalftoneGlow extends StatelessWidget {
  const HalftoneGlow({super.key, this.heightFraction = 0.45});

  final double heightFraction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenSize.height * heightFraction,
      child: RepaintBoundary(
        child: CustomPaint(
          painter: _HalftoneGlowPainter(color: context.palette.haloGold),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class _HalftoneGlowPainter extends CustomPainter {
  _HalftoneGlowPainter({required this.color});

  final Color color;

  static const _dotSpacing = 14.0;
  static const _maxDotRadius = 2.2;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, 0);
    final maxRadius = size.width * 0.85;

    final gradient = RadialGradient(
      center: Alignment.topCenter,
      radius: 0.85,
      colors: [
        color.withValues(alpha: 0.55),
        color.withValues(alpha: 0.0),
      ],
    );
    final rect = Offset.zero & size;
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));

    final dotPaint = Paint()..blendMode = BlendMode.screen;
    for (double y = 0; y < size.height; y += _dotSpacing) {
      for (double x = 0; x < size.width; x += _dotSpacing) {
        final dx = x - center.dx;
        final dy = y - center.dy;
        final distance = math.sqrt(dx * dx + dy * dy);
        if (distance > maxRadius) continue;

        final falloff = 1.0 - (distance / maxRadius);
        final radius = _maxDotRadius * falloff;
        if (radius < 0.3) continue;

        dotPaint.color = color.withValues(alpha: 0.6 * falloff);
        canvas.drawCircle(Offset(x, y), radius, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _HalftoneGlowPainter oldDelegate) =>
      oldDelegate.color != color;
}
