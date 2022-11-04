import 'dart:convert';

import 'package:flutter/services.dart';

enum ProjectType {
  inky,
  githubOAuth,
  crackd,
}

class Project {
  final String title;
  final String shortDescription;
  final String description;
  final String architectureDescription;
  final String gitHubUrl;

  Project({
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.architectureDescription,
    required this.gitHubUrl,
  });

  Future<int> _initAssets(ProjectType projectType) async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) =>
            key.contains('/assets/projects/${projectType.name}'))
        .where((String key) => key.contains('.png'))
        .toList();

    return imagePaths.length;
  }
}

Map<ProjectType, Project> projects = {
  ProjectType.crackd: Project(
    title: 'Crack\'d',
    shortDescription: 'A easy-to-use Pomodoro',
    description: '''
A flexible and easy-to-use Pomodoro technique productivity app designed for your work and study
        ''',
    architectureDescription: 'Stack information',
    gitHubUrl: 'www.youtube.com',
  ),
  ProjectType.inky: Project(
    title: 'Inky',
    shortDescription: 'Inspiration archiving app',
    description: '''
A flexible and easy-to-use Pomodoro technique productivity app designed for your work and study
        ''',
    architectureDescription: 'Stack information',
    gitHubUrl: 'www.youtube.com',
  ),
  ProjectType.githubOAuth: Project(
    title: 'OAuth 2.0',
    shortDescription: 'GitHub\'s OAuth 2.0 implementation',
    description: '''
A flexible and easy-to-use Pomodoro technique productivity app designed for your work and study
        ''',
    architectureDescription: 'Stack information',
    gitHubUrl: 'www.youtube.com',
  ),
};

extension ProjectTypeX on ProjectType {
  String get title => projects[this]?.title ?? '';
  String get shortDescription => projects[this]?.shortDescription ?? '';
  String get description => projects[this]?.description ?? '';
  String get architectureDescription =>
      projects[this]?.architectureDescription ?? '';
  String get gitHubUrl => projects[this]?.gitHubUrl ?? '';
  String get assetPath => 'projects/$name';

  Future<int> assetLength() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('projects/$name/'))
        // .where((String key) => key.contains('.png'))
        .toList();

    print(imagePaths.length);
    //-1 as we're not including the cover image in the Image wheel.
    return imagePaths.length - 1;
  }
}
