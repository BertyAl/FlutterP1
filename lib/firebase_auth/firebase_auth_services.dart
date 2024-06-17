import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<User?> signUpWithEmailPassword(String email, String password) async {
        try {
            UserCredential result = await _auth.createUserWithEmailAndPassword(
                email: email,
                password: password,
            );
            return result.user;
        } catch (e) {
            print(e.toString());
            return null;
        }
    }

    Future<User?> signInWithEmailPassword(String email, String password) async {
        try {
            UserCredential result = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
            );
            return result.user;
        } catch (e) {
            print(e.toString());
            return null;
        }
    }
}