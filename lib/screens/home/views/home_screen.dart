import 'package:flutter/material.dart';
import 'package:finsavvy/constants.dart';
import 'package:finsavvy/screens/home/views/components/popularInvest.dart';

import 'components/Mission.dart';
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
              sliver: SliverToBoxAdapter(child: Mission()),
            ),
          ],
        ),
      ),
    );
  }
}
