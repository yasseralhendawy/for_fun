import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class RightPageViewClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width , size.height);
    path.lineTo(size.width , size.height/3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(RightPageViewClipper oldClipper) => false;
}

class LeftPageViewClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width , size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height/3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(LeftPageViewClipper oldClipper) => true;
}

class CompanyProfileClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width- 40, 0);
    path.lineTo(size.width , size.height/2);
    path.lineTo(size.width- 40 , size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CompanyProfileClip oldClipper) => true;
}


class CharacterClipper extends CustomClipper<Path>{


  @override
  Path getClip(Size size) {
    Path path=Path();
    path= parseSvgPathData(
"M386.93,96.66a40.22,40.22,0,0,0-.48-5.82c-.05-.36-.11-.72-.17-1.09-.3-1.83-.71-3.76-1.22-5.73-.1-.39-.21-.79-.32-1.19-.54-2-1.18-4-1.91-6-.29-.78-.6-1.56-.92-2.33a37.91,37.91,0,0,0-7.14-11.68c-7.32-7.51-20.08-20-45.55-20V43c-1.15-.05-2.3-.09-3.49-.09H260.07c-1.55,0-51.31.14-64.21,1.23-13.11,1.11-37.68,3.91-49.91,19-10,12.31-11.48,21.42-11.48,30.46s4.66,26.1,12.15,33.78c7.32,7.51,20.08,20,45.55,20l.35,34.94a24.69,24.69,0,0,1-4,14,25.38,25.38,0,0,1-2,2.55,36.27,36.27,0,0,1-9.9,8.05,24.63,24.63,0,0,1-11.65,3c-20.9.17-50.86.57-61.49,1.47-17,1.43-48.79,5.07-64.62,24.62C26,251.93,24,263.72,24,275.43s6,33.8,15.74,43.75c9.48,9.72,30.52,25.9,63.51,25.9H298c30.84,0,46.24-13.69,53.15-35.6,8.17-26,12.87-66,10.21-162.12v-.11a16.48,16.48,0,0,1,6.89-13.44,36.27,36.27,0,0,0,7.2-6.69h0c6.54-8.08,9.44-14.78,10.66-21,.12-.59.22-1.18.3-1.76a52.13,52.13,0,0,0,.51-7.72Z"    );
    final Rect pathBounds = path.getBounds();
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(size.width / pathBounds.width, size.height / pathBounds.height);
    matrix4.translate(24.01);
    return path.transform(matrix4.storage);
  }

  @override
  bool shouldReclip(CharacterClipper oldClipper) => true;


}
