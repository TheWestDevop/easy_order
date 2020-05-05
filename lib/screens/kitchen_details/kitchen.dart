
import 'dart:async';

import 'package:easy_order/models/models.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

part 'page.dart';

class Kitchen_Details extends StatelessWidget {
   Kitchen detail;
   Kitchen_Details({@required this.detail});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KitchenDetailsPage(detail:detail),
    );
  }  
}