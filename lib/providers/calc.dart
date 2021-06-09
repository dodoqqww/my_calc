import 'package:flutter/foundation.dart';
import 'package:my_calc/services/calculator_services.dart';
import 'package:my_calc/services/service_locator.dart';

class SimpleCalculatorProvider extends ChangeNotifier {
  String _value = "";

  CalculatorService _calculatorService = getIt<CalculatorService>();

  String get value => _value;

  Future<void> pushButton(String button) async {
    if (button == "calculate") {
      _value = await _calculatorService.getCalculatedValue(_value);
    } else if (button == "delete") {
      _value = _calculatorService.deleteAll();
    } else if (button == "back") {
      _value = _calculatorService.deleteBack(_value);
    } else {
      _value += button;
    }
    notifyListeners();
  }
}
