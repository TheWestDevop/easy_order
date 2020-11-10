
import 'package:easy_order/models/Models.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';


part  'order_page.dart';

class Orders extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ScopedModel<OrderViewModel>(
      model:locator<OrderViewModel>(),
      child:ScopedModel<CartViewModel>(
      model:locator<CartViewModel>(),
      child:ScopedModel<AccountViewModel>(
      model:locator<AccountViewModel>(),
      child:OrderPage()
      ))
      )
    );
  }  
}
