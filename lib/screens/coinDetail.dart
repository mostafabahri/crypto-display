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

  Divider _sectionDivider({double height = 30.0}) {
    return new Divider(
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    // Color primaryColor = Colors.grey[800];
    // Color secondaryColor = Colors.black26;

    TextStyle primaryTextStyle = textTheme.title;

    TextStyle secondaryTextStyle = textTheme.body1;

    Widget chartsSection() {
      return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width * 0.80,
            // height: MediaQuery.of(context).size.width * 0.4,
            child: new SimpleTimeSeriesChart.withSampleData(),
          )
        ],
      );
    }

    Widget capVolumeSection() {
      List marketCapWidgets = <Widget>[
        new Text(
          'Market Cap',
          style: primaryTextStyle,
        ),
        new Text(
          '\$${coin.marketCapUSD} USD',
          style: secondaryTextStyle,
        )
      ];
      var volume = <Widget>[
        new Text(
          'Volume',
          style: primaryTextStyle,
        ),
        new Text(
          '\$ ${coin.volume24H} USD',
          style: secondaryTextStyle,
        )
      ];

      return new Row(
        // cap, volume
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // todo : center vertically
          new Flexible(
              child: new Column(
            children: marketCapWidgets,
          )),
          new Flexible(
            child: new Column(children: volume),
          )
        ],
      );
    }

    Widget generalInfoSection() {
      return new Center(
          child: new Row(
        // rank, name, price
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: new Column(children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text(
                    'Ranked ${_rankText(coin.rank)}',
                    style: textTheme.headline
                        .merge(new TextStyle(color: Colors.blueGrey)),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Expanded(
                      flex: 3,
                      child: new Padding(
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
                      )),
                  new Container(
                    width: MediaQuery.of(context).size.width * 0.05,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        border: new Border(
                            left: new BorderSide(
                                color: Colors.black38, width: 2.0))),
                  ),
                  new Flexible(
                      flex: 2,
                      child: new Column(
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
                      )) // usd and btc price
                ],
              ),
            ]),
          ),
        ],
      ));
    }

    Widget changeSupplySection() {
      List priceChangeWidgets = <Widget>[
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
            new Text('${coin.change1Hour}%',
                style: secondaryTextStyle.merge(new TextStyle(
                    color: coin.change1Hour >= 0 ? Colors.green : Colors.red))),
            new Text('${coin.change24Hour}%',
                style: secondaryTextStyle.merge(new TextStyle(
                    color:
                        coin.change24Hour >= 0 ? Colors.green : Colors.red))),
            new Text('${coin.change7Days}%',
                style: secondaryTextStyle.merge(new TextStyle(
                    color: coin.change7Days >= 0 ? Colors.green : Colors.red))),
          ],
        ),
      ];
      return new Row(
          // percentage changes, supply stat
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Flexible(
                child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: priceChangeWidgets,
                ),
              ],
            )),
            new Flexible(
                child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
            )),
          ]);
    }

    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: new Container(
          child: new Column(// top level column
              children: [
        new Flexible(flex: 4, child: new Center(child: generalInfoSection())),
        _sectionDivider(),
        new Flexible(flex: 2, child: capVolumeSection()),
        _sectionDivider(),
        new Flexible(
          flex: 3,
          child: changeSupplySection(),
        ),
        _sectionDivider(),
        new Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: chartsSection(),
        )
      ])),
    );
  }
}
