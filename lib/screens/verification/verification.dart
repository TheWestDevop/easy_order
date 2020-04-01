import 'package:easy_order/bloc/bloc.dart';
import 'package:easy_order/services/services.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_order/shared/shared.dart';


part  'verification_page.dart';

class Verification extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerificationForm(),
    );
  }  
}