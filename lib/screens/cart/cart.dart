
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';



part  'page.dart';

class CartItem extends StatelessWidget {
  final cartViewModel = locator<CartViewModel>();
  final orderViewModel = locator<OrderViewModel>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel<CartViewModel>(
      model:cartViewModel,
      child:ScopedModel<OrderViewModel>(
      model:orderViewModel,
      child:CartPage())),
    );
  }  
}
