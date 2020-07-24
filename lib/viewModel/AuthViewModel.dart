import 'dart:convert';
import 'dart:io';

import 'package:easy_order/models/profile.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends Model {
  AuthService _authService = locator<AuthService>();
  AppViewModel _appViewModel = locator<AppViewModel>();
 
  AppState _status;

  AppState get status => _status;

  AuthViewModel() {
    _status = _appViewModel.getState();
  }

  void setStatus(AppState state) {
    _status = state;
  }



  dynamic get userProfile => Preference.getMap("profile") == null ? null : Profile.map(Preference.getMap("profile"));
 
  register() {}

  phoneAuth() {}

  forgotPassword() {}

  Future<dynamic> loginUser(String email, String password) async {
    var response = await _authService.login(email, password);
    // print("auth response $response");
    if (response['status']) {
      Profile _profile = Profile.fromJson(response['data']);
      // prefs.setString('uid', _profile.id);
      Preference.setBool('userloggedIn', true);
      Preference.setMap("profile", _profile.toMap());
      notifyListeners();
      return {
        "status":true,
        "user":_profile
      };
    } else {
      notifyListeners();
      return {
        "status":false,
      };
    }
  }

  Future<bool> logOut() async {
    Preference.setBool('userloggedIn', false);
    Preference.setMap("profile", null);
    return true;
  }
}
