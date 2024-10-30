import 'dart:math';

import 'package:flutter/material.dart';

class WavyLinePainter extends CustomPainter {
  final double progress;
  final Color color;
  final double amplitude;
  final double frequency;
  final double storkwidth;

  WavyLinePainter(
    this.progress, {
    required this.color,
    required this.amplitude,
    required this.frequency,
    required this.storkwidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = color
      ..strokeWidth = storkwidth
      ..style = PaintingStyle.stroke;

    final path1 = Path();

    // Drawing the first sine wave
    for (double i = 0; i < size.width * progress; i++) {
      double y1 = size.height / 20 +
          amplitude * sin((i / size.width) * frequency * pi); // 1 cycle
      if (i == 0) {
        path1.moveTo(i, y1);
      } else {
        path1.lineTo(i, y1);
      }
    }

    canvas.drawPath(path1, paint1); // Draw the first wave
  }

  @override
  bool shouldRepaint(WavyLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class WavyLinePainter1 extends CustomPainter {
  final double progress;
  final Color color;
  final double stockWidth;
  final double amplitude;
  final double frequency;

  WavyLinePainter1(this.progress,
      {required this.amplitude,
      required this.frequency,
      required this.color,
      required this.stockWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      // ..color = const Color.fromARGB(255, 255, 242, 194)
      ..strokeWidth = stockWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    for (double i = 0; i < size.width * progress; i++) {
      // Adjust the y calculation to start above the center
      double y = size.height / 2 -
          amplitude * sin((i / size.width) * frequency * pi * 2);
      if (i == 0) {
        path.moveTo(i, y);
      } else {
        path.lineTo(i, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavyLinePainter1 oldDelegate) {
    return oldDelegate.progress != progress;
  }
}


// class WavyLinePainter1 extends CustomPainter {
//   final double progress;

//   WavyLinePainter1(this.progress);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color.fromARGB(255, 255, 223, 107)
//       ..strokeWidth = 5.0
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     final path = Path();

//     double amplitude = 150; // Adjust this value for a smoother wave
//     double frequency = 1; // Number of cycles across the width

//     for (double i = 0; i < size.width * progress; i++) {
//       // Adjust the y calculation to start above the center
//       double y = size.height / 2 -
//           amplitude * sin((i / size.width) * frequency * pi * 2);
//       if (i == 0) {
//         path.moveTo(i, y);
//       } else {
//         path.lineTo(i, y);
//       }
//     }

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(WavyLinePainter1 oldDelegate) {
//     return oldDelegate.progress != progress;
//   }
// }
