import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';

class OrderService extends ChangeNotifier {
  AppState _status = AppState.Idle;
  String _message;
  Order _order;
  API _api;

  OrderService() {
    //_status = AppState.Idle;
  }

  String get message => _message;
  Order get order => _order;

  Future<String> make_order(Order data) async {
    try {
      String url = "${Constant.MARKET_API_URL}/make/order";
      final response = await _api.Post(url, data);
      return response;
    } catch (e) {
      print(e.toString());
      _message = "Order Not Placed";
      return e;
    }
  }

  Future<String> get_all_user_order(String uId) async {
    
      String url = "${Constant.MARKET_API_URL}/all/$uId/orders";
      final response = await _api.Get(url);
      return response;
  }
  dynamic verifyCoupon(String coupon) async {
      var response = await _api.Get("${Constant.MARKET_API_URL}/coupon/use/$coupon");
      print(" coupon response --> $response");
      return response;
    }
}
