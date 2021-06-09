import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_calc/providers/calc.dart';

class SimpleCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Simple Calcualtor"),
          actions: [
            IconButton(
                tooltip: "Change calculator",
                icon: Icon(Icons.calculate),
                onPressed: () => print("now have to change"))
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          children: [
            _MyCalcValue(),
            _MyCalcButtons(),
          ],
        ),
      ),
    );
  }
}

class _MyCalcValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        //padding: EdgeInsets.all(10),
        child: Center(
            child: Text('${context.watch<SimpleCalculatorProvider>().value}')));
  }
}

class _MyCalcButtons extends StatelessWidget {
  final List<String> _buttons = [
    "1",
    "2",
    "3",
    "/",
    "4",
    "5",
    "6",
    "*",
    "7",
    "8",
    "9",
    "+",
    ".",
    "0",
    "-",
    "calculate",
    "back",
    "delete",
    "(",
    ")",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: _buttons.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return _calcButton(name: _buttons[index], context: context);
        });
  }

  Widget _calcButton({@required String name, @required BuildContext context}) {
    return TextButton(
        onPressed: () => {
              context.read<SimpleCalculatorProvider>().pushButton(name),
            },
        child: Text(name));
  }
}
