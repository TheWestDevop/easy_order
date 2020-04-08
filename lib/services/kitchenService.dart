
import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';

class KitchenService {

  API _api;

  List<Kitchen> getKitchens() {
    var demo_kitchen = [
                    {
                      "id":1,
                      "image":"https://source.unsplash.com/user/jsnbrsc/1600x1000",
                      "title":'Ikeja-1',
                      "location":'Ikeja Lagos',
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":2,
                      "image":"https://source.unsplash.com/user/creatveight/1600x1000",
                      "title":'Ikeja-2',
                      "location":'Ikeja Lagos',
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":3,
                      "image":"https://source.unsplash.com/user/sidekix/1600x1000",
                      "title":'Yaba-1',
                      "location":'Yaba Lagos',
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":4,
                      "image":"https://source.unsplash.com/user/beccatapert/1600x1000",
                      "title":'Yaba-2',
                      "location":'Yaba Lagos',
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":5,
                      "image":"https://source.unsplash.com/user/im3rdmedia/1600x1000",
                      "title":'Ikorodu-1',
                      "location":'Ikorodu Lagos',
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":6,
                      "image":"https://source.unsplash.com/user/michaelwb/1600x1000",
                      "title":'Ikorodu-2',
                      "location":'Ikorodu Lagos',
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":7,
                      "image":"https://source.unsplash.com/user/aahubs/1600x1000",
                      "title":'Lekki-1',
                      "location":'Lekki Lagos',
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":8,
                      "image":"https://source.unsplash.com/user/carlg1979/1600x1000",
                      "title":'Lekki-2',
                      "location":'Lekki Lagos',
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":9,
                      "image":"https://images.unsplash.com/photo-1571179018088-2938f083f2ab?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
                      "title":'Ikoyi-1',
                      "location":'Ikoyi Lagos',
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":10,
                      "image":"https://images.unsplash.com/photo-1556185781-a47769abb7ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
                      "title":'Ikoyi-2',
                      "location":'Ikoyi Lagos',
                      "rating":4.5,
                      "fav":true
                    }

          ];
    return demo_kitchen.map((data)=> Kitchen.fromJson(data)).toList();
  }

}