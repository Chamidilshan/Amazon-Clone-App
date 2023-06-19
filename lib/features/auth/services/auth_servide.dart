import 'dart:convert';
import 'package:amazoon_clone/constants/constants.dart';
import 'package:amazoon_clone/constants/error_handling.dart';
import 'package:amazoon_clone/constants/utils.dart';
import 'package:amazoon_clone/features/home/screens/home_screen.dart';
import 'package:amazoon_clone/models/user.dart';
import 'package:amazoon_clone/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
  void signUpUser({
    required BuildContext context,
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
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account created!, Login with the same credentials');          }
      );
    } catch (e){
    print(e);
    showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
  required String email,
    required String password
})
  async {
    try{
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email' : email,
            'password': password
          }),
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
        }
      );
      print(res.body);
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () async{
            SharedPreferences perfs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await perfs.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.routeName,
                    (route) => false
            );
          }
      );
    } catch (e){
    print(e);
    showSnackBar(context, e.toString());
    }
  }
  void getUserData(BuildContext context)
  async {
    try{
      SharedPreferences perfs = await SharedPreferences.getInstance();
      String? token = perfs.getString('x-auth-token');

      if(token==null){
        perfs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
          Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token' : token!
        }
      );

      var response = jsonDecode(tokenRes.body);

      if(response==true){
        http.Response userRes = await http.get(
            Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token' : token!
            }
        );

        var userProvider = Provider.of<UserProvider>(context!, listen: false);
        userProvider.setUser(userRes.body);
      }



    }
    catch (e){
    print(e);
    //showSnackBar(context, e.toString());
    }
  }
}