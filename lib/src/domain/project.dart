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
  final int assetLength;

  Project({
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.architectureDescription,
    required this.gitHubUrl,
    required this.assetLength,
  });

  factory Project.empty() {
    return Project(
      title: '',
      shortDescription: '',
      description: '',
      architectureDescription: '',
      gitHubUrl: '',
      assetLength: 0,
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
