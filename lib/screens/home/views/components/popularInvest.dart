import 'package:flutter/material.dart';
import 'package:shop/components/product/InvestmentCard.dart';
import 'package:shop/models/InvestmentModel.dart';
import 'package:shop/route/screen_export.dart';
import '../../../../constants.dart';

class PopularInvestments extends StatelessWidget {
  const PopularInvestments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "เทรนด์การลงทุน",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: demoPopularInvestments.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == demoPopularInvestments.length - 1
                    ? defaultPadding
                    : 0,
              ),
              child: InvestmentCard(
                image: demoPopularInvestments[index].image,
                name: demoPopularInvestments[index].name,
                type: demoPopularInvestments[index].type,
                currentPrice: demoPopularInvestments[index].currentPrice,
                priceAfterDiscount: demoPopularInvestments[index].priceAfterDiscount,
                percentChange: demoPopularInvestments[index].percentChange,
                press: () {
                  Navigator.pushNamed(context, productDetailsScreenRoute,
                      arguments: index.isEven);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
