import 'dart:convert';
import 'dart:io';

import 'package:easy_order/models/Profile.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends Model {
  AuthService _authService = locator<AuthService>();
  


  dynamic get userProfile => Preference.getMap("profile") == null
      ? null
      : Profile.map(Preference.getMap("profile"));

  register() {}

  phoneAuth() {}

  forgotPassword() {}

  Future<dynamic> loginUser(String email, String password) async {
    var response = await _authService.login(email, password);
    // print("auth response $response");
    if (response['status']) {
      Profile _profile = Profile.fromJson(response['data']);
      // prefs.setString('uid', _profile.id);
      await locator<ProductViewModel>().getAvailableProducts(
                                _profile.token);
      await locator<ProductViewModel>().getUnavailableProducts(
                                _profile.token);
      await locator<ProductViewModel>().getCategories(
                                _profile.token);
      Preference.setBool('userloggedIn', true);
      Preference.setMap("profile", _profile.toMap());
      notifyListeners();
      return {"status": true, "user": _profile};
    } else {
      notifyListeners();
      return {
        "status": false,
      };
    }
  }

  Future<dynamic> registerUser(
      String name, String phone, String email, String password) async {
    var user = {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password
    };
    var response = await _authService.register(user);
    // print("auth response $response");
    if (response['status']) {
      Profile _profile = Profile.fromJson(response['data']);
      // prefs.setString('uid', _profile.id);
      await locator<ProductViewModel>().getAvailableProducts(
                                _profile.token);
      await locator<ProductViewModel>().getUnavailableProducts(
                                _profile.token);
      await locator<ProductViewModel>().getCategories(
                                _profile.token);
      Preference.setBool('userloggedIn', true);
      Preference.setMap("profile", _profile.toMap());
      
      notifyListeners();
      return response;
    } else {
      notifyListeners();
      return response;
    }
  }

  Future<bool> logOut() async {
    Preference.setBool('userloggedIn', false);
    Preference.setMap("profile", null);
    return true;
  }
}
