import 'package:google_sign_in/google_sign_in.dart';
import 'package:mourinavent/core/error/exceptions.dart';
import 'package:mourinavent/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithGoogle();
  Future<UserModel> signIn({
    required String email,
    required String password,
  });

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
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        'name': name,
      });
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


    // Retourne le modèle utilisateur
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
}
