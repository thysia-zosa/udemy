import 'package:firebase_auth/firebase_auth.dart';

abstract class Backend {
  Future<UserCredential> register({
    required String email,
    required String password,
  });

  Future<UserCredential> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  factory Backend() => _FireBaseBackend();
}

class _FireBaseBackend implements Backend {
  static _FireBaseBackend? _instance;
  final FirebaseAuth _auth;

  _FireBaseBackend._() : _auth = FirebaseAuth.instance;

  factory _FireBaseBackend() => _instance ??= _FireBaseBackend._();

  @override
  Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credentials =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credentials;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An unknown error occurred.';
    }
  }

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credentials = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credentials;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An unknown error occurred';
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
