class Project {
  final String? name;
  final String? description;
  final String? image;
  final String? url;
  final List<String>? skills;

  Project({this.name, this.description, this.image, this.url, this.skills});
}

// ignore: non_constant_identifier_names
List<Project> PROJECTS = [
  Project(
    name: 'Glamoure',
    description:
        'Write clean efficient and maintainable code to implement the features and functionalities outlined in the project requirements. Work with the design team to implement the UI/UX according to the provided pixel-perfect guidelines Use version control systems such as it to manage and track changes to the codebase',
    image: 'assets/Frame.png',
    url: 'https://play.google.com/store/apps/',
    skills: [
      'Dart',
      'Flutter',
      'Git',
    ],
  )
];
