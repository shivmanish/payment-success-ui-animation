import 'package:flutter/material.dart';

@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.bgBase,
    required this.bgElevated,
    required this.giftCardBg,
    required this.iconTileBg,
    required this.haloGold,
    required this.haloGoldSoft,
    required this.walletYellow,
    required this.walletYellowDark,
    required this.walletGreen,
    required this.walletGreenDark,
    required this.textPrimary,
    required this.textSecondary,
    required this.textBrand,
    required this.textMuted,
    required this.ctaPrimary,
    required this.ctaPrimaryText,
    required this.iconButtonBg,
    required this.confettiPalette,
  });

  final Color bgBase;
  final Color bgElevated;
  final Color giftCardBg;
  final Color iconTileBg;
  final Color haloGold;
  final Color haloGoldSoft;
  final Color walletYellow;
  final Color walletYellowDark;
  final Color walletGreen;
  final Color walletGreenDark;
  final Color textPrimary;
  final Color textSecondary;
  final Color textBrand;
  final Color textMuted;
  final Color ctaPrimary;
  final Color ctaPrimaryText;
  final Color iconButtonBg;
  final List<Color> confettiPalette;

  static const AppPalette dark = AppPalette(
    bgBase: Color(0xFF0F0F11),
    bgElevated: Color(0xFF37373B),
    giftCardBg: Color(0xFF16161A),
    iconTileBg: Color(0xFF111114),
    haloGold: Color(0xFFE8B400),
    haloGoldSoft: Color(0xFF5A4500),
    walletYellow: Color(0xFFF2C200),
    walletYellowDark: Color(0xFFA37A00),
    walletGreen: Color(0xFF1F5E2B),
    walletGreenDark: Color(0xFF0E3318),
    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xFFB5B5B5),
    textBrand: Color(0xFFE6E6E6),
    textMuted: Color(0xFF5A5A5A),
    ctaPrimary: Color(0xFF2C7C18),
    ctaPrimaryText: Color(0xFFFFFFFF),
    iconButtonBg: Color(0x14FFFFFF),
    confettiPalette: [
      Color(0xFFFF4D6D),
      Color(0xFF3DD17F),
      Color(0xFFFFD500),
      Color(0xFF3D8BFE),
      Color(0xFF9C5BFF),
      Color(0xFFFF8A3D),
    ],
  );

  @override
  AppPalette copyWith({
    Color? bgBase,
    Color? bgElevated,
    Color? giftCardBg,
    Color? iconTileBg,
    Color? haloGold,
    Color? haloGoldSoft,
    Color? walletYellow,
    Color? walletYellowDark,
    Color? walletGreen,
    Color? walletGreenDark,
    Color? textPrimary,
    Color? textSecondary,
    Color? textBrand,
    Color? textMuted,
    Color? ctaPrimary,
    Color? ctaPrimaryText,
    Color? iconButtonBg,
    List<Color>? confettiPalette,
  }) {
    return AppPalette(
      bgBase: bgBase ?? this.bgBase,
      bgElevated: bgElevated ?? this.bgElevated,
      giftCardBg: giftCardBg ?? this.giftCardBg,
      iconTileBg: iconTileBg ?? this.iconTileBg,
      haloGold: haloGold ?? this.haloGold,
      haloGoldSoft: haloGoldSoft ?? this.haloGoldSoft,
      walletYellow: walletYellow ?? this.walletYellow,
      walletYellowDark: walletYellowDark ?? this.walletYellowDark,
      walletGreen: walletGreen ?? this.walletGreen,
      walletGreenDark: walletGreenDark ?? this.walletGreenDark,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textBrand: textBrand ?? this.textBrand,
      textMuted: textMuted ?? this.textMuted,
      ctaPrimary: ctaPrimary ?? this.ctaPrimary,
      ctaPrimaryText: ctaPrimaryText ?? this.ctaPrimaryText,
      iconButtonBg: iconButtonBg ?? this.iconButtonBg,
      confettiPalette: confettiPalette ?? this.confettiPalette,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      bgBase: Color.lerp(bgBase, other.bgBase, t)!,
      bgElevated: Color.lerp(bgElevated, other.bgElevated, t)!,
      giftCardBg: Color.lerp(giftCardBg, other.giftCardBg, t)!,
      iconTileBg: Color.lerp(iconTileBg, other.iconTileBg, t)!,
      haloGold: Color.lerp(haloGold, other.haloGold, t)!,
      haloGoldSoft: Color.lerp(haloGoldSoft, other.haloGoldSoft, t)!,
      walletYellow: Color.lerp(walletYellow, other.walletYellow, t)!,
      walletYellowDark: Color.lerp(walletYellowDark, other.walletYellowDark, t)!,
      walletGreen: Color.lerp(walletGreen, other.walletGreen, t)!,
      walletGreenDark: Color.lerp(walletGreenDark, other.walletGreenDark, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textBrand: Color.lerp(textBrand, other.textBrand, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      ctaPrimary: Color.lerp(ctaPrimary, other.ctaPrimary, t)!,
      ctaPrimaryText: Color.lerp(ctaPrimaryText, other.ctaPrimaryText, t)!,
      iconButtonBg: Color.lerp(iconButtonBg, other.iconButtonBg, t)!,
      confettiPalette: t < 0.5 ? confettiPalette : other.confettiPalette,
    );
  }
}
