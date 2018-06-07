import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_display/main.dart';

void main() {
  testWidgets('app should start with no errors', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());
  });
}
