import 'package:flutter/foundation.dart';

@immutable
class MoneyFeature {
  const MoneyFeature({
    required this.iconAsset,
    required this.title,
    required this.subtitle,
  });

  final String iconAsset;
  final String title;
  final String subtitle;
}
