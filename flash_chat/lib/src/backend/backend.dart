import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/message.dart';
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

  Future<void> sendMessage(
    Message message,
  );

  Stream<QuerySnapshot<Map<String, dynamic>>> messageStream();

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
  Future<void> sendMessage(
    Message message,
  ) async {
    _firestore.collection(collection).add(message.toJson());
  }

// TODO: test stream possibilities: there must be a way...
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> messageStream() => _firestore
          .collection(collection)
          .snapshots() /* .map(
        (event) {
          // return event.docs.map((e) => Message.fromJson(e.data())).toList()
          //   ..sort(
          //     (a, b) => a.date.compareTo(b.date),
          //   );
          List<Message> entries = [];
          for (QueryDocumentSnapshot<Map<String, dynamic>> element
              in event.docs) {
            entries.add(Message.fromJson(element.data()));
            print('snapData: ${element.data()}');
            print('entries: $entries');
          }
          return entries.reversed.toList();
        },
      ) */
      ;
}
