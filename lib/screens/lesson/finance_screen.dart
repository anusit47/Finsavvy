import 'package:flutter/material.dart';
import 'package:finsavvy/route/route_constants.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  final PageController _pageController = PageController();
  final List<FinanceCard> pages = const [
    FinanceCard(
      title: 'วิชาการเงินเป็นมากกว่าตัวเลขและสูตรคำนวณ ',
      content:
          'มันคือทักษะที่จำเป็นสำหรับทุกคน \nไม่ว่าคุณจะมีรายได้มากหรือน้อย \nหรืออยู่ในช่วงวัยใดก็ตาม \nการเรียนรู้เรื่องการเงินเปรียบเสมือนการลงทุนที่ให้ผลตอบแทนคุ้มค่าที่สุด \nเพราะความรู้ทางการเงินเป็นสิ่งที่สามารถนำไปใช้ประโยชน์ได้ตลอดชีวิต \nไม่ว่ายุคสมัยจะเปลี่ยนแปลงไปอย่างไร \nหลักการทางการเงินก็ยังคงเป็นจริงเสมอ',
      imagePath: 'assets/images/all-finsavvy-image/dsfawfaw.png',
    ),
    FinanceCard(
      title: 'ชีวิตของเราผูกพันกับเงินอย่างหลีกเลี่ยงไม่ได้',
      content:
          'ไม่ว่าจะเป็นการใช้จ่ายประจำวัน \nการออมเงิน การลงทุน \nหรือการวางแผนเพื่ออนาคต \nการจัดการเงินที่ดีจะช่วยให้เรามีความมั่นคงทางการเงิน \nสามารถใช้ชีวิตได้อย่างมีความสุข \nและบรรลุเป้าหมายในชีวิตได้อย่างราบรื่น \nการจัดการทางการเงินที่ดีประกอบด้วย \n3 องค์ประกอบหลัก ได้แก่',
      imagePath: 'assets/images/all-finsavvy-image/salary.png',
    ),
    FinanceCard(
      title: 'การจัดการสภาพคล่อง',
      content:
          'หมายถึงการบริหารจัดการรายรับและรายจ่ายให้สมดุลกัน เพื่อให้มีเงินใช้จ่ายในชีวิตประจำวันได้อย่างเพียงพอ แต่ก็ไม่ฟุ่มเฟือยจนเกินไป การมีสภาพคล่องที่ดีจะช่วยให้เราสามารถรับมือกับเหตุการณ์ไม่คาดคิดได้ เช่น การเจ็บป่วย หรือการตกงาน',
      imagePath: 'assets/images/all-finsavvy-image/image.png',
    ),
    FinanceCard(
      title: 'การจัดการความเสี่ยง',
      content:
          'หมายถึงการเตรียมตัวรับมือกับความเสี่ยงที่อาจเกิดขึ้นในอนาคต เช่น การสูญเสียรายได้ การเจ็บป่วย หรือภัยธรรมชาติ การทำประกันชีวิตและสุขภาพ การออมเงินสำรองฉุกเฉิน เป็นต้น เป็นวิธีการจัดการความเสี่ยงที่สำคัญ',
      imagePath: 'assets/images/all-finsavvy-image/fse.png',
    ),
    FinanceCard(
      title: 'การสะสมความมั่งคั่ง',
      content:
          'หมายถึงการเพิ่มพูนทรัพย์สินและสินทรัพย์ต่างๆ เพื่อให้มีฐานะทางการเงินที่ดีขึ้น การลงทุนเป็นวิธีการหนึ่งในการสะสมความมั่งคั่ง แต่การลงทุนต้องอาศัยความรู้และความเข้าใจอย่างถ่องแท้',
      imagePath: 'assets/images/all-finsavvy-image/piggy-bank.png',
    ),
    FinanceCard(
      title: 'การวางแผนการเงินเป็นขั้นตอนสำคัญในการบรรลุเป้าหมายทางการเงิน',
      content:
          'ไม่ว่าจะเป็นการซื้อบ้าน ซื้อรถ ส่งลูกเรียน หรือเกษียณอายุ การวางแผนการเงินจะช่วยให้เรามองเห็นภาพรวมของสถานการณ์ทางการเงินของเรา และสามารถวางแผนการใช้จ่ายและการออมได้อย่างมีประสิทธิภาพ การวางแผนการเงินไม่ใช่เรื่องยาก เพียงแค่เราเริ่มต้นตั้งเป้าหมายที่ชัดเจน และวางแผนการดำเนินงานให้สอดคล้องกับเป้าหมายนั้น',
      imagePath: 'assets/images/all-finsavvy-image/schedule.png',
    ),
    FinanceCard(
      title: 'การเรียนรู้เรื่องการเงินไม่ใช่เรื่องยาก',
      content:
          'มีแหล่งข้อมูลมากมายที่สามารถนำมาศึกษาได้ เช่น หนังสือ บทความ เว็บไซต์ หรือคอร์สเรียนออนไลน์ การเริ่มต้นเรียนรู้เรื่องการเงินตั้งแต่เนิ่นๆ จะทำให้เรามีความพร้อมในการบริหารจัดการเงินของตัวเองได้อย่างมีประสิทธิภาพ และสามารถสร้างความมั่งคั่งให้กับตนเองและครอบครัวได้ในระยะยาว',
      imagePath: 'assets/images/all-finsavvy-image/lightbulb.png',
    ),
    FinanceCard(
      title: 'สรุป',
      content:
          'การเรียนรู้เรื่องการเงินเป็นสิ่งจำเป็นสำหรับทุกคน เพราะมันจะช่วยให้เรามีชีวิตที่มีความสุขและมั่นคงทางการเงิน การจัดการสภาพคล่อง การจัดการความเสี่ยง และการสะสมความมั่งคั่ง เป็น 3 องค์ประกอบหลักของการจัดการเงินที่ดี การวางแผนการเงินจะช่วยให้เราบรรลุเป้าหมายทางการเงินได้อย่างมีประสิทธิภาพ ดังนั้นอย่ารอช้าที่จะเริ่มต้นเรียนรู้เรื่องการเงินตั้งแต่วันนี้',
      imagePath: 'assets/images/all-finsavvy-image/salary.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('พื้นฐานการเงิน')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start,  
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/all-finsavvy-image/acadawda.png',
                height: 67,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return pages[index];
                },
                onPageChanged: (index) {
                  if (index == pages.length - 1) {
                    Navigator.pushNamed(context, quizScreen);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinanceCard extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;

  const FinanceCard({
    required this.title,
    required this.content,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF8A19D6), 
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 200),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              content,
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
