import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/data/profile_provider.dart';
import 'package:profile/ui/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/colors.dart';

class Header extends ConsumerWidget {
  final String _name = "Kawser Ahmed";
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRef = ref.watch(profileFetchProvider);
    return profileRef.when(
      data: (profile) {
        return ResponsiveWidget(
          desktopScreen: Container(
            clipBehavior: Clip.none,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'I’m $_name',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  profile.subject,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    profile.aboutMe,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey[100],
                          fontSize: 17,
                        ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    ),
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.primaryColor),
                    textStyle: WidgetStatePropertyAll(TextStyle(
                      color: Colors.white,
                    )),
                  ),
                  onPressed: () {
                      launch(profile.cvLink);
                    },
                  child: Text(
                    'Download CV',
                    style: TextStyle(color: AppColors.greyLight),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          mobileScreen: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .15,
            ),
            child: FittedBox(
              child: Column(
                children: [
                  Text(
                    'I’m $_name',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    profile.subject,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      profile.aboutMe,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey[100],
                            fontSize: 15,
                            height: 1.8,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      ),
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.primaryColor),
                    ),
                    onPressed: () {
                      launch(profile.cvLink);
                    },
                    child: const Text(
                      'Download CV',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
