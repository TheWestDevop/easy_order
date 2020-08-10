import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';

class OrderService extends ChangeNotifier {
  AppState _status = AppState.Idle;
  String _message;
  Order _order;
  API _api = new API();


  String get message => _message;
  Order get order => _order;

  dynamic make_order(Order data,String authToken) async {
    
      String url = "${Constant.MARKET_API_URL}/make/order";
      final response = await _api.Post(url, data.toMap(),authToken);
      return response;
  }

  Future<dynamic> getUserOrder(String uId,String authToken) async {
    
      String url = "${Constant.MARKET_API_URL}/all/$uId/orders";
      final response = await _api.Get(url,authToken);
      return response;
  }
  dynamic verifyCoupon(String coupon,String authToken) async {
      var response = await _api.Get("${Constant.MARKET_API_URL}/coupon/use/$coupon",authToken);
      print(" coupon response --> $response");
      return response;
    }
}
