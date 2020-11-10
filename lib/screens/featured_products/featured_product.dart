
import 'package:easy_order/models/Models.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';


part  'page.dart';

class FeaturedProducts extends StatelessWidget {
  final List<Product> products;
  final String title;
  
  const FeaturedProducts({Key key, @required this.products, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return ScopedModel<ProductViewModel>(
      model:locator<ProductViewModel>(),
      child:ScopedModel<CartViewModel>(
      model:locator<CartViewModel>(),
      child:FeaturedProductView(products:products,title:title,))
      );  
  }  
}
