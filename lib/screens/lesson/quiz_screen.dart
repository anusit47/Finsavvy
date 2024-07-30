import 'package:flutter/material.dart';
import 'package:finsavvy/route/route_constants.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> _questions = [
    Question(
      questionText: 'ความรู้เรื่องการเงินสามารถใช้ได้ตลอดชีวิต เพราะอะไร?',
      options: [
        'เครื่องมือการเงินมีการปรับเปลี่ยน',
        'หลักการทางการเงินไม่เปลี่ยนแปลง',
        'การลงทุนต้องมีการปรับตัว',
        'การออมเงินมีการพัฒนา'
      ],
      answerIndex: 1,
      explanation:
          'แม้ว่าเครื่องมือทางการเงินอาจมีการปรับเปลี่ยนตามยุคสมัย แต่หลักการทางการเงินยังคงเหมือนเดิมและสามารถใช้ได้ตลอดชีวิต',
    ),
    Question(
      questionText: 'การจัดการสภาพคล่องควรทำอย่างไร?',
      options: [
        'ใช้เงินตามความสุข',
        'ออมเงินให้เพียงพอตามรายได้',
        'ลงทุนในตลาดหุ้น',
        'ใช้เงินตามความฝัน',
      ],
      answerIndex: 1,
      explanation:
          'การจัดการสภาพคล่องคือการรักษาสมดุลระหว่างรายได้และการออมเพื่อให้มีเงินเพียงพอใช้ในทุกจังหวะของชีวิต',
    ),
    Question(
      questionText: 'การจัดการความเสี่ยงเกี่ยวข้องกับอะไร?',
      options: [
        'การประกันภัย',
        'การสะสมทรัพย์สิน',
        'การวางแผนเกษียณ',
        'การลงทุนในหุ้น',
      ],
      answerIndex: 0,
      explanation:
          ' การจัดการความเสี่ยงหมายถึงการเตรียมพร้อมรับมือกับเหตุการณ์ไม่คาดฝัน เช่น การเจ็บป่วย อุบัติเหตุ หรือการตกงาน ซึ่งสามารถทำได้ผ่านการประกันภัย',
    ),
    Question(
      questionText: 'หลักการสำคัญของการสะสมความมั่งคั่งคืออะไร?',
      options: [
        'ลงทุนให้มากที่สุด',
        'ลงทุนตามความรู้ที่มี',
        'ลงทุนในอสังหาริมทรัพย์',
        'ใช้ชีวิตอย่างประหยัด',
      ],
      answerIndex: 1,
      explanation:
          'การสะสมความมั่งคั่งหมายถึงการลงทุนตามความรู้และจริตของตัวเอง ซึ่งช่วยให้การลงทุนมีโอกาสประสบความสำเร็จมากขึ้น',
    ),
    Question(
      questionText: 'การวางแผนการเงินมีความสำคัญอย่างไร?',
      options: [
        'เพื่อให้มีเงินเยอะที่สุด',
        'เพื่อเตรียมรับมือกับอนาคต',
        'เพื่อใช้ชีวิตหรูหรา',
        'เพื่อเก็บเงินให้ลูกหลาน',
      ],
      answerIndex: 1,
      explanation:
          'การวางแผนการเงินช่วยให้เรามองเห็นอนาคตและเตรียมการในปัจจุบันเพื่อพร้อมรับมือกับเหตุการณ์ต่าง ๆ ที่อาจเกิดขึ้น',
    ),
    Question(
      questionText: 'เมื่อรายได้น้อย ควรทำอย่างไร?',
      options: [
        'ใช้เงินฟุ่มเฟือย',
        'หาได้น้อยออมน้อย',
        'ไม่ต้องออม',
        'ยืมเงินเพื่อใช้จ่าย',
      ],
      answerIndex: 1,
      explanation:
          'ไม่ว่าเราจะมีรายได้มากหรือน้อย การออมเงินเป็นสิ่งสำคัญ การหาได้น้อยออมน้อยยังดีกว่าไม่ออมเลย',
    ),
    Question(
      questionText: 'การเตรียมพร้อมรับมือกับเรื่องร้ายๆ ควรทำอย่างไร?',
      options: [
        'ไม่ต้องเตรียมการ',
        'วางแผนและจัดการผลกระทบ',
        'หวังว่ามันจะไม่เกิดขึ้น',
        'ใช้เงินทั้งหมดในปัจจุบัน',
      ],
      answerIndex: 1,
      explanation:
          'ไม่มีใครรู้ว่าเรื่องร้าย ๆ จะเกิดขึ้นเมื่อไหร่ แต่เราสามารถวางแผนและเตรียมการเพื่อจัดการผลกระทบได้',
    ),
    Question(
      questionText: 'การลงทุนที่ดีควรทำอย่างไร?',
      options: [
        'ลงทุนตามที่คนอื่นแนะนำ',
        'ลงทุนตามความรู้และจริตของตัวเอง',
        'ลงทุนในสินทรัพย์ที่มีความเสี่ยงสูง',
        'ลงทุนทั้งหมดในอสังหาริมทรัพย์',
      ],
      answerIndex: 1,
      explanation:
          'การลงทุนที่ดีควรลงทุนในสิ่งที่เรามีความรู้และเข้าใจดี เพื่อให้การลงทุนมีโอกาสประสบความสำเร็จมากขึ้น',
    ),
    Question(
      questionText: 'การรู้จักวางแผนการเงินหมายถึงอะไร?',
      options: [
        'การมีเงินเยอะที่สุด',
        'การเตรียมการในปัจจุบันเพื่ออนาคต',
        'การใช้ชีวิตฟุ่มเฟือย',
        'การไม่มีหนี้สิน',
      ],
      answerIndex: 1,
      explanation:
          'การวางแผนการเงินหมายถึงการมองเห็นอนาคตและเตรียมการในปัจจุบันเพื่อพร้อมรับมือกับเหตุการณ์ต่าง ๆ ที่อาจเกิดขึ้น',
    ),
    Question(
      questionText: 'การสะสมความมั่งคั่งมีขั้นตอนอย่างไร?',
      options: [
        'ลงทุนต่อยอดเงินที่มี',
        'ใช้เงินทั้งหมดในปัจจุบัน',
        'ออมเงินแล้วไม่ลงทุน',
        'ไม่ต้องทำอะไร',
      ],
      answerIndex: 0,
      explanation:
          'การสะสมความมั่งคั่งคือการลงทุนต่อยอดจากเงินที่มีอยู่แล้ว เพื่อให้เกิดการเพิ่มพูนในระยะยาว',
    ),
  ];

  final List<int> _selectedAnswers = List<int>.filled(10, -1, growable: false);
  bool _showResult = false;

  void _submitQuiz() {
    if (_selectedAnswers.contains(-1)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('กรุณาตอบทุกข้อก่อนส่งคำตอบ'),
        ),
      );
      return;
    }

    setState(() {
      _showResult = true;
    });
  }

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
      body: Column(
        children: [
          Image.asset(
            'assets/images/all-finsavvy-image/quiz.png', 
            height: 90,
          ),
          Expanded(
            child: _showResult ? _buildResultView() : _buildQuizView(),
          ),
          if (!_showResult)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _submitQuiz,
                child: Text('Submit'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQuizView() {
    return ListView.builder(
      itemCount: _questions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Card(
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
          ),
        );
      },
    );
  }

  Widget _buildResultView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: List.generate(_questions.length, (index) {
                final question = _questions[index];
                final selectedAnswer = _selectedAnswers[index];
                final isCorrect = selectedAnswer == question.answerIndex;
                return Card(
                  margin: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10), 
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ข้อที่ ${index + 1}: ${question.questionText}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'คำตอบของคุณ: ${question.options[selectedAnswer]}',
                          style: TextStyle(
                              fontSize: 16,
                              color: isCorrect ? Colors.green : Colors.red),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'คำตอบที่ถูกต้อง: ${question.options[question.answerIndex]}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'คำอธิบาย: ${question.explanation}',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              
              onPressed: () {
                Navigator.pushNamed(context, levelScreen2);
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int answerIndex;
  final String explanation;

  Question({
    required this.questionText,
    required this.options,
    required this.answerIndex,
    required this.explanation,
  });
}
