



import 'package:easy_order/models/product.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:flutter/material.dart';



class ProductService extends ChangeNotifier {

API _api = new API();

List<Product> getProducts() {
    var demo_product = [
                    {
                      "id":1,
                      "image":"https://source.unsplash.com/user/erondu/1600x1000",
                      "description":"Food Item from Easy Order",
                      "title":'Rice',
                      "quantity":"1",
                      "price":350.0,
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":2,
                      "image":"https://source.unsplash.com/user/jackie/1600x1000",
                      "description":"Food Item from Easy Order",
                      "title":'Beans',
                      "quantity":"1",
                      "price":250.0,
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":3,
                      "image":"https://source.unsplash.com/user/jnnfrchn/1600x1000",
                      "description":"Food Item from Easy Order",
                      "title":'Maize',
                      "quantity":"1",
                      "price":350.0,
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":4,
                      "image":"https://source.unsplash.com/user/lefterisk/1600x1000",
                      "description":"Food Item from Easy Order",
                      "title":'Yam',
                      "quantity":'1',
                      "price":700.0,
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":5,
                      "image":"https://source.unsplash.com/user/saracervera/1600x1000",
                      "description":"Food Item from Easy Order",
                      "title":'Potato',
                      "quantity":'1',
                      "price":350.0,
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":6,
                      "image":"https://source.unsplash.com/user/naveed28/1600x1000",
                      "description":"Food Item from Easy Order",
                      "title":'Chicken',
                      "quantity":"1",
                      "price":350.0,
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":7,
                      "image":"https://source.unsplash.com/user/fryfamilyfoodco/1600x1000",
                      "description":"Food Item from Easy Order",
                      "title":'Fish',
                      "quantity":"1",
                      "price":350.0,
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":8,
                      "image":"https://source.unsplash.com/user/fryfamilyfoodco/1600x1000",
                      "description":"Food Item from Easy Order",
                      "title":'Beef',
                      "quantity":"1",
                      "price":350.0,
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":9,
                      "image":"https://source.unsplash.com/user/fryfamilyfoodco/1600x1000",
                      "description":"Food Item from Easy Order",
                      "title":'Garri',
                      "quantity":"1",
                      "price":350.0,
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":10,
                      "image":"https://source.unsplash.com/user/fryfamilyfoodco/1600x1000",
                      "description":"Food Item from Easy Order",
                      "title":'Tomato',
                      "quantity":"1",
                      "price":350.0,
                      "rating":4.5,
                      "fav":true
                    },
                    {
                      "id":11,
                      "image":"https://source.unsplash.com/user/fryfamilyfoodco/1600x1000",
                      "description":"Food Item from Easy Order",
                      "title":'Semo',
                      "quantity":"1",
                      "price":1050.0,
                      "rating":4.5,
                      "fav":true
                    },

];
    return demo_product.map((data)=> Product.fromJson(data)).toList();
}




ProductService(){
  this.getProducts();
}

}
 

