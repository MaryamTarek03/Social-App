import 'package:connect_social_app/core/usecases/usecase.dart';
import 'package:connect_social_app/modules/authentication/logic/repos/auth_repo.dart';

class RegisterUseCase extends UseCase{
  final AuthRepo authRepo;

  RegisterUseCase({required this.authRepo});

  @override
  call() {
    // TODO: implement call
    // upload image if exists
    authRepo.userImageUpload();
    // register data
    // add user to firestore
    throw UnimplementedError();
  }

}