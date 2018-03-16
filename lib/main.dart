import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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
  MyHomePage({Key key, @required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title and subtitle) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List _apiData;

  // todo: recurring

  _getPricesFromApi() async {
    var url = 'https://api.coinmarketcap.com/v1/ticker/?limit=15';
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
      _scaffoldKey.currentState.showSnackBar(
          new SnackBar(content:
          new Text('Network Error! Check your network connection.'))
      );
      // so the state does not change
      return;
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      this._apiData = newApiData;
    });
  }

  @override
  void initState() {
    super.initState();
//    get prices for the first time
//    _getPricesFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),

      ),
      body: new CoinList(
          coinJsonData: _apiData
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _getPricesFromApi,
        tooltip: 'Get Price',
        child: new Icon(Icons.update),
        backgroundColor: Colors.red[400],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

