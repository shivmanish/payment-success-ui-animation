import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:assignment_flicktv/src/app.dart';
import 'package:assignment_flicktv/src/features/blinkit_money/data/blinkit_money_content.dart';

void main() {
  testWidgets('Blinkit Money screen renders the static end-state',
      (WidgetTester tester) async {
    // Portrait phone — the app locks to portrait at runtime via SystemChrome
    // in main.dart, but tests don't go through that bootstrap so we set the
    // surface explicitly. Matches a typical 360×800 dp device.
    await tester.binding.setSurfaceSize(const Size(360, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const FlickTvApp());

    // Wordmark
    expect(find.text(BlinkitMoneyContent.brandLowercase), findsOneWidget);
    expect(find.text(BlinkitMoneyContent.brandHeadline), findsOneWidget);

    // All three feature titles
    for (final f in BlinkitMoneyContent.features) {
      expect(find.text(f.title), findsOneWidget);
    }

    // CTAs
    expect(find.text(BlinkitMoneyContent.addMoneyLabel), findsOneWidget);
    expect(find.text(BlinkitMoneyContent.giftCardTitle), findsOneWidget);

    // Bottom marquee renders enough repeated copies to fill the row
    expect(find.text(BlinkitMoneyContent.marqueeText), findsWidgets);
  });
}
