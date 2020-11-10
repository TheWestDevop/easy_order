import 'package:easy_order/models/Models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

part 'page.dart';

class Booking_Details extends StatelessWidget {
   Booking detail;
   Booking_Details({@required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel<CartViewModel>(
      model:locator<CartViewModel>(),
      child:ScopedModel<ChefViewModel>(
      model:locator<ChefViewModel>(),
      child:BookingDetailsPage(detail:detail)),
    ));
  }  
}