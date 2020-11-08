import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcModel extends ChangeNotifier {
  String _theFunction = "";

  String get function => _theFunction;

  calculate() {
    Parser p = Parser();
    Expression exp = p.parse(_theFunction);
    _theFunction = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
  }

  deleteAll() {
    _theFunction = "";
  }

  deleteBack() {
    int _length = _theFunction.length;
    _theFunction = _theFunction.replaceRange(_length - 1, _length, "");
  }

  void pushButton(String button) {
    if (button == "calculate") {
      calculate();
    } else if (button == "delete") {
      deleteAll();
    } else if (button == "back") {
      deleteBack();
    } else {
      _theFunction += button;
    }
    notifyListeners();
  }
}
