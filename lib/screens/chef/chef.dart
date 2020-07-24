import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';

part 'page.dart';

class Chefs extends StatelessWidget {
  ChefViewModel chef = locator<ChefViewModel>();
  AuthViewModel account = locator<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ChefViewModel>(model: chef, child: ChefsPage());
  }
}
