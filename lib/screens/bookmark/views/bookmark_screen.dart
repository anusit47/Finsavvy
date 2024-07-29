import 'package:flutter/material.dart';
// import 'package:shop/components/product/product_card.dart';
// import 'package:shop/models/product_model.dart';
// import 'package:shop/route/route_constants.dart';

// import '../../../constants.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/all-finsavvy-image/retirement_plan.png",
          ),
          Image.asset(
            "assets/images/all-finsavvy-image/tax_plan.png",
          ),
          Image.asset(
            "assets/images/all-finsavvy-image/financial_health.png",
          ),
          Image.asset(
            "assets/images/all-finsavvy-image/investment_plan.png",
          ),
          Image.asset(
            "assets/images/all-finsavvy-image/home_purchase_plan.png",
          ),
        ],
      ),
    );
  }
}
