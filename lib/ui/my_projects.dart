import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/data/profile_model.dart';
import 'package:profile/data/profile_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'responsive_widget.dart';
import '../constant/styles.dart';
import '../constant/colors.dart';

class MyProjects extends ConsumerWidget {
  const MyProjects({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRef = ref.watch(profileFetchProvider);
    return profileRef.when(
      data: (profile) {
        return ResponsiveWidget(
          desktopScreen: Container(
            color: AppColors.greyLight,
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              children: [
                Text('MY PROJECTS', style: AppStyles.title),
                Container(width: 100, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 3),
                Container(width: 75, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 50),
                ...projects
                    .getRange(0, 6)
                    .map((p) => _buildProject(context, p)),
              ],
            ),
          ),
          mobileScreen: Container(
            color: AppColors.greyLight,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .15,
              vertical: 50,
            ),
            child: Column(
              children: [
                Text(
                  'MY PROJECTS',
                  style: AppStyles.title,
                  textAlign: TextAlign.center,
                ),
                Container(width: 75, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 3),
                Container(width: 50, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 50),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: projects
                      .getRange(0, 6)
                      .map((p) => _buildProject(context, p))
                      .toList(),
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

  Widget _buildProject(BuildContext context, Project project) =>
      ResponsiveWidget(
        desktopScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.width * .2,
                      child: Image.asset(
                        project.image,
                        fit: BoxFit.cover,
                      )
                      //          CachedNetworkImage(
                      //   imageUrl: project.image,
                      //   fit: BoxFit.cover,
                      //   placeholder: (context, url) =>
                      //       const CircularProgressIndicator(),
                      //   errorWidget: (context, url, error) =>
                      //       const Icon(Icons.hide_image_outlined),
                      // ),
                      ),
                  SizedBox(width: MediaQuery.of(context).size.width * .075),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(project.name, style: AppStyles.title),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(project.description),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: project.useTechnology
                              .map((s) => Chip(label: Text(s)))
                              .toList(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // ignore: deprecated_member_use
                            launch(project.projectLink);
                          },
                          style: ButtonStyle(
                              padding: const WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                              ),
                              backgroundColor: const WidgetStatePropertyAll(
                                  AppColors.primaryColor),
                              textStyle: const WidgetStatePropertyAll(TextStyle(
                                color: Colors.white,
                              )),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color:
                                        AppColors.primaryColor.withOpacity(.5),
                                    width: 5,
                                  ),
                                ),
                              )),
                          child: Text(
                            'Visit',
                            style: TextStyle(color: AppColors.greyLight),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.black.withOpacity(.1),
                height: 20,
                thickness: 1,
              ),
            ],
          ),
        ),
        mobileScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.width * .50,
                  child: Image.asset(
                    project.image,
                    fit: BoxFit.cover,
                  )
                  //  CachedNetworkImage(
                  //   imageUrl: project.image,
                  //   fit: BoxFit.cover,
                  //    placeholder: (context, url) =>
                  //                     const CircularProgressIndicator(),
                  //                 errorWidget: (context, url, error) =>
                  //                     const Icon(Icons.hide_image_outlined),
                  // ),
                  ),
              SizedBox(width: MediaQuery.of(context).size.width * .075),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(project.name, style: AppStyles.title),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(
                project.description,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: project.useTechnology
                    .map((s) => Chip(label: Text(s)))
                    .toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              OutlinedButton(
                onPressed: () {
                  // ignore: deprecated_member_use
                  launch(project.projectLink);
                },
                style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                    backgroundColor:
                        const WidgetStatePropertyAll(AppColors.primaryColor),
                    textStyle: const WidgetStatePropertyAll(TextStyle(
                      color: Colors.white,
                    )),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: AppColors.primaryColor.withOpacity(.5),
                          width: 5,
                        ),
                      ),
                    )),
                child: Text(
                  'Visit',
                  style: TextStyle(color: AppColors.greyLight),
                ),
              ),
              Divider(
                color: AppColors.black.withOpacity(.1),
                height: 50,
                thickness: 1,
              ),
            ],
          ),
        ),
      );
}
