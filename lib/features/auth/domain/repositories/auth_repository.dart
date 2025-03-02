abstract class AuthRepository {
  Future<dynamic> signInWithGoogle();
  Future<bool> signOut();
}
