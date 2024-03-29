import 'dart:convert';

import 'package:flutter/services.dart';

import 'project.dart';

abstract class _ProjectInterface {
  Future<Map<ProjectType, Project>> fetchProjects();
}

class ProjectRepository implements _ProjectInterface {
  static const projectJson = 'assets/projects/projects.json';

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
      final hoverColor = parseColor(projectData['hoverColor']);
      final basePath = await getbasePath(projectType);

      projects[projectType] = Project(
        title: projectData['title'],
        description: projectData['description'],
        shortDescription: projectData['shortDescription'],
        technicalDescription: projectData['technicalDescription'],
        shortTechnicalDescription: projectData['shortTechnicalDescription'],
        gitHubUrl: projectData['gitHubUrl'],
        assetLength: assetLength,
        basePath: basePath,
        hoverColor: hoverColor,
        hoverDescription: projectData['hoverDescription'],
      );
    }
    return projects;
  }

  Future<String> getbasePath(ProjectType projectType) async {
    final String pngPath =
        'assets/projects/${projectType.folderName}/cover.png';
    return pngPath;
  }

  Future<int> getAssetLength(ProjectType projectType) async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final imagePaths = manifestMap.keys
        .where((String key) =>
            key.contains('assets/projects/${projectType.folderName}/'))
        .toList();
    return imagePaths.length - 1;
  }

  Color parseColor(String colorString) {
    final hexColor = 'FF$colorString';
    final colorValue = int.parse(hexColor, radix: 16);
    return Color(colorValue);
  }
}
