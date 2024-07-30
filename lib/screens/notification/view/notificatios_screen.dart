import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finsavvy/components/buy_full_ui_kit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/DotsV.svg",
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/screens/Notification.png'), // Replace with your image path
            fit: BoxFit.cover, // This makes the image fit the background
          ),
        ),
      ),
    );
  }
}
