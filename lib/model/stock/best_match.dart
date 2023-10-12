class StockListResult {
  String? symbol;
  String? name;
  String? currency;
  String? matchscore;

  StockListResult({
    this.symbol,
    this.name,
    this.currency,
    this.matchscore,
  });

  factory StockListResult.fromJson(Map<String, dynamic> json) =>
      StockListResult(
        symbol: json['1. symbol'] as String?,
        name: json['2. name'] as String?,
        currency: json['8. currency'] as String?,
        matchscore: json['9. matchScore'] as String?,
      );
}
