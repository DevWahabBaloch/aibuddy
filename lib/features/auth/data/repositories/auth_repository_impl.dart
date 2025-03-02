import 'package:aibuddy/features/auth/data/services/auth_service.dart';
import 'package:aibuddy/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl(this.authService);
  @override
  Future<dynamic> signInWithGoogle() async {
    return await authService.loginInWithGoogle();
  }

  @override
  Future<bool> signOut() async {
    return await authService.signOutFromGoogle();
  }
}
