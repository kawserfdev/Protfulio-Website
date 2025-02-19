import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/data/profile_model.dart';

final profileFetchProvider = FutureProvider<Profile>((ref) async {
  try {
    final doc = await FirebaseFirestore.instance
        .collection('profiles')
        .doc('profile_kawser')
        .get();

    if (doc.exists) {
      final Map<String, dynamic> data = Map<String, dynamic>.from(doc.data()!);
      // print('Document data: $data');
      return Profile.fromMap(data);
    } else {
      throw Exception('Profile not found');
    }
  } catch (e) {
    // print('Error fetching profile: $e');
    throw Exception('Failed to fetch profile data');
  }
});

final profilePostProvider =
    FutureProvider.family<void, Profile>((ref, profile) async {
  try {
    await FirebaseFirestore.instance
        .collection('profiles')
        .doc('profile_kawser')
        .set(profile.toMap());
    // print('Profile data posted successfully');
  } catch (e) {
    // print('Error posting profile data: $e');
    throw Exception('Failed to post profile data');
  }
});

List<Skill> skillList = [
  Skill(skill: 'Flutter', image: 'skills/flutter.png'),
  Skill(skill: 'Dart', image: 'skills/dart.png'),
  Skill(skill: 'Firebase', image: 'skills/firebase.png'),
  Skill(skill: 'RiverPod', image: 'skills/riverpod.png'),
  Skill(skill: 'GetX', image: 'skills/getx.png'),
  Skill(skill: 'GitHub', image: 'skills/github.png'),
  Skill(skill: 'HTML', image: 'skills/html.png'),
  Skill(skill: 'C++', image: 'skills/c++.png'),
  Skill(skill: 'C', image: 'skills/c.png'),
  Skill(skill: 'Python', image: 'skills/python.png')
];

List<Project> projects = [
  Project(
      name: "Shpper",
      image: "projects/shpper.png",
      description:
          "Shpper is a P2P platform revolutionizing personalized shipping & shopping. We connect individuals seeking to send or receive items with travelers acting as couriers and leveraging daily flights worldwide as our delivery fleet. In addition to shipping, our shopping feature streamlines supply & demand with a marketplace where we empower individuals to act as personal shoppers, showcasing items from their destinations for purchase requests. Our platform aims to create a borderless market. Our vision is to transform the global shipping and shopping industry with an affordable, eco-friendly platform.",
      useTechnology: [
        "Dart",
        "Flutter",
        "Riverpod",
        "Rast API",
        "Payment Getway",
        "Git",
        "Firebase"
      ],
      projectLink:
          "https://play.google.com/store/apps/details?id=com.shpper.app&pcampaignid=web_share"),
  Project(
      name: "Shpper Admin",
      image: "projects/shpper.png",
      description: "This an admin website for controlling Shpper App",
      useTechnology: ["Dart", "Flutter", "Riverpod", "Git", "Firebase"],
      projectLink: ""),
  Project(
      name: "Venue Finder",
      image: "projects/venue-finder.png",
      description:
          "Venue Finder is the ultimate solution for finding and booking venues tailored to your specific needs. Whether youre planning a corporate meeting, wedding, or special event, our app offers a variety of spaces from small rooms for a few attendees to large venues that can accommodate hundreds.",
      useTechnology: [
        "Dart",
        "Flutter",
        "Riverpod",
        "Payment Getway",
        "Git",
        "Firebase"
      ],
      projectLink:
          "https://play.google.com/store/apps/details?id=com.venuefinder.mobileapp&pcampaignid=web_share"),
  Project(
      name: "Venue Finder Admin",
      image: "projects/venue-finder.png",
      description: "This an admin web for controlling Venue funder App",
      useTechnology: [
        "Dart",
        "Flutter",
        "Riverpod",
        "Payment Getway",
        "Git",
        "Firebase"
      ],
      projectLink: ""),
  // Project(
  //     name: "Shelter Travel",
  //     image: "projects/Shelter-Travel.png",
  //     description: "",
  //     useTechnology: ["Flutter","Dart",
  //       "Riverpod",
  //       "Git",
  //       "Firebase"],
  //     projectLink: ""),
  Project(
      name: "Learning Campus",
      image: "projects/learning-campus.jpg",
      description: "This is an School Management System app Only buid UI",
      useTechnology: [
        "Dart",
        "Flutter",
        "Riverpod",
        "Payment Getway",
        "Git",
        "Firebase"
      ],
      projectLink:
          "https://github.com/kawserfdev/School-Management-System.git"),
  Project(
      name: "Fitness",
      image: "projects/fitness.jpg",
      description: "",
      useTechnology: [
        "Dart",
        "Flutter",
        "Riverpod",
        "Payment Getway",
        "Git",
        "Firebase"
      ],
      projectLink: "https://github.com/kawserfdev/Fitness-master.git"),
];
