import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:almabad/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSouce {
  Future<UserModel> login(UserModel user);
  Future<void> signUp(UserModel user);
  Future<void> deleteAccount(String id);
  Future<void> logout();
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacebook();
}

class AuthRemoteDataSouceImpl implements AuthRemoteDataSouce {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSouceImpl({required this.firebaseAuth});
  @override
  Future<void> deleteAccount(String id) async {
    try {
      await firebaseAuth.currentUser!.delete();
      await ls<UserRemoteDataSource>().deleteUser(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> login(UserModel user) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: user.email, password: user.password!);
      final use = await ls<UserRemoteDataSource>().getUser(user.email);
      use.verified = result.user!.emailVerified;
      use.password = user.password;
      return use;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUp(UserModel user) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password!);
      await result.user!.sendEmailVerification();
      await ls<UserRemoteDataSource>().addUser(user);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = UserModel(
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName,
        verified: true);
    if (!await ls<UserRemoteDataSource>().isExist(user.email)) {
      await ls<UserRemoteDataSource>().addUser(user);
    }
    final userCopy = await ls<UserRemoteDataSource>().getUser(user.email);
    user.id = userCopy.id;
    return user;
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    final userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    final user = UserModel(
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName,
        verified: true);
    if (!await ls<UserRemoteDataSource>().isExist(user.email)) {
      await ls<UserRemoteDataSource>().addUser(user);
    }

    return user;
  }
}
