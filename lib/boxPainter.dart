import 'package:flutter/material.dart';


class BoxPainter extends CustomPainter{
  Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = Colors.green;
    paint.strokeWidth = 3.0;
    paint.style=PaintingStyle.stroke;
    paint.strokeCap =StrokeCap.round;
    
    
    Rect rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    canvas.drawRect(rect, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
  
}