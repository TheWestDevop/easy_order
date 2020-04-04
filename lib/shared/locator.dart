import 'package:easy_order/services/services.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;

void setupLocator() {
  // Register services
  locator.registerSingleton(ProductService());
  locator.registerLazySingleton(() => OrderService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => AccountService());
  locator.registerLazySingleton(() => Preference());


  // Register models
  locator.registerFactory(() => AppViewModel());
  locator.registerSingleton<ProductViewModel>(ProductViewModel());
  locator.registerLazySingleton(() => CartViewModel());
  locator.registerLazySingleton(() => AuthViewModel());
  locator.registerLazySingleton(() => AccountViewModel());
  


}