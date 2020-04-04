

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
  ProductViewModel _productViewModel = locator<ProductViewModel>();
  AppViewModel _appViewModel = locator<AppViewModel>();
  String cartMessage = "";
  final LocalStorage storage = new LocalStorage('app_data');
  bool success = false;
  Directory tempDir;
  String tempPath;
  List<Profile> _profile =[];
  Preference userpreference = locator<Preference>();
  Future isUserLogged;

//Database _db;
  String _message;
  AppState  _status;

  AppState get status => _status;

  String  get message => _message;
  

  AuthViewModel(){
    _status = this.getState();
  }


void setStatus(AppState state) {
        _status = state;
       }

 AppState getState() {
   
   AppState state;

   userpreference.isUserLoggedIn.then((res) {
       if (res) {
         print("Preferences :- $res ");
         _appViewModel.setStatus(AppState.Authenticated);
       } else {
         print("Preferences :- $res ");
         _appViewModel.setStatus(AppState.UnAuthenticated);
       }
    }).catchError((e) {
      _appViewModel.setStatus(AppState.UnAuthenticated);
    });
   
  return state;
    
  }

  
 fetchLocalProfile() async{
   _appViewModel.setStatus(AppState.Busy);
  _profile = [];
    try {
      // Get the records
      List<Map> list = await _productViewModel.db.rawQuery('SELECT * FROM Profile Where id = 1');
      list.map((dd) {
         Profile profile = new Profile.fromJson(dd);
        _profile.add(profile);
        
      }).toList();
       print("User Object :-${_profile.length}");
       _appViewModel.setStatus(AppState.Retrieved);
      notifyListeners();
    } catch (e) {
      print("Error on fetch profile");
      print(e);
    }
 }

 updateProfileToLocal(Profile profile) async {
    
    await _productViewModel.db.transaction((tx) async {
      try {
        var qry = 'UPDATE Profile set name = "${profile.name}",';
          qry += 'image = "${profile.avatar}", phone = "${profile.phone}",';
          qry += 'email="${profile.email}",address = "${profile.address}" where id = 1';
        _productViewModel.db.rawUpdate(qry).then((res) async {
        print("User local Update  $res");
         await this.fetchLocalProfile();
      }).catchError((e) {
        print("User local Update $e");
      });
        
      } catch (e) {
        print("Error @ User local Update");
        print(e);
      }
    });
  }


Profile get userProfile => _profile[0];

 register(){

 }

  phoneAuth(){

  }

 forgotPassword(){

 }

Future  loginUser(context,String email,String password) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    _appViewModel.setStatus(AppState.Busy);
       final response =  _authService.login(email,password);
       if (response['status']){
          Profile _profile = Profile.fromJson(response['profile']);
          this.updateProfileToLocal(_profile);
          this.fetchLocalProfile();
          prefs.setBool('userloggedIn', true);
          _appViewModel.setStatus(AppState.Authenticated);
          ToastOn("Welcome Back ${_profile.name}.", Colors.greenAccent[400],Colors.white, 20.0);
          notifyListeners();
          return true;
        
       } else {
         ToastOn("Invalid email or password.", Colors.redAccent,Colors.white, 20.0);
         _appViewModel.setStatus(AppState.UnAuthenticated);
         notifyListeners();
         return false;
       }
    
 }

 logOut(context){
   _appViewModel.setStatus(AppState.Busy);
   removePreference();
   _appViewModel.setStatus(AppState.UnAuthenticated);
   Navigator.of(context).pushNamed('/login');
   
 }

 removePreference() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool('userloggedIn',false);
   //prefs.setInt('userId',1);
  }

}