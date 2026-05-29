import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/app_assets.dart';

const Duration _confettiStartDelay = Duration(milliseconds: 850);

class ConfettiOverlay extends StatefulWidget {
  const ConfettiOverlay({super.key});

  @override
  State<ConfettiOverlay> createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<ConfettiOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: constraints.maxHeight / 3,
                  child: ClipRect(
                    child: Lottie.asset(
                      AppAssets.confettiLottie,
                      controller: _controller,
                      fit: BoxFit.cover,
                      repeat: false,
                      onLoaded: (composition) {
                        _controller.duration = composition.duration;
                        Future<void>.delayed(_confettiStartDelay, () {
                          if (!mounted) return;
                          if (_controller.isAnimating ||
                              !_controller.isDismissed) {
                            return;
                          }
                          _controller.forward(from: 0);
                        });
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
