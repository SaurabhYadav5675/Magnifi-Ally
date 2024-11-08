import 'package:flutter/material.dart';
import 'package:magnifi_ally/core/constants/colors.dart';

class ContainerClipper extends CustomClipper<Path> {
  final double? constant;

  ContainerClipper({this.constant});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, constant ?? size.height * 0.018); // Start from top left
    path.lineTo(
        constant ?? size.width * 0.018, 0); // Diagonal line to the right
    path.lineTo(size.width, 0); // Top right corner
    path.lineTo(size.width, size.height); // Bottom right corner
    path.lineTo(0, size.height); // Bottom left corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ContainerPainter extends CustomPainter {
  final double? constant;

  ContainerPainter({this.constant});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(
        0,
        constant ??
            size.height * 0.18); // Adjust the value to match ContainerClipper
    path.lineTo(constant ?? size.width * 0.08,
        0); // Adjust the value to match ContainerClipper
    path.lineTo(size.width, 0); // Top right corner
    path.lineTo(size.width, size.height); // Bottom right corner
    path.lineTo(0, size.height); // Bottom left corner
    path.close();
    final paint = Paint()
      ..color = MagnifiColorPalette.primary.lightBlue.v400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BorderPainter extends CustomPainter {
  final double? constant;

  BorderPainter({this.constant});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = MagnifiColorPalette.primary.neutral.v900;

    final path = Path();
    path.moveTo(
        0,
        constant ??
            size.height * 0.18); // Adjust the value to match ContainerClipper
    path.lineTo(constant ?? size.width * 0.08,
        0); // Adjust the value to match ContainerClipper
    path.lineTo(size.width, 0); // Top right corner
    path.lineTo(size.width, size.height); // Bottom right corner
    path.lineTo(0, size.height); // Bottom left corner
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
