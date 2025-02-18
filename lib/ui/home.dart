// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/data/profile_provider.dart';
import 'package:profile/ui/icon.dart';
import 'package:profile/ui/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about.dart';
import 'contact_us.dart';
import 'footer.dart';
import 'header.dart';
import 'my_projects.dart';
import 'statistics.dart';
import 'working_process.dart';
import '../constant/colors.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final _headerGlobalKey = GlobalKey();
  final _aboutGlobaleKey = GlobalKey();
  final _statisticsGlobaleKey = GlobalKey();
  final _workingProcessGlobaleKye = GlobalKey();
  final _recentProjectsGlobaleKey = GlobalKey();
  final _contactUsGlobaleKey = GlobalKey();

  final _scrollController = ScrollController();

  final _fabStream = StreamController<bool>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _fabStream.sink.add(_scrollController.offset > 500);
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileRef = ref.watch(profileFetchProvider);
    return profileRef.when(
      data: (profile) {
        return ResponsiveWidget(
          desktopScreen: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/cover.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    key: _headerGlobalKey,
                    titleSpacing: 0,
                    toolbarHeight: 100,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/background.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black,
                              Colors.black87,
                              Colors.transparent
                            ],
                          ),
                        ),
                      ),
                    ),
                    title: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .15,
                        ),
                        child: const Text(
                          "Kawser Ahmed",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        )),
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(500),
                      child: Header(),
                    ),
                    actions: [
                      Row(
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: AppColors.greyLight,
                            onPressed: _scrollToAbout,
                            highlightColor: Colors.white60,
                            child: const Text(
                              'About Me',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 16),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: AppColors.greyLight,
                            onPressed: _scrollToStatistics,
                            child: const Text(
                              'Experience',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 16),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: AppColors.greyLight,
                            onPressed: _scrollToWorkingProcess,
                            child: const Text(
                              'Process',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 16),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: AppColors.greyLight,
                            onPressed: _scrollToRecentProjects,
                            child: const Text(
                              'Portfolio',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: _scrollToContactUs,
                            style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                  AppColors.primaryColor),
                              textStyle: WidgetStatePropertyAll(TextStyle(
                                color: Colors.white,
                              )),
                            ),
                            child: const Text(
                              'Contact Me',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .15),
                    ],
                  ),
                  ..._slivers(),
                ],
              ),
            ),
            floatingActionButton: _buildFab(),
          ),
          mobileScreen: Scaffold(
            drawer: Drawer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          'images/background.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        _scrollToAbout();
                        Navigator.pop(context);
                      },
                      title: const Text(
                        'About Me',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        _scrollToStatistics();
                        Navigator.pop(context);
                      },
                      title: const Text(
                        'Experience',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        _scrollToWorkingProcess();
                        Navigator.pop(context);
                      },
                      title: const Text(
                        'Process',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        _scrollToRecentProjects();
                        Navigator.pop(context);
                      },
                      title: const Text(
                        'Portfolio',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 20),
                    ListTile(
                      title: ElevatedButton(
                        onPressed: () {
                          _scrollToContactUs();
                          Navigator.pop(context);
                        },
                        style: const ButtonStyle(
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          ),
                          backgroundColor:
                              WidgetStatePropertyAll(AppColors.primaryColor),
                        ),
                        child: const Text(
                          'Contact Me',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            launch(profile.githubLink);
                          },
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.black,
                            child:
                                AppIcon('assets/images/github.png', size: 20),
                          ),
                        ),
                        const SizedBox(width: 24),
                        InkWell(
                          onTap: () {
                            launch(profile.linkedinLink);
                          },
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.black,
                            child:
                                AppIcon('assets/images/linkedin.png', size: 20),
                          ),
                        ),
                        const SizedBox(width: 24),
                        InkWell(
                          onTap: () {
                            launch(profile.twitterLink);
                          },
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.black,
                            child:
                                AppIcon('assets/images/twitter.png', size: 16),
                          ),
                        ),
                        const SizedBox(width: 24),
                        InkWell(
                          onTap: () {
                            launch(profile.fbLink);
                          },
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.black,
                            child:
                                AppIcon('assets/images/facebook.png', size: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    key: _headerGlobalKey,
                    titleSpacing: 0,
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    leading: Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu,
                            color: AppColors.primaryColor),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                    flexibleSpace: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/cover.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black,
                              Colors.black87,
                              Colors.transparent
                            ],
                          ),
                        ),
                      ),
                    ),
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(400),
                      child: Header(),
                    ),
                  ),
                  ..._slivers(),
                ],
              ),
            ),
            floatingActionButton: _buildFab(),
          ),
        );
      },
      error: (error, stackTrace) =>const Center(
        child: Text("Data Not Found"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  List<Widget> _slivers() => [
        SliverToBoxAdapter(
          key: _aboutGlobaleKey,
          child: const About(),
        ),
        SliverToBoxAdapter(
          key: _statisticsGlobaleKey,
          child: const Statistics(),
        ),
        SliverToBoxAdapter(
          key: _workingProcessGlobaleKye,
          child: const WorkingProcess(),
        ),
        SliverToBoxAdapter(
          key: _recentProjectsGlobaleKey,
          child: const MyProjects(),
        ),
        SliverToBoxAdapter(
          key: _contactUsGlobaleKey,
          child: const ContactUs(),
        ),
        const SliverToBoxAdapter(
          child: Footer(),
        ),
      ];

  Widget _buildFab() {
    return StreamBuilder<bool>(
      stream: _fabStream.stream,
      builder: (_, data) {
        final bool showFab = data.hasData && data.data!;
        return AnimatedOpacity(
          opacity: showFab ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: FloatingActionButton(
            onPressed: showFab ? _scrollToHeader : null,
            mini: true,
            child: const Icon(
              Icons.keyboard_double_arrow_up_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        );
      },
    );
  }

  void _scrollToHeader() {
    Scrollable.ensureVisible(
      _headerGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToAbout() {
    Scrollable.ensureVisible(
      _aboutGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToStatistics() {
    Scrollable.ensureVisible(
      _statisticsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToWorkingProcess() {
    Scrollable.ensureVisible(
      _workingProcessGlobaleKye.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToRecentProjects() {
    Scrollable.ensureVisible(
      _recentProjectsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToContactUs() {
    Scrollable.ensureVisible(
      _contactUsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _fabStream.close();
    super.dispose();
  }
}
