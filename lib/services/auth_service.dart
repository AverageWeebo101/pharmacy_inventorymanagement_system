import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendOTPEmail(String email) async {
    await _auth.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: ActionCodeSettings(
        url: 'https://yourapp.page.link/otp',
        handleCodeInApp: true,
      ),
    );
  }

  bool verifyEmailLink(String emailLink) {
    return _auth.isSignInWithEmailLink(emailLink);
  }

  Future<void> signInWithEmailLink(String email, String emailLink) async {
    await _auth.signInWithEmailLink(email: email, emailLink: emailLink);
  }
}
