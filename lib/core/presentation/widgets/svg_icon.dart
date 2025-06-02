import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetPath;
  final double size;
  final Color? color;

  const SvgIcon({super.key, required this.assetPath, this.size = 24, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: size,
      width: size,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
