class Coin {
  String name;
  String symbol;
  int rank;
  double priceUSD;
  double priceBTC;
  double marketCapUSD;
  double availableSupply;
  double totalSupply;
  double volume24H;
  double change1Hour;
  double change24Hour;
  double change7Days;

  Coin(
      {this.name,
      this.symbol,
      this.rank,
      this.priceUSD,
      this.priceBTC,
      this.marketCapUSD,
      this.availableSupply,
      this.totalSupply,
      this.volume24H,
      this.change1Hour,
      this.change24Hour,
      this.change7Days});

  factory Coin.fromJson(Map<String, dynamic> json) {
    return new Coin(
      name: json["name"],
      symbol: json["symbol"],
      rank: int.parse(json["rank"]),
      priceUSD: double.parse(json["price_usd"]),
      priceBTC: double.parse(json["price_btc"]),
      marketCapUSD: double.parse(json["market_cap_usd"]),
      availableSupply: double.parse(json["available_supply"]),
      totalSupply: double.parse(json["total_supply"]),
      volume24H: double.parse(json["24h_volume_usd"]),
      change1Hour: double.parse(json["percent_change_1h"]),
      change24Hour: double.parse(json["percent_change_24h"]),
      change7Days: double.parse(json["percent_change_7d"]),
    );
  }
}
