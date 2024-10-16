import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/data/profile_model.dart';

final profileProvider = FutureProvider<Profile>((ref) async {
  final snapshot = await FirebaseFirestore.instance
      .collection('profiles')
      .doc('profile_kawser')
      .get();
  if (snapshot.exists) {
    return Profile.fromMap(snapshot.data() ?? {});
  } else {
    return Profile(
      subject: 'N/A',
      experienceTitle: 'N/A',
      cvLink: '',
      aboutMeShortTitle: '',
      resumeLink: '',
      skills: [],
      experienceTimeline: 0,
      plan: '',
      design: '',
      code: '',
      phone: '',
      email: '',
      address: '',
      githubLink: '',
      linkedinLink: '',
      twitterLink: '',
      fbLink: '',
    );
  }
});
