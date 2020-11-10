import 'package:easy_order/models/Models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';

class RecipeViewModel extends Model {
  RecipeService _recipeService = locator<RecipeService>();
  
  List<Recipe> _posts = [];

  Future<dynamic> getPosts(token) async {
    var response = await _recipeService.getPosts(token);
    // print("user orders response ==> ${response['data']}");
    if (response['status']) {
      _posts.clear();
      List<dynamic> list = response['data'];
      _posts = list.map((item) => Recipe.fromJson(item)).toList();
      notifyListeners();
    }
    return response;
  }
  Future<dynamic> likePost(pid,token) async {
    var response = await _recipeService.likePost(pid,token);
    notifyListeners();
    return response;
  }
  Future<dynamic> postViewed(pid,token) async {
    var response = await _recipeService.postViewed(pid,token);
    print("post viewed response ==> $response");
    notifyListeners();
    return response;
  }

  List<Recipe> get posts => _posts;
}