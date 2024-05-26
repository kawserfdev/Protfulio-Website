import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:profile/config/colors.dart';
import 'package:profile/firebase_options.dart';
import 'ui/home.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kawser Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColors.brand),
      ),
      home: Home(),
    );
  }
}
