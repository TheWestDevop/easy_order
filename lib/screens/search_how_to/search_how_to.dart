import 'package:easy_order/models/Models.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';


part  'page.dart';

class Search_Recipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return ScopedModel<RecipeViewModel>(
      model:locator<RecipeViewModel>(),
      child:ScopedModel<CartViewModel>(
              model:locator<CartViewModel>(),
              child:SearchRecipes())
      );  
  }  
}
