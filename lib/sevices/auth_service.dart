import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> studentLogin({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Error: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      log('Login Error: $e');
      rethrow;
    }
  }

  Future<UserCredential?> studentReg({
    required String name,
    required String email,
    required String password,
    required String idnumber,
    required String department,
    required String phoneno,
  }) async {
    try {
      // Create user in Firebase Auth
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      // If user creation is successful, store additional details in Firestore
      if (credential.user != null) {
        await _firestore
            .collection('Student_Registers')
            .doc(credential.user!.uid)
            .set({
          'username': name.trim(),
          'email': email.trim(),
          'idnumber': idnumber.trim(),
          'department': department.trim(),
          'phoneno': phoneno.trim(),
          'createdAt': FieldValue.serverTimestamp(),
          'role': 'student',
        });
      }

      return credential;
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Error: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      log('Registration Error: $e');
      rethrow;
    }
  }

  Future<UserCredential?> OrganizerLogin({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Error: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      log('Login Error: $e');
      rethrow;
    }
  }

  Future<UserCredential?> OrganizerReg({
    required String name,
    required String email,
    required String password,
    required String idnumber,
    required String department,
    required String phoneno,
  }) async {
    try {
      // Create user in Firebase Auth
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      // If user creation is successful, store additional details in Firestore
      if (credential.user != null) {
        await _firestore
            .collection('Organizer_Registration')
            .doc(credential.user!.uid)
            .set({
          'username': name.trim(),
          'email': email.trim(),
          'idnumber': idnumber.trim(),
          'department': department.trim(),
          'phoneno': phoneno.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      return credential;
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Error: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      log('Registration Error: $e');
      rethrow;
    }
  }
}
