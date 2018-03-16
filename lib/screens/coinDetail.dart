import 'package:flutter/material.dart';
import 'package:crypto_display/coin.dart';

class CoinItemDetail extends StatelessWidget {
  final Coin coin;

  CoinItemDetail(Coin coin) : coin = coin;

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Padding(
          padding: const EdgeInsets.all(15.0),
          child: new Container(
              child: new Column(
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Text(coin.name,
                            style: new TextStyle(
                                fontSize: 40.0,
                                color: Colors.grey[600]
                            )),
                        new Text(coin.symbol,
                            style: new TextStyle(
                                fontSize: 35.0,
                                color: Colors.blueGrey
                            )),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child:
                          new Text("\$${coin.priceUsd}",
                            style: new TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text("1 hour: ${coin.change1Hour}%"),
                          new Text("24 hour: ${coin.change24Hour}%"),
                        ]
                    )
                  ]
              )
          ),
        ));
  }
}
