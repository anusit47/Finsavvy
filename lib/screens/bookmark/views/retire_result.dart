import 'package:flutter/material.dart';
import 'package:finsavvy/models/retirement_result_arguments.dart';
import 'package:intl/intl.dart';

class RetirementResult extends StatelessWidget {
  final RetirementResultArguments? arguments;

  const RetirementResult({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    final args = arguments;
    if (args == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text('No arguments were provided.'),
        ),
      );
    }

    final numberFormat = NumberFormat('#,##0.00');

    return Scaffold(
      appBar: AppBar(
        title: const Text('ผลการคำนวณการเกษียณ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'สรุปผลของคุณ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFB0AF89),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'จำนวนเงินที่ต้องเตรียม\nสำหรับเกษียณ\n${numberFormat.format(args.totalRetirementFund)} บาท',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Image.asset(
                    'assets/images/all-finsavvy-image/money-bag 1.png', 
                    width: 80, 
                    height: 80, 
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            const Text(
              'จำนวนเงินที่ต้องออมต่อเดือน',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(height: 8),
            _buildRiskContainer(
              color: Colors.green.shade300,
              iconPath: 'assets/images/all-finsavvy-image/money-bag 1 (1).png',
              text: 'ความเสี่ยงต่ำ 3.50%',
              amount: numberFormat.format(args.lowRiskSavings),
            ),
            SizedBox(height: 16),
            _buildRiskContainer(
              color: Colors.yellow.shade700,
              iconPath: 'assets/images/all-finsavvy-image/money-bag 1 (2).png',
              text: 'ความเสี่ยงกลาง 5.50%',
              amount: numberFormat.format(args.mediumRiskSavings),
            ),
            SizedBox(height: 16),
            _buildRiskContainer(
              color: Colors.red.shade400,
              iconPath: 'assets/images/all-finsavvy-image/money-bag 1 (3).png',
              text: 'ความเสี่ยงสูง 8.00%',
              amount: numberFormat.format(args.highRiskSavings),
            ),
            SizedBox(height: 16),
            const Center(
              child: Text(
                'คำนวณด้วยอัตราเงินเฟ้อ 2.5% ตามค่าเฉลี่ยย้อนหลัง 10 ปี จากธนาคารแห่งประเทศไทย',
                style: TextStyle(
                    fontSize: 9, color: Color.fromARGB(255, 85, 85, 85)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskContainer({
    required Color color,
    required String iconPath,
    required String text,
    required String amount,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                '$amount บาทต่อเดือน',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Spacer(),  
          Image.asset(
            iconPath, 
            width: 80, 
            height: 80, 
          ),
        ],
      ),
    );
  }
}
