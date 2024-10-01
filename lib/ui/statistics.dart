import 'package:flutter/material.dart';

import '../data/projects.dart';
import 'responsive_widget.dart';
import 'icon.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        height: 400,
        color: Colors.black.withOpacity(.7),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _buildStatistic(context, "assets/images/experence.png", '2.5+',
              'Years of Experience'),
          _buildStatistic(context, "assets/images/complete_order.png",
              '${PROJECTS.length}+', 'Projects Done'),
          _buildStatistic(
              context, "assets/images/happy_clint.png", '4+', 'Happy Clients'),
          _buildStatistic(
              context, "assets/images/coffe.png", '∞', 'Coffee Cups'),
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
            _buildStatistic(context, "assets/images/experence.png", '2.5+',
                'Years of Experience'),
            const SizedBox(height: 50),
            _buildStatistic(context, "assets/images/complete_order.png",
                '${PROJECTS.length}+', 'Projects Done'),
            const SizedBox(height: 50),
            _buildStatistic(context, "assets/images/happy_clint.png", '4+',
                'Happy Clients'),
            const SizedBox(height: 50),
            _buildStatistic(
                context, "assets/images/coffe.png", '∞', 'Coffee Cups'),
          ],
        ),
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
          AppIcon(background: Colors.transparent, icon, size: 132),
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
