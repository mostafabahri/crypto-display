import 'package:flutter/material.dart';
import 'package:crypto_display/coin.dart';

class CoinListItem extends StatelessWidget {
  final Coin coin;

  CoinListItem(Coin coin)
      : coin = coin;

  void _onTap(BuildContext context) {
    Scaffold.of(context).showSnackBar(
        new SnackBar(content: new Text(coin.name))
    );
  }

  Icon _decreaseRedIcon() =>
      new Icon(
        Icons.arrow_drop_down,
        color: Colors.red,
      );


  Icon _increaseBlueIcon() =>
      new Icon(
        Icons.arrow_drop_up,
        color: Colors.green,
      );

  @override
  Widget build(BuildContext context) {
    return
      new ListTile(
        leading: new Icon(Icons.local_atm),
        title: new Text(coin.name),
        trailing: coin.change1Hour >= 0
            ? _increaseBlueIcon()
            : _decreaseRedIcon(),
        subtitle: new Text("\$${coin.priceUsd}"),
        onTap: () => _onTap(context),
      );
  }
}
