import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_display/main.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('load price button should be clickable',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());

    await tester.tap(find.byType(FloatingActionButton));
    await tester.tap(find.byTooltip('Get Price'));
  });

  testWidgets('search input should be clickable', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());
    await tester.tap(find.byType(TextField));
  });
}
