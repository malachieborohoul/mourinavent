import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rinavent/core/common/widgets/auth_field.dart';
import 'package:rinavent/core/common/widgets/custom_button.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/core/theme/app_palette.dart';
import 'package:rinavent/core/utils/pick_image.dart';
import 'package:rinavent/features/user_profile/presentation/widgets/user_avatar.dart';

class CompleteProfileScreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const CompleteProfileScreen(),
        );
      });
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  File? image;
  TextEditingController nameController = TextEditingController();

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Complete Your Profile",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: AppPadding.miniSpacer,
                    ),
                    Text(
                      "To get the most out of your experience, please complete your profile by providing the necessary details",
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          print("object");
                          selectImage();
                        },
                        child: UserAvatar(
                          image: image,
                        )),
                    const SizedBox(
                      height: AppPadding.smallSpacer,
                    ),
                    AuthField(
                      hintText: "Borohoul Soguelni Malachie",
                      controller: nameController,
                      title: 'Name',
                      textInputType: TextInputType.name,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding),
        child: CustomButton(buttonText: "Complete Profile", onPressed: () {}),
      ),
    ));
  }
}
