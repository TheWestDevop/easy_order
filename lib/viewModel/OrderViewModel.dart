
import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:flutter/material.dart';

class OrderViewModel extends ChangeNotifier {

  OrderServices _order;
  // Profile profile;
  // Transactions transactions;

place_order(Order data) async {
     _order.setStatus(AppState.Busy);
    final verify = _order.make_order(data);
   
    // if (verify != null) {
     
    // } else {
    // }
  await ToastOn("Hello your order $verify", Colors.green, Colors.white, 20.0);
}
error(){
  ToastOn("Fill the Neccesary field", Colors.orange, Colors.white, 20.0);
}
}