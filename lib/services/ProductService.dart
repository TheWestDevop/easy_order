import 'dart:io';



import 'package:easy_order/models/product.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:flutter/material.dart';



class ProductService extends ChangeNotifier {

API api;
Future<Product> getProduct() async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(null);
}

}
 

