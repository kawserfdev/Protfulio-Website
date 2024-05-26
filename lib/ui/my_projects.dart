import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'responsive_widget.dart';
import '../data/projects.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  Future<List<Project>> fetchProjectsFromFirestore() async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('project').get();
    return snapshot.docs.map((doc) => Project.fromMap(doc.data() as Map<String, dynamic>)).toList();
  }

  void _launchURL(String? url) async {
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        color: AppColors.greyLight,
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            const Text('MY PROJECTS',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                )),
            Container(width: 100, height: 2, color: AppColors.black),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.black),
            const SizedBox(height: 50),
            SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              child: FutureBuilder<List<Project>>(
                  future: fetchProjectsFromFirestore(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No Projects Found'));
                    }

                    final projects = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        final project = projects[index];
                        return Container(
                          width: MediaQuery.of(context).size.width * .28,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                 imageUrl: "https://firebasestorage.googleapis.com/v0/b/profulio.appspot.com/o/projects_image%2FScreenshot%202023-10-08%20225914.png?alt=media&token=81a16788-7509-4036-8e6a-0a661ff2f3cb",
                                width: MediaQuery.of(context).size.width * .24,
                                height: MediaQuery.of(context).size.height * .3,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) => const Icon(Icons.photo),
                              ),
                              const SizedBox(height: 8),
                              Text(project.name, style: AppStyles.title),
                              const SizedBox(height: 8),
                              Expanded(child: Text(project.description)),
                              const SizedBox(height: 5),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  onPressed: () => _launchURL(project.url),
                                  child: const Text("View"),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ),
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
            Container(width: 75, height: 2, color: AppColors.brand),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.brand),
            const SizedBox(height: 50),
            FutureBuilder<List<Project>>(
                future: fetchProjectsFromFirestore(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No Projects Found'));
                  }

                  final projects = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      return Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl: project.image,
                              width: MediaQuery.of(context).size.width * .7,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => const Icon(Icons.photo),
                            ),
                            const SizedBox(height: 8),
                            Text(project.name, style: AppStyles.title),
                            const SizedBox(height: 8),
                            Text(project.description, textAlign: TextAlign.left),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 10,
                              alignment: WrapAlignment.start,
                              children: project.skills.map((s) => Chip(label: Text(s))).toList(),
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () => _launchURL(project.url),
                                child: const Text("View"),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
