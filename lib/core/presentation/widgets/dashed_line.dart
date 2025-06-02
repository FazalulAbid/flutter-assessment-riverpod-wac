import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashSpacing;
  final Color color;

  const DashedLine({
    super.key,
    this.height = 1,
    this.dashWidth = 5,
    this.dashSpacing = 3,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: CustomPaint(
        painter: _DashedLinePainter(
          dashWidth: dashWidth,
          dashSpacing: dashSpacing,
          color: color,
          height: height,
        ),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpacing;
  final Color color;
  final double height;

  _DashedLinePainter({
    required this.dashWidth,
    required this.dashSpacing,
    required this.color,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = height;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
