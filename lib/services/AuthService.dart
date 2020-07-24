import 'package:easy_order/shared/shared.dart';

class AuthService {
  API api = new API();

  dynamic login(String email, String password) async {
    var data = {
      "email":email, 
      "password":password,
      "app":"user"};
    var response = await api.Post("${Constant.USER_API_URL}/auth", data);
    // print(" auth response --> $response");
    return response;
  }

  Future<Map<String, dynamic>> register() {}

  Future<String> phoneAuth() {}

  Future<Map<String, dynamic>> passwordRecovery() {}
}
