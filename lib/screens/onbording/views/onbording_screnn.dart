import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finsavvy/components/dot_indicators.dart';
import 'package:finsavvy/constants.dart';
import 'package:finsavvy/route/route_constants.dart';

import 'components/onbording_content.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  final List<Onbord> _onbordData = [
    Onbord(
      image: "assets/Illustration/on0.png",
      // imageDarkTheme: "assets/Illustration/Illustration_darkTheme_0.png",
      title: "ยินดีต้อนรับเข้าสู่\nFinsavvy!",
      description:
          "พวกเราจะช่วยส่งเสริมทักษะและการเรียนรู้ด้านการเงินของคุณ \nคุณพร้อมจะก้าวสู่อนาคตทางการเงินที่มั่นคงแล้วหรือยัง? \nเตรียมตัวให้เพร้อม แล้วมาร่วมเดินทางไปด้วยกัน!",
    ),
    Onbord(
      image: "assets/Illustration/on1.png",
      // imageDarkTheme: "assets/Illustration/Illustration_darkTheme_1.png",
      title: "วัตถุประสงค์",
      description:
          "เสริมทักษะการเงิน การลงทุน และการออม\nFinSavvy มุ่งเน้นพัฒนาทักษะด้านการเงินอย่างครบถ้วน\nเรามีบทเรียนทันสมัยและแผนการลงทุน\nที่ออกแบบมาเพื่อคุณโดยเฉพาะ",
    ),
    Onbord(
      image: "assets/Illustration/on2.png",
      // imageDarkTheme: "assets/Illustration/Illustration_darkTheme_2.png",
      title: "เป้าหมาย",
      description:
          "สร้างนิสัยการเงินที่ดีผ่านแอปพลิเคชันที่ใช้ง่ายและเข้าใจได้ทันที \nFinSavvy จะเป็นเพื่อนคู่คิดด้านการเงินของคุณ คุณจะสามารถติดตามและปรับปรุงการเงินของคุณได้อย่างมีประสิทธิภาพ",
    ),
    Onbord(
      image: "assets/Illustration/on3.png",
      // imageDarkTheme: "assets/Illustration/Illustration_darkTheme_3.png",
      title: "ประโยชน์ที่คาดว่าจะได้รับ",
      description:
          "เรียนรู้และวางแผนการเงินอย่างมืออาชีพเปลี่ยนความรู้สู่การปฏิบัติจริง FinSavvy จะช่วยให้คุณมีความรู้พื้นฐานด้านการเงินที่มั่นคงนอกจากนี้ยังช่วยเพิ่มความพึงพอใจในการใช้ชีวิตที่มีการจัดการการเงินที่ดี",
    ),
    Onbord(
      image: "assets/Illustration/on4.png",
      // imageDarkTheme: "assets/Illustration/Illustration_darkTheme_4.png",
      title: "เริ่มต้นใช้งาน",
      description:
          "พร้อมแล้ว! มาเริ่มต้นการเรียนรู้กับ FinSavvy กันเลย \nเรียนรู้บทเรียนใหม่ ๆ และวางแผนการลงทุนที่เหมาะสมกับคุณ\nแล้วคุณจะพบว่าการบริหารเงินไม่ใช่เรื่องยากอีกต่อไป",
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, logInScreenRoute);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onbordData.length,
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  itemBuilder: (context, index) => OnbordingContent(
                    title: _onbordData[index].title,
                    description: _onbordData[index].description,
                    image: (Theme.of(context).brightness == Brightness.dark &&
                            _onbordData[index].imageDarkTheme != null)
                        ? _onbordData[index].imageDarkTheme!
                        : _onbordData[index].image,
                    isTextOnTop: index.isOdd,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    _onbordData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding / 4),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex < _onbordData.length - 1) {
                          _pageController.nextPage(
                              curve: Curves.ease, duration: defaultDuration);
                        } else {
                          Navigator.pushNamed(context, logInScreenRoute);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Arrow - Right.svg",
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}

class Onbord {
  final String image, title, description;
  final String? imageDarkTheme;

  Onbord({
    required this.image,
    required this.title,
    this.description = "",
    this.imageDarkTheme,
  });
}
