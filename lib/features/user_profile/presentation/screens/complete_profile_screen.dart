import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rinavent/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:rinavent/core/common/widgets/auth_field.dart';
import 'package:rinavent/core/common/widgets/custom_button.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/core/utils/pick_image.dart';
import 'package:rinavent/features/user_profile/presentation/cubits/complete_user_profile/complete_user_profile_cubit.dart';
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
        context.read<CompleteUserProfileCubit>().selectAvatar(image);
      });
    }
  }

  @override
  void initState() {
    if (context.read<CompleteUserProfileCubit>().state.avatar != null) {
      image = context.read<CompleteUserProfileCubit>().state.avatar;
    }
    final appUserState = context.read<AppUserCubit>().state;
    if (appUserState is AppUserLoggedIn) {
      nameController.text = appUserState.user.name;
    }
    super.initState();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.appPadding),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
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
                const SizedBox(
                  height: AppPadding.smallSpacer,
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          
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
                    const SizedBox(
                      height: AppPadding.smallSpacer,
                    ),
                    IntlPhoneField(
                      pickerDialogStyle: PickerDialogStyle(
                        countryCodeStyle: Theme.of(context)
                          .textTheme
                          .bodySmall,
                          countryNameStyle: Theme.of(context)
                          .textTheme
                          .bodySmall
                      ),
                      cursorColor: Colors.black,
                      dropdownTextStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
                      initialCountryCode: 'TD',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    )
                  ],
                )
              ],
            ),
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
