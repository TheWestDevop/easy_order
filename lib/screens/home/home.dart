import 'package:easy_order/bloc/bloc.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



part  'home_page.dart';

class HomeLand extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeForm(),
    );
  }  
}
