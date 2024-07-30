import 'package:flutter/material.dart';
import 'package:shop/models/retirement_result_arguments.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('ผลการคำนวณการเกษียณ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  // Icon(Icons.person, size: 40), // Placeholder for icon
                  SizedBox(width: 10),
                  Text(
                    'จำนวนเงินที่ต้องเตรียมสำหรับเกษียณ\n${args.totalRetirementFund.toStringAsFixed(2)} บาท',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildRiskContainer(
              color: Colors.green.shade300,
              // icon: Icons.check_circle,
              text: 'ความเสี่ยงต่ำ 3.50%',
              amount: args.lowRiskSavings.toStringAsFixed(2),
            ),
            SizedBox(height: 16),
            _buildRiskContainer(
              color: Colors.yellow.shade700,
              // icon: Icons.warning,
              text: 'ความเสี่ยงกลาง 5.50%',
              amount: args.mediumRiskSavings.toStringAsFixed(2),
            ),
            SizedBox(height: 16),
            _buildRiskContainer(
              color: Colors.red.shade400,
              // icon: Icons.error,
              text: 'ความเสี่ยงสูง 8.00%',
              amount: args.highRiskSavings.toStringAsFixed(2),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('ดูสถิติผู้ใช้งานใหญ่'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskContainer({
    required Color color,
    // required IconData icon,
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
          // Icon(icon, size: 40), // Placeholder for icon
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '$amount บาทต่อเดือน',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
