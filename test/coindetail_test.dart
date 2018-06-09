import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:crypto_display/models/coin.dart';
import 'package:crypto_display/screens/coinDetail.dart';

void main() {
  testWidgets('CoinDetailItem should render with no errors',
      (WidgetTester tester) async {
    String jsonString =
        '{"id": "bitcoin","name": "Bitcoin","symbol": "BTC","rank": "1","price_usd": "573.137","price_btc": "1.0","24h_volume_usd": "72855700.0","market_cap_usd": "9080883500.0","available_supply": "15844176.0","total_supply": "15844176.0","percent_change_1h": "0.04","percent_change_24h": "-0.3","percent_change_7d": "-0.57","last_updated": "1472762067"}';

    Map<String, dynamic> json = jsonDecode(jsonString);
    Coin coin = new Coin.fromJson(json);

    var widget = new MaterialApp(
        home: new Scaffold(
      body: new CoinItemDetail(coin),
    ));

    await tester.pumpWidget(widget);
  });
}
