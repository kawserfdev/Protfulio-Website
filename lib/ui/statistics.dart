import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/data/profile_provider.dart';
import 'responsive_widget.dart';
import 'icon.dart';

class Statistics extends ConsumerWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRef = ref.watch(profileFetchProvider);
    return profileRef.when(
      data: (profile) {
        return ResponsiveWidget(
          desktopScreen: Container(
            height: 400,
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(.7),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .15,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatistic(context, "images/experence.png",
                      '${profile.experienceTimeline}+', 'Years of Experience'),
                  _buildStatistic(context, "images/complete_order.png",
                      '${profile.projectsList.length}+', 'Projects Done'),
                  _buildStatistic(context, "images/happy_clint.png",
                      '${profile.happyClients}', 'Happy Clients'),
                  _buildStatistic(
                      context, "images/coffe.png", '∞', 'Coffee Cups'),
                ]),
          ),
          mobileScreen: Container(
            color: Colors.black54,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .15,
              vertical: 50,
            ),
            child: Column(
              children: [
                _buildStatistic(context, "images/experence.png",
                    '${profile.experienceTimeline}+', 'Years of Experience'),
                const SizedBox(height: 50),
                _buildStatistic(context, "images/complete_order.png",
                    '${profile.projectsList.length}+', 'Projects Done'),
                const SizedBox(height: 50),
                _buildStatistic(context, "images/happy_clint.png",
                    '${profile.happyClients}', 'Happy Clients'),
                const SizedBox(height: 50),
                _buildStatistic(
                    context, "images/coffe.png", '∞', 'Coffee Cups'),
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

  Widget _buildStatistic(
      BuildContext context, String icon, String total, String description) {
    return ResponsiveWidget(
      desktopScreen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(background: Colors.transparent, icon, size: 132),
          const SizedBox(height: 5),
          Text(
            total,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      mobileScreen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(background: Colors.transparent, icon, size: 70),
          const SizedBox(height: 5),
          Text(
            total,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
