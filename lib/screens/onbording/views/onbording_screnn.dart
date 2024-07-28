import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/components/dot_indicators.dart';
import 'package:shop/constants.dart';
import 'package:shop/route/route_constants.dart';

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
      image: "assets/Illustration/Illustration-0.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_0.png",
      title: "ยินดีต้อนรับเข้าสู่แอป \nFinsavvy!",
      description:
          "เครื่องมือที่ช่วยเพิ่มพูนความรู้และทักษะในการบริหารจัดการ \nการเงิน การลงทุน การออมเงินสำหรับนิสิตจบใหม่และบุคคลทั่วไป",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-1.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_1.png",
      title: "วัตถุประสงค์และเป้าหมาย",
      description:
          "เพื่อส่งเสริมความรู้ด้านการเงิน การลงทุน และการบริหารจัดการเงินในอนาคตของนิสิตจบใหม่และบุคคลทั่วไป",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-2.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_2.png",
      title: "ปัญหาและอุปสรรคในการพัฒนา",
      description: "ความเข้ากันได้กับอุปกรณ์และระบบปฏิบัติการต่างๆ",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-3.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_3.png",
      title: "ข้อสรุปและข้อเสนอแนะ",
      description:
          "การปลูกฝังความรู้และทักษะที่จำเป็นในการจัดการเงินจะเป็นประโยชน์ต่อทุกคนในทุกช่วงวัยทำให้พวกเขาสามารถจัดการการเงินได้อย่างมีประสิทธิภาพและเตรียมพร้อมสำหรับอนาคตได้ดีขึ้น",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-4.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_4.png",
      title: "ข้อตกลงในการใช้ซอฟต์แวร์",
      description:
          "เพื่อส่งเสริมให้นักเรียนและนักศึกษาได้เรียนรู้และฝึกทักษะในการ พัฒนาซอฟต์แวร์",
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
