import 'package:flutter/material.dart';

class TopCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();

    Path bgTop = new Path();
    bgTop.addRect(Rect.fromLTRB(0, 0, size.width, size.height));
    paint.color = Colors.blue[400];
    canvas.drawPath(bgTop, paint);

    var leftTop = Offset(size.width * 0, -05);
    paint.color = Colors.blue[300];
    canvas.drawCircle(leftTop, 120, paint);

    var rightTop = Offset(size.width * .95, size.height * .10);
    paint.color = Colors.blue[300];
    canvas.drawCircle(rightTop, 50, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
