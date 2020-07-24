import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;

void setupLocator() {
  // Register services
  locator.registerFactory(() => Preference());
  locator.registerSingleton<ProductService>(ProductService());
   locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => AccountService());
  locator.registerLazySingleton(() => KitchenService());
  locator.registerLazySingleton(() => ChefService());
  locator.registerLazySingleton(() => OrderService());
 
  


  // Register models
  locator.registerFactory(() => AppViewModel());
  locator.registerSingleton<CartViewModel>(CartViewModel());
  locator.registerLazySingleton(() => AccountViewModel());
  locator.registerLazySingleton(() =>ProductViewModel());
  locator.registerLazySingleton(() => OrderViewModel());
  locator.registerLazySingleton(() => AuthViewModel());
   locator.registerLazySingleton(() => KitchenViewModel());
  locator.registerLazySingleton(() => ChefViewModel());


}