import 'package:freeman_portfolio/src/application/theme_notifier.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:riverpod/riverpod.dart';

import 'theme.dart';

//APP ROUTER
final appRouterProvider = Provider((ref) => AppRouter());
final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);
