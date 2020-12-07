import 'package:get_it/get_it.dart';
import 'package:newsapp/viewmodels/validateLogin.dart';

GetIt locator = GetIt.instance();
void setupLocator() {
  locator.registerLazySingleton(() => ValidateLoginModel());
}
