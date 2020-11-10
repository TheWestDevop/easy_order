import 'package:easy_order/models/Models.dart';
import 'package:flutter/material.dart';
import 'package:easy_order/screens/screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        var user = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => Home(
                  user: user,
                ));
        break;
      case '/orders':
        return MaterialPageRoute(builder: (_) => Orders());
        break;
      case '/bookings':
        return MaterialPageRoute(builder: (_) => UserBookings());
        break;
      case '/posts':
        return MaterialPageRoute(builder: (_) => Posts());
        break;
      case '/search/posts':
        return MaterialPageRoute(builder: (_) => Search_Recipes());
        break;
      case '/kitchens':
        return MaterialPageRoute(builder: (_) => Kitchens());
        break;
      case '/chefs':
        return MaterialPageRoute(builder: (_) => SearchChef());
        break;
      case '/search/chef/nickname':
        return MaterialPageRoute(builder: (_) => SearchChefNickName());
        break;
      case '/avaliable/chefs':
        List<Chef> chefs = settings.arguments;
        return MaterialPageRoute(builder: (_) => ListChefs(chefs: chefs));
        break;
      case '/chats':
        return MaterialPageRoute(builder: (_) => Chat());
        break;
      case '/place_order':
        return MaterialPageRoute(builder: (_) => Verification());
        break;
      case '/products':
        return MaterialPageRoute(builder: (_) => Products());
        break;
      case '/search/product':
        return MaterialPageRoute(builder: (_) => Search_Product());
        break;
      case '/featured/product':
        List details = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => FeaturedProducts(
                  products: details[0],
                  title: details[1],
                ));
        break;
      case '/upcoming/product':
        List details = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => UpcomingProducts(
                  products: details[0],
                  title: details[1],
                ));
        break;
      case '/product/category':
        List category = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => ProductCategory(
                  category: category[0],
                  category_title: category[1],
                ));
        break;
      case '/detail':
        Product details = settings.arguments;
        return MaterialPageRoute(builder: (_) => Details(detail: details));
        break;
      case '/order/detail':
        UserOrder detail = settings.arguments;
        return MaterialPageRoute(builder: (_) => Order_Details(detail: detail));
        break;
      case '/booking/detail':
        Booking detail = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => Booking_Details(detail: detail));
        break;
      case '/post/detail':
        Recipe detail = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => Recipe_Details(detail: detail));
        break;
      case '/cart':
        return MaterialPageRoute(builder: (_) => CartItem());
        break;
      case '/profile':
        return MaterialPageRoute(builder: (_) => UserProfile());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
        break;
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
        break;
      // case '/phone':
      // return MaterialPageRoute(builder:(_) => Phone());
      // break;
      // case '/otp':
      // return MaterialPageRoute(builder:(_) => OTP());
      // break;
      case '/forgot':
        return MaterialPageRoute(builder: (_) => Forgot());
        break;
      default:
        return MaterialPageRoute(builder: (_) => Error());
    }
  }
}
