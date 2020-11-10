
import 'package:easy_order/models/Models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';


class AccountViewModel extends Model {
  AccountService _accountService = locator<AccountService>();
  Profile _profile;

  updateProfile() {}

  uploadPicture() {}

  AccountViewModel() {
    getCacheProfile();
  }

  getCacheProfile() async {
     var data = await locator<Preference>().userProfile;
    //  print("user profile --> $data");
    _profile = Profile.fromJson(data);   
    notifyListeners();
  }

  Profile get profile => _profile;
}
