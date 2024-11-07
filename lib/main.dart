import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/constant/colors.dart';
import 'package:profile/firebase_options.dart';
import 'ui/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kawser Developer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: AppColors.primaryColor),
        ),
        home: Home());
  }
}



// class ProfileScreen extends ConsumerWidget {
//   final Profile profile = Profile(
//       subject: "Flutter Developer",
//       experienceTitle:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor laboris nisi ut aliquip ex ea commodo.",
//       cvLink: "www.shpper.net",
//       aboutMeShortTitle: "I am Flutter Developer",
//       resumeLink: "bn",
//       skills: ["jhgfs"],
//       experienceTimeline: 2.5,
//       plan: "",
//       design: "",
//       code: "",
//       phone: "",
//       email: "",
//       address: "",
//       githubLink: "",
//       linkedinLink: "",
//       twitterLink: "",
//       fbLink: "");

 
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final profileFetch = ref.watch(profileFetchProvider);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Profile')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await ref.read(profilePostProvider(profile).future);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Profile posted successfully')),
//                   );
//                   ref.refresh(profileFetchProvider); // Refresh to fetch updated data
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Failed to post profile: $e')),
//                   );
//                 }
//               },
//               child: const Text('Post Profile Data'),
//             ),
//             const SizedBox(height: 20),
//             profileFetch.when(
//               data: (profile) => _buildProfileContent(profile),
//               loading: () => const CircularProgressIndicator(),
//               error: (error, stackTrace) => Text('Error: $error'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileContent(Profile profile) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Subject: ${profile.subject}', style: const TextStyle(fontSize: 18)),
//         Text('Experience: ${profile.experienceTitle}'),
//         Text('About Me: ${profile.aboutMeShortTitle}'),
//       ],
//     );
//   }
// }