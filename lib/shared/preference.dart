

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preference {

 Future<bool> get isUserLoggedIn async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   bool _isUserLoggedIn =  prefs.getBool('userloggedIn') ?? false;
   return _isUserLoggedIn;
   }
 Future<int> get userID async { 
   SharedPreferences prefs = await SharedPreferences.getInstance();
   int _userId =  prefs.getInt('user_id') ?? null;
   return _userId;
   }

   Future<Map<String,dynamic>> get user async { 
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String _user =  prefs.getString('user_id') ?? null;
   return json.decode(_user);
   }



}