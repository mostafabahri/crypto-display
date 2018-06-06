import 'package:flutter/material.dart';
import 'package:crypto_display/models/coin.dart';
import 'package:crypto_display/screens/coinListItem.dart';
import 'package:flutter/foundation.dart';

class CoinList extends StatelessWidget {
  final List<Coin> coinListData;

  CoinList({@required this.coinListData});


  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: coinListData.length > 0 ?
      new ListView(
        children: _listChildren(),
      )
          : new ListView(),
    );
  }

  List<Widget> _listChildren() {
    List<Widget> children = new List<Widget>();
    // (2 * size) because every other item is a divider
    for (int i = 0; i < 2 * coinListData.length - 1; i++) {
      children.add(_RowBuilder(i));
    }
    return children;
  }

  Widget _RowBuilder(int i) {
    if (i.isOdd)
      return new Divider();
    else
      return new CoinListItem(this.coinListData[i ~/ 2]);
  }

}
