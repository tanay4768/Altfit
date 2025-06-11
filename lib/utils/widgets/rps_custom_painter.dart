import 'package:flutter/material.dart';

class RPSCustomClipper extends CustomClipper<Path> {
  final double width;

  RPSCustomClipper({super.reclip, required this.width});
  
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0); // Top-left
    path.lineTo(size.width, 0); // Top-right
    path.lineTo(size.width, size.height * 0.85); // Down right edge

    // Wavy bottom curve
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.95, // Control point
      size.width * 0.65, size.height * 0.85,  // Middle
    );
    path.quadraticBezierTo(
      size.width * 0.2, size.height * 0.5, // Control point
      0, size.height * 0.75,                 // Bottom-left
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
