part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initCategory();
  _initUserProfile();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;


  serviceLocator.registerLazySingleton(() => supabase.client);

    serviceLocator.registerLazySingleton(
    () => Hive.box(name: 'profiles'),
  );

  serviceLocator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn(
        serverClientId: AppSecrets.webClientId,
        clientId: AppSecrets.iosClientId,
      ));
 serviceLocator.registerFactory(() => InternetConnection());
  //core
  serviceLocator.registerLazySingleton(
    () => AppUserCubit(),
  );

  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
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

     ..registerFactory<AuthLocalDatasource>(
      () => AuthLocalDatasourceImpl(
        serviceLocator(),
      ),
    )

    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
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
      () => UserSignOut(
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
        signUpWithApple: serviceLocator(), userSignOut: serviceLocator(),
      ),
    );
}

void _initCategory() {
  //Datasource

  serviceLocator
    ..registerFactory<CategoryRemoteDatasource>(
      () => CategoryRemoteDatasourceImpl(
        serviceLocator(),
      ),
    )

    // Repository
    ..registerFactory<CategoryRepository>(
      () => CategoryRepositoryImpl(
        serviceLocator(),
      ),
    )

    //Usecases
    ..registerFactory(
      () => GetCategories(
        serviceLocator(),
      ),
    )

    //Bloc
    ..registerLazySingleton(
      () => CategoryBloc(
        getCategories: serviceLocator(),
      ),
    );
}


void _initUserProfile() {
  //Datasource

  serviceLocator
    ..registerFactory<UserProfileRemoteDatasource>(
      () => UserProfileRemoteDatasourceImpl(
        serviceLocator(),
      ),
    )

    // Repository
    ..registerFactory<UserProfileRepository>(
      () => UserProfileRepositoryImpl(
        serviceLocator(),
      ),
    )

    //Usecases
    ..registerFactory(
      () => CompleteUserProfile(
        serviceLocator(),
      ),
    )
   

    //Bloc
   
    ..registerLazySingleton(
      () => UserProfileBloc(completeUserProfile: serviceLocator(), appUserCubit: serviceLocator()
        
      ),
    );

    //Cubit
        serviceLocator.registerLazySingleton(
      () => CompleteUserProfileCubit(
        
      ),
    );

  
}
