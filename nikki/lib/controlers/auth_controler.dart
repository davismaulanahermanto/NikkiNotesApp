import 'package:firebase_auth/firebase_auth.dart';

class AuthControler {
  final String email;
  final String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthControler({
    this.email = "",
    this.password = "",
    });

  Future<Map<String, dynamic>> signIn() async {
    try {
      final UserCredential res = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return{
        "Isvalid": true,
        "data": res.user,
      };
    } catch (err) {
      return{
        "Isvalid": false,
        "data": err.message,
      };
    }
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }
}