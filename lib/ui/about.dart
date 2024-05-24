import 'package:flutter/material.dart';
import 'package:profile/ui/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/skills.dart';
import '../config/constants.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class About extends StatelessWidget {
  final String _avatar = 'assets/profile.jpg';
  final String _description =
      "I am developer has around 2.5 years experience developing mobile applications, using Dart languages in Flutter framwork";

  const About({super.key});

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                      color: AppColors.greyLight,
                      child: Image.asset(
                        _avatar,
                        width: 250,
                        height:250,
                        fit: BoxFit.cover,
                      ),
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
                            color: AppColors.brand,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _description,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                                padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                ),
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColors.brand),
                                textStyle: MaterialStatePropertyAll(TextStyle(
                                  color: Colors.white,
                                )),
                              ),
                              child: const Text('HIRE ME NOW',style: TextStyle(
                                  color: Colors.white,
                                ),),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: _downloadCV,
                              style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                ),
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColors.brand),
                                textStyle: MaterialStatePropertyAll(TextStyle(
                                  color: Colors.white,
                                )),
                              ),
                              child: const Text('VIEW RESUME',style: TextStyle(
                                  color: Colors.white,
                                ),),
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
              Container(width: 100, height: 2, color: AppColors.brand),
              const SizedBox(height: 3),
              Container(width: 75, height: 2, color: AppColors.brand),
              const SizedBox(height: 50),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                runAlignment: WrapAlignment.spaceBetween,
                children: SKILLS.map(_buildSkill).toList(),
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
                  color: AppColors.brand,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _description,
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
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    ),
                    backgroundColor: MaterialStatePropertyAll(AppColors.brand),
                    textStyle: MaterialStatePropertyAll(TextStyle(
                      color: Colors.white,
                    ))),
                child: const Text('HIRE ME NOW',style: TextStyle(
                                  color: Colors.white,
                                ),),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _downloadCV,
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  ),
                  backgroundColor: MaterialStatePropertyAll(AppColors.brand),
                  textStyle: MaterialStatePropertyAll(TextStyle(
                    color: Colors.white,
                  )),
                ),
                child: const Text('VIEW RESUME',style: TextStyle(
                                  color: Colors.white,
                                ),),
              ),
              const SizedBox(height: 50),
              Text('MY SKILLS', style: AppStyles.title),
              Container(width: 75, height: 2, color: AppColors.brand),
              const SizedBox(height: 3),
              Container(width: 50, height: 2, color: AppColors.brand),
              const SizedBox(height: 25),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                children: SKILLS.map(_buildSkill).toList(),
              ),
            ],
          ),
        ),
      );

  void _downloadCV() {
    // ignore: deprecated_member_use
    launch(AppConstants.cv);
  }

  Widget _buildSkill(Skill skill) => Chip(label: Text(skill.name!));
}


