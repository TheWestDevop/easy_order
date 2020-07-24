import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class OrderViewModel extends Model {
  final _orderService = locator<OrderService>();

  Future<dynamic> placeOrder(Order data) async {
    final verify = _orderService.make_order(data);
    await ToastOn("Hello your order $verify", Colors.green, Colors.white, 20.0);
  }

  Future<dynamic> verifyCoupon(String coupon) async {
    var response = await _orderService.verifyCoupon(coupon);
    // print("auth response $response");
    notifyListeners();
    return response;
  }

  error() {
    ToastOn("Fill the Neccesary field", Colors.orange, Colors.white, 20.0);
  }
}
