import 'package:easy_order/services/services.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  // Register services
  locator.registerLazySingleton<ProductService>(() => ProductService());

  // Register models
  locator.registerFactory<CartViewModel>(() => CartViewModel());
}