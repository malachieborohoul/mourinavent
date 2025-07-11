import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rinavent/core/presentation/widgets/custom_elevated_button.dart';
import 'package:rinavent/core/presentation/widgets/custom_image_view.dart';
import 'package:rinavent/core/theme/app_decoration.dart';
import 'package:rinavent/core/theme/custom_text_style.dart';
import 'package:rinavent/core/theme/theme_helper.dart';
import 'package:rinavent/core/utils/image_constant.dart';
import 'package:rinavent/core/utils/size_utils.dart';
import 'package:confetti/confetti.dart';

void confirmDialog(
  BuildContext context,
  String title,
  String subtitle,
  String redirectName,
  VoidCallback onPressed, [
  bool isIcon = false,
  IconData icon = Icons.error_outline,
  bool hasConfetti = true
]) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          ConfettiController confettiController = ConfettiController(duration: const Duration(seconds: 2));

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if(hasConfetti){
              confettiController.play();

            }
          });

          return PopScope(
               canPop: false,
        onPopInvokedWithResult: (bool didPop, result) async {
          if (didPop) {
            // Action à effectuer si la page est fermée
          } else {
            // Afficher une boîte de dialogue de confirmation

           
          }
        },
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
              content: Stack(
                alignment: Alignment.topCenter,
                children: [
                   // Confettis à gauche
              Positioned(
                left: 50,
                top: 0,
                child: ConfettiWidget(
                  confettiController: confettiController,
                  blastDirection: -pi / 4, // Explosion vers la gauche
                  emissionFrequency: 0.05,
                  numberOfParticles: 10,
                  gravity: 0.3,
                ),
              ),
                  // Confettis en haut
                  Positioned(
                    top: 0,
                    child: ConfettiWidget(
                      confettiController: confettiController,
                      blastDirection: -pi / 2, // Explosion vers le haut
                      emissionFrequency: 0.05,
                      numberOfParticles: 10,
                      gravity: 0.3,
                    ),
                  ),
            
                    // Confettis à droite
              Positioned(
                right: 50,
                top: 0,
                child: ConfettiWidget(
                  confettiController: confettiController,
                  blastDirection: -3 * pi / 4, // Explosion vers la droite
                  emissionFrequency: 0.05,
                  numberOfParticles: 10,
                  gravity: 0.3,
                ),
              ),
            
                  // Boîte de dialogue
                  Container(
                    width: 388.h,
                    padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.v),
                    decoration: AppDecoration.fillWhiteA.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isIcon
                            ? Icon(icon, color: Colors.red, size: 116.v,)
                            : CustomImageView(
                                imagePath: ImageConstant.passwordChanged,
                                height: 116.v,
                                width: 116.h,
                                fit: BoxFit.contain,
                                alignment: Alignment.center),
                        SizedBox(height: 19.v),
                        Text(title, style: CustomTextStyles.titleLargeBlack900),
                        SizedBox(height: 8.v),
                        Text(subtitle, maxLines: 3, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: theme.textTheme.bodyLarge!.copyWith(height: 1.29)),
                        SizedBox(height: 37.v),
                        CustomElevatedButton(
                          text: redirectName,
                          onPressed: () {
                            confettiController.stop();
                            Navigator.pop(context);
                            onPressed();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
