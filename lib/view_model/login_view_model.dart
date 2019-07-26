


abstract class LoginViewModel{

Sink get inputUserNameText;

Stream<bool> get isEnableButtonLogin;

Stream<String> get errorLoginMessage;

Stream<bool> get isLoginSuccess;


void dispose();

}