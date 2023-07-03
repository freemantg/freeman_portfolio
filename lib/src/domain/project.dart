import 'package:flutter/material.dart';

enum ProjectType { ricedrop, glum, inky, githubOAuth, crackd, flutterweb }

class Project {
  final String title;
  final String shortDescription;
  final String description;
  final String technicalDescription;
  final String shortTechnicalDescription;
  final String gitHubUrl;
  final int assetLength;
  final String basePath;
  final Color hoverColor;

  Project({
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.technicalDescription,
    required this.shortTechnicalDescription,
    required this.gitHubUrl,
    required this.assetLength,
    required this.basePath,
    this.hoverColor = Colors.white,
  });

  factory Project.empty() {
    return Project(
      title: '',
      shortDescription: '',
      description: '',
      technicalDescription: '',
      shortTechnicalDescription: '',
      gitHubUrl: '',
      assetLength: 0,
      basePath: '',
    );
  }
}

extension ProjectTypeX on ProjectType {
  String get folderName {
    switch (this) {
      case ProjectType.ricedrop:
        return "ricedrop";
      case ProjectType.glum:
        return "glum";
      case ProjectType.inky:
        return "inky";
      case ProjectType.githubOAuth:
        return "oauth2.0";
      case ProjectType.crackd:
        return "crack'd";
      case ProjectType.flutterweb:
        return "flutterweb";
      default:
        throw Exception('Unknown project type');
    }
  }
}

extension ProjectX on Project {
  String get folderName {
    return title.replaceAll(' ', '');
  }
}
