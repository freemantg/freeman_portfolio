import 'package:flutter/material.dart';

class Insets {
  static double gutterScale = 1;
  static const double scale = 1;

  /// Dynamic insets, may get scaled with the device size
  static double mGutter = m * gutterScale;
  static double lGutter = l * gutterScale;
  static const double xs = 2 * scale;
  static const double sm = 6 * scale;
  static const double m = 12 * scale;
  static const double l = 24 * scale;
  static const double xl = 36 * scale;
}

class Fonts {
  static const String codecPro = 'Codec Pro';
}

class TextStyles {
  static const TextStyle codecPro = TextStyle(
    fontFamily: Fonts.codecPro,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get h1 => codecPro.copyWith(
      fontWeight: FontWeight.w600, fontSize: 75, letterSpacing: -3);
  static TextStyle get h2 => h1.copyWith(fontSize: 24);
  static TextStyle get h3 => h1.copyWith(fontSize: 14);
  static TextStyle get title1 =>
      codecPro.copyWith(fontSize: 17, fontWeight: FontWeight.w600);
  static TextStyle get title2 =>
      title1.copyWith(fontSize: 15, fontWeight: FontWeight.normal);
  static TextStyle get body1 =>
      codecPro.copyWith(fontWeight: FontWeight.normal, fontSize: 14);
  static TextStyle get body2 => body1.copyWith(fontSize: 12);
  static TextStyle get caption =>
      codecPro.copyWith(fontWeight: FontWeight.w500, fontSize: 11);
}

class Space extends StatelessWidget {
  final double width;
  final double height;

  const Space({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(width: width, height: height);
}

class VSpace extends StatelessWidget {
  final double size;
  const VSpace({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Space(width: size, height: 0);
  }
}

class HSpace extends StatelessWidget {
  final double size;
  const HSpace({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Space(width: 0, height: size);
  }
}
