import 'package:amazoon_clone/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  User _user = User(
      email: '',
      token: '',
      id: '',
      name: '',
      password: '',
      address: '',
      type: ''
  );

  User get user => _user;

  void setUser(String user){
    _user = User.fromJson(user);
    notifyListeners();
  }
}