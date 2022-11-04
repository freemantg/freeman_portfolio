import 'dart:convert';

import 'package:flutter/services.dart';

import 'project.dart';

abstract class _ProjectInterface {
  Future<List<Project>> fetchProjects();
}

class ProjectRepository implements _ProjectInterface {
  static const projectJson = 'projects/projects.json';

  Future<String> getJson() => rootBundle.loadString(projectJson);

  @override
  Future<List<Project>> fetchProjects() async {
    var projectData = jsonDecode(await getJson());
    return [];
  }
}
