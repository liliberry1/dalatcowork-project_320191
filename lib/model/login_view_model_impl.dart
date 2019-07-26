import 'dart:async';

import 'package:project_320191/view_model/login_view_model.dart';
import 'package:project_320191/services/login_api.dart';

class LoginViewModelImpl implements LoginViewModel {
  var _userNameController = StreamController<String>.broadcast();
  LoginApi _api = LoginApi();

  @override
  void dispose() {
    _userNameController.close();
  }

  @override
  // TODO: implement errorLoginMessage
  Stream<String> get errorLoginMessage =>
      _userNameController.stream.map((username) => error(username));

  @override
  Sink get inputUserNameText => _userNameController;

  @override
  Stream<bool> get isEnableButtonLogin =>
      _userNameController.stream.map((userName) => userNameValidator(userName));

  @override
  Stream<bool> get isLoginSuccess{
    String userName;
    _userNameController.stream.map((text) => userName = userName);
    return Stream.fromFuture(_api.login(userName));
  }

  bool userNameValidator(String userName) {
    return !userName.contains(" ");
  }

  String error(String userName) {
    if (!userNameValidator(userName)) {
      return "User name must remove all space";
    }
  }
}
