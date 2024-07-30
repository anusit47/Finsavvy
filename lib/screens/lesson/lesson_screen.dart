import 'package:flutter/material.dart';
import 'package:shop/route/route_constants.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

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
                Navigator.pushNamed(context, levelScreen);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  "assets/images/all-finsavvy-image/basic.png",
                  height: 150, // ตั้งค่าความสูงของภาพ
                ),
              ),
            ),
            GestureDetector(
              // onTap: () {
              //   Navigator.pushNamed(context, taxPlanner);
              // },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  "assets/images/all-finsavvy-image/manage.png",
                  height: 150, // ตั้งค่าความสูงของภาพ
                ),
              ),
            ),
            GestureDetector(
              // onTap: () {
              //   Navigator.pushNamed(context, financialHealthChecker);
              // },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  "assets/images/all-finsavvy-image/saving.png",
                  height: 150, // ตั้งค่าความสูงของภาพ
                ),
              ),
            ),
            GestureDetector(
              // onTap: () {
              //   Navigator.pushNamed(context, investmentPlanner);
              // },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  "assets/images/all-finsavvy-image/longtoon.png",
                  height: 150, // ตั้งค่าความสูงของภาพ
                ),
              ),
            ),
            GestureDetector(
              // onTap: () {
              //   Navigator.pushNamed(context, homePurchasePlanner);
              // },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  "assets/images/all-finsavvy-image/taxxxxx.png",
                  height: 150, // ตั้งค่าความสูงของภาพ
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
