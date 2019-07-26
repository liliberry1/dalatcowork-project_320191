
import 'package:http/http.dart' as http;

import 'dart:convert';

class LoginApi{

  final api = 'https://mighty-sands-12882.herokuapp.com/users';

  var client = http.Client();

  Future<bool> login(String userName) async{
    Map<String, dynamic> params = Map();
    params['user_name'] = userName;
    params['password'] = '123';
    var response = await client.post('$api/login',body: params);
    return jsonDecode(response.body)['success'];
  }
}