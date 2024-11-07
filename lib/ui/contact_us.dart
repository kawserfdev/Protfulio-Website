import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailto/mailto.dart';
import 'package:profile/data/profile_provider.dart';
import 'package:profile/ui/icon.dart';
import 'responsive_widget.dart';
import '../constant/styles.dart';
import '../constant/colors.dart';
import '../utils/extensions.dart';

class ContactUs extends ConsumerStatefulWidget {
  const ContactUs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactUsState();
}

class _ContactUsState extends ConsumerState<ContactUs> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  Text('GET IN TOUCH', style: AppStyles.title),
                  Container(
                      width: 100, height: 2, color: AppColors.primaryColor),
                  const SizedBox(height: 3),
                  Container(
                      width: 75, height: 2, color: AppColors.primaryColor),
                  const SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactInfo(
                            'assets/images/email.png',
                            'Mail Us:',
                            profile.email,
                          ),
                          const SizedBox(height: 20),
                          _buildContactInfo(
                            'assets/images/phone.png',
                            'Call Us:',
                            profile.phone,
                          ),
                          const SizedBox(height: 20),
                          _buildContactInfo(
                            'assets/images/site.png',
                            'Visit Us:',
                            profile.address,
                          ),
                        ],
                      ),
                      ),
                      Expanded(
                        child: _buildContactForm(context),
                      ),
                    ],
                  )
                ],
              ),
            ),
            mobileScreen: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .15,
                vertical: 100,
              ),
              child: Column(
                children: [
                  Text(
                    'GET IN TOUCH',
                    style: AppStyles.title,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                      width: 75, height: 2, color: AppColors.primaryColor),
                  const SizedBox(height: 3),
                  Container(
                      width: 50, height: 2, color: AppColors.primaryColor),
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactInfo(
                            'assets/images/email.png',
                            'Mail Us:',
                            profile.email,
                          ),
                          const SizedBox(height: 20),
                          _buildContactInfo(
                            'assets/images/phone.png',
                            'Call Us:',
                            profile.phone,
                          ),
                          const SizedBox(height: 20),
                          _buildContactInfo(
                            'assets/images/site.png',
                            'Visit Us:',
                            profile.address,
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      _buildContactForm(context),
                    ],
                  )
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
      ),);
  }

  Widget _buildContactInfo(String imagePath, String title, String content) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcon(imagePath, color: AppColors.primaryColor, size: 20),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                content,
                style: TextStyle(color: AppColors.black.withOpacity(.7)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Have Something To Write? Coming Soon',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 25),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (text) {
                        return (text!.isValidName())
                            ? null
                            : 'Please insert valid name!';
                      },
                      decoration: const InputDecoration(
                        hintText: 'Your Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextFormField(
                      validator: (text) {
                        return (text!.isValidEmail)
                            ? null
                            : 'Please insert valid email!';
                      },
                      decoration: const InputDecoration(
                        hintText: 'Your Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                minLines: 3,
                maxLines: 10,
                validator: (text) {
                  return (text!.isValidName(minLength: 10))
                      ? null
                      : 'Please insert valid message!, at least 10 characters';
                },
                decoration: const InputDecoration(
                  hintText: 'Your Message',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  ),
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.primaryColor),
                  textStyle: WidgetStatePropertyAll(TextStyle(
                    color: Colors.white,
                  )),
                ),
                onPressed: _sendMail,
                child: Text(
                  'Send',
                  style: TextStyle(color: AppColors.greyLight),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _sendMail() async {
    bool isValidForm = _formKey.currentState!.validate();
    if (!isValidForm) return;

    final mailto = Mailto(
      to: ["kawserahmed5459@gmail.com"],
      subject: _nameController.text.trim(),
      body: _contentController.text.trim(),
    );

    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
    String renderHtml(Mailto mailto) =>
        '''<html><head><title>mailto example</title></head><body><a href="$mailto">Open mail client</a></body></html>''';
    await for (HttpRequest request in server) {
      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType.html
        ..write(renderHtml(mailto));
      await request.response.close();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
