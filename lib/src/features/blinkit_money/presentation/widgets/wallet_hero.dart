import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';

class WalletHero extends StatelessWidget {
  const WalletHero({
    super.key,
    this.size = 140,
    this.restingAngleRadians = -0.226,
  });

  final double size;
  final double restingAngleRadians;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: restingAngleRadians,
      child: Image.asset(
        AppAssets.walletHero,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
