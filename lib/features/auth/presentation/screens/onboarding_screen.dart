import 'package:flutter/material.dart';
import 'package:rinavent/core/common/animations/opacity_tween.dart';
import 'package:rinavent/core/common/animations/slide_down_tween.dart';
import 'package:rinavent/core/theme/theme_helper.dart';
import 'package:rinavent/core/utils/image_constant.dart';
import 'package:rinavent/core/presentation/widgets/custom_elevated_button.dart';
import 'package:rinavent/core/utils/size_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const OnboardingScreen(),
        );
      });

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  SharedPreferences? prefs;

  final List<OnboardingPageModel> _pages = [
    OnboardingPageModel(
      imagePath: ImageConstant.imgRectangle34624256,
      title: 'Grab all events now\nonly in your hands',
      description: 'Stream is here to help you to find the best events\nbased on your interests.',
    ),
    OnboardingPageModel(
      imagePath: ImageConstant.imgRectangle34624256474x388,
      title: 'Discover new experiences',
      description: 'Find and book the best events near you.',
    ),
    OnboardingPageModel(
      imagePath: ImageConstant.imgRectangle346242561,
      title: 'Let’s get started!',
      description: 'Join us and never miss a moment.',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NextScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    pref();
  }

  void pref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: _pages.map((page) => _buildPage(page)).toList(),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 12 : 8,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : Colors.white54,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingPageModel page) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(page.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SlideDownTween(
                  offset: 80,
                  delay: 0.6,
                  child: OpacityTween(
                    begin: 0.5,
                    child: Text(
                      page.title,
                      textAlign: TextAlign.start,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        height: 1.36,
                        fontSize: 34.fSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SlideDownTween(
                  offset: 80,

                  child: OpacityTween(
                    begin: 0.5,

                    child: Text(
                      

                      page.description,
                      textAlign: TextAlign.start,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        height: 1.50,
                        fontSize: 17.fSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text: _currentPage == _pages.length - 1
                        ? 'Get Started'
                        : 'Next',
                    onPressed: _nextPage,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingPageModel {
  final String imagePath;
  final String title;
  final String description;

  OnboardingPageModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Screen')),
      body: const Center(child: Text('Welcome to the app!')),
    );
  }
}
