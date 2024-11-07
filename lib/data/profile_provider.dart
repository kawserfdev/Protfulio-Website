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
      print('Document data: $data'); 
      return Profile.fromMap(data);
    } else {
      throw Exception('Profile not found');
    }
  } catch (e) {
    print('Error fetching profile: $e'); 
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
    print('Profile data posted successfully');
  } catch (e) {
    print('Error posting profile data: $e');
    throw Exception('Failed to post profile data');
  }
});
