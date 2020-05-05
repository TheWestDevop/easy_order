
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_order/screens/screen.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';

import 'package:flutter/material.dart';





part  'home_page.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   @override
   void initState() { 
    
     locator<CartViewModel>().fetchCartList();
     locator<AuthViewModel>().fetchLocalProfile();
     locator<KitchenViewModel>().removeKitchens();
     locator<KitchenViewModel>().insertKitchenToLocal();
     //locator<KitchenViewModel>().fetchKitchen();
    locator<ChefViewModel>().removeChefs();
    locator<ChefViewModel>().insertChefToLocal();
    locator<ChefViewModel>().fetchChef();
     super.initState();
     
   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: HomePage(),
    );
  }  


}
