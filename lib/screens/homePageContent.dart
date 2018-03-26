import 'package:crypto_display/coin.dart';
import 'package:crypto_display/screens/coinList.dart';
import 'package:crypto_display/screens/searchInput.dart';
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
  List<Coin> _coinListData;
  List<Coin> _displayCoinList;

  @override
  void initState() {
    super.initState();
    print(widget.coinApiData);

    _coinListData = widget.coinApiData.map(
            (coinJson) => new Coin.fromJson(coinJson)).toList();

    _displayCoinList = _coinListData;
  }

  void onSearchInputChanged(String text) {
    String searchText = text.trim().toLowerCase();

    if (searchText == "") {
      setState(() {
        _displayCoinList = _coinListData;
      });
    } else {
      setState(() {
        _displayCoinList = _coinListData.where((Coin coin) {
          return _searchFilter(coin, searchText);
        }).toList();
      });
    };
  }

  bool _searchFilter(Coin coin, String searchText) {
    return coin.name.toLowerCase().contains(searchText) ||
        coin.symbol.toLowerCase().contains(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new SearchInput(
              onChanged:
              onSearchInputChanged),
          new CoinList(
            coinListData: this._displayCoinList,
          ),
        ],
      ),
    );
  }
}



