import 'package:anime_vault/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Email and password register
  Future<String> createUser({
    required UserModel user,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      //TODO PHOTO
      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(user.userName);

        final uid = userCredential.user!.uid;
        final data = user.toMap();

        data.putIfAbsent('created_at', () => FieldValue.serverTimestamp());

        await _firestore.collection('Users').doc(uid).set(data);
      }

      return 'Nais';
    } on FirebaseAuthException catch (e) {
      return '$e';
    }
  }

  Future logIn({
    required String email,
    required String password,
  }) async {
    // try {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // } catch (e) {}
  }
}
