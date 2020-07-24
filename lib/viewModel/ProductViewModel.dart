import 'dart:io';

import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductViewModel extends Model {
  ProductService _productService = locator<ProductService>();

  ProductViewModel() {
    // Create DB Instance & Create Table
  }

  

  List<Product> get products => _productService.getProducts();
}
