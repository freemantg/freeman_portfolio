import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/theme.dart';
import 'package:riverpod/riverpod.dart';

//APP ROUTER
final appRouterProvider = Provider((ref) => AppRouter());
final themeProvider = Provider((ref) => AppTheme.fromType(ThemeType.light));
