
import 'package:easy_order/models/models.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';


part  'page.dart';

class UserBookings extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ScopedModel<ChefViewModel>(
      model:locator<ChefViewModel>(),
      child:ScopedModel<CartViewModel>(
      model:locator<CartViewModel>(),
      child:ScopedModel<AccountViewModel>(
      model:locator<AccountViewModel>(),
      child:BookingPage()
      ))
      )
    );
  }  
}
