abstract class AuthRepo {
  userLogin({required String email, required String password});
  userSignUp({required String email, required String password});
  userAddData();
  getUser();
  logOut();
}