
import 'package:easy_order/models/models.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_order/screens/screen.dart';


class RouteGenerator { 
   static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/home':
       Profile user = settings.arguments;
      return MaterialPageRoute(builder:(_) => Home(user:user,));
      break;
      case '/orders':
      return MaterialPageRoute(builder:(_) => Orders());
      case '/bookings':
      return MaterialPageRoute(builder:(_) => UserBookings());
      case '/kitchens':
      return MaterialPageRoute(builder:(_) => Kitchens());
      case '/chefs':
      return MaterialPageRoute(builder:(_) => SearchChef());
      case '/search/chef/nickname':
      return MaterialPageRoute(builder:(_) => SearchChefNickName());
      case '/avaliable/chefs':
       List<Chef> chefs = settings.arguments;
       return MaterialPageRoute(builder:(_) => ListChefs(chefs:chefs));
      break;
      case '/chats':
      return MaterialPageRoute(builder:(_) => Chat());
      break;
      case '/place_order':
      return MaterialPageRoute(builder:(_) => Verification());
      break;
      case '/products':
      return MaterialPageRoute(builder:(_) => Products());
      break;
      case '/search':
      return MaterialPageRoute(builder:(_) => Search_Product());
      break;
      case '/detail':
       Product details = settings.arguments;
       return MaterialPageRoute(builder:(_) => Details(detail:details));
      break;
      case '/order/detail':
       UserOrder detail = settings.arguments;
       return MaterialPageRoute(builder:(_) => Order_Details(detail:detail));
      break;
      case '/cart':
      return MaterialPageRoute(builder:(_) => CartItem());
      break;
      case '/profile':
       return MaterialPageRoute(builder:(_) => UserProfile());
      break;
      case '/login':
       return MaterialPageRoute(builder:(_) => Login());
      break;
      case '/register':
       return MaterialPageRoute(builder:(_) => Register());
      break;
      case '/phone':
      return MaterialPageRoute(builder:(_) => Phone());
      break;
      case '/otp':
      return MaterialPageRoute(builder:(_) => OTP());
      break;
      case '/forgot':
      return MaterialPageRoute(builder:(_) => Forgot());
      break;
      default:
      return MaterialPageRoute(builder:(_) => Error());
    }
  }
}