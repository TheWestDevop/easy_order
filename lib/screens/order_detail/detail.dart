import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

part 'page.dart';

class Order_Details extends StatelessWidget {
   UserOrder detail;
   Order_Details({@required this.detail});
  final orderViewModel = locator<OrderViewModel>();
  final cartViewModel = locator<CartViewModel>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel<CartViewModel>(
      model:cartViewModel,
      child:ScopedModel<OrderViewModel>(
      model:orderViewModel,
      child:OrderDetailsPage(detail:detail)),
    ));
  }  
}