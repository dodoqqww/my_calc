import 'package:get_it/get_it.dart';
import 'package:my_calc/services/calculator_services.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<CalculatorService>(
      () => SimpleCalculatorService());
}
