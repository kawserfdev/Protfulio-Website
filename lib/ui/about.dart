import 'package:flutter/material.dart';
import 'package:profile/ui/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/skills.dart';
import '../constant/constants.dart';
import '../constant/styles.dart';
import '../constant/colors.dart';

class About extends StatelessWidget {
  final String _avatar = 'assets/images/me.jpg';
  final String _description =
      "I am developer has around 2.5 years experience developing mobile and web applications, using different languages and techniques.";

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
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                ),
                                backgroundColor:
                                    WidgetStatePropertyAll(AppColors.primaryColor),
                                textStyle: WidgetStatePropertyAll(TextStyle(
                                  color: Colors.white,
                                )),
                              ),
                              child:  Text('HIRE ME NOW',style: TextStyle(color: AppColors.greyLight),),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: _downloadCV,
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
                              child:  Text('VIEW RESUME',style: TextStyle(color: AppColors.greyLight),),
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
                  color: AppColors.primaryColor,
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
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    ),
                    backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
                    textStyle: WidgetStatePropertyAll(TextStyle(
                      color: Colors.white,
                    ))),
                child:  Text('HIRE ME NOW',style: TextStyle(color: AppColors.greyLight),),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _downloadCV,
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  ),
                  backgroundColor: WidgetStatePropertyAll(AppColors.black),
                  textStyle: WidgetStatePropertyAll(TextStyle(
                    color: Colors.white,
                  )),
                ),
                child:  Text('VIEW RESUME',style: TextStyle(color: AppColors.greyLight),),
              ),
              const SizedBox(height: 50),
              Text('MY SKILLS', style: AppStyles.title),
              Container(width: 75, height: 2, color: AppColors.primaryColor),
              const SizedBox(height: 3),
              Container(width: 50, height: 2, color: AppColors.primaryColor),
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
