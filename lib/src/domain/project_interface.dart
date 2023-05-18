import 'dart:convert';

import 'package:flutter/services.dart';

import 'project.dart';

abstract class _ProjectInterface {
  Future<Map<ProjectType, Project>> fetchProjects();
}

class ProjectRepository implements _ProjectInterface {
  static const projectJson = 'projects/projects.json';

  Future<String> getJson() => rootBundle.loadString(projectJson);

  @override
  Future<Map<ProjectType, Project>> fetchProjects() async {
    final jsonString = await rootBundle.loadString(projectJson);
    final jsonData = json.decode(jsonString) as Map<String, dynamic>;

    Map<ProjectType, Project> projects = {};
    for (var entry in jsonData.entries) {
      final projectType = ProjectType.values
          .firstWhere((e) => e.toString().split('.').last == entry.key);
      final projectData = entry.value;
      projects[projectType] = Project(
        title: projectData['title'],
        shortDescription: projectData['shortDescription'],
        description: projectData['description'],
        architectureDescription: projectData['architectureDescription'],
        gitHubUrl: projectData['gitHubUrl'],
      );
    }
    return projects;
  }
}
