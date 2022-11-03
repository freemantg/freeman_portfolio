import 'package:freeman_portfolio/src/shared/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme.fromType(ThemeType.dark));

  void toggleTheme() {
    state = AppTheme.fromType(state.isDark ? ThemeType.light : ThemeType.dark);
  }
}
