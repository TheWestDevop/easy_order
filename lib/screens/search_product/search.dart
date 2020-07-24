import 'package:easy_order/models/models.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';


part  'page.dart';

class Search_Product extends StatelessWidget {
  final productViewModel = locator<ProductViewModel>();
  final accountViewModel = locator<AccountViewModel>();
  final cartViewModel = locator<CartViewModel>();



  @override
  Widget build(BuildContext context) {
      return ScopedModel<ProductViewModel>(
      model:productViewModel,
      child:ScopedModel<AccountViewModel>(
              model:accountViewModel,
              child:ScopedModel<CartViewModel>(
              model:cartViewModel,
              child:SearchView()))
      );  
  }  
}
