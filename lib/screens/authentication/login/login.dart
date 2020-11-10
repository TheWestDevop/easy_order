





import 'package:easy_order/models/Models.dart';
import 'package:easy_order/screens/screen.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

part 'page.dart';

class Login extends StatelessWidget {
  final authtViewModel = locator<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel<AuthViewModel>(
              model:authtViewModel,
              child:LoginForm()
              )
    );
  }  
}