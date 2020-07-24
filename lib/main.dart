import 'package:easy_order/screens/screen.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  deleteCache();
  setupLocator();
  
  bool isUserIn = await locator<Preference>().isUserLoggedIn;
  if (isUserIn == true) {
    locator<AccountViewModel>().getCacheProfile(); 
    locator<CartViewModel>().fetchCartList();
  }
  runApp(MyApp());
}

deleteCache() async {
  final manager = new DefaultCacheManager();
  manager.emptyCache();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:FutureBuilder<bool>(
        future: locator<Preference>().isUserLoggedIn,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          // print("isUserLoggedIn --> ${snapshot.data}");
          // print("user from account model :- $user");
          if (snapshot.data == false || snapshot.data == null) {
            return SplashScreen.navigate(
              name: 'assets/icon/loader.flr',
              next: (context) => Login(),
              until: () => Future.delayed(Duration(seconds: 3)),
              startAnimation: 'load',
            );
          } else {
            return SplashScreen.navigate(
              name: 'assets/icon/loader.flr',
              next: (context) => Home(user: locator<AccountViewModel>().profile,),
              until: () => Future.delayed(Duration(seconds: 3)),
              startAnimation: 'load',
            );
          }
        })
        ),
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}
