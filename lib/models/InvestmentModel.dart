// ignore: file_names
class InvestmentModel {
  final String image;
  final String name;
  final String type; // e.g., 'Stock' or 'Crypto'
  final double currentPrice;
  final double? priceAfterDiscount;
  final double? percentChange;

  InvestmentModel({
    required this.image,
    required this.name,
    required this.type,
    required this.currentPrice,
    this.priceAfterDiscount,
    this.percentChange,
  });
}

List<InvestmentModel> demoPopularInvestments = [
  InvestmentModel(
    image:
        "https://s3-symbol-logo.tradingview.com/indices/s-and-p-500--big.svg",
    name: "S&P500",
    type: "Stock",
    currentPrice: 5481.15,
    percentChange: 0.37,
  ),
  InvestmentModel(
    image: "https://s3-symbol-logo.tradingview.com/crypto/XTVCBTC--big.svg",
    name: "Bitcoin",
    type: "Crypto",
    currentPrice: 67048,
    percentChange: -1.82,
  ),
  InvestmentModel(
    image: "https://s3-symbol-logo.tradingview.com/apple--big.svg",
    name: "Apple Inc.",
    type: "Stock",
    currentPrice: 218.96,
    percentChange: 0.47,
  ),
  InvestmentModel(
    image: "https://s3-symbol-logo.tradingview.com/crypto/XTVCETH--big.svg",
    name: "Ethereum",
    type: "Crypto",
    currentPrice: 3307.1,
    percentChange: 1.07,
  ),
  InvestmentModel(
    image: "https://s3-symbol-logo.tradingview.com/tesla--big.svg",
    name: "Tesla, Inc.",
    type: "Stock",
    currentPrice: 232.13,
    percentChange: 5.54,
  ),
];

List<InvestmentModel> demoFlashSaleInvestments = [
  InvestmentModel(
    image: "https://i.imgur.com/tXyOMMG.png",
    name: "Bitcoin",
    type: "Crypto",
    currentPrice: 5479.04,
    percentChange: 0.37,
  ),
  InvestmentModel(
    image: "https://i.imgur.com/h2LqppX.png",
    name: "Apple Inc.",
    type: "Stock",
    currentPrice: 150.00,
    priceAfterDiscount: 140.00,
    percentChange: -6.67,
  ),
];

List<InvestmentModel> demoBestSellersInvestments = [
  InvestmentModel(
    image: "https://i.imgur.com/tXyOMMG.png",
    name: "Bitcoin",
    type: "Crypto",
    currentPrice: 5479.04,
    percentChange: 0.37,
  ),
  InvestmentModel(
    image: "https://i.imgur.com/h2LqppX.png",
    name: "Apple Inc.",
    type: "Stock",
    currentPrice: 150.00,
    priceAfterDiscount: 140.00,
    percentChange: -6.67,
  ),
];

List<InvestmentModel> kidsInvestments = [
  InvestmentModel(
    image: "https://i.imgur.com/tXyOMMG.png",
    name: "Bitcoin",
    type: "Crypto",
    currentPrice: 5479.04,
    percentChange: 0.37,
  ),
  InvestmentModel(
    image: "https://i.imgur.com/h2LqppX.png",
    name: "Apple Inc.",
    type: "Stock",
    currentPrice: 150.00,
    priceAfterDiscount: 140.00,
    percentChange: -6.67,
  ),
];
