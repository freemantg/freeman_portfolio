import 'package:freeman_portfolio/src/application/project_notifier.dart';
import 'package:freeman_portfolio/src/application/theme_notifier.dart';
import 'package:riverpod/riverpod.dart';

import '../domain/project_interface.dart';
import '../infrastructure/url_launcher_repository.dart';
import 'app_router.gr.dart';
import 'theme.dart';

//APP ROUTER
final appRouterProvider = Provider((ref) => AppRouter());
final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

final projectRepositoryProvider = Provider((ref) => ProjectRepository());
final projectsProvider = StateNotifierProvider<ProjectsNotifier, ProjectsState>(
    (ref) => ProjectsNotifier(ref.watch(projectRepositoryProvider)));

final urlLauncherServiceProvider =
    Provider<UrlLauncherService>((ref) => UrlLauncherService());
