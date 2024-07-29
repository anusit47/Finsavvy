import 'package:flutter/material.dart';
import 'package:shop/constants.dart';
import 'package:shop/screens/home/views/components/popularInvest.dart';

import 'components/flash_sale.dart';
import 'components/offer_carousel_and_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: OffersCarouselAndCategories()),
            SliverToBoxAdapter(child: PopularInvestments()),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
              sliver: SliverToBoxAdapter(child: FlashSale()),
            ),
          ],
        ),
      ),
    );
  }
}
