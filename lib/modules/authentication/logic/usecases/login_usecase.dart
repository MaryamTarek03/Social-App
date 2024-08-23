import 'package:connect_social_app/core/usecases/usecase.dart';
import 'package:connect_social_app/modules/authentication/logic/repos/auth_repo.dart';

class LoginUseCase extends UseCase {
  final AuthRepo authRepo;

  final String email;
  final String password;

  LoginUseCase({
    required this.authRepo,
    required this.email,
    required this.password,
  });

  @override
  Future<void> call() {
    // TODO: implement call
    // login
    authRepo.userLogin(email: email, password: password);
    throw UnimplementedError();
  }
}
