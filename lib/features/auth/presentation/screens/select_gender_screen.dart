import 'package:flutter/material.dart';
import 'package:rinavent/core/common/widgets/custom_button.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/features/auth/presentation/screens/select_age_screen.dart';
import 'package:rinavent/features/auth/presentation/widgets/gender_card.dart';
import 'package:rinavent/features/auth/presentation/widgets/progress_bar.dart';

class SelectGenderScreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const SelectGenderScreen(),
        );
      });
  const SelectGenderScreen({super.key});

  @override
  State<SelectGenderScreen> createState() => _SelectGenderScreenState();
}

enum Gender { male, female }

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          leading: const BackButton(),
          title: const ProgressBar(
            currentNumber: 1,
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
                      "What's up ?",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: AppPadding.miniSpacer,
                    ),
                    Text(
                      "Please Share Your Gender for bet Experience",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    GenderCard(
                      isSelected: isSelected,
                      title: 'Male',
                      onPressed: () {
                        isSelected = true;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: AppPadding.smallSpacer,
                    ),
                    GenderCard(
                      isSelected: !isSelected,
                      icon: Icons.female,
                      title: 'Female',
                      onPressed: () {
                        isSelected = false;
                        setState(() {});
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding),
        child: CustomButton(buttonText: "Next", onPressed: () {
              Navigator.push(context, SelectAgeScreen.route());

        }),
      ),
    ));
  }
}
