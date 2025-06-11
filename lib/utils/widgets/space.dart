import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double? height;
  final double? width;

  const Space({super.key, this.height, this.width})
      : assert(height != null || width != null, 'At least one of height or width must be non-null.');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}