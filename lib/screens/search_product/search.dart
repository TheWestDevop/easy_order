import 'package:easy_order/models/Models.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';


part  'page.dart';

class Search_Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return ScopedModel<ProductViewModel>(
      model:locator<ProductViewModel>(),
      child:ScopedModel<AccountViewModel>(
              model:locator<AccountViewModel>(),
              child:ScopedModel<CartViewModel>(
              model:locator<CartViewModel>(),
              child:SearchView()))
      );  
  }  
}
