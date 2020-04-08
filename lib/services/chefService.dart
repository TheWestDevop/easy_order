
import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';

class ChefService {

  API _api;

  List<Chef> getChefs() {
    var demo_chef = [
                    {
                      "id":1,
                      "image":"https://source.unsplash.com/user/erondu/1600x1000",
                      "location":"Yaba",
                      "name":'Micheal Owen',
                      "rating":4.5,
                      "fav":true,
                      "experience":"Fried Rice",
                      "experience_years":5
                    },
                    {
                      "id":2,
                      "image":"https://source.unsplash.com/user/jackie/1600x1000",
                      "location":"Ikorodu",
                      "name":'John',
                      "rating":4.5,
                      "fav":true,
                      "experience":"Ewa Oganyi",
                      "experience_years":7
                    },
                    {
                      "id":3,
                      "image":"https://source.unsplash.com/user/jnnfrchn/1600x1000",
                      "location":"Ikeja",
                      "name":'Steven',
                      "rating":4.5,
                      "fav":true,
                      "experience":"Jollof Rice",
                      "experience_years":6
                    },
                    {
                      "id":4,
                      "image":"https://source.unsplash.com/user/lefterisk/1600x1000",
                      "location":"Lekki",
                      "name":'Tope',
                      "rating":4.5,
                      "fav":true,
                      "experience":"Fried Yam and Eggs",
                      "experience_years":7
                    },
                    {
                      "id":5,
                      "image":"https://source.unsplash.com/user/saracervera/1600x1000",
                      "location":"Ikoyi",
                      "name":'Patric',
                      "rating":4.5,
                      "fav":true,
                      "experience":"Oha Soup",
                      "experience_years":10
                    },
                    {
                      "id":6,
                      "image":"https://source.unsplash.com/user/naveed28/1600x1000",
                      "location":"Yaba",
                      "name":'Stella',
                      "rating":4.5,
                      "fav":true,
                      "experience":"Semo and Vegetable Soup",
                      "experience_years":8
                    },
                    {
                      "id":7,
                      "image":"https://source.unsplash.com/user/fryfamilyfoodco/1600x1000",
                      "location":"Ikorodu",
                      "name":'Ibukun',
                      "rating":4.5,
                      "fav":true,
                      "experience":"White Rice and Stew",
                      "experience_years":5
                    },
                    {
                      "id":8,
                      "image":"https://source.unsplash.com/user/likemeat/1600x1000",
                      "location":"Ikeja",
                      "name":'Ebuka',
                      "rating":4.5,
                      "fav":true,
                      "experience":"Spaghetti and Chicken",
                      "experience_years":9
                    },
                    {
                      "id":9,
                      "image":"https://source.unsplash.com/user/yogidan2012/1600x1000",
                      "location":"Ikoyi",
                      "name":'Abigal',
                      "rating":4.5,
                      "fav":true,
                      "experience":"Amala and Melon Soup",
                      "experience_years":10
                    },
                    {
                      "id":10,
                      "image":"https://source.unsplash.com/user/louishansel/1600x1000",
                      "location":"Lekki",
                      "name":'Aisha',
                      "rating":4.5,
                      "fav":true,
                      "experience":"Fruit Salad",
                      "experience_years":5
                    },
                    {
                      "id":11,
                      "image":"https://source.unsplash.com/user/kul_kultida/1600x1000",
                      "location":"Yaba",
                      "name":'Shade',
                      "rating":4.5,
                      "fav":true,
                      "experience":"Indomie and Fried Eggs",
                      "experience_years":4
                    },

];
    return demo_chef.map((data)=> Chef.fromJson(data)).toList();
  }

}