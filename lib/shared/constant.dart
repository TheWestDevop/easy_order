import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constant {
  Constant._();
  static DateTime toDate(String date) => (DateFormat('yyyy-MM-d')).parse(date);
  static dateToString(String date) =>
      DateFormat.yMMMMEEEEd().format(toDate(date));
  static const String MARKET_API_URL =
      'https://smor-market.herokuapp.com/api/v1';
  static const String USER_API_URL =
      "https://smor-user.herokuapp.com/api/v1/user";
  static const String CHEF_API_URL =
      "https://smor-chef.herokuapp.com/api/v1/user";
  static const String homelabel = "Home";
  static const String namePlaceholder = "Full Name";
  static const String phonePlaceholder = "Phone Number";
  static const String emailPlaceholder = "Email";
  static const String addressPlaceholder = "Delivery Address";
  static const String storePlaceholder = "Preferred Store";
  static const String passwordPlaceholder = "Password";
  static const String confirmPasswordPlaceholder = "Confirm Password";
  static const String passwordResetlabel = "Reset Password";
  static const String forgot_password = "Forgot Password ?";
  static const String loginBtn = "Login";
  static const String registerBtn = "Register";
  static const String loginWithPhoneBtn = "Use Phone Number";
  static const String newUserlabel = "New to Smorfarm?";
  static const String oldUserlabel = "Have an account on Smorfarm already?";
  static const String rememberPasswordlabel = "you have remembered password?";
  static const String registerLabel = "Register";
  static const String loginLabel = "Login";
  static const String logOutLabel = "Log out";
  static const String nextLabel = "Next";
  static const String goBackLabel = "Go Back To";
  static const String otpPlaceholder = "OTP Code";
  static const String sendOTPPlaceholder = "Confirm";
  static const String orderLabel = "Order Note";
  static const String deliveryLabel = "Delivery Details";
  static const String placeOrderBtn = "Place Order Now";
  static const String orderListPlaceholder = "Orders";
  static const String bookingListPlaceholder = "Chef Bookings";
  static const String avaliableProduct = " Market ";
  static const String productDetail = "Product Detail";
  static const String kitchenDetail = "Kitchen Detail";
  static const String cartItem = "Cart Items";
  static const String searchPlaceholder = "Search Product";
  static const String searchKitchenPlaceholder = "Search Kitchen";
  static const String searchChefPlaceholder = "Dish Interested";
  static const String searchChefNicknamePlaceholder = "Chef Nickname";
  static const String searchChefLabel = "Search chefs";
  static const String searchChefNickNameLabel = "Find chef by nickname";
  static const String searchChefNickNameLabel2 = "Find by nickname";
  static const String searchChefNickName = "Search chef";
  static const String noChefFound = "No Chef Found";

  static const String checkoutLabel = "Check Out";
  static const String verifyOTPLabel = "Verify";
  static const String kitchenLabel = "Kitchens ";
  static const String chefLabel = "Book A Chefs";
  static const String chefs = "Avaliable Chefs";

  static const String chefHeader =
      "Specify kind of dish you're interested in and your location";
  static const String chatLabel = "Messanger";
  static const String profileLabel = "Profile";
  static const Color primaryColor = Color(0xFF00C012);
  static Color getColor(String code) => Color(int.parse("0xFF$code"));
}
