import 'package:flutter/material.dart';
import 'package:shop/route/route_constants.dart';
import 'dart:math';
import 'package:shop/models/retirement_result_arguments.dart';

class RetirementPlanner extends StatefulWidget {
  const RetirementPlanner({super.key});

  @override
  RetirementPlannerState createState() => RetirementPlannerState();
}

class RetirementPlannerState extends State<RetirementPlanner> {
  final TextEditingController _currentAgeController = TextEditingController();
  final TextEditingController _retirementAgeController =
      TextEditingController();
  final TextEditingController _lifeExpectancyController =
      TextEditingController();
  final TextEditingController _monthlyExpenseController =
      TextEditingController();
  final TextEditingController _currentRetirementFundController =
      TextEditingController();

  double _totalRetirementFund = 0.0;
  double _lowRiskSavings = 0.0;
  double _mediumRiskSavings = 0.0;
  double _highRiskSavings = 0.0;

  @override
  void dispose() {
    _currentAgeController.dispose();
    _retirementAgeController.dispose();
    _lifeExpectancyController.dispose();
    _monthlyExpenseController.dispose();
    _currentRetirementFundController.dispose();
    super.dispose();
  }

  void _calculate() {
    final int currentAge = int.parse(_currentAgeController.text);
    final int retirementAge = int.parse(_retirementAgeController.text);
    final int lifeExpectancy = int.parse(_lifeExpectancyController.text);
    final double monthlyExpense = double.parse(_monthlyExpenseController.text);
    final double currentRetirementFund =
        double.parse(_currentRetirementFundController.text);

    // Calculate total retirement fund needed
    final int yearsOfRetirement = lifeExpectancy - retirementAge;
    final double annualExpense = monthlyExpense * 12;
    _totalRetirementFund = annualExpense * yearsOfRetirement;

    // Calculate number of months until retirement
    final int monthsUntilRetirement = (retirementAge - currentAge) * 12;

    // Calculate monthly savings required for different risk levels
    _lowRiskSavings = _calculateMonthlySavings(
        _totalRetirementFund - currentRetirementFund,
        3.50,
        monthsUntilRetirement);
    _mediumRiskSavings = _calculateMonthlySavings(
        _totalRetirementFund - currentRetirementFund,
        5.50,
        monthsUntilRetirement);
    _highRiskSavings = _calculateMonthlySavings(
        _totalRetirementFund - currentRetirementFund,
        8.00,
        monthsUntilRetirement);

    Navigator.pushNamed(
      context,
      retirementResult,
      arguments: RetirementResultArguments(
        totalRetirementFund: _totalRetirementFund,
        lowRiskSavings: _lowRiskSavings,
        mediumRiskSavings: _mediumRiskSavings,
        highRiskSavings: _highRiskSavings,
      ),
    );
  }

  double _calculateMonthlySavings(
      double futureValue, double annualRate, int months) {
      double monthlyRate = annualRate / 100 / 12;
    return futureValue * monthlyRate / (pow(1 + monthlyRate, months) - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เครื่องวางแผนเกษียณ'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/all-finsavvy-image/retire_top.png",
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _currentAgeController,
                decoration: const InputDecoration(
                  labelText: 'อายุปัจจุบัน',
                  suffixText: 'ปี',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _retirementAgeController,
                decoration: const InputDecoration(
                  labelText: 'อายุที่ต้องการเกษียณ',
                  suffixText: 'ปี',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _lifeExpectancyController,
                decoration: const InputDecoration(
                  labelText: 'อายุขัย',
                  suffixText: 'ปี',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _monthlyExpenseController,
                decoration: const InputDecoration(
                  labelText: 'เงินที่ต้องการใช้ต่อเดือน (หลังเกษียณ)',
                  suffixText: 'บาท',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _currentRetirementFundController,
                decoration: const InputDecoration(
                  labelText: 'เงินกองทุนเกษียณ ณ ปัจจุบัน',
                  suffixText: 'บาท',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _calculate,
                child: const Text('คำนวณ'),
              ),
              const SizedBox(height: 16.0),
              if (_totalRetirementFund > 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'จำนวนเงินที่ต้องเตรียมสำหรับเกษียณ: ${_totalRetirementFund.toStringAsFixed(2)} บาท'),
                    Text(
                        'จำนวนเงินที่ต้องออมต่อเดือน (ความเสี่ยงต่ำ 3.50%): ${_lowRiskSavings.toStringAsFixed(2)} บาท'),
                    Text(
                        'จำนวนเงินที่ต้องออมต่อเดือน (ความเสี่ยงกลาง 5.50%): ${_mediumRiskSavings.toStringAsFixed(2)} บาท'),
                    Text(
                        'จำนวนเงินที่ต้องออมต่อเดือน (ความเสี่ยงสูง 8.00%): ${_highRiskSavings.toStringAsFixed(2)} บาท'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
