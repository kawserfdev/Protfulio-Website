import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/data/profile_provider.dart';
import 'package:profile/ui/responsive_widget.dart';
import '../constant/styles.dart';
import '../constant/colors.dart';
import 'icon.dart';

class WorkingProcess extends ConsumerWidget {
  const WorkingProcess({super.key});

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
                Text('WORKING PROCESS', style: AppStyles.title),
                Container(width: 100, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 3),
                Container(width: 75, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: __buildProcess(context, '01.',
                          'images/panning.jpg', 'Plan', profile.plan),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: __buildProcess(context, '02.',
                          'images/UX-App-design.jpg', 'Design', profile.design),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: __buildProcess(context, '03.',
                          'images/cooding.jpg', 'Code', profile.code),
                    )
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
                Text(
                  'WORKING PROCESS',
                  style: AppStyles.title,
                  textAlign: TextAlign.center,
                ),
                Container(width: 75, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 3),
                Container(width: 50, height: 2, color: AppColors.primaryColor),
                const SizedBox(height: 50),
                __buildProcess(
                    context, '01.', 'images/panning.jpg', 'Plan', profile.plan),
                const SizedBox(height: 10),
                __buildProcess(context, '02.', 'images/UX-App-design.jpg',
                    'Design', profile.design),
                const SizedBox(height: 10),
                __buildProcess(
                    context, '03.', 'images/cooding.jpg', 'Code', profile.code),
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

  Widget __buildProcess(BuildContext context, String index, String iconPath,
      String title, String description) {
    return Card(
      elevation: 3,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  index,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: AppColors.greyLight),
              const SizedBox(height: 10),
              AppIcon(
                iconPath,
                size: 220,
                background: Colors.white,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                maxLines: 8,
                style: const TextStyle(
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
