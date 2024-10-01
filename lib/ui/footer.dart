import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive_widget.dart';
import '../data/projects.dart';
import '../constant/constants.dart';
import '../constant/colors.dart';
import 'icon.dart';

class Footer extends StatelessWidget {
  final String _getInTouch =
      "You have an idea, I am here to turn your dream into real digital solution.";
  final String _description =
      "I am developer has around 2.5 years experience developing mobile and web applications, using different languages and techniques.";

  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 30,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Get in touch
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 20,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(width: 7.5),
                          const Text(
                            'GET IN TOUCH',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _getInTouch,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Email Address',
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        AppConstants.mail,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        AppConstants.phone,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Location',
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        AppConstants.location,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Aout me
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 20,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(width: 7.5),
                          const Text(
                            'ABOUT ME',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _description,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // My projects
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 20,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(width: 7.5),
                          const Text(
                            'RECENT PROJECTS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: PROJECTS
                            .take(4)
                            .map((p) => _buildProject(context, p))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Divider(
              color: AppColors.greyLight!.withOpacity(.75),
              thickness: .5,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Proudly powered by KawserDev ©${DateTime.now().year}',
                  style: TextStyle(
                    color: AppColors.greyLight!.withOpacity(.75),
                  ),
                ),
                Row(children: _socialMedia()),
              ],
            )
          ],
        ),
      ),
      mobileScreen: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 30,
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 20,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 7.5),
                    const Text(
                      'GET IN TOUCH',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  _getInTouch,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Email Address',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  AppConstants.mail,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  AppConstants.phone,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Location',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  AppConstants.location,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            // Aout me
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 20,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 7.5),
                    const Text(
                      'ABOUT ME',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  _description,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // My projects
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 20,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 7.5),
                    const Text(
                      'RECENT PROJECTS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: PROJECTS
                      .take(4)
                      .map((p) => _buildProject(context, p))
                      .toList(),
                )
              ],
            ),
            const SizedBox(height: 30),
            Divider(
              color: AppColors.greyLight!.withOpacity(.75),
              thickness: .5,
            ),
            const SizedBox(height: 20),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _socialMedia(),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Proudly powered by KawserDev ©${DateTime.now().year}',
              style: TextStyle(
                color: AppColors.greyLight!.withOpacity(.75),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProject(BuildContext context, Project project) => InkWell(
        onTap: () {
          // ignore: deprecated_member_use
          launch(project.url!);
        },
        child: ResponsiveWidget(
          desktopScreen: Container(
            color: AppColors.greyLight,
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * .1,
            height: MediaQuery.of(context).size.width * .1,
            child: CachedNetworkImage(
              imageUrl: project.image!,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          mobileScreen: Container(
            color: AppColors.greyLight,
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * .2,
            height: MediaQuery.of(context).size.width * .2,
            child: CachedNetworkImage(
              imageUrl: project.image!,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      );

  List<Widget> _socialMedia() => [
        InkWell(
          onTap: () async {
            // ignore: deprecated_member_use
            launch(AppConstants.github);
          },
          child: const AppIcon('assets/images/github.png', size: 16),
        ),
        const SizedBox(width: 24),
        InkWell(
          onTap: () {
            launch(AppConstants.linkedin);
          },
          child: const AppIcon('assets/images/linkedin.png', size: 16),
        ),
        const SizedBox(width: 24),
        InkWell(
          onTap: () {
            launch(AppConstants.twitter);
          },
          child: const AppIcon('assets/images/twitter.png', size: 16),
        ),
        const SizedBox(width: 24),
        InkWell(
          onTap: () {
            launch(AppConstants.facebook);
          },
          child: const AppIcon('assets/images/facebook.png', size: 16),
        ),
      ];
}
