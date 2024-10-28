// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Profile {
  final String subject;//
  final String experienceTitle;//
  final String cvLink;//
  final String aboutMeShortTitle;//
  final String resumeLink;//
  final List<String> skills;//
  final double experienceTimeline;//
  final int? projectDone;//
  final int? happyClients;//
  final String plan;//
  final String design;//
  final String code;//
  final List<Project>? projectsList;//
  final String phone;//
  final String email;//
  final String address;//
  final String githubLink;//
  final String linkedinLink;//
  final String twitterLink;//
  final String fbLink;//
  Profile({
    required this.subject,
    required this.experienceTitle,
    required this.cvLink,
    required this.aboutMeShortTitle,
    required this.resumeLink,
    required this.skills,
    required this.experienceTimeline,
    this.projectDone,
    this.happyClients,
    required this.plan,
    required this.design,
    required this.code,
    this.projectsList,
    required this.phone,
    required this.email,
    required this.address,
    required this.githubLink,
    required this.linkedinLink,
    required this.twitterLink,
    required this.fbLink,
  });

  Profile copyWith({
    String? subject,
    String? experienceTitle,
    String? cvLink,
    String? aboutMeShortTitle,
    String? resumeLink,
    List<String>? skills,
    double? experienceTimeline,
    int? projectDone,
    int? happyClients,
    String? plan,
    String? design,
    String? code,
    List<Project>? projectsList,
    String? phone,
    String? email,
    String? address,
    String? githubLink,
    String? linkedinLink,
    String? twitterLink,
    String? fbLink,
  }) {
    return Profile(
      subject: subject ?? this.subject,
      experienceTitle: experienceTitle ?? this.experienceTitle,
      cvLink: cvLink ?? this.cvLink,
      aboutMeShortTitle: aboutMeShortTitle ?? this.aboutMeShortTitle,
      resumeLink: resumeLink ?? this.resumeLink,
      skills: skills ?? this.skills,
      experienceTimeline: experienceTimeline ?? this.experienceTimeline,
      projectDone: projectDone ?? this.projectDone,
      happyClients: happyClients ?? this.happyClients,
      plan: plan ?? this.plan,
      design: design ?? this.design,
      code: code ?? this.code,
      projectsList: projectsList ?? this.projectsList,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      githubLink: githubLink ?? this.githubLink,
      linkedinLink: linkedinLink ?? this.linkedinLink,
      twitterLink: twitterLink ?? this.twitterLink,
      fbLink: fbLink ?? this.fbLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subject': subject,
      'experienceTitle': experienceTitle,
      'cvLink': cvLink,
      'aboutMeShortTitle': aboutMeShortTitle,
      'resumeLink': resumeLink,
      'skills': skills,
      'experienceTimeline': experienceTimeline,
      'projectDone': projectDone,
      'happyClients': happyClients,
      'plan': plan,
      'design': design,
      'code': code,
      'projectsList': projectsList?.map((x) => x.toMap()).toList(),
      'phone': phone,
      'email': email,
      'address': address,
      'githubLink': githubLink,
      'linkedinLink': linkedinLink,
      'twitterLink': twitterLink,
      'fbLink': fbLink,
    };
  }

factory Profile.fromMap(Map<String, dynamic> map) {
  return Profile(
    subject: map['subject'] as String,
    experienceTitle: map['experienceTitle'] as String,
    cvLink: map['cvLink'] as String,
    aboutMeShortTitle: map['aboutMeShortTitle'] as String,
    resumeLink: map['resumeLink'] as String,
    skills: List<String>.from(map['skills'] ?? []),
    experienceTimeline: map['experienceTimeline'] is int
        ? (map['experienceTimeline'] as int).toDouble()
        : map['experienceTimeline'] as double,
    projectDone: map['projectDone'] != null ? map['projectDone'] as int : null,
    happyClients: map['happyClients'] != null ? map['happyClients'] as int : null,
    plan: map['plan'] as String,
    design: map['design'] as String,
    code: map['code'] as String,
    projectsList: map['projectsList'] != null
        ? List<Project>.from(
            (map['projectsList'] as List<dynamic>).map<Project?>(
              (x) => Project.fromMap(x as Map<String, dynamic>),
            ),
          )
        : null,
    phone: map['phone'] as String,
    email: map['email'] as String,
    address: map['address'] as String,
    githubLink: map['githubLink'] as String,
    linkedinLink: map['linkedinLink'] as String,
    twitterLink: map['twitterLink'] as String,
    fbLink: map['fbLink'] as String,
  );
}


  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(subject: $subject, experienceTitle: $experienceTitle, cvLink: $cvLink, aboutMeShortTitle: $aboutMeShortTitle, resumeLink: $resumeLink, skills: $skills, experienceTimeline: $experienceTimeline, projectDone: $projectDone, happyClients: $happyClients, plan: $plan, design: $design, code: $code, projectsList: $projectsList, phone: $phone, email: $email, address: $address, githubLink: $githubLink, linkedinLink: $linkedinLink, twitterLink: $twitterLink, fbLink: $fbLink)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;
  
    return 
      other.subject == subject &&
      other.experienceTitle == experienceTitle &&
      other.cvLink == cvLink &&
      other.aboutMeShortTitle == aboutMeShortTitle &&
      other.resumeLink == resumeLink &&
      listEquals(other.skills, skills) &&
      other.experienceTimeline == experienceTimeline &&
      other.projectDone == projectDone &&
      other.happyClients == happyClients &&
      other.plan == plan &&
      other.design == design &&
      other.code == code &&
      listEquals(other.projectsList, projectsList) &&
      other.phone == phone &&
      other.email == email &&
      other.address == address &&
      other.githubLink == githubLink &&
      other.linkedinLink == linkedinLink &&
      other.twitterLink == twitterLink &&
      other.fbLink == fbLink;
  }

  @override
  int get hashCode {
    return subject.hashCode ^
      experienceTitle.hashCode ^
      cvLink.hashCode ^
      aboutMeShortTitle.hashCode ^
      resumeLink.hashCode ^
      skills.hashCode ^
      experienceTimeline.hashCode ^
      projectDone.hashCode ^
      happyClients.hashCode ^
      plan.hashCode ^
      design.hashCode ^
      code.hashCode ^
      projectsList.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      address.hashCode ^
      githubLink.hashCode ^
      linkedinLink.hashCode ^
      twitterLink.hashCode ^
      fbLink.hashCode;
  }
}

class Project {
  final String name;//
  final String image;//
  final String description;//
  final List<String> useTechnology;//
  final String projectLink;//
  Project({
    required this.name,
    required this.image,
    required this.description,
    required this.useTechnology,
    required this.projectLink,
  });

  Project copyWith({
    String? name,
    String? image,
    String? description,
    List<String>? useTechnology,
    String? projectLink,
  }) {
    return Project(
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      useTechnology: useTechnology ?? this.useTechnology,
      projectLink: projectLink ?? this.projectLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'description': description,
      'useTechnology': useTechnology,
      'projectLink': projectLink,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      useTechnology: List<String>.from(
        (map['useTechnology'] as List<String>),
      ),
      projectLink: map['projectLink'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Project(name: $name, image: $image, description: $description, useTechnology: $useTechnology, projectLink: $projectLink)';
  }

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image == image &&
        other.description == description &&
        listEquals(other.useTechnology, useTechnology) &&
        other.projectLink == projectLink;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        description.hashCode ^
        useTechnology.hashCode ^
        projectLink.hashCode;
  }
}
