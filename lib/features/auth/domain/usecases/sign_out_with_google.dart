import 'package:aibuddy/features/auth/domain/repositories/auth_repository.dart';

class SignOutWithGoogle {
  final AuthRepository repository;

  SignOutWithGoogle(this.repository);

  Future<bool> call() async {
    return await repository.signOut();
  }
}
