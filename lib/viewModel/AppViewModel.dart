

import 'dart:async';

import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';


class AppViewModel extends Model {

 
  Future isUserLogged;

//Database _db;
  String _message;
  AppState  _status;
  StreamController<AppState> _appState = StreamController<AppState>.broadcast();

  Preference userpreference = locator<Preference>();

  AppState get status => _status;

  String  get message => _message;

  Stream<AppState>  get state => _appState.stream;
  

  AppViewModel(){
    this.getState();
    //setStatus(_status);
  }


 void setStatus(AppState state) {
        _status = state;
        _appState.add(state);
    }

AppState getState() {
   
   AppState state;

   userpreference.isUserLoggedIn.then((res) {
       if (res) {
         print("User LoggedIn Preferences :- $res ");
         this.setStatus(AppState.Authenticated);
       } else {
         print("User LoggedIn Preferences :- $res ");
         this.setStatus(AppState.UnAuthenticated);
       }
    }).catchError((e) {
      this.setStatus(AppState.UnAuthenticated);
    });
   
  return state;
    
  }




}