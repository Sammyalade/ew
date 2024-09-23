import 'package:flutter/material.dart';

import '../models/auth_user_model.dart';

class UserModelProvider extends ChangeNotifier{
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  void setUserModel(UserModel user){
    _userModel = user;
    notifyListeners();
  }

}