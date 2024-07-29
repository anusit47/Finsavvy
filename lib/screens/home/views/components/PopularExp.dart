import 'package:flutter/material.dart';
import 'package:shop/components/product/ExpCard.dart';
import 'package:shop/models/ExpModel.dart';
import 'package:shop/route/route_constants.dart';
import '../../../../constants.dart';

class PopularExp extends StatelessWidget {
  const PopularExp({
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
            "ภารกิจ",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: demoExpModels.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == demoExpModels.length - 1 ? defaultPadding : 0,
              ),
              child: ExpCard(
                image: demoExpModels[index].image,
                questName: demoExpModels[index].questName,
                type: demoExpModels[index].type,
                expAmount: demoExpModels[index].expAmount,
                description: demoExpModels[index].description,
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
