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
  Profile _profile;

  updateProfile() {}

  uploadPicture() {}

  AccountViewModel() {
    getCacheProfile();
  }

  getProfile() async {
    int uid = await Preference.getInt("UID");

    if (uid == null) {
      _appViewModel.setStatus(AppState.UnAuthenticated);
    } else {
      final response = _accountService.getUserProfile(uid);
      _profile = new Profile.fromJson(response['profile']);
      _appViewModel.setStatus(AppState.Authenticated);
    }
  }

  getCacheProfile() async {

     var data = await locator<Preference>().userProfile;
    _profile = Profile.fromJson(data);

    //print("user profile --> ${_profile.name}");
   
  }

  Profile get profile => _profile;
}
