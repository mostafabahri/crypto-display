import 'package:flutter/material.dart';
import 'package:crypto_display/models/coin.dart';
import 'package:crypto_display/screens/coinChart.dart';

String _rankText(rank) {
  if (rank == 1)
    return '1st';
  else if (rank == 2)
    return '2nd';
  else if (rank == 3) return '3rd';
  return '${rank}th';
}

class CoinItemDetail extends StatelessWidget {
  final Coin coin;

  CoinItemDetail(Coin coin) : coin = coin;

  Divider _rowDivider() {
    return new Divider(
      height: 45.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.grey[800];
    Color secondaryColor = Colors.black26;

    TextStyle primaryTextStyle =
        new TextStyle(color: primaryColor, fontSize: 30.0);

    TextStyle secondaryTextStyle =
        new TextStyle(color: secondaryColor, fontSize: 22.0);

    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
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
                    new Text(
                      'Ranked ${_rankText(coin.rank)}',
                      style:
                          new TextStyle(fontSize: 20.0, color: Colors.blueGrey),
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // name, symbol
                        children: <Widget>[
                          new Text(
                            '${coin.name}',
                            style: primaryTextStyle,
                          ),
                          new Text(
                            '${coin.symbol}',
                            style: secondaryTextStyle,
                          )
                        ],
                      ),
                    ),
                    new Container(
                      width: 10.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                          border: new Border(
                              left: new BorderSide(
                                  color: Colors.black38, width: 2.0))),
                    ),
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          '${coin.priceUSD} USD',
                          style: primaryTextStyle,
                        ),
                        new Text(
                          '${coin.priceBTC} BTC',
                          style: secondaryTextStyle,
                        )
                      ],
                    ) // usd and btc price
                  ],
                ),
              ]),
            ),
          ],
        ),
        _rowDivider(),
        new Row(
          // cap, volume
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Text(
                  'Market Cap',
                  style: primaryTextStyle,
                ),
                new Text(
                  '\$${coin.marketCapUSD} USD',
                  style: secondaryTextStyle,
                )
              ],
            ),
            new Column(
              children: <Widget>[
                new Text(
                  'Volume',
                  style: primaryTextStyle,
                ),
                new Text(
                  '\$ ${coin.volume24H} USD',
                  style: secondaryTextStyle,
                )
              ],
            ),
          ],
        ),
        _rowDivider(),
        new Row(
            // percentage changes, supply stat
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        '1 Hour',
                        style: secondaryTextStyle,
                      ),
                      new Text(
                        '24 Hour',
                        style: secondaryTextStyle,
                      ),
                      new Text(
                        '7 Days',
                        style: secondaryTextStyle,
                      ),
                    ],
                  ),
                  new Container(
                    width: 15.0,
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        '${coin.change1Hour}%',
                        style: secondaryTextStyle,
                      ),
                      new Text(
                        '${coin.change24Hour}%',
                        style: secondaryTextStyle,
                      ),
                      new Text(
                        '${coin.change7Days}%',
                        style: secondaryTextStyle,
                      ),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Icon(coin.change1Hour >= 0
                          ? Icons.arrow_upward
                          : Icons.arrow_downward),
                      new Icon(coin.change24Hour >= 0
                          ? Icons.arrow_upward
                          : Icons.arrow_downward),
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
                      new Text(
                        'available supply',
                        style: primaryTextStyle,
                      ),
                      new Text(
                        '${coin.availableSupply} USD',
                        style: secondaryTextStyle,
                      ),
                    ],
                  ), // available supply
                  new Column(
                    children: <Widget>[
                      new Text(
                        'total supply',
                        style: primaryTextStyle,
                      ),
                      new Text(
                        '${coin.totalSupply} USD',
                        style: secondaryTextStyle,
                      ),
                    ],
                  ) // total supply
                ],
              ),
            ]),
        _rowDivider(),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: 300.0,
              width: 600.0,
              child: new SimpleTimeSeriesChart.withSampleData(),
            )
          ],
        ),
      ])),
    );
  }
}
