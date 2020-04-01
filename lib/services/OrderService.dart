import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';


class OrderServices extends ChangeNotifier {

  AppState  _status = AppState.Idle;
  String _message;
  Order _order;
  API api;

  OrderServices.instance() {
    _status = AppState.Idle;
  }
  


  AppState get status => _status;
  String  get message => _message;
  Order  get  order  =>  _order;


   void setStatus(AppState state) {
        _status = state;
       }
     

  Future<String> make_order(Order data) async {
    try {
      _status = AppState.Busy;
      notifyListeners();
      String url = "${Constant.API_URL}order";
      final response = await api.Put(url:url,data:data);
     _status = AppState.Retrieved;
     notifyListeners();
     return jsonDecode(response.body['message']);

    } catch (e) {
      _status = AppState.Error;
       print(e.toString());
      _message = "Order Not Placed";
       notifyListeners();
      return Future.value("Order Not Placed");
    }
    
  }

  Future<String> check_status(String orderId) async {
    try {
      _status = AppState.Busy;
      notifyListeners();
      final data = {"order_id":orderId};
      String url = "${Constant.API_URL}order/status";
      final response = await api.Post(url:url,data:data);
      _status = AppState.Retrieved;
      notifyListeners();
      return jsonDecode(response.body['message']);
    } catch (e) {
       _status = AppState.Error;
       print(e.toString());
      _message = "Order Not Processed";
       notifyListeners();
      return Future.value("Order Not Processed");
    }
  }

  




 
}