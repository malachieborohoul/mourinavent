import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rinavent/core/common/providers/language_provider.dart';
import 'package:rinavent/core/l10n/app_localizations.dart';
import 'package:rinavent/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:rinavent/core/common/providers/app_user_provider.dart';
import 'package:rinavent/core/l10n/l10n.dart';
import 'package:rinavent/core/theme/theme_helper.dart';
import 'package:rinavent/core/utils/logger.dart';
import 'package:rinavent/core/utils/size_utils.dart';

import 'package:rinavent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rinavent/features/auth/presentation/screens/splash_screen.dart';

import 'package:rinavent/init_dependencies.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await initDependencies();

//Background tasks
// WorkManagerService.initialize();
// WorkManagerService.registerPeriodicSync();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(
      MultiProvider(
        providers: [
          // Ajoutez vos ChangeNotifier ici
          ChangeNotifierProvider(create: (_) => LanguageProvider()),
          ChangeNotifierProvider(create: (_) => AppUserProvider()),
        ],
        child: MultiBlocProvider(
          // Ajoutez vos Blocs/Cubits ici
          providers: [
            BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
            BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
            // BlocProvider(create: (_) => serviceLocator<HomeBloc>()),
          
          ],
          child: const MyApp(),
        ),
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeLanguage();
  }

  Future<void> _initializeLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? globalLanguage = prefs.getInt("globalLanguage");

    if (globalLanguage == null) {
      await prefs.setInt("globalLanguage", 1);
      globalLanguage = 1;
    }

    // Assurez-vous que le widget est monté avant de changer l'état
    if (mounted) {
      Provider.of<LanguageProvider>(context, listen: false)
          .setLanguage(globalLanguage);
    }
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();

    //   late int? globalLanguage;
    //   globalLanguage = prefs.getInt("globalLanguage");

    //   // LANGUAGE SETTING
    //   if (globalLanguage == null) {
    //     prefs.setInt("globalLanguage", 1);
    //   }
    //   Provider.of<LanguageProvider>(context, listen: false)
    //       .setLanguage(prefs.getInt("globalLanguage")!);
    // });

    return Sizer(builder: (context, orientation, deviceType) {
      return Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            title: 'wegoo',
            locale: languageProvider.language == 0
                ? const Locale('en')
                : const Locale('fr'),
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            home: const SplashScreen(),
          );
        },
      );
    });
  }
}
