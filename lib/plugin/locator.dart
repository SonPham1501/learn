
import 'package:get_it/get_it.dart';
import 'package:learn/plugin/navigator.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => NavigationService());
}