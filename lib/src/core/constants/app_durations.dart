import 'package:flutter/animation.dart';

class AppDurations {
  AppDurations._();

  static const Duration intro = Duration(milliseconds: 4600);

  static const Interval walletDrop = Interval(
    0.08,
    0.24,
    curve: Curves.easeOutCubic,
  );
  static const Interval haloFadeIn = Interval(
    0.08,
    0.24,
    curve: Curves.easeOutCubic,
  );

  static const Interval blinkitReveal = Interval(
    0.24,
    0.36,
    curve: Curves.easeOutCubic,
  );
  static const Interval moneyReveal = Interval(
    0.34,
    0.48,
    curve: Curves.easeOutCubic,
  );

  static const Interval logoDock = Interval(
    0.51,
    0.66,
    curve: Curves.easeInOutCubic,
  );

  static const Interval card1Reveal = Interval(
    0.65,
    0.76,
    curve: Curves.easeOutCubic,
  );
  static const Interval card2Reveal = Interval(
    0.69,
    0.80,
    curve: Curves.easeOutCubic,
  );
  static const Interval card3Reveal = Interval(
    0.73,
    0.84,
    curve: Curves.easeOutCubic,
  );

  static const Interval settingsFadeIn = Interval(
    0.80,
    0.86,
    curve: Curves.easeOutCubic,
  );
  static const Interval addMoneyReveal = Interval(
    0.85,
    0.93,
    curve: Curves.easeOutCubic,
  );
  static const Interval claimGiftCardReveal = Interval(
    0.85,
    0.93,
    curve: Curves.easeOutCubic,
  );
  static const Interval marqueeFadeIn = Interval(
    0.94,
    1.00,
    curve: Curves.easeOutCubic,
  );

  static const Duration marqueeLoop = Duration(seconds: 8);
}
