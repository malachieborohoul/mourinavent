 import 'package:flutter/material.dart';
import 'package:rinavent/core/l10n/app_localizations.dart';
import 'package:rinavent/core/presentation/widgets/app_bar/appbar_leading_image.dart';
import 'package:rinavent/core/presentation/widgets/app_bar/appbar_subtitle.dart';
import 'package:rinavent/core/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:rinavent/core/utils/image_constant.dart';
import 'package:rinavent/core/utils/size_utils.dart';

PreferredSizeWidget buildAppBar(AppLocalizations appLocalization, BuildContext context) {
    return CustomAppBar(
        leadingWidth: 52.h,
        leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgExpandMoreFil,
          margin: EdgeInsets.only(left: 20.h, top: 20.v, bottom: 18.v),
          onTap: () {
             Navigator.pop(context);
          },
        ),
        title: AppbarSubtitle(
            text: '',
            margin: EdgeInsets.only(left: 16.h)),
        styleType: Style.bgFill);
  }