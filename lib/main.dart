import 'package:flutter/material.dart';
import 'package:project_320191/view/page/login_page.dart';
import 'package:project_320191/view_model/login_view_model.dart';

import 'model/login_view_model_impl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'project #320191',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(new LoginViewModelImpl()),
    );
  }
}