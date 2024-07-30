import 'package:flutter/material.dart';


class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  final List<FinanceCard> pages = const [
    FinanceCard(
      title: 'วิชาการเงินเป็นมากกว่าตัวเลขและสูตรคำนวณ ',
      content: 'มันคือทักษะที่จำเป็นสำหรับทุกคน \nไม่ว่าคุณจะมีรายได้มากหรือน้อย \nหรืออยู่ในช่วงวัยใดก็ตาม \nการเรียนรู้เรื่องการเงินเปรียบเสมือนการลงทุนที่ให้ผลตอบแทนคุ้มค่าที่สุด \nเพราะความรู้ทางการเงินเป็นสิ่งที่สามารถนำไปใช้ประโยชน์ได้ตลอดชีวิต \nไม่ว่ายุคสมัยจะเปลี่ยนแปลงไปอย่างไร \nหลักการทางการเงินก็ยังคงเป็นจริงเสมอ',
      imagePath: 'assets/images/all-finsavvy-image/salary.png',
    ),
    FinanceCard(
      title: 'ชีวิตของเราผูกพันกับเงินอย่างหลีกเลี่ยงไม่ได้',
      content: 'ไม่ว่าจะเป็นการใช้จ่ายประจำวัน \nการออมเงิน การลงทุน \nหรือการวางแผนเพื่ออนาคต \nการจัดการเงินที่ดีจะช่วยให้เรามีความมั่นคงทางการเงิน \nสามารถใช้ชีวิตได้อย่างมีความสุข \nและบรรลุเป้าหมายในชีวิตได้อย่างราบรื่น \nการจัดการทางการเงินที่ดีประกอบด้วย \n3 องค์ประกอบหลัก ได้แก่',
      imagePath: 'assets/images/all-finsavvy-image/salary.png',
    ),
    FinanceCard(
      title: 'การจัดการสภาพคล่อง',
      content: 'หมายถึงการบริหารจัดการรายรับและรายจ่ายให้สมดุลกัน เพื่อให้มีเงินใช้จ่ายในชีวิตประจำวันได้อย่างเพียงพอ แต่ก็ไม่ฟุ่มเฟือยจนเกินไป การมีสภาพคล่องที่ดีจะช่วยให้เราสามารถรับมือกับเหตุการณ์ไม่คาดคิดได้ เช่น การเจ็บป่วย หรือการตกงาน',
      imagePath: 'assets/images/all-finsavvy-image/salary.png',
    ),
    FinanceCard(
      title: 'การจัดการความเสี่ยง',
      content: 'หมายถึงการเตรียมตัวรับมือกับความเสี่ยงที่อาจเกิดขึ้นในอนาคต เช่น การสูญเสียรายได้ การเจ็บป่วย หรือภัยธรรมชาติ การทำประกันชีวิตและสุขภาพ การออมเงินสำรองฉุกเฉิน เป็นต้น เป็นวิธีการจัดการความเสี่ยงที่สำคัญ',
      imagePath: 'assets/images/all-finsavvy-image/salary.png',
    ),
    FinanceCard(
      title: 'การสะสมความมั่งคั่ง',
      content: 'หมายถึงการเพิ่มพูนทรัพย์สินและสินทรัพย์ต่างๆ เพื่อให้มีฐานะทางการเงินที่ดีขึ้น การลงทุนเป็นวิธีการหนึ่งในการสะสมความมั่งคั่ง แต่การลงทุนต้องอาศัยความรู้และความเข้าใจอย่างถ่องแท้',
      imagePath: 'assets/images/all-finsavvy-image/salary.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('พื้นฐานการเงิน')),
      body: SafeArea(
        child: PageView(
          children: pages,
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
      color: Color.fromARGB(255, 0, 80, 146), // เปลี่ยนสีพื้นหลังของการ์ด
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 150),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
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
