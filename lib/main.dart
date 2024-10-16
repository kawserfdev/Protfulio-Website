import 'dart:async';
import 'dart:math';

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
  ProviderScope(
    child: MyApp(),
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

// const FancyContainer(
//         size: Size(300, 300),
//         cycle: Duration(seconds: 5),
//         colors: [
//           Color(0xFF46C4FF),
//           Color(0xFF269BFA),
//           Color(0xFF1B7CCC),
//           Color(0xFF196AAC),
//           Color(0xFF0752A8)
//         ],
//       ),

class FancyContainer extends StatefulWidget {
  final Size size;
  final Duration cycle;
  final List<Color> colors;

  const FancyContainer({
    required this.size,
    required this.cycle,
    required this.colors,
  });

  @override
  State<FancyContainer> createState() => _FancyContainerState();
}

class _FancyContainerState extends State<FancyContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.cycle,
      vsync: this,
    )..repeat();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final double angle = controller.value * 2 * pi;
        const double radius = 0.2;

        final double centerX = 0.1 + radius * cos(angle);
        final double centerY = 0.1 + radius * sin(angle);

        return Container(
          width: widget.size.width,
          height: widget.size.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(centerX, centerY),
              radius: 0.5,
              colors: widget.colors,
              tileMode: TileMode.clamp,
            ),
          ),
          child: const Center(child: Text("Flutter Portfolio")),
        );
      },
    );
  }
}
