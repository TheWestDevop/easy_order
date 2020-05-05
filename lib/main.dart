
import 'package:easy_order/screens/screen.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/state.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  deleteCache();
  setupLocator();
  runApp(MyApp());
}

deleteCache() async{
     final manager = new DefaultCacheManager();
     manager.emptyCache();
   }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final accountViewModel = locator<AccountViewModel>();
  final appViewModel = locator<AppViewModel>();
  final authViewModel = locator<AuthViewModel>();
  final cartViewModel = locator<CartViewModel>();
  final productViewModel = locator<ProductViewModel>();

 @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductViewModel>(
      model:productViewModel,
      child:ScopedModel<CartViewModel>(
              model:cartViewModel,
              child:ScopedModel<AuthViewModel>(
              model:authViewModel,
              child: ScopedModel<AppViewModel>(
              model:appViewModel,
              child:ScopedModel<AccountViewModel>(
              model:accountViewModel,
              child:ScopedModel<KitchenViewModel>(
              model:KitchenViewModel(),
              child: ScopedModel<ChefViewModel>(
              model:ChefViewModel(),
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Scaffold(
                    body: MainScreen()
                    ),
                  onGenerateRoute: RouteGenerator.generateRoute,
                  theme: ThemeData(
                      primaryColor: Colors.white
                  ),
        ),
      ),
      ),
      ),
      ),
      ),
        ),
    );
  
  }
}


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 Preference userpreference;
 
 @override
   void initState() { 
     userpreference = locator<Preference>();
     super.initState();
     
   }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
            future: userpreference.isUserLoggedIn,
             builder:(BuildContext context, AsyncSnapshot<bool> snapshot){
                    if (snapshot.data == false){
                              return SplashScreen.navigate(
                                        name: 'assets/icon/loader.flr',
                                        next: (context) =>Login(),
                                        until: () => Future.delayed(Duration(seconds: 3)),
                                        startAnimation: 'load',
                                      );
              }
                      else{
                        return SplashScreen.navigate(
                                                name: 'assets/icon/loader.flr',
                                                next: (context) =>MainViewState(),
                                                until: () => Future.delayed(Duration(seconds: 3)),
                                                startAnimation: 'load',
                                              );
                      }
             });
  }


   
}






