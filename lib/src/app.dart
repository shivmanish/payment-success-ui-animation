import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/blinkit_money/presentation/screens/blinkit_money_screen.dart';

class FlickTvApp extends StatelessWidget {
  const FlickTvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manish Sharma',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const BlinkitMoneyScreen(),
    );
  }
}
