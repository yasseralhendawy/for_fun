import 'package:flutter/material.dart';
import 'package:for_fun/values/colors.dart';

class RightBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.SecondaryElement;
    Path path = Path();
    path.moveTo(size.width- 20, 0);
    path.lineTo(size.width , size.height/2);
    path.lineTo(size.width- 20 , size.height);
    path.lineTo(size.width , size.height/2);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class TopPagePainter extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {
  Path path = Path();
  Paint paint = Paint();


  path =Path();
  path.lineTo(0, size.height*0.75);
  path.quadraticBezierTo(size.width*0.10, size.height*0.55, size.width*0.22, size.height*0.70);
  path.quadraticBezierTo(size.width*0.30, size.height*0.90, size.width*0.40, size.height*0.75);
  path.quadraticBezierTo(size.width*0.52, size.height*0.50, size.width*0.65, size.height*0.70);
  path.quadraticBezierTo(size.width*0.8, size.height*0.95, size.width, size.height*0.65);
  path.lineTo(size.width, 0);
  path.close();


  paint.color = AppColors.SecondaryElement;
  canvas.drawPath(path, paint);
}

@override
bool shouldRepaint(CustomPainter oldDelegate) => true;
}