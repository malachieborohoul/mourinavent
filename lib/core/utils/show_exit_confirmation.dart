

// Fonction pour afficher une confirmation avant de quitter
import 'package:flutter/material.dart';
import 'package:rinavent/core/presentation/widgets/custom_elevated_button.dart';
import 'package:rinavent/core/theme/app_decoration.dart';
import 'package:rinavent/core/theme/custom_text_style.dart';
import 'package:rinavent/core/theme/theme_helper.dart';
import 'package:rinavent/core/utils/size_utils.dart';

void showExitConfirmation(BuildContext context) async {
  final size = MediaQuery.of(context).size;
  return await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
       contentPadding: EdgeInsets.zero,
      content:  Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.v),
            decoration: AppDecoration.fillWhiteA
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  SizedBox(height: 19.v),
                  Text("Quitter ?",
                      style: CustomTextStyles.titleLargeBlack900),
                  SizedBox(height: 8.v),
                  Text("Voulez-vous vraiment quitter ?",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge!.copyWith(height: 1.29)),
                  SizedBox(height: 37.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        width: size.width*.3,
                          text: "Oui",
                          onPressed: () => Navigator.of(context).pop(true)),

                         CustomElevatedButton(
                          buttonStyle:  ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: theme.colorScheme.primary),
                              borderRadius: BorderRadius.circular(12.h),
                            ),
                          ),
                          buttonTextStyle: TextStyle(color: theme.colorScheme.primary),
                          width: size.width*.3,
                          text: "Non",
                          onPressed: () => Navigator.of(context).pop(false)),
                      
                    ],
                  )
                ])),
      
      // actions: [
      //   TextButton(
      //     onPressed: () => Navigator.of(context).pop(false),
      //     child: Text("Non"),
      //   ),
      //   TextButton(
      //     onPressed: () => Navigator.of(context).pop(true),
      //     child: Text("Oui"),
      //   ),
      // ],
    ),
  ) .then((value) {
      if (value == true) {
        Navigator.of(context).pop();
      }
    });
}