import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  final String title;
  final String description;
  final String architectureDescription;

  Project({
    required this.title,
    required this.description,
    required this.architectureDescription,
  });

  factory Project.initial() => Project(
        title: '',
        description: '',
        architectureDescription: '',
      );

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
