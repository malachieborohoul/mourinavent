part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;
 
Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);

  serviceLocator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn(
    serverClientId: AppSecrets.webClientId,
    clientId: AppSecrets.iosClientId,
  ));

  //core
  serviceLocator.registerLazySingleton(
    () => AppUserCubit(),
  );
}

void _initAuth() {
  //Datasource

  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
        serviceLocator(),

      ),
    )

    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )

    //Usecases
    ..registerFactory(
      () => SignUpWithGoogle(
        serviceLocator(),
      ),
    )

     ..registerFactory(
      () => SignUpWithApple(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignIn(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )

    //Bloc
    ..registerLazySingleton(
      () => AuthBloc(
          userSignUp: serviceLocator(),
          userSignIn: serviceLocator(),
          currentUser: serviceLocator(),
          appUserCubit: serviceLocator(),
          signUpWithGoogle: serviceLocator(),
          signUpWithApple: serviceLocator(),
          ),
    );
}
