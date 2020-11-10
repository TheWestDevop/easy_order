
import 'package:easy_order/models/Models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';


part  'page.dart';

class Products extends StatelessWidget {
  final productViewModel = locator<ProductViewModel>();

  @override
  Widget build(BuildContext context) {
      return ScopedModel<ProductViewModel>(
      model:productViewModel,
      child:ProductView()
      );  
  }  
}
