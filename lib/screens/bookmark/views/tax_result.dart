import 'package:flutter/material.dart';
import 'package:shop/models/tax_result_arguments.dart';
import 'package:intl/intl.dart';

class TaxResult extends StatelessWidget {
  final TaxResultArguments? arguments;

  const TaxResult({super.key, required this.arguments});

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
        title: const Text('ผลการคำนวณภาษี'),
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
                      'ภาษีที่ต้องเสีย\n${numberFormat.format(args.totalTax)} บาท',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Image.asset(
                    'assets/images/all-finsavvy-image/money-bag 1 (4).png', // Path to your image
                    width: 80, // Width of the image
                    height: 80, // Height of the image
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildDetailContainer(
              color: Colors.blue.shade300,
              text: 'รายได้รวม',
              amount: numberFormat.format(args.totalIncome),
            ),
            SizedBox(height: 16),
            _buildDetailContainer(
              color: Colors.orange.shade300,
              text: 'รวมค่าใช้จ่ายและค่าลดหย่อน',
              amount: numberFormat.format(args.totalDeductions),
            ),
            SizedBox(height: 16),
            _buildDetailContainer(
              color: Colors.green.shade300,
              text: 'รายได้สุทธิ',
              amount: numberFormat.format(args.netIncome),
            ),
            SizedBox(height: 16),
            const Center(
              child: Text(
                'คำนวณตามอัตราภาษีประเทศไทย',
                style: TextStyle(
                    fontSize: 9, color: Color.fromARGB(255, 85, 85, 85)),
              ),
            ),
            const Center(
              child: Text(
                'เครื่องมือนี้เป็นเพียงคำนวณภาษีเบื้องต้นเท่านั้นควรศึกษาการคำนวณภาษีอย่างละเอียด',
                style: TextStyle(
                    fontSize: 9, color: Color.fromARGB(255, 255, 0, 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailContainer({
    required Color color,
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
                '$amount บาท',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
