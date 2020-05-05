

import 'dart:io';

import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AccountViewModel extends Model {

AccountService _accountService = locator<AccountService>();
AppViewModel _appViewModel = locator<AppViewModel>();
List<Profile> _profile =[];


updateProfile(){

 }

 uploadPicture(){

 }


 AccountViewModel(){
   

   this.getProfile();
 }

 getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _appViewModel.setStatus(AppState.Busy);
     int uid = prefs.getInt('UID');

     if (uid == null) {
       _appViewModel.setStatus(AppState.UnAuthenticated);
     } else {
      final response =  _accountService.getUserProfile(uid);
     Profile profile = new Profile.fromJson(response['profile']);
     _profile.clear();
     _profile.add(profile);
        _appViewModel.setStatus(AppState.Authenticated);
     print("user from account model :- $_profile");
     }
     

  }

  get profile => _profile[0];


   
}