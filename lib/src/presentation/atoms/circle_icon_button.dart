import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.diameter = 40,
    this.semanticLabel,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final double diameter;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Semantics(
      button: true,
      label: semanticLabel,
      child: ClipOval(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: palette.iconButtonBg,
              border: Border.all(
                color: palette.textPrimary.withValues(alpha: 0.14),
                width: 0.6,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onTap,
                customBorder: const CircleBorder(),
                child: SizedBox(
                  width: diameter,
                  height: diameter,
                  child: Icon(
                    icon,
                    color: palette.textPrimary,
                    size: diameter * 0.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
