import 'package:flutter/material.dart';
import 'package:project_320191/helper/utils.dart';
import 'package:project_320191/model/login_view_model_impl.dart';
import 'package:project_320191/view_model/login_view_model.dart';

class LoginPage extends StatefulWidget {

  final LoginViewModel viewModel;


  LoginPage(@required this.viewModel);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userNameController = TextEditingController();

  @override
  void initState() {
    _userNameController.addListener(() => widget.viewModel.inputUserNameText.add
      (_userNameController.text));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: size.width / 3,
                height: size.width / 3,
                decoration:
                BoxDecoration(color: randomColor(), shape: BoxShape.circle),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                      hintText: 'user name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                      )),
                ),
              ),
              StreamBuilder(
                stream: widget.viewModel.isEnableButtonLogin,
                builder: (context, snapshot) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    child: FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              color: snapshot?.data == true? Colors.blue:
                              Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(45))),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        )),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
