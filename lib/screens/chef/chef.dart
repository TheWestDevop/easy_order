import 'package:easy_order/models/Models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'package:easy_order/shared/shared.dart';
import 'package:scoped_model/scoped_model.dart';

part 'page.dart';

class SearchChef extends StatelessWidget {
  ChefViewModel chef = locator<ChefViewModel>();
  AccountViewModel account = locator<AccountViewModel>();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AccountViewModel>(
      model: account, 
      child: ScopedModel<ChefViewModel>(
      model: chef, 
      child: ChefsPage())
    );
  }
}
