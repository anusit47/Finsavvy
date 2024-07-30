import 'package:flutter/material.dart';
import 'package:finsavvy/route/route_constants.dart';


class LevelScreen2 extends StatelessWidget {
  const LevelScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('พื้นฐานการเงิน'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/all-finsavvy-image/acadawda.png', 
              height: 70,
            ),
            SizedBox(height: 20),
            CustomPaint(
              painter: PathPainter2(),
              child: Container(
                width: 300,
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButton2(level: '5', onPressed: () {}),
                    LevelButton2(level: '4', onPressed: () {}),
                    LevelButton2(level: '3', onPressed: () {}),
                    LevelButton2(level: '2', onPressed: () {}),
                    LevelButton2(level: 'START', onPressed: () {
                      Navigator.pushNamed(context, financeScreen);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class LevelButton2 extends StatelessWidget {
  final String level;
  final VoidCallback onPressed;

  const LevelButton2({required this.level, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(24),
        backgroundColor: level == 'START' || level == '2' ? Color(0xFF8A19D6) : Colors.grey,  
      ),
      child: Text(
        level,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}

class PathPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width / 2, size.height);
    path.quadraticBezierTo(size.width / 2, size.height * 3 / 4, size.width / 2, size.height / 2);
    path.quadraticBezierTo(size.width / 2, size.height / 4, size.width / 2, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}