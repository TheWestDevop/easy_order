import 'dart:io';

import 'package:easy_order/models/Models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductViewModel extends Model {
  ProductService _productService = locator<ProductService>();
  List<Category> _categories = [];
  List<Product> _available_products = [];
  List<UpcomingProduct> _unavailable_products = [];
  List<Product> _category_products = [];

  ProductViewModel() {
    // Create DB Instance & Create Table
  }

  Future<dynamic> getAvailableProducts(token) async {
    var response = await _productService.getAvaliableProducts(token);
    // print("user orders response ==> ${response['data']}");
    if (response['status']) {
      _available_products.clear();
      List<dynamic> list = response['data'];
      _available_products = list.map((item) => Product.fromJson(item)).toList();
      notifyListeners();
    }
    return response;
  }

  Future<dynamic> getUnavailableProducts(token) async {
    var response = await _productService.getUnavaliableProducts(token);
    // print("user orders response ==> ${response['data']}");
    if (response['status']) {
      _unavailable_products.clear();
      List<dynamic> list = response['data'];
      _unavailable_products =
          list.map((item) => UpcomingProduct.fromJson(item)).toList();
      notifyListeners();
    }
    return response;
  }

  Future<dynamic> getCategories(token) async {
    var response = await _productService.getCategories(token);
    //  print("user orders response ==> ${response['data']}");
    if (response['status']) {
      _categories.clear();
      List<dynamic> list = response['data'];
      _categories = list.map((item) => Category.fromJson(item)).toList();
      notifyListeners();
    }
    return response;
  }

  Future<dynamic> getProductsCategory(cid, token) async {
    var response = await _productService.getProductsByCategory(cid, token);
    // print("user orders response ==> ${response['data']}");
    if (response['status']) {
      _category_products.clear();
      List<dynamic> list = response['data'];
      _category_products = list.map((item) => Product.fromJson(item)).toList();
      notifyListeners();
    }
    return response;
  }

  List<Product> get demo_products => _productService.getProducts();
  List<UpcomingProduct> get demo_upcoming_products => _productService.getUpcomingProducts();

  List<Product> get available_products => _available_products;
  List<UpcomingProduct> get unavailable_products => _unavailable_products;
  List<Product> get category_products => _category_products;
  List<Category> get categories => _categories;
}
