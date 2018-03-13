import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Crypto Display',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primaryColor: Colors.grey[300],
      ),
      home: new MyHomePage(
          title: 'Crypto Display App', subtitle: 'Latest prices on cryptos'),
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

  // todo: recurring

  _getPricesFromApi() async {
    var url = 'https://api.coinmarketcap.com/v1/ticker/?limit=10';
    url = 'https://api.myjson.com/bins/13mpv9';
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
      print(exception);
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
    var children = new List<Widget>();

    if (apiData == null) {
      // happens on the first build
      return children;
    }
    for (int i = 0; i < apiData.length; i++) {
      String price = apiData[i]["name"] + ': \$' + apiData[i]["price_usd"];
      children.add(
          new Text(price,
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              )
          )
      );
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    var apiChildren = _makeChildren();
    var baseChildren = <Widget>[
      new Text(
          'Current Crypto Price',
          style: Theme
              .of(context)
              .textTheme
              .display1
      ),
    ].toList();
    List children = baseChildren + apiChildren;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),

      ),
      body: new Center(

        child: new Column(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        ),
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
