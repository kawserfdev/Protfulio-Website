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
    name: 'Venue Finder',
    description:
        'Venue Finder is the ultimate solution for finding and booking venues tailored to your specific needs. Whether youre planning a corporate meeting, wedding, or special event, our app offers a variety of spaces from small rooms for a few attendees to large venues that can accommodate hundreds.',
    image: 'assets/images/venue_finder_logo.jpg',
    url:
        'https://play.google.com/store/apps/details?id=com.venuefinder.mobileapp&pcampaignid=web_share',
    skills: ['Dart', 'Flutter', 'Git', 'Firebase'],
  ),
  
];
