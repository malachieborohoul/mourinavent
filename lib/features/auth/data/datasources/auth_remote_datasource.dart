import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rinavent/core/error/exceptions.dart';
import 'package:rinavent/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithGoogle();
  Future<UserModel> signUpWithApple();
  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<UserModel?> getCurrentUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl(this.supabaseClient, this.googleSignIn);
  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      final user = response.user;

      if (user == null) {
        throw const ServerException('User is null');
      }
      return UserModel.fromMap(user.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      if (kDebugMode) {
        print('Tentative d\'inscription...');
      }
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        'name': name,
      });
      final user = response.user;
      if (user == null) {
        throw const ServerException('User is null');
      }

      // Vérify user identities exists
      if (user.identities != null && user.identities!.isEmpty) {
        throw const ServerException('Email already exists');
      }

      // identities exist Confirm email
      if (user.identities != null && user.identities!.isNotEmpty) {
        throw const ServerException('Confirm email');
      }

      return UserModel.fromMap(user.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithGoogle() async {
    try {
      // Étape 1: Authentification via Google
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw const ServerException("Failed to sign in with Google.");
      }
      final googleAuth = await googleUser.authentication;

      // Étape 2: Utilisation de Supabase pour l'authentification avec Google ID token
      final response = await supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
      );

      final user = response.user;

      if (user == null) {
        //Failed to get user from Supabase.
        throw const ServerException("User is null");
      }

      // // identities exist Confirm email
      // if (user.identities != null && user.identities!.isNotEmpty) {
      //   throw const ServerException('Confirm email');
      // }

      // Retourne le modèle utilisateur
      return UserModel.fromMap(user.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName
        ],
      );

      final idToken = appleCredential.identityToken;
      // final accessToken = appleCredential.authorizationCode;

      if (idToken == null) {
        throw const ServerException('No ID Token found.');
      }

      // Étape 2: Utiliser Supabase pour s'authentifier avec le token d'Apple
      final response = await supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.apple,
        idToken: idToken,
        // accessToken: accessToken,
      );

      final user = response.user;

      if (user == null) {
        throw const ServerException('Failed to get user from Supabase.');
      }

      return UserModel.fromMap(user.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final userData = await supabaseClient
            .from('profiles')
            .select()
            .eq('id', currentUserSession!.user.id);
        return UserModel.fromMap(userData.first)
            .copyWith(email: currentUserSession!.user.email);
      }

      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await supabaseClient.auth.signOut();
      await googleSignIn.signOut();

    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
