import 'dart:async';

import 'package:project_320191/view_model/login_view_model.dart';

class LoginViewModelImpl implements LoginViewModel {
  var _userNameController = StreamController<String>.broadcast();

  @override
  void dispose() {
    _userNameController.close();
  }

  @override
  // TODO: implement errorLoginMessage
  Stream<String> get errorLoginMessage =>
      _userNameController.stream.map((username) => error(username));

  @override
  // TODO: implement inputUserNameText
  Sink get inputUserNameText => _userNameController;

  @override
  // TODO: implement isEnableButtonLogin
  Stream<bool> get isEnableButtonLogin =>
      _userNameController.stream.map((userName) => userNameValidator(userName));

  bool userNameValidator(String userName) {
    return !userName.contains(" ");
  }

  String error(String userName) {
    if (!userNameValidator(userName)) {
      return "User name must remove all space";
    }
  }
}
