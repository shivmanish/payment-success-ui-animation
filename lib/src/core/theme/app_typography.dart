import 'package:flutter/material.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.wordmarkBlinkit,
    required this.wordmarkMoney,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.primaryButton,
    required this.giftCardTitle,
    required this.giftCardSubtitle,
    required this.bottomMarquee,
  });

  final TextStyle wordmarkBlinkit;
  final TextStyle wordmarkMoney;
  final TextStyle cardTitle;
  final TextStyle cardSubtitle;
  final TextStyle primaryButton;
  final TextStyle giftCardTitle;
  final TextStyle giftCardSubtitle;
  final TextStyle bottomMarquee;

  static const Color _textPrimary = Color(0xFFFFFFFF);
  static const Color _textSecondary = Color(0xFFB5B5B5);
  static const Color _textBrand = Color(0xFFE6E6E6);
  static const Color _textMuted = Color(0xFF5A5A5A);

  static const AppTypography dark = AppTypography(
    wordmarkBlinkit: TextStyle(
      color: _textBrand,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.2,
      height: 1.0,
    ),
    wordmarkMoney: TextStyle(
      color: _textPrimary,
      fontSize: 44,
      fontWeight: FontWeight.w900,
      letterSpacing: 3.5,
      height: 1.0,
    ),
    cardTitle: TextStyle(
      color: _textPrimary,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
    cardSubtitle: TextStyle(
      color: _textSecondary,
      fontSize: 13.5,
      fontWeight: FontWeight.w400,
      height: 1.3,
    ),
    primaryButton: TextStyle(
      color: _textPrimary,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    giftCardTitle: TextStyle(
      color: _textPrimary,
      fontSize: 15.5,
      fontWeight: FontWeight.w600,
    ),
    giftCardSubtitle: TextStyle(
      color: _textSecondary,
      fontSize: 12.5,
      fontWeight: FontWeight.w400,
    ),
    bottomMarquee: TextStyle(
      color: _textMuted,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.1,
    ),
  );

  @override
  AppTypography copyWith({
    TextStyle? wordmarkBlinkit,
    TextStyle? wordmarkMoney,
    TextStyle? cardTitle,
    TextStyle? cardSubtitle,
    TextStyle? primaryButton,
    TextStyle? giftCardTitle,
    TextStyle? giftCardSubtitle,
    TextStyle? bottomMarquee,
  }) {
    return AppTypography(
      wordmarkBlinkit: wordmarkBlinkit ?? this.wordmarkBlinkit,
      wordmarkMoney: wordmarkMoney ?? this.wordmarkMoney,
      cardTitle: cardTitle ?? this.cardTitle,
      cardSubtitle: cardSubtitle ?? this.cardSubtitle,
      primaryButton: primaryButton ?? this.primaryButton,
      giftCardTitle: giftCardTitle ?? this.giftCardTitle,
      giftCardSubtitle: giftCardSubtitle ?? this.giftCardSubtitle,
      bottomMarquee: bottomMarquee ?? this.bottomMarquee,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;
    return AppTypography(
      wordmarkBlinkit: TextStyle.lerp(wordmarkBlinkit, other.wordmarkBlinkit, t)!,
      wordmarkMoney: TextStyle.lerp(wordmarkMoney, other.wordmarkMoney, t)!,
      cardTitle: TextStyle.lerp(cardTitle, other.cardTitle, t)!,
      cardSubtitle: TextStyle.lerp(cardSubtitle, other.cardSubtitle, t)!,
      primaryButton: TextStyle.lerp(primaryButton, other.primaryButton, t)!,
      giftCardTitle: TextStyle.lerp(giftCardTitle, other.giftCardTitle, t)!,
      giftCardSubtitle:
          TextStyle.lerp(giftCardSubtitle, other.giftCardSubtitle, t)!,
      bottomMarquee: TextStyle.lerp(bottomMarquee, other.bottomMarquee, t)!,
    );
  }
}
