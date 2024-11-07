import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/data/profile_provider.dart';
import 'package:profile/ui/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/styles.dart';
import '../constant/colors.dart';

class About extends ConsumerWidget {
  final String _avatar = 'assets/images/me.jpg';

  const About({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRef = ref.watch(profileFetchProvider);
    return profileRef.when(
      data: (profile) {
        return ResponsiveWidget(
          desktopScreen: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .15,
              vertical: 100,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 272,
                      width: 216,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        _avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ABOUT ME',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            profile.aboutMeShortTitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.black.withOpacity(.7),
                                  fontSize: 17,
                                ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppColors.primaryColor),
                                  textStyle: WidgetStatePropertyAll(TextStyle(
                                    color: Colors.white,
                                  )),
                                ),
                                child: Text(
                                  'HIRE ME NOW',
                                  style: TextStyle(color: AppColors.greyLight),
                                ),
                              ),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                onPressed: (){
                                  launch(profile.cvLink);
                                },
                                style: const ButtonStyle(
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                  ),
                                  backgroundColor:
                                      WidgetStatePropertyAll(AppColors.black),
                                  textStyle: WidgetStatePropertyAll(TextStyle(
                                    color: Colors.white,
                                  )),
                                ),
                                child: Text(
                                  'VIEW RESUME',
                                  style: TextStyle(color: AppColors.greyLight),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Text('MY SKILLS', style: AppStyles.title),
                Container(width: 100, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 3),
                Container(width: 75, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: profile.skills
                          .map((skill) => Chip(
                              avatar: SizedBox(
                                height: MediaQuery.of(context).size.width * .01,
                                child: Image.network(
                                  skill.image,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const CircularProgressIndicator();
                                  },
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              label: Text(skill.skill,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: AppColors.primaryColor))))
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          mobileScreen: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .15,
              vertical: 50,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Container(
                    color: AppColors.greyLight,
                    child: Image.asset(
                      _avatar,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'ABOUT ME',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  profile.aboutMeShortTitle,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black.withOpacity(.7),
                        fontSize: 13,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      ),
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.primaryColor),
                      textStyle: WidgetStatePropertyAll(TextStyle(
                        color: Colors.white,
                      ))),
                  child: Text(
                    'HIRE ME NOW',
                    style: TextStyle(color: AppColors.greyLight),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    launch(profile.cvLink);
                  },
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    ),
                    backgroundColor: WidgetStatePropertyAll(AppColors.black),
                    textStyle: WidgetStatePropertyAll(TextStyle(
                      color: Colors.white,
                    )),
                  ),
                  child: Text(
                    'VIEW RESUME',
                    style: TextStyle(color: AppColors.greyLight),
                  ),
                ),
                const SizedBox(height: 50),
                Text('MY SKILLS', style: AppStyles.title),
                Container(width: 75, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 3),
                Container(width: 50, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: profile.skills
                          .map((skill) => Chip(
                              avatar: SizedBox(
                                height: MediaQuery.of(context).size.width * .04,
                                child: Image.network(
                                  skill.image,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const CircularProgressIndicator();
                                  },
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              label: Text(skill.skill,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.primaryColor))))
                          .toList(),
                    ),
                  ],
                ),
              ],
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
