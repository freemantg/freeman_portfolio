// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      title: json['title'] as String,
      description: json['description'] as String,
      architectureDescription: json['architectureDescription'] as String,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'architectureDescription': instance.architectureDescription,
    };
