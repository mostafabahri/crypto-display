import 'package:crypto_display/coin.dart';
import 'package:crypto_display/screens/coinList.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class HomePageContent extends StatefulWidget {
  final List<Map<String, dynamic>> coinApiData;

  HomePageContent({Key key, @required this.coinApiData})
      : super(key: key);

  @override
  _HomePageContentState createState() => new _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
//  String _searchText;
  List<Coin> _coinListData;

  @override
  void initState() {
    super.initState();
    print(widget.coinApiData);
    _coinListData = widget.coinApiData.map(
            (coinJson) => new Coin.fromJson(coinJson)).toList();
  }

//  void _onSearchInputChanged(String text) {
//    String trimmedText = text.trim();
//    if (trimmedText == "") {
//
//    } else {
//      setState(() {
//
//      });
//    };
//  }

  @override
  Widget build(BuildContext context) {
        return new Center(
          child: new Column(
            children: <Widget>[
              new Placeholder(
                fallbackHeight: 50.0,
              ),
              new CoinList(
                coinListData: this._coinListData,
              ),
            ],
          ),
        );
  }
}



