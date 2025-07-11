import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rinavent/features/auth/presentation/screens/loading_screen.dart';
import 'package:rinavent/core/theme/theme_helper.dart';
import 'package:rinavent/core/utils/image_constant.dart';
import 'package:rinavent/core/utils/pref_utils.dart';
import 'package:rinavent/core/utils/size_utils.dart';
import 'package:rinavent/core/presentation/widgets/custom_image_view.dart';
import 'package:rinavent/features/auth/presentation/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const SplashScreen(),
        );
      });
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? scaleController;
  Animation<double>? scaleAnimation;

  bool _a = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;
  bool secondAnim = false;
  Color boxColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await Future.delayed(Duration.zero);
    // if (ModalRoute.of(context)!.settings.arguments != null) {
    //   HomeController homeController = Get.find<HomeController>();
    //   homeController.onChange(0.obs);
    //   Get.toNamed(AppRoutes.homeCardSliderScreen);
    //   return;
    // }

    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        boxColor = theme.colorScheme.primary;
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        boxColor = theme.colorScheme.primary;
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 3200), () {
      secondAnim = true;

      scaleController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
      )..forward();
      scaleAnimation =
          Tween<double>(begin: 0.0, end: 12).animate(scaleController!);

      setState(() {
        boxColor = appTheme.bgColor;
        _d = true;
      });
    });

    Timer(const Duration(milliseconds: 2000), () async {
      // bool isLogin = await PrefUtils.getLogin();
      bool isIntro = await PrefUtils.getIntro();

      await Future.delayed(Duration.zero);

      Timer(const Duration(seconds: 3), () {
        if (isIntro) {
          debugPrint("💡Navigating to Onboarding Screen");
          Navigator.push(context, OnboardingScreen.route());

        }  else {
           debugPrint("💡Navigating to LoadingScreen ");

                    Navigator.push(context, LoadingScreen.route());

        }
      });
    });
  }

  @override
  void dispose() {
    if (scaleController != null) {
      scaleController!.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // Constant.setupSize(context);
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: appTheme.bgColor,
      appBar: getInVisibleAppBar(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? h / (kIsWeb ? 2.5 : 4.5)
                      : 20,
              width: 20,
            ),
            AnimatedContainer(
              duration: Duration(seconds: _c ? 2 : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? h
                  : _c
                      ? 160
                      : 20,
              width: _d
                  ? w
                  : _c
                      ? 200
                      : 20,
              decoration: BoxDecoration(
                  color: !_d ? appTheme.gray100 : appTheme.bgColor,
                  // shape: _d ? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: _d
                      ? const BorderRadius.only()
                      : BorderRadius.circular(30)),
              child: secondAnim
                  ? Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: appTheme.bgColor, shape: BoxShape.circle),
                        child: AnimatedBuilder(
                          animation: scaleAnimation!,
                          builder: (c, child) => Transform.scale(
                            scale: scaleAnimation!.value,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: appTheme.bgColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: _e
                          ? CustomImageView(
                              imagePath: ImageConstant.imgThumbsUp,
                              height: 136.v,
                              width: 155.v,
                            )
                          : const SizedBox(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar getInVisibleAppBar(
      {Color color = Colors.transparent,
      Brightness? statusBarBrightness,
      Brightness? statusBarIconBrightness}) {
    return AppBar(
      toolbarHeight: 0,
      elevation: 0,
      backgroundColor: color,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
    );
  }
}
