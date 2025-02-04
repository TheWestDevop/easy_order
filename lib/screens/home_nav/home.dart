import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_order/models/Models.dart';
import 'package:easy_order/screens/screen.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

part 'page.dart';

class Home extends StatefulWidget {
  final Profile user;

  const Home({Key key, this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
    locator<CartViewModel>().fetchCartList();
    super.initState();
    // print("user object ====> ${widget.user.toMap()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel<AccountViewModel>(
          model: locator<AccountViewModel>(),
          child: ScopedModel<CartViewModel>(
              model: locator<CartViewModel>(),
              child: ScopedModel<ProductViewModel>(
                  model: locator<ProductViewModel>(), 
                      child: HomePage(widget.user)
                      )
                    )
                  ),
    );
  }
}
