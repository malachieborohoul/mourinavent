import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rinavent/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:rinavent/core/common/widgets/auth_field.dart';
import 'package:rinavent/core/common/widgets/custom_button.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/core/theme/app_palette.dart';
import 'package:rinavent/core/utils/loader_dialog.dart';
import 'package:rinavent/core/utils/pick_image.dart';
import 'package:rinavent/core/utils/show_snackbar.dart';
import 'package:rinavent/features/user_profile/presentation/bloc/user_profile/user_profile_bloc.dart';
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
  String phoneNumber = '';
  String countryCode = '';
  bool isPhoneValid = false;

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.appPadding),
            child: BlocConsumer<UserProfileBloc, UserProfileState>(
              listener: (context, state) {
                if (state is UserProfileLoading) {
                  showLoaderDialog(context);
                } else {
                  closeLoaderDialog(context);
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  //   FocusScope.of(context)
                  //       .unfocus(); // S'assurer que le focus est retiré après la mise à jour de l'UI
                  // });

                  if (state is UserProfileFailure) {
                    showSnackBar(context, state.message);
                  } else if (state is UserProfileSuccess) {
                    // Navigator.pushAndRemoveUntil(
                    //     context, Test.route(), (route) => false);
                  }
                }
              },
              builder: (context, state) {
                return Center(
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
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppPalette.greyColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppPadding.smallSpacer,
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                selectImage();
                              },
                              child: Center(
                                child: UserAvatar(
                                  image: image,
                                ),
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
                          Text(
                            "Phone Number",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: AppPadding.miniSpacer - 10,
                          ),
                          IntlPhoneField(
                            pickerDialogStyle: PickerDialogStyle(
                                countryCodeStyle:
                                    Theme.of(context).textTheme.bodySmall,
                                countryNameStyle:
                                    Theme.of(context).textTheme.bodySmall),
                            cursorColor: Colors.black,
                            dropdownTextStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.black),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.black),
                            initialCountryCode: 'TD',
                            onChanged: (phone) {
                              try {
                                isPhoneValid = phone.isValidNumber();
                                countryCode = phone.countryISOCode;
                                phoneNumber = phone.number;
                              } catch (e) {
                                isPhoneValid = false;
                                print(e);
                              }

                              setState(() {});
                            },
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(AppPadding.appPadding),
          child: isPhoneValid && nameController.text.isNotEmpty
              ? CustomButton(
                  buttonText: "Complete Profile",
                  onPressed: () {
                    print("object");
                    final user =
                        (context.read<AppUserCubit>().state as AppUserLoggedIn)
                            .user;
                    final completeUserProfile =
                        context.read<CompleteUserProfileCubit>().state;
                    context.read<UserProfileBloc>().add(
                        UserProfileCompleteUserProfile(
                            user.id,
                            user.email,
                            nameController.text,
                            'M',
                            completeUserProfile.age!,
                            phoneNumber,
                            countryCode,
                            completeUserProfile.avatar!,
                            completeUserProfile.categories!));
                  })
              : CustomButton(
                  buttonText: "Complete Profile",
                  primaryColor: AppPalette.borderColor,
                  secondaryColor: AppPalette.borderColor,
                  textColor: AppPalette.greyColor,
                  onPressed: () {}),
        ),
      )),
    );
  }
}
