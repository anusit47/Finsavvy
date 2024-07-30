import 'package:flutter/material.dart';
import 'package:shop/components/product/ExpCard.dart'; // Adjust the import path as needed
import 'package:shop/models/ExpModel.dart'; // Adjust the import path as needed
import 'package:shop/route/route_constants.dart';
import 'package:shop/screens/discover/views/discover_screen.dart';
import '/components/Banner/M/banner_m_with_counter.dart';
import '../../../../constants.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // While loading show 👇
        // const BannerMWithCounterSkelton(),
        BannerMWithCounter(
          duration: const Duration(hours: 72),
          text:
              "ยินดีต้อนรับผู้ใช้งานใหม่ \nคุณได้รับ exp เพิ่มขึ้น 30% \nเป็นระยะเวลา 3 วัน",
          press: () {},
        ),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "ภารกิจ",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading show 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Replace demoFlashSaleProducts with demoExpModels or another specific list
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const DiscoverScreen()),
                  // );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
