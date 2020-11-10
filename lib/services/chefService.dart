import 'package:easy_order/models/Models.dart';
import 'package:easy_order/shared/shared.dart';

class ChefService {
  API _api = new API();

  List<Chef> getChefs() {
    var demo_chef = [
      {
        "id": 1,
        "icon": "https://source.unsplash.com/user/erondu/1600x1000",
        "location": "Yaba",
        "name": 'Micheal Owen',
        "rating": 4.5,
        "experience": "Fried Rice",
        "experience_years": 5
      },
      {
        "id": 2,
        "icon": "https://source.unsplash.com/user/jackie/1600x1000",
        "location": "Ikorodu",
        "name": 'John',
        "rating": 4.5,
        "experience": "Ewa Oganyi",
        "experience_years": 7
      },
      {
        "id": 3,
        "icon": "https://source.unsplash.com/user/jnnfrchn/1600x1000",
        "location": "Ikeja",
        "name": 'Steven',
        "rating": 4.5,
        "experience": "Jollof Rice",
        "experience_years": 6
      },
      {
        "id": 4,
        "icon": "https://source.unsplash.com/user/lefterisk/1600x1000",
        "location": "Lekki",
        "name": 'Tope',
        "rating": 4.5,
        "experience": "Fried Yam and Eggs",
        "experience_years": 7
      },
      {
        "id": 5,
        "icon": "https://source.unsplash.com/user/saracervera/1600x1000",
        "location": "Ikoyi",
        "name": 'Patric',
        "rating": 4.5,
        "experience": "Oha Soup",
        "experience_years": 10
      },
      {
        "id": 6,
        "icon": "https://source.unsplash.com/user/naveed28/1600x1000",
        "location": "Yaba",
        "name": 'Stella',
        "rating": 4.5,
        "experience": "Semo and Vegetable Soup",
        "experience_years": 8
      },
      {
        "id": 7,
        "icon": "https://source.unsplash.com/user/fryfamilyfoodco/1600x1000",
        "location": "Ikorodu",
        "name": 'Ibukun',
        "rating": 4.5,
        "experience": "White Rice and Stew",
        "experience_years": 5
      },
      {
        "id": 8,
        "icon": "https://source.unsplash.com/user/likemeat/1600x1000",
        "location": "Ikeja",
        "name": 'Ebuka',
        "rating": 4.5,
        "experience": "Spaghetti and Chicken",
        "experience_years": 9
      },
      {
        "id": 9,
        "icon": "https://source.unsplash.com/user/yogidan2012/1600x1000",
        "location": "Ikoyi",
        "name": 'Abigal',
        "rating": 4.5,
        "experience": "Amala and Melon Soup",
        "experience_years": 10
      },
      {
        "id": 10,
        "icon": "https://source.unsplash.com/user/louishansel/1600x1000",
        "location": "Lekki",
        "name": 'Aisha',
        "rating": 4.5,
        "experience": "Fruit Salad",
        "experience_years": 5
      },
      {
        "id": 11,
        "icon": "https://source.unsplash.com/user/kul_kultida/1600x1000",
        "location": "Yaba",
        "name": 'Shade',
        "rating": 4.5,
        "experience": "Indomie and Fried Eggs",
        "experience_years": 4
      },
    ];
    return demo_chef.map((data) => Chef.fromJson(data)).toList();
  }

  Future<dynamic> search(dynamic query, String authToken) async {
    String url = "${Constant.USER_API_URL}/search/chef";
    final response = await _api.Post(url, query, authToken);
    return response;
  }
  Future<dynamic> searchNickname(String nickname, String authToken) async {
    String url = "${Constant.USER_API_URL}/search/chef/$nickname";
    final response = await _api.Get(url,authToken);
    return response;
  }
  Future<dynamic> getUserBooking(String uId,String authToken) async {
      String url = "${Constant.CHEF_API_URL}/all/user/$uId/booking";
      final response = await _api.Get(url,authToken);
      return response;
  }
  Future<dynamic> bookedChef(){

  }
  Future<dynamic> payHalfToChefWallet(){

  }
  Future<dynamic> payBalanceToChefWallet(){

  }
  Future<dynamic> bookingPayment(){

  }
  Future<dynamic> getUserBookings(){

  }
  // Future<dynamic> payToChefWallet(){

  // }
}
