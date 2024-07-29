import 'package:flutter/material.dart';
// import 'package:shop/components/product/product_card.dart';
// import 'package:shop/models/product_model.dart';
// import 'package:shop/route/route_constants.dart';

// import '../../../constants.dart';

final List<String> images = [
    "assets/images/all-finsavvy-image/retirement_plan.png", 
    "assets/images/all-finsavvy-image/tax_planner.png", 
    "assets/images/all-finsavvy-image/financial_health_checker.png", 
    "assets/images/all-finsavvy-image/investment_planner.png", 
    "assets/images/all-finsavvy-image/home_purchase_planner.png", 
  ];


class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Image.asset(images[index]),
            ),
          );
        },
      ),
    );
  }
}
