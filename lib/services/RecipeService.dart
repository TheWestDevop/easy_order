import 'package:easy_order/shared/shared.dart';

class RecipeService {
  API _api = new API();
  Future<dynamic> getPosts(String authToken) async {
    
      String url = "${Constant.CHEF_API_URL}/all/posts";
      final response = await _api.Get(url,authToken);
      return response;
  }
   Future<dynamic> postViewed(String pid,String authToken) async {
    
      String url = "${Constant.CHEF_API_URL}/post/$pid/viewed";
      final response = await _api.Get(url,authToken);
      return response;
  }
  Future<dynamic> likePost(String pid,String authToken) async {
    
      String url = "${Constant.CHEF_API_URL}/like/post/$pid";
      final response = await _api.Get(url,authToken);
      return response;
  }
  
}
