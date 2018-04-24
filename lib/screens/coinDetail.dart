import 'package:flutter/material.dart';
import 'package:crypto_display/coin.dart';

class CoinItemDetail extends StatelessWidget {
  final Coin coin;

  CoinItemDetail(Coin coin) : coin = coin;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.black38;
    Color secondaryColor = Colors.blueGrey;

    String rankText() {
      if (coin.rank == 1)
        return '1st';
      else if (coin.rank == 2) return '2nd';
      return '${coin.rank}th';
    }

    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: new Container(
          child: new Column(// top level column
              children: [
        new Row(
          // rank, name, price
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new Column(children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Text('Ranked ${rankText()}'),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // name, symbol
                      children: <Widget>[
                        new Text('${coin.name}'),
                        new Text('${coin.symbol}')
                      ],
                    ) ,
                        ),
                    // new Container(
                    //     width: 10.0,
                    //     height: 20.0,
                    //     decoration: new BoxDecoration(
                    //       border: new Border(left : new BorderSide(color: Colors.black38, width: 2.0))
                    //     ),
                    // ),
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text('${coin.priceUSD} USD'),
                        new Text('${coin.priceBTC} BTC')
                      ],
                    ) // usd and btc price
                  ],
                ),
              ]),
            ),
          ],
        ),
        new Divider(),
        new Row(
          // cap, volume
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Text('Market Cap'),
                new Text('\$${coin.marketCapUSD} USD')
              ],
            ),
            new Column(
              children: <Widget>[
                new Text('Volume'),
                new Text('\$ ${coin.volume24H} USD')
              ],
            ),
          ],
        ),
        new Divider(),
        new Row(
            // percentage changes, supply stat
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Text('1 Hour'),
                      new Text('${coin.change1Hour}%'),
                      new Icon(coin.change1Hour >= 0
                          ? Icons.arrow_upward
                          : Icons.arrow_downward)
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Text('24 Hour'),
                      new Text('${coin.change24Hour}%'),
                      new Icon(coin.change24Hour >= 0
                          ? Icons.arrow_upward
                          : Icons.arrow_downward)
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Text('7 Days'),
                      new Text('${coin.change7Days}%'),
                      new Icon(coin.change7Days >= 0
                          ? Icons.arrow_upward
                          : Icons.arrow_downward)
                    ],
                  )
                ],
              ),
              new Column(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Text('available supply'),
                      new Text('${coin.availableSupply} USD'),
                    ],
                  ), // available supply
                  new Column(
                    children: <Widget>[
                      new Text('total supply'),
                      new Text('${coin.totalSupply} USD'),
                    ],
                  ) // total supply
                ],
              ),
            ]),
        new Divider(),
        new Row(
            // chart(s)
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Placeholder(
                fallbackHeight: 150.0,
              )
            ])
      ])),
    );
  }
}
