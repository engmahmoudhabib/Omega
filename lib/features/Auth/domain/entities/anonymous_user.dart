class AnonymousUser {
  final String uid;
  final String? displayName;
  final String? email;
  final bool emailVerified;
  final String? tenantId;
  final bool isAnonymous;
  final String? photoURL;
  final String? phoneNumber;
  final String? refreshToken;
  final List? providerData;
  final AnonymousUserMetadata metadata;
  AnonymousUser({
    this.displayName,
    this.email,
    required this.emailVerified,
    required this.uid,
    required this.isAnonymous,
    this.tenantId,
    this.phoneNumber,
    this.photoURL,
    this.refreshToken,
    this.providerData,
    required this.metadata,
  });
}

class AnonymousUserMetadata {
  final DateTime? creationTime;
  final DateTime? lastSignInTime;
  AnonymousUserMetadata({
    required this.creationTime,
    required this.lastSignInTime,
  });
}
