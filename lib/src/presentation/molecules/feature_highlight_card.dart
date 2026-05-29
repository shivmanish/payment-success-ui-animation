import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../../features/blinkit_money/domain/entities/money_feature.dart';

class FeatureHighlightCard extends StatelessWidget {
  const FeatureHighlightCard({super.key, required this.feature});

  final MoneyFeature feature;

  static const _iconTileSize = 56.0;
  static const _iconAssetSize = 44.0;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final typography = context.typography;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: palette.bgElevated,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: _iconTileSize,
            height: _iconTileSize,
            decoration: BoxDecoration(
              color: palette.iconTileBg,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              feature.iconAsset,
              width: _iconAssetSize,
              height: _iconAssetSize,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(feature.title, style: typography.cardTitle),
                const SizedBox(height: 4),
                Text(feature.subtitle, style: typography.cardSubtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
