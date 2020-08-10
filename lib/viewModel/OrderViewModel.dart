import 'dart:convert';

import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class OrderViewModel extends Model {
  final _orderService = locator<OrderService>();
  final Profile user = locator<AccountViewModel>().profile;
  // OrderViewModel(){
  //   this.getUserOrders(user.id, user.token);
  // }

  List<UserOrder> _user_order = [];

  Future<dynamic> placeOrder(Order data, String authToken) async {
    var verify = await _orderService.make_order(data, authToken);
    return verify;
  }

  Future<dynamic> verifyCoupon(String coupon, String authToken) async {
    var response = await _orderService.verifyCoupon(coupon, authToken);
    // print("auth response $response");
    notifyListeners();
    return response;
  }

  Future<dynamic> getUserOrders(uid, token) async {
    var response = await _orderService.getUserOrder(uid, token);
    // print("user orders response ==> ${response['data']}");
    if (response['status']) {
      _user_order.clear();
      List<dynamic> list = response['data'];
      _user_order = list.map((item) => UserOrder.fromJson(item)).toList();
      notifyListeners();
    }
    return response;
  }

  List<UserOrder> get orders => _user_order;
}
