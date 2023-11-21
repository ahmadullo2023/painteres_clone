import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _authService = FirebaseAuth.instance;

  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential? users = await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return users;
    } catch (e) {
      throw Exception("firebase sign in error $e");
    }
  }

  Future<UserCredential> signUp(String email, String password) async {
    try {
      UserCredential? users = await _authService.createUserWithEmailAndPassword(
          email: email, password: password);
      return users;
    } catch (e) {
      throw Exception("firebase sign up error $e");
    }
  }
}
