
import 'package:easy_order/models/Models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

part 'page.dart';

class Details extends StatelessWidget {
   Product detail;
   Details({@required this.detail});
  final cartViewModel = locator<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel<CartViewModel>(
      model:cartViewModel,
      child:DetailsPage(detail:detail)),
    );
  }  
}