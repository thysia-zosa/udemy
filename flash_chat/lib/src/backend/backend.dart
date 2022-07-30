import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utilities/consts.dart';

abstract class Backend {
  Future<String?> register({
    required String email,
    required String password,
  });

  Future<String?> login({
    required String email,
    required String password,
  });

  String getCurrentUserEmail();

  Future<void> logout();

  Future<void> sendMessage({
    required String sender,
    required String message,
  });

  factory Backend() => _FireBaseBackend();
}

class _FireBaseBackend implements Backend {
  static _FireBaseBackend? _instance;
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  _FireBaseBackend._()
      : _auth = FirebaseAuth.instance,
        _firestore = FirebaseFirestore.instance;

  factory _FireBaseBackend() => _instance ??= _FireBaseBackend._();

  @override
  Future<String?> register({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  @override
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  @override
  String getCurrentUserEmail() => _auth.currentUser?.email ?? '';

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<void> sendMessage({
    required String sender,
    required String message,
  }) async {
    _firestore.collection(collection).add(
      {
        senderKey: sender,
        messageKey: message,
      },
    );
  }

  // @override
  // Stream<DocumentSnapshot> messageStream() =>
  //     _firestore.collection(collection).snapshots();
}
