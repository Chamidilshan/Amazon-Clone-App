import 'package:amazoon_clone/constants/constants.dart';
import 'package:amazoon_clone/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthService{
  void signUpUser({
  required String email,
    required String password,
    required String name
})
  async {
    try{
      User user = User(
          token: '',
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
      );
      
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
        }
      );
      print(res.body);
    } catch (e){
print(e);
    }
  }
}