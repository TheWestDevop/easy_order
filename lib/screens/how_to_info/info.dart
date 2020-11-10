import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_order/models/Models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/feather.dart';
import 'package:scoped_model/scoped_model.dart';

part 'page.dart';

class Recipe_Details extends StatelessWidget {
   Recipe detail;
   Recipe_Details({@required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel<CartViewModel>(
      model:locator<CartViewModel>(),
      child:ScopedModel<RecipeViewModel>(
      model:locator<RecipeViewModel>(),
      child:ScopedModel<AccountViewModel>(
      model:locator<AccountViewModel>(),
      child:RecipeDetailsPage(detail:detail))),
    ));
  }  
}