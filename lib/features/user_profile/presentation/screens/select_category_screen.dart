import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/common/widgets/custom_button.dart';
import 'package:rinavent/core/common/widgets/loader.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/core/theme/app_palette.dart';
import 'package:rinavent/core/utils/show_snackbar.dart';
import 'package:rinavent/features/auth/presentation/widgets/progress_bar.dart';
import 'package:rinavent/features/user_profile/presentation/bloc/category/category_bloc.dart';

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

  List<Category> selectedCategories = [];

  @override
  void initState() {
    super.initState();

    context.read<CategoryBloc>().add(CategoryLoadCategories());
  }

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
              const SizedBox(
                height: AppPadding.smallSpacer,
              ),
              BlocConsumer<CategoryBloc, CategoryState>(
                listener: (context, state) {
                  if (state is CategoryFailure) {
                    showSnackBar(context, state.error);
                  }
                },
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Loader();
                  }
                  if (state is CategorySuccess) {
                    final categories = state.categories;
                    return Expanded(
                      child: Wrap(
                        spacing: 8.0, // horizontal space beetween elements
                        runSpacing: 4.0, // vertical
                        children: List.generate(categories.length, (i) {
                          return GestureDetector(
                            onTap: () {
                              if (selectedCategories.contains(categories[i])) {
                                selectedCategories.remove(categories[i]);
                              } else {
                                selectedCategories.add(categories[i]);
                              }
                              setState(() {});
                            },
                            child: Chip(
                              labelStyle: TextStyle(
                                  color:
                                      selectedCategories.contains(categories[i])
                                          ? Colors.white
                                          : null),
                              color: selectedCategories.contains(categories[i])
                                  ? const WidgetStatePropertyAll(
                                      AppPalette.gradient1,
                                    )
                                  : null,
                              label: Text(categories[i].title),
                            ),
                          );
                        }),
                      ),
                    );
                  }
                  return const SizedBox();
                },
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
