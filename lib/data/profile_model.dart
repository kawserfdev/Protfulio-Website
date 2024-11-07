

class Profile {
  final String subject;
  final String aboutMe;
  final String experienceTitle;
  final String cvLink;
  final String aboutMeShortTitle;
  final String resumeLink;
  final List<Skill> skills;
  final double experienceTimeline;
  final int? projectDone;
  final int? happyClients;
  final String plan;
  final String design;
  final String code;
  final List<Project> projectsList;
  final String phone;
  final String email;
  final String address;
  final String githubLink;
  final String linkedinLink;
  final String twitterLink;
  final String fbLink;

  Profile({
    required this.subject,
    required this.aboutMe,
    required this.experienceTitle,
    required this.cvLink,
    required this.aboutMeShortTitle,
    required this.resumeLink,
    this.skills = const [], 
    required this.experienceTimeline,
    this.projectDone,
    this.happyClients,
    required this.plan,
    required this.design,
    required this.code,
    this.projectsList = const [], 
    required this.phone,
    required this.email,
    required this.address,
    required this.githubLink,
    required this.linkedinLink,
    required this.twitterLink,
    required this.fbLink,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
  return Profile(
    subject: map['subject'] as String? ?? '',
    aboutMe: map['aboutMe'] as String? ?? '',
    experienceTitle: map['experienceTitle'] as String? ?? '',
    cvLink: map['cvLink'] as String? ?? '',
    aboutMeShortTitle: map['aboutMeShortTitle'] as String? ?? '',
    resumeLink: map['resumeLink'] as String? ?? '',
    skills: map['skills'] != null && map['skills'] is List
        ? (map['skills'] as List).map((x) => Skill.fromMap(x as Map<String, dynamic>)).toList()
        : [], 
    experienceTimeline: (map['experienceTimeline'] as num?)?.toDouble() ?? 0.0,
    projectDone: map['projectDone'] as int?,
    happyClients: map['happyClients'] as int?,
    plan: map['plan'] as String? ?? '',
    design: map['design'] as String? ?? '',
    code: map['code'] as String? ?? '',
    projectsList: map['projectsList'] != null && map['projectsList'] is List
        ? (map['projectsList'] as List).map((x) => Project.fromMap(x as Map<String, dynamic>)).toList()
        : [], 
    phone: map['phone'] as String? ?? '',
    email: map['email'] as String? ?? '',
    address: map['address'] as String? ?? '',
    githubLink: map['githubLink'] as String? ?? '',
    linkedinLink: map['linkedinLink'] as String? ?? '',
    twitterLink: map['twitterLink'] as String? ?? '',
    fbLink: map['fbLink'] as String? ?? '',
  );
}


  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'aboutMe':aboutMe,
      'experienceTitle': experienceTitle,
      'cvLink': cvLink,
      'aboutMeShortTitle': aboutMeShortTitle,
      'resumeLink': resumeLink,
      'skills': skills.map((x) => x.toMap()).toList(),
      'experienceTimeline': experienceTimeline,
      'projectDone': projectDone,
      'happyClients': happyClients,
      'plan': plan,
      'design': design,
      'code': code,
      'projectsList': projectsList.map((x) => x.toMap()).toList(),
      'phone': phone,
      'email': email,
      'address': address,
      'githubLink': githubLink,
      'linkedinLink': linkedinLink,
      'twitterLink': twitterLink,
      'fbLink': fbLink,
    };
  }
}

class Project {
  final String name;
  final String image;
  final String description;
  final List<String> useTechnology;
  final String projectLink;

  Project({
    required this.name,
    required this.image,
    required this.description,
    required this.useTechnology,
    required this.projectLink,
  });

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'] as String? ?? '',
      image: map['image'] as String? ?? '',
      description: map['description'] as String? ?? '',
      useTechnology: map['useTechnology'] != null
          ? List<String>.from(map['useTechnology'] as List)
          : [],
      projectLink: map['projectLink'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'useTechnology': useTechnology,
      'projectLink': projectLink,
    };
  }
}

class Skill {
  final String skill;
  final String image;

  Skill({
    required this.skill,
    required this.image,
  });

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      skill: map['skill'] as String? ?? '',
      image: map['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'skill': skill,
      'image': image,
    };
  }
}
