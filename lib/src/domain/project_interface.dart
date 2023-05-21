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
      final assetLength = await getAssetLength(projectType);
      final basePath = await getbasePath(projectType);

      projects[projectType] = Project(
        title: projectData['title'],
        shortDescription: projectData['shortDescription'],
        description: projectData['description'],
        architectureDescription: projectData['architectureDescription'],
        gitHubUrl: projectData['gitHubUrl'],
        assetLength: assetLength,
        basePath: basePath,
      );
    }
    return projects;
  }

  Future<String> getbasePath(ProjectType projectType) async {
    final String gifPath = 'projects/${projectType.folderName}/cover.gif';
    final String pngPath = 'projects/${projectType.folderName}/cover.png';

    try {
      await rootBundle.load(pngPath);
      return pngPath;
    } catch (e) {
      return gifPath;
    }
  }

  Future<int> getAssetLength(ProjectType projectType) async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final imagePaths = manifestMap.keys
        .where(
            (String key) => key.contains('projects/${projectType.folderName}/'))
        .toList();
    return imagePaths.length - 1;
  }
}
