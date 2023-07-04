import 'package:flutter/cupertino.dart';

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 730;
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}

extension MediaQueryUtils on BuildContext {
  bool get isTablet => MediaQuery.of(this).size.width > 730;
  bool get isDesktop => MediaQuery.of(this).size.width > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}