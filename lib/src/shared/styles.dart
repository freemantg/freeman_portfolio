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
  static const String rilenoSans = 'RilenoSans';
}

class TextStyles {
  static const TextStyle codecPro = TextStyle(
    fontFamily: Fonts.codecPro,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle rilenoSans = TextStyle(
    fontFamily: Fonts.rilenoSans,
    fontWeight: FontWeight.w400,
    fontSize: 55,
  );

  static TextStyle get h0 => rilenoSans.copyWith(fontWeight: FontWeight.w700);

  static TextStyle get h1 => codecPro.copyWith(
      fontWeight: FontWeight.w600, fontSize: 75, letterSpacing: -3, height: 1);
  static TextStyle get h2 => h1.copyWith(fontSize: 52, height: 1.2);
  static TextStyle get h2White => h2.copyWith(color: Colors.white);

  static TextStyle get h3 => h1.copyWith(fontSize: 30);
  static TextStyle get h4 => h1.copyWith(fontSize: 16);
  static TextStyle get projectTitle =>
      codecPro.copyWith(fontSize: 115, fontWeight: FontWeight.w600);

  static TextStyle get projectTitleMobile =>
      codecPro.copyWith(fontSize: 82, fontWeight: FontWeight.w600);

  static TextStyle get projectDescription =>
      rilenoSans.copyWith(fontSize: 21, fontWeight: FontWeight.w100);
  static TextStyle get title1 =>
      codecPro.copyWith(fontSize: 17, fontWeight: FontWeight.w600);
  static TextStyle get title1White => codecPro.copyWith(
      fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle get title2 =>
      title1.copyWith(fontSize: 15, fontWeight: FontWeight.normal);
  static TextStyle get body1 =>
      codecPro.copyWith(fontWeight: FontWeight.w100, fontSize: 16, height: 1.5);
  static TextStyle get body1White => body1.copyWith(color: Colors.white);
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
