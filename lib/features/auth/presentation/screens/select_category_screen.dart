import 'package:flutter/material.dart';
import 'package:rinavent/core/common/widgets/custom_button.dart';
import 'package:rinavent/core/contants/constants.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/features/auth/presentation/screens/select_age_screen.dart';
import 'package:rinavent/features/auth/presentation/widgets/gender_card.dart';
import 'package:rinavent/features/auth/presentation/widgets/progress_bar.dart';

class SelectCategoryScreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const SelectCategoryScreen(),
        );
      });
  const SelectCategoryScreen({super.key});

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

enum Gender { male, female }

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          leading: const BackButton(),
          title: const ProgressBar(
            currentNumber: 3,
            totalNumber: 3,
          )),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Select categories  ",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppPadding.miniSpacer,
                  ),
                  Text(
                    "Pick the categories that match your preferences and help us tailor the perfect event for you.",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: AppPadding.smallSpacer,
              ),
              Expanded(
                child: Wrap(
                  spacing: 8.0, // horizontal space beetween elements
                  runSpacing: 4.0, // vertical
                  children: List.generate(Constants.categories.length, (i) {
                    return Chip(
                      label: Text(Constants.categories[i]),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding),
        child: CustomButton(buttonText: "Next", onPressed: () {}),
      ),
    ));
  }
}
