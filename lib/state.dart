

import 'dart:async';

import 'package:easy_order/screens/screen.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class MainViewState extends StatefulWidget {
  MainViewState({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainViewState> {

  AppViewModel appViewModel; 
  StreamSubscription<AppState> appState;
  AppState viewState;
  
   @override
   void initState() { 
     
     appViewModel = locator<AppViewModel>();
     locator<CartViewModel>().fetchCartList();
     locator<AuthViewModel>().fetchLocalProfile();
     locator<KitchenViewModel>().removeKitchens();
     locator<KitchenViewModel>().insertKitchenToLocal();
     //locator<KitchenViewModel>().fetchKitchen();
    locator<ChefViewModel>().removeChefs();
    locator<ChefViewModel>().insertChefToLocal();
    locator<ChefViewModel>().fetchChef();
     setState(() {
       appState = appViewModel.state.listen((state)=>{
       viewState = state
     });
     });
     super.initState();
     
   }
   
   @override
   void dispose(){
     appState.cancel();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ScopedModelDescendant<AppViewModel>(
    builder: (context,child,model){
    return  getUI(model.status);
    }
    )
    );
  }
}

Widget getUI(AppState state){
    if (state == AppState.Idle || state == AppState.Busy) {
      return  LoadingIndicator();
    } else if (state == AppState.Authenticated || state == AppState.Retrieved) {
      return  Home();
    } else if (state == AppState.UnAuthenticated) {
      return  Login();
    }else if (state == AppState.Error || state == null) {
    return  Error();
    }

}

