
import 'package:easy_order/screens/screen.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  CartViewModel cartViewModel = CartViewModel();
 @override
  Widget build(BuildContext context) {
    return ScopedModel<CartViewModel>(
      model: cartViewModel,
      child: MaterialApp(
        home: _getBodyUi(cartViewModel.status),
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
            primaryColor: Colors.white
        ),
      ),
    );
  
  }
}

Widget _getBodyUi(AppState state) {
  switch (state) {
    case AppState.Busy:
      return CircularProgressIndicator();
    case AppState.Retrieved:
    return HomeLand();
    case AppState.Error:
    return Error();
    
    default:
      return Error();
  }
}


class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(),
      );
}



