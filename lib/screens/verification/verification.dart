import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easy_order/models/models.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:intl/intl.dart';

part 'verification_page.dart';

class Verification extends StatelessWidget {
  final cartViewModel = locator<CartViewModel>();
  final orderViewModel = locator<OrderViewModel>();
  final profileViewModel = locator<AccountViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel<CartViewModel>(
          model: cartViewModel, 
          child:ScopedModel<AccountViewModel>(
          model: profileViewModel, 
          child:  ScopedModel<OrderViewModel>(
          model: orderViewModel, 
          child:  VerificationForm()
      )
          )
      ),
    );
  }
}
