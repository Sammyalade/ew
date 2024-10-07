import 'package:flutter/material.dart';

import '../models/auth_user_model.dart';

class UserModelProvider extends ChangeNotifier{
  AuthUserModel? _userModel;

  AuthUserModel? get userModel => _userModel;

  void setUserModel(AuthUserModel user){
    _userModel = user;
    notifyListeners();
  }

}