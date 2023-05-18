import 'dart:convert';

import 'package:flutter/services.dart';

enum ProjectType {
  ricedrop,
  glum,
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
}

extension ProjectTypeX on ProjectType {
  Future<int> assetLength() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('projects/$name/'))
        // .where((String key) => key.contains('.png'))
        .toList();
    //-1 as we're not including the cover image in the Image wheel.
    return imagePaths.length - 1;
  }
}
