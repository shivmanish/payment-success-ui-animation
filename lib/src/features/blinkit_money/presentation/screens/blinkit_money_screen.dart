import 'package:flutter/material.dart';

import '../../../../core/constants/app_durations.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../presentation/atoms/circle_icon_button.dart';
import '../../../../presentation/atoms/pill_button.dart';
import '../../../../presentation/molecules/feature_highlight_card.dart';
import '../../data/blinkit_money_content.dart';
import '../widgets/claim_gift_card_row.dart';
import '../widgets/confetti_overlay.dart';
import '../widgets/halftone_glow.dart';
import '../widgets/wallet_hero.dart';

class BlinkitMoneyScreen extends StatefulWidget {
  const BlinkitMoneyScreen({super.key});

  @override
  State<BlinkitMoneyScreen> createState() => _BlinkitMoneyScreenState();
}

class _BlinkitMoneyScreenState extends State<BlinkitMoneyScreen>
    with SingleTickerProviderStateMixin {
  static const double _marqueeReserve = 64;
  static const double _heroCenterOffset = 200;
  static const double _walletDropOffset = -30;

  late final AnimationController _intro = AnimationController(
    vsync: this,
    duration: AppDurations.intro,
  )..forward();

  late final _walletDrop = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.walletDrop,
  );
  late final _haloFade = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.haloFadeIn,
  );
  late final _blinkit = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.blinkitReveal,
  );
  late final _money = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.moneyReveal,
  );
  late final _dock = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.logoDock,
  );
  late final _card1 = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.card1Reveal,
  );
  late final _card2 = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.card2Reveal,
  );
  late final _card3 = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.card3Reveal,
  );
  late final _settings = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.settingsFadeIn,
  );
  late final _addMoney = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.addMoneyReveal,
  );
  late final _giftCard = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.claimGiftCardReveal,
  );
  late final _marquee = CurvedAnimation(
    parent: _intro,
    curve: AppDurations.marqueeFadeIn,
  );

  @override
  void dispose() {
    for (final a in [
      _walletDrop,
      _haloFade,
      _blinkit,
      _money,
      _dock,
      _card1,
      _card2,
      _card3,
      _settings,
      _addMoney,
      _giftCard,
      _marquee,
    ]) {
      a.dispose();
    }
    _intro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _FadeIn(animation: _haloFade, child: const HalftoneGlow()),
          ),
          const ConfettiOverlay(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: _FadeIn(animation: _marquee, child: bottomText()),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, _marqueeReserve),
              child: Column(
                children: [
                  _TopChrome(settingsAnim: _settings),
                  const SizedBox(height: 8),
                  _HeroGroup(
                    walletDrop: _walletDrop,
                    blinkit: _blinkit,
                    money: _money,
                    dock: _dock,
                    centerOffset: _heroCenterOffset,
                    walletDropOffset: _walletDropOffset,
                  ),
                  const SizedBox(height: 24),
                  _RevealUp(
                    animation: _card1,
                    distance: 32,
                    child: FeatureHighlightCard(
                      feature: BlinkitMoneyContent.features[0],
                    ),
                  ),
                  const SizedBox(height: 12),
                  _RevealUp(
                    animation: _card2,
                    distance: 32,
                    child: FeatureHighlightCard(
                      feature: BlinkitMoneyContent.features[1],
                    ),
                  ),
                  const SizedBox(height: 12),
                  _RevealUp(
                    animation: _card3,
                    distance: 32,
                    child: FeatureHighlightCard(
                      feature: BlinkitMoneyContent.features[2],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _RevealUp(
                    animation: _addMoney,
                    distance: 40,
                    child: PillButton(
                      label: BlinkitMoneyContent.addMoneyLabel,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 24),
                  _RevealUp(
                    animation: _giftCard,
                    distance: 24,
                    child: ClaimGiftCardRow(onTap: () {}),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomText() {
    return Text(
      BlinkitMoneyContent.marqueeText,
      style: context.typography.bottomMarquee,
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }
}

class _TopChrome extends StatelessWidget {
  const _TopChrome({required this.settingsAnim});

  final Animation<double> settingsAnim;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleIconButton(
          icon: Icons.arrow_back_ios_new,
          semanticLabel: 'Back',
          onTap: () => context.popOrIgnore(),
        ),
        _FadeIn(
          animation: settingsAnim,
          child: CircleIconButton(
            icon: Icons.settings_outlined,
            semanticLabel: 'Settings',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _HeroGroup extends StatelessWidget {
  const _HeroGroup({
    required this.walletDrop,
    required this.blinkit,
    required this.money,
    required this.dock,
    required this.centerOffset,
    required this.walletDropOffset,
  });

  final Animation<double> walletDrop;
  final Animation<double> blinkit;
  final Animation<double> money;
  final Animation<double> dock;
  final double centerOffset;
  final double walletDropOffset;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: dock,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, centerOffset * (1 - dock.value)),
          child: child,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: Listenable.merge([walletDrop, dock]),
            builder: (context, _) {
              final drop = walletDrop.value;
              final d = dock.value;
              final scale = (0.5 + 0.5 * drop) * (1.0 - 0.2 * d);
              final yAdjust = walletDropOffset * (1 - drop);
              return Opacity(
                opacity: drop.clamp(0.0, 1.0),
                child: Transform.translate(
                  offset: Offset(0, yAdjust),
                  child: Transform.scale(
                    scale: scale,
                    child: const WalletHero(),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          _RevealUp(
            animation: blinkit,
            distance: 8,
            child: Text(
              BlinkitMoneyContent.brandLowercase,
              style: context.typography.wordmarkBlinkit,
            ),
          ),
          const SizedBox(height: 4),
          _RevealUp(
            animation: money,
            distance: 16,
            child: Text(
              BlinkitMoneyContent.brandHeadline,
              style: context.typography.wordmarkMoney,
            ),
          ),
        ],
      ),
    );
  }
}

class _RevealUp extends StatelessWidget {
  const _RevealUp({
    required this.animation,
    required this.distance,
    required this.child,
  });

  final Animation<double> animation;
  final double distance;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        final v = animation.value.clamp(0.0, 1.0);
        return Opacity(
          opacity: v,
          child: Transform.translate(
            offset: Offset(0, distance * (1 - v)),
            child: child,
          ),
        );
      },
    );
  }
}

class _FadeIn extends StatelessWidget {
  const _FadeIn({required this.animation, required this.child});

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return Opacity(opacity: animation.value.clamp(0.0, 1.0), child: child);
      },
    );
  }
}
