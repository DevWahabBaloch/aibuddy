import 'package:aibuddy/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository repository;
  SignInWithGoogle(this.repository);

  Future<dynamic> call() async {
    return await repository.signInWithGoogle();
  }
}
