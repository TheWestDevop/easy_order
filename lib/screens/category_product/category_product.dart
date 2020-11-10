import 'package:easy_order/models/Models.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';

part 'page.dart';

class ProductCategory extends StatelessWidget {
  final int category;
  final String category_title;


  const ProductCategory({Key key, @required this.category, @required this.category_title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScopedModel<ProductViewModel>(
            model: locator<ProductViewModel>(),
            child: ScopedModel<CartViewModel>(
                model: locator<CartViewModel>(),
                child: ScopedModel<AccountViewModel>(
                    model: locator<AccountViewModel>(),
                    child: ProductCategoryPage(category: category,category_title: category_title,)))));
  }
}
