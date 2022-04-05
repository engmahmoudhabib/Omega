import 'package:firebase_auth/firebase_auth.dart';
import 'package:omega/features/Auth/domain/entities/anonymous_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AnonymousUser? userFromAnonymous(User? user) {
    if (user != null) {
      return AnonymousUser(
        emailVerified: user.emailVerified,
        isAnonymous: user.isAnonymous,
        metadata: AnonymousUserMetadata(
          creationTime: user.metadata.creationTime,
          lastSignInTime: user.metadata.lastSignInTime,
        ),
        uid: user.uid,
        displayName: user.displayName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        photoURL: user.photoURL,
        providerData: user.providerData,
        refreshToken: user.refreshToken,
        tenantId: user.tenantId,
      );
    } else
      return null;
  }

  Stream<AnonymousUser?> get user {
    return _auth.userChanges().map(userFromAnonymous);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return userFromAnonymous(user);
    } catch (e) {
      return null;
    }
  }
}
