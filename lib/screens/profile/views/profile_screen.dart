import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finsavvy/constants.dart';
import 'package:finsavvy/route/screen_export.dart';
import 'package:finsavvy/screens/profile/views/components/CreditScreen.dart';

import 'components/profile_card.dart';
import 'components/profile_menu_item_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProfileCard(
            name: "Anusit",
            email: "threeninja.work@gmail.com",
            imageSrc:
                "https://scontent.fnak4-1.fna.fbcdn.net/v/t39.30808-1/247401069_2674942402801428_1510295725705619951_n.jpg?stp=dst-jpg_p200x200&_nc_cat=104&ccb=1-7&_nc_sid=0ecb9b&_nc_ohc=SmDHOPxJIPAQ7kNvgGgQTDC&_nc_ht=scontent.fnak4-1.fna&oh=00_AYD_nkjF-n2BgCnYi9HMpmPO5j2gHX8Zso1s7q2KrrjcIw&oe=66AE67EE",
            // proLableText: "Sliver",
            // isPro: true, if the user is pro
            press: () {
              Navigator.pushNamed(context, userInfoScreenRoute);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "การตั้งค่า",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ProfileMenuListTile(
            text: "ความคืบหน้าของผู้ใช้",
            svgSrc: "assets/icons/trophy-star.svg",
            press: () {
              // Navigator.pushNamed(context, ordersScreenRoute);
            },
          ),
          ProfileMenuListTile(
            text: "แพลนที่เคยสร้าง",
            svgSrc: "assets/icons/blueprint.svg",
            press: () {},
          ),
          ProfileMenuListTile(
            text: "Credits and Copyrights",
            svgSrc: "assets/icons/copyright.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreditScreen()),
              );
            },
          ),
          ProfileMenuListTile(
            text: "ให้ข้อเสนอแนะ feedback",
            svgSrc: "assets/icons/feedback-alt.svg",
            press: () {
              // Navigator.pushNamed(context, addressesScreenRoute);
            },
          ),

          // Log Out
          ListTile(
            onTap: () {},
            minLeadingWidth: 24,
            leading: SvgPicture.asset(
              "assets/icons/Logout.svg",
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                errorColor,
                BlendMode.srcIn,
              ),
            ),
            title: const Text(
              "Log Out",
              style: TextStyle(color: errorColor, fontSize: 14, height: 1),
            ),
          )
        ],
      ),
    );
  }
}
