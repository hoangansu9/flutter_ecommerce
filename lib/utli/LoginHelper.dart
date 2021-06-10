import 'package:app_ecommerce/model/user.dart';
import 'package:app_ecommerce/utli/database_helper.dart';

abstract class LoginCallBack {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginResponse {
  LoginCallBack _callBack;
  LoginRequest loginRequest = new LoginRequest();
  LoginResponse(this._callBack);

  doLogin(String username, String password) {
    loginRequest
        .getLogin(username, password)
        .then((user) => _callBack.onLoginSuccess(user))
        .catchError((onError) => _callBack.onLoginError(onError.toString()));
  }
}

class LoginRequest {
  DatabaseHelper con = new DatabaseHelper();

  Future<User> getLogin(String username, String password) {
    var result = con.getLogin(username, password);
    return result;
  }
}
