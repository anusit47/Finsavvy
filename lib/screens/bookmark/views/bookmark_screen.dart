import 'package:flutter/material.dart';
// import 'package:shop/components/product/product_card.dart';
// import 'package:shop/models/product_model.dart';
import 'package:shop/route/route_constants.dart';

// import '../../../constants.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, retirementPlanner);
              },
              child: Image.asset(
                "assets/images/all-finsavvy-image/retirement_plan.png",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, taxPlanner);
              },
              child: Image.asset(
                "assets/images/all-finsavvy-image/tax_plan.png",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, financialHealthChecker);
              },
              child: Image.asset(
                "assets/images/all-finsavvy-image/financial_health.png",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, investmentPlanner);
              },
              child: Image.asset(
                "assets/images/all-finsavvy-image/investment_plan.png",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, homePurchasePlanner);
              },
              child: Image.asset(
                "assets/images/all-finsavvy-image/home_purchase_plan.png",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, homePurchasePlanner);
              },
              child: Image.asset(
                "assets/images/all-finsavvy-image/car.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
