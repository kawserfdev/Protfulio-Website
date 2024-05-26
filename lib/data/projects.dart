import 'dart:convert';

import 'package:flutter/foundation.dart';

class Project {
  final String name;
  final String description;
  final String image;
  final String url;
  final List<String> skills;

  Project({
    required this.name,
    required this.description,
    required this.image,
    required this.url,
    required this.skills,
  });

  Project copyWith({
    String? name,
    String? description,
    String? image,
    String? url,
    List<String>? skills,
  }) {
    return Project(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      url: url ?? this.url,
      skills: skills ?? this.skills,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
      'url': url,
      'skills': skills,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      url: map['url'] as String,
      skills: List<String>.from(map['skills'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) => Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Project(name: $name, description: $description, image: $image, url: $url, skills: $skills)';
  }

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;

    return
      other.name == name &&
          other.description == description &&
          other.image == image &&
          other.url == url &&
          listEquals(other.skills, skills);
  }

  @override
  int get hashCode {
    return name.hashCode ^
    description.hashCode ^
    image.hashCode ^
    url.hashCode ^
    skills.hashCode;
  }
}
