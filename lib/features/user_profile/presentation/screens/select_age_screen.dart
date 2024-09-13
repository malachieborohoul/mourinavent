import 'package:flutter/material.dart';
import 'package:rinavent/core/common/widgets/custom_button.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/core/theme/app_palette.dart';
import 'package:rinavent/features/user_profile/presentation/screens/select_category_screen.dart';
import 'package:rinavent/features/auth/presentation/widgets/progress_bar.dart';
import 'package:vibration/vibration.dart';

class SelectAgeScreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const SelectAgeScreen(),
        );
      });
  const SelectAgeScreen({super.key});

  @override
  State<SelectAgeScreen> createState() => _SelectAgeScreenState();
}

enum Gender { male, female }

class _SelectAgeScreenState extends State<SelectAgeScreen> {
  late FixedExtentScrollController _hourController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _hourController = FixedExtentScrollController();
  }

  @override
  void dispose() {
    _hourController.dispose();
    super.dispose();
  }

  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wheelSize = size.height * 0.8;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          leading: const BackButton(),
          title: const ProgressBar(
            currentNumber: 2,
            totalNumber: 3,
          )),
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
                      "How Old Are You ?",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: AppPadding.miniSpacer,
                    ),
                    Text(
                      "We will help you find a specific event for your age",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Stack(
                    children: [
                      Positioned(
                        top: wheelSize * .33,
                        child: Container(
                          width: 100,
                          height: 2,
                          color: AppPalette.gradient1, // Couleur principale
                        ),
                      ),
                      Positioned(
                        top: wheelSize * .42,
                        child: Container(
                          width: 100,
                          height: 2,
                          color: AppPalette.gradient1, // Couleur principale
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: wheelSize,
                        child: ListWheelScrollView.useDelegate(
                          controller: _hourController,
                          onSelectedItemChanged: (value) async {
                            setState(() {
                              selectedIndex =
                                  value; // Mettre à jour l'index sélectionné
                            });

                            // Check if vibration is available, then vibrate
                            if ((await Vibration.hasVibrator()) ?? false) {
                              Vibration.vibrate(
                                  duration: 50); // Vibrate for 50 milliseconds
                            }
                          },
                          perspective: 0.005,
                          diameterRatio: 1.4,
                          itemExtent: 70,
                          physics: const FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 30,
                            builder: (context, i) {
                              return Center(
                                child: Text("${i + 18}",
                                    style: selectedIndex == i
                                        ? Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppPalette
                                                    .gradient1 // Couleur principale pour l'élément sélectionné

                                                )
                                        : Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(color: Colors.black)),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding),
        child: CustomButton(
            buttonText: "Next",
            onPressed: () {
              Navigator.push(context, SelectCategoryScreen.route());
            }),
      ),
    ));
  }
}
