import 'package:flutter_test/flutter_test.dart';

import 'package:crypto_display/main.dart';

void main() {
  testWidgets('app should start', (WidgetTester tester) async {
    tester.pumpWidget(new MyApp());
  });
}