import 'package:freeman_portfolio/src/domain/project_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../domain/project.dart';

part 'project_notifier.freezed.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const ProjectsState._();
  const factory ProjectsState.initial() = _Initial;
  const factory ProjectsState.loadInProgress() = _LoadInProgress;
  const factory ProjectsState.loadSuccess(
      {required Map<ProjectType, Project> projects}) = _LoadSuccess;
  const factory ProjectsState.loadFailure() = _LoadFailure;
}

class ProjectsNotifier extends StateNotifier<ProjectsState> {
  final ProjectRepository _projectRepository;

  ProjectsNotifier(ProjectRepository repository)
      : _projectRepository = repository,
        super(const ProjectsState.initial()) {
    _fetchProjects();
  }

  void _fetchProjects() async {
    state = const ProjectsState.loadInProgress();
    final projects = await _projectRepository.fetchProjects();
    state = ProjectsState.loadSuccess(projects: projects);
  }
}
