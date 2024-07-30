import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> _questions = [
    Question(
      questionText: 'ความรู้เรื่องการเงินสามารถใช้ได้ตลอดชีวิต เพราะอะไร?',
      options: [
        'เครื่องมือการเงินมีการปรับเปลี่ยน',
        'หลักการทางการเงินไม่เปลี่ยนแปลง',
        'การลงทุนต้องมีการปรับตัว',
        'การออมเงินมีการพัฒนา',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'การจัดการสภาพคล่องควรทำอย่างไร?',
      options: [
        'ใช้เงินตามความสุข',
        'ออมเงินให้เพียงพอตามรายได้',
        'ลงทุนในตลาดหุ้น',
        'ใช้เงินตามความฝัน',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'การจัดการความเสี่ยงเกี่ยวข้องกับอะไร?',
      options: [
        'การประกันภัย',
        'การสะสมทรัพย์สิน',
        'การวางแผนเกษียณ',
        'การลงทุนในหุ้น',
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'หลักการสำคัญของการสะสมความมั่งคั่งคืออะไร?',
      options: [
        'ลงทุนให้มากที่สุด',
        'ลงทุนตามความรู้ที่มี',
        'ลงทุนในอสังหาริมทรัพย์',
        'ใช้ชีวิตอย่างประหยัด',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'การวางแผนการเงินมีความสำคัญอย่างไร?',
      options: [
        'เพื่อให้มีเงินเยอะที่สุด',
        'เพื่อเตรียมรับมือกับอนาคต',
        'เพื่อใช้ชีวิตหรูหรา',
        'เพื่อเก็บเงินให้ลูกหลาน',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'เมื่อรายได้น้อย ควรทำอย่างไร?',
      options: [
        'ใช้เงินฟุ่มเฟือย',
        'หาได้น้อยออมน้อย',
        'ไม่ต้องออม',
        'ยืมเงินเพื่อใช้จ่าย',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'การเตรียมพร้อมรับมือกับเรื่องร้ายๆ ควรทำอย่างไร?',
      options: [
        'ไม่ต้องเตรียมการ',
        'วางแผนและจัดการผลกระทบ',
        'หวังว่ามันจะไม่เกิดขึ้น',
        'ใช้เงินทั้งหมดในปัจจุบัน',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'การลงทุนที่ดีควรทำอย่างไร?',
      options: [
        'ลงทุนตามที่คนอื่นแนะนำ',
        'ลงทุนตามความรู้และจริตของตัวเอง',
        'ลงทุนในสินทรัพย์ที่มีความเสี่ยงสูง',
        'ลงทุนทั้งหมดในอสังหาริมทรัพย์',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'การรู้จักวางแผนการเงินหมายถึงอะไร?',
      options: [
        'การมีเงินเยอะที่สุด',
        'การเตรียมการในปัจจุบันเพื่ออนาคต',
        'การใช้ชีวิตฟุ่มเฟือย',
        'การไม่มีหนี้สิน',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'การสะสมความมั่งคั่งมีขั้นตอนอย่างไร?',
      options: [
        'ลงทุนต่อยอดเงินที่มี',
        'ใช้เงินทั้งหมดในปัจจุบัน',
        'ออมเงินแล้วไม่ลงทุน',
        'ไม่ต้องทำอะไร',
      ],
      correctAnswerIndex: 0,
    ),
  ];

  final Map<int, int> _selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ข้อที่ ${index + 1}: ${_questions[index].questionText}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ..._questions[index].options.asMap().entries.map(
                        (option) => RadioListTile<int>(
                          title: Text(option.value),
                          value: option.key,
                          groupValue: _selectedAnswers[index],
                          onChanged: (value) {
                            setState(() {
                              _selectedAnswers[index] = value!;
                            });
                          },
                        ),
                      ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: _checkAnswers,
      ),
    );
  }

  void _checkAnswers() {
    int score = 0;
    _selectedAnswers.forEach((index, answer) {
      if (answer == _questions[index].correctAnswerIndex) {
        score++;
      }
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('ผลลัพธ์'),
        content: Text('คุณได้คะแนน $score / ${_questions.length}\n\n${_getAnswerExplanation()}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('ตกลง'),
          ),
        ],
      ),
    );
  }

  String _getAnswerExplanation() {
    String explanation = 'เฉลย\n\n';
    for (int i = 0; i < _questions.length; i++) {
      explanation += 'ข้อที่ ${i + 1}\n${_questions[i].questionText}\n';
      explanation += 'คำตอบ: ${_questions[i].options[_questions[i].correctAnswerIndex]}\n\n';
    }
    return explanation;
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}
