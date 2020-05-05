
import 'package:easy_order/models/models.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_order/screens/screen.dart';


class RouteGenerator { 
   static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/home':
      return MaterialPageRoute(builder:(_) => Home());
      break;
      case '/orders':
      return MaterialPageRoute(builder:(_) => Orders());
      case '/kitchens':
      return MaterialPageRoute(builder:(_) => Kitchens());
      case '/chefs':
      return MaterialPageRoute(builder:(_) => Chefs());
      case '/chats':
      return MaterialPageRoute(builder:(_) => Chat());
      break;
      case '/place_order':
      return MaterialPageRoute(builder:(_) => Verification());
      break;
      case '/products':
      return MaterialPageRoute(builder:(_) => Products());
       break;
       case '/detail':
       final details = settings.arguments;
        if (details is Product) {
          return MaterialPageRoute(builder:(_) => Details(detail:details));
        }else if(details is Kitchen){
          return MaterialPageRoute(builder:(_) => Kitchen_Details(detail:details));
        } else {
        return MaterialPageRoute(builder:(_) => Error());
        }
      break;
      case '/cart':
      return MaterialPageRoute(builder:(_) => CartItem());
      break;
      case '/profile':
       return MaterialPageRoute(builder:(_) => UserProfile());
      break;
      case '/login':
       return MaterialPageRoute(builder:(_) =>Scaffold(
         body:SplashScreen.navigate(
        name: 'assets/icon/loader.flr',
        next: (context) =>  Login(),
        until: () => Future.delayed(Duration(seconds: 3)),
        startAnimation: 'load',
      )));
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