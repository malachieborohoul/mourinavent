import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:rinavent/core/theme/theme.dart';
import 'package:rinavent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rinavent/features/auth/presentation/screens/splash_screen.dart';
import 'package:rinavent/features/user_profile/presentation/bloc/category/category_bloc.dart';
import 'package:rinavent/features/user_profile/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:rinavent/features/user_profile/presentation/cubits/complete_user_profile/complete_user_profile_cubit.dart';
import 'package:rinavent/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
      BlocProvider(create: (_) => serviceLocator<CompleteUserProfileCubit>()),
      BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      BlocProvider(create: (_) => serviceLocator<CategoryBloc>(),),
      BlocProvider(create: (_) => serviceLocator<UserProfileBloc>(),),
    ],
    child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "rinavent",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      home: const SplashScreen(), // Affiche d'abord le Splash Screen
    );
  }
}