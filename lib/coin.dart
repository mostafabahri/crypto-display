class Coin {
  String name;
  String symbol;
  double priceUsd;
  double change1Hour;
  double change24Hour;

  Coin({
    this.name,
    this.symbol,
    this.priceUsd,
    this.change1Hour,
    this.change24Hour});

  factory Coin.fromJson(Map<String, dynamic> json){
    return new Coin(
        name: json["name"],
        symbol: json["symbol"],
        priceUsd: double.parse(json["price_usd"]),
        change1Hour: double.parse(json["percent_change_1h"]),
        change24Hour: double.parse(json["percent_change_24h"])
    );
  }
}