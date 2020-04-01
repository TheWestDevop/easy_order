
import 'package:easy_order/models/models.dart';
import 'package:flutter/material.dart';
import 'package:easy_order/screens/screen.dart';


class RouteGenerator { 
  


   static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/':
      return MaterialPageRoute(builder:(_) => HomeLand());
      break;
      case '/order':
      return MaterialPageRoute(builder:(_) => Orders());
      break;
      case '/place_order':
      return MaterialPageRoute(builder:(_) => Verification()); 
      break;
      case '/products':
      return MaterialPageRoute(builder:(_) => Products());
       break;
       case '/detail':
       final product = settings.arguments;
        if (product is Product) {
          return MaterialPageRoute(builder:(_) => Details(detail:product));
        } else {
        return MaterialPageRoute(builder:(_) => Error());
        }
      break;
      case '/cart':
       return MaterialPageRoute(builder:(_) => CartItem());
      break;
      default:
      return MaterialPageRoute(builder:(_) => Error());
    }
  }
  
}