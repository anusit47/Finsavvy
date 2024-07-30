import 'package:flutter/material.dart';
import 'package:shop/route/route_constants.dart';
import 'package:shop/models/tax_result_arguments.dart';

class TaxPlanner extends StatefulWidget {
  const TaxPlanner({super.key});

  @override
  TaxPlannerState createState() => TaxPlannerState();
}

class TaxPlannerState extends State<TaxPlanner> {
  final TextEditingController _monthlyIncomeController =
      TextEditingController();
  final TextEditingController _bonusController = TextEditingController();
  final TextEditingController _otherIncomeController = TextEditingController();
  final TextEditingController _personalDeductionController =
      TextEditingController();
  final TextEditingController _providentFundController =
      TextEditingController();
  final TextEditingController _socialSecurityController =
      TextEditingController();
  final TextEditingController _housingInterestController =
      TextEditingController();
  final TextEditingController _lifeInsuranceController =
      TextEditingController();
  final TextEditingController _healthInsuranceController =
      TextEditingController();
  final TextEditingController _parentHealthInsuranceController =
      TextEditingController();
  final TextEditingController _pensionInsuranceController =
      TextEditingController();
  final TextEditingController _nationalSavingsFundController =
      TextEditingController();
  final TextEditingController _privateTeacherFundController =
      TextEditingController();
  final TextEditingController _ssfInvestmentController =
      TextEditingController();
  final TextEditingController _rmfInvestmentController =
      TextEditingController();
  final TextEditingController _thaiEsgInvestmentController =
      TextEditingController();
  final TextEditingController _generalDonationController =
      TextEditingController();
  final TextEditingController _eduSportHospitalDonationController =
      TextEditingController();

  String _maritalStatus = 'Single';
  String _parentalDeduction = 'None';
  String _disabledDependentDeduction = 'None';

  final _formKey = GlobalKey<FormState>();

  double _totalTaxDeduction = 0.0;

  @override
  void dispose() {
    _monthlyIncomeController.dispose();
    _bonusController.dispose();
    _otherIncomeController.dispose();
    _personalDeductionController.dispose();
    _providentFundController.dispose();
    _socialSecurityController.dispose();
    _housingInterestController.dispose();
    _lifeInsuranceController.dispose();
    _healthInsuranceController.dispose();
    _parentHealthInsuranceController.dispose();
    _pensionInsuranceController.dispose();
    _nationalSavingsFundController.dispose();
    _privateTeacherFundController.dispose();
    _ssfInvestmentController.dispose();
    _rmfInvestmentController.dispose();
    _thaiEsgInvestmentController.dispose();
    _generalDonationController.dispose();
    _eduSportHospitalDonationController.dispose();
    super.dispose();
  }

  void _calculate() {
  if (_formKey.currentState?.validate() ?? false) {
    final double monthlyIncome = double.parse(_monthlyIncomeController.text);
    final double bonus = double.parse(_bonusController.text);
    final double otherIncome = double.parse(_otherIncomeController.text);
    final double personalDeduction =
        double.parse(_personalDeductionController.text);
    final double providentFund = double.parse(_providentFundController.text);
    final double socialSecurity = double.parse(_socialSecurityController.text);
    final double housingInterest =
        double.parse(_housingInterestController.text);
    final double lifeInsurance = double.parse(_lifeInsuranceController.text);
    final double healthInsurance =
        double.parse(_healthInsuranceController.text);
    final double parentHealthInsurance =
        double.parse(_parentHealthInsuranceController.text);
    final double pensionInsurance =
        double.parse(_pensionInsuranceController.text);
    final double nationalSavingsFund =
        double.parse(_nationalSavingsFundController.text);
    final double privateTeacherFund =
        double.parse(_privateTeacherFundController.text);
    final double ssfInvestment = double.parse(_ssfInvestmentController.text);
    final double rmfInvestment = double.parse(_rmfInvestmentController.text);
    final double thaiEsgInvestment =
        double.parse(_thaiEsgInvestmentController.text);
    final double generalDonation =
        double.parse(_generalDonationController.text);
    final double eduSportHospitalDonation =
        double.parse(_eduSportHospitalDonationController.text);

    // รวมรายได้
    final double totalIncome = (monthlyIncome * 12) + bonus + otherIncome;

    // รวมค่าใช้จ่ายค่าลดหย่อนและเงินบริจาค
    final double totalDeductions = personalDeduction +
        providentFund +
        socialSecurity +
        housingInterest +
        lifeInsurance +
        healthInsurance +
        parentHealthInsurance +
        pensionInsurance +
        nationalSavingsFund +
        privateTeacherFund +
        ssfInvestment +
        rmfInvestment +
        thaiEsgInvestment +
        generalDonation +
        eduSportHospitalDonation;

    // รายได้สุทธิ
    final double netIncome = totalIncome - totalDeductions;

    // คำนวณภาษีที่ต้องเสีย
    double tax = 0.0;
    if (netIncome <= 150000) {
      tax = 0;
    } else if (netIncome <= 300000) {
      tax = (netIncome - 150000) * 0.05;
    } else if (netIncome <= 500000) {
      tax = (netIncome - 300000) * 0.10 + 7500;
    } else if (netIncome <= 750000) {
      tax = (netIncome - 500000) * 0.15 + 27500;
    } else if (netIncome <= 1000000) {
      tax = (netIncome - 750000) * 0.20 + 65000;
    } else if (netIncome <= 2000000) {
      tax = (netIncome - 1000000) * 0.25 + 115000;
    } else if (netIncome <= 5000000) {
      tax = (netIncome - 2000000) * 0.30 + 365000;
    } else {
      tax = (netIncome - 5000000) * 0.35 + 1265000;
    }

    // ส่งผลลัพธ์ไปยังหน้าผลลัพธ์
    Navigator.pushNamed(
      context,
      taxResult,
      arguments: TaxResultArguments(
        totalTax: tax,
        totalIncome: totalIncome,
        totalDeductions: totalDeductions,
        netIncome: netIncome,
      ),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แบบฟอร์มภาษี'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/all-finsavvy-image/taxtop.png",
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _monthlyIncomeController,
                  decoration: const InputDecoration(
                    labelText: 'รายได้ต่อเดือน',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรายได้ต่อเดือน';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _bonusController,
                  decoration: const InputDecoration(
                    labelText: 'โบนัส',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกโบนัส';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _otherIncomeController,
                  decoration: const InputDecoration(
                    labelText: 'รายได้อื่นๆ',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรายได้อื่นๆ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _personalDeductionController,
                  decoration: const InputDecoration(
                    labelText: 'ค่าลดหย่อนส่วนตัว',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกค่าลดหย่อนส่วนตัว';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'สถานะสมรส',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    ListTile(
                      title: const Text('โสด'),
                      leading: Radio<String>(
                        value: 'Single',
                        groupValue: _maritalStatus,
                        onChanged: (value) {
                          setState(() {
                            _maritalStatus = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('แต่งงาน'),
                      leading: Radio<String>(
                        value: 'Married',
                        groupValue: _maritalStatus,
                        onChanged: (value) {
                          setState(() {
                            _maritalStatus = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ลดหย่อนบิดา-มารดา (ตนเอง)',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    ListTile(
                      title: const Text('ไม่มี'),
                      leading: Radio<String>(
                        value: 'None',
                        groupValue: _parentalDeduction,
                        onChanged: (value) {
                          setState(() {
                            _parentalDeduction = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('บิดา'),
                      leading: Radio<String>(
                        value: 'Father',
                        groupValue: _parentalDeduction,
                        onChanged: (value) {
                          setState(() {
                            _parentalDeduction = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('มารดา'),
                      leading: Radio<String>(
                        value: 'Mother',
                        groupValue: _parentalDeduction,
                        onChanged: (value) {
                          setState(() {
                            _parentalDeduction = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ลดหย่อนผู้พิการหรือทุพพลภาพ (ไม่มีเงินได้)',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    ListTile(
                      title: const Text('ไม่มี'),
                      leading: Radio<String>(
                        value: 'None',
                        groupValue: _disabledDependentDeduction,
                        onChanged: (value) {
                          setState(() {
                            _disabledDependentDeduction = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('บิดา'),
                      leading: Radio<String>(
                        value: 'Father',
                        groupValue: _disabledDependentDeduction,
                        onChanged: (value) {
                          setState(() {
                            _disabledDependentDeduction = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('มารดา'),
                      leading: Radio<String>(
                        value: 'Mother',
                        groupValue: _disabledDependentDeduction,
                        onChanged: (value) {
                          setState(() {
                            _disabledDependentDeduction = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('ญาติ'),
                      leading: Radio<String>(
                        value: 'Relative',
                        groupValue: _disabledDependentDeduction,
                        onChanged: (value) {
                          setState(() {
                            _disabledDependentDeduction = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _providentFundController,
                  decoration: const InputDecoration(
                    labelText: 'ค่าลดหย่อนกองทุนสำรองเลี้ยงชีพ',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกค่าลดหย่อนกองทุนสำรองเลี้ยงชีพ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _socialSecurityController,
                  decoration: const InputDecoration(
                    labelText: 'เงินประกันสังคม',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกเงินประกันสังคม';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _housingInterestController,
                  decoration: const InputDecoration(
                    labelText: 'ดอกเบี้ยซื้อที่อยู่อาศัย',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกดอกเบี้ยซื้อที่อยู่อาศัย';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _lifeInsuranceController,
                  decoration: const InputDecoration(
                    labelText: 'เบี้ยประกันชีวิต',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกเบี้ยประกันชีวิต';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _healthInsuranceController,
                  decoration: const InputDecoration(
                    labelText: 'เบี้ยประกันสุขภาพ',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกเบี้ยประกันสุขภาพ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _parentHealthInsuranceController,
                  decoration: const InputDecoration(
                    labelText: 'เบี้ยประกันสุขภาพบิดา/มารดา',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกเบี้ยประกันสุขภาพบิดา/มารดา';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _pensionInsuranceController,
                  decoration: const InputDecoration(
                    labelText: 'เบี้ยประกันชีวิตบำนาญ',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกเบี้ยประกันชีวิตบำนาญ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _nationalSavingsFundController,
                  decoration: const InputDecoration(
                    labelText: 'กองทุนออมแห่งชาติ',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกกองทุนออมแห่งชาติ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _privateTeacherFundController,
                  decoration: const InputDecoration(
                    labelText: 'กองทุนครูเอกชน',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกกองทุนครูเอกชน';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _ssfInvestmentController,
                  decoration: const InputDecoration(
                    labelText: 'ลงทุน SSF',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกลงทุน SSF';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _rmfInvestmentController,
                  decoration: const InputDecoration(
                    labelText: 'ลงทุน RMF',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกลงทุน RMF';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _thaiEsgInvestmentController,
                  decoration: const InputDecoration(
                    labelText: 'ลงทุน ThaiESG',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกลงทุน ThaiESG';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _generalDonationController,
                  decoration: const InputDecoration(
                    labelText: 'เงินบริจาคทั่วไป',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกเงินบริจาคทั่วไป';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _eduSportHospitalDonationController,
                  decoration: const InputDecoration(
                    labelText:
                        'เงินบริจาคสนับสนุนการศึกษา/กีฬา/โรงพยาบาล',
                    suffixText: 'บาท',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกเงินบริจาคสนับสนุนการศึกษา/กีฬา/โรงพยาบาล';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _calculate,
                  child: const Text('คำนวณ'),
                ),
                const SizedBox(height: 16.0),
                if (_totalTaxDeduction > 0)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'ยอดรวมค่าลดหย่อนภาษี: ${_totalTaxDeduction.toStringAsFixed(2)} บาท'),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
