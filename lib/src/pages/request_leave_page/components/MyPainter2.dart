import 'package:flutter/material.dart';

class MyPainter2 extends CustomPainter {
  Color color;
  Size size;
  MyPainter2({this.color = Colors.black54, this.size});
  @override
  void paint(Canvas canvas, Size size) {
    size = size;
    Paint paint = new Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    var path = Path();
    path.moveTo(0, 0);
    //top
    for (double i = 0; i <= size.width; i = i + 3) {
      if (i % 2 != 0) path.moveTo(i, 0);
      if (i % 2 == 0) {
        path.lineTo(i, 0);
      }
    }
    //right
    path.moveTo(size.width, 0);
    for (double i = 0; i <= size.height; i = i + 3) {
      if (i % 2 != 0) path.moveTo(size.width, i);
      if (i % 2 == 0) {
        path.lineTo(size.width, i);
      }
    }
    //left
    path.moveTo(0, 0);
    for (double i = 0; i <= size.height; i = i + 3) {
      if (i % 2 != 0) path.moveTo(0, i);
      if (i % 2 == 0) {
        path.lineTo(0, i);
      }
    }
    //bottom
    path.moveTo(0, size.height);
    for (double i = 0; i <= size.width; i = i + 3) {
      if (i % 2 != 0) path.moveTo(i, size.height);
      if (i % 2 == 0) {
        path.lineTo(i, size.height);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
