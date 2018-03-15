import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:crypto_display/coin.dart';
import 'package:crypto_display/screens/coinList.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Crypto Display',
      theme: new ThemeData(
        primaryColor: Colors.grey[300],
      ),
      home: new MyHomePage(
          title: 'Crypto Display'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.subtitle}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title and subtitle) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String subtitle;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List apiData;
  BuildContext snackContext;

  // todo: recurring

  _getPricesFromApi() async {
    var url = 'https://api.coinmarketcap.com/v1/ticker/?limit=12';
//    url = 'https://api.myjson.com/bins/13mpv9';
    var httpClient = new HttpClient();


    List newApiData;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      print("called api...");
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        newApiData = JSON.decode(json);
      }
    } catch (exception) {
      Scaffold.of(snackContext).showSnackBar(
          new SnackBar(content:
          new Text('Network Error! Check your network connection.'))
      );
      return;
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      this.apiData = newApiData;
    });
  }


  List<Widget> _makeChildren() {
    // happens on the first build
    if (apiData == null) {
      return new List<Widget>();
    }

    return apiData.map(
            (var coinJson) =>
        new CoinListItem(
            new Coin.fromJson(coinJson)
        )
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    var apiChildren = _makeChildren();
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),

      ),
      body: new Builder(
//        todo : extract a widget instead of this
          builder: (BuildContext context) {
            snackContext = context;
            return new Center(
              child:
              new ListView.builder
                (
                padding: const EdgeInsets.all(15.0),
                itemBuilder: (context, i) {
                  if (i.isOdd)
                    return new Divider();
                  else
                    return apiChildren[i ~/ 2];
                },
              ),
            );
          }),
      floatingActionButton: new FloatingActionButton(
        onPressed: _getPricesFromApi,
        tooltip: 'Get Price',
        child: new Icon(Icons.update),
        backgroundColor: Colors.red[400],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


