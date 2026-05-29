import '../../../core/constants/app_assets.dart';
import '../domain/entities/money_feature.dart';

class BlinkitMoneyContent {
  BlinkitMoneyContent._();

  static const String brandLowercase = 'blinkit';
  static const String brandHeadline = 'MONEY';

  static const String addMoneyLabel = 'Add Money';
  static const String giftCardTitle = 'Claim Gift Card';
  static const String giftCardSubtitle =
      'Enter gift card details to claim your gift card';

  static const String marqueeText = 'Enjoy seamless\none tap payments';

  static const List<MoneyFeature> features = [
    MoneyFeature(
      iconAsset: AppAssets.featureTap,
      title: 'Single tap payments',
      subtitle: 'Enjoy seamless payments without the wait for OTPs',
    ),
    MoneyFeature(
      iconAsset: AppAssets.featurePhone,
      title: 'Zero failures',
      subtitle: 'Zero payment failures ensure you never miss an order',
    ),
    MoneyFeature(
      iconAsset: AppAssets.featureRefund,
      title: 'Real-time refunds',
      subtitle: 'No need to wait for refunds. Blinkit Money refunds are instant!',
    ),
  ];
}
