import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final dynamic item;

  const Item({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: myWidth * 0.06,
        vertical: myHeight * 0.02,
      ),
      child: Container(
        child: Row(
          children: [
            _buildImage(myHeight),
            SizedBox(width: myWidth * 0.02),
            _buildItemDetails(),
            SizedBox(width: myWidth * 0.01),
            _buildSparkline(myHeight),
            SizedBox(width: myWidth * 0.04),
            _buildPriceInfo(myWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(double myHeight) {
    return Expanded(
      flex: 1,
      child: Container(
        height: myHeight * 0.05,
        child: Image.network(item.image),
      ),
    );
  }

  Widget _buildItemDetails() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.id,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '1 ' + item.symbol,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSparkline(double myHeight) {
    return Expanded(
      flex: 2,
      child: Container(
        height: myHeight * 0.05,
        child: Sparkline(
          data: item.sparklineIn7D.price,
          lineWidth: 2.0,
          lineColor: item.marketCapChangePercentage24H >= 0
              ? Colors.green
              : Colors.red,
          fillMode: FillMode.below,
          fillGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.7],
            colors: item.marketCapChangePercentage24H >= 0
                ? [Colors.green, Colors.green.shade100]
                : [Colors.red, Colors.red.shade100],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceInfo(double myWidth) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$' + item.currentPrice.toString(),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Row(
            children: [
              Text(
                _formattedPriceChange(),
                style: TextStyle(
                  fontSize: 7,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(width: myWidth * 0.01),
              Text(
                item.marketCapChangePercentage24H.toStringAsFixed(2) + '%',
                style: TextStyle(
                  fontSize: 7,
                  fontWeight: FontWeight.normal,
                  color: item.marketCapChangePercentage24H >= 0
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formattedPriceChange() {
    return item.priceChange24H.toString().contains('-')
        ? "-\$" + item.priceChange24H.toStringAsFixed(2).replaceAll('-', '')
        : "\$" + item.priceChange24H.toStringAsFixed(2);
  }
}
