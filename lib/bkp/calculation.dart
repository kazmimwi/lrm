import 'package:flutter/material.dart';

class CalculationMethod extends StatefulWidget {
  @override
  _CalculationMethodState createState() => _CalculationMethodState();
}

class _CalculationMethodState extends State<CalculationMethod> {
  double num1 = 0, num2 = 0, res = 0; //res = Result...................

  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');

  doAddition() {
    setState(() {
      num2 = double.parse(t2.text);
      num1 = double.parse(t1.text);
      res = num1 + num2;
    });
  }

  doSub() {
    setState(() {
      num2 = double.parse(t2.text);
      num1 = double.parse(t1.text);
      res = num1 - num2;
    });
  }

  doMul() {
    setState(() {
      num2 = double.parse(t2.text);
      num1 = double.parse(t1.text);
      res = num1 * num2;
    });
  }

  doDiv() {
    setState(() {
      num2 = double.parse(t2.text);
      num1 = double.parse(t1.text);
      res = (num1 / num2);
    });
  }

  doClear() {
    setState(() {
      t1 = TextEditingController(text: '');
      t2 = TextEditingController(text: '');
      res = 0;
    });
  }

  doDecimal() {
    setState(() {
      // ignore: todo
      //TODO:..............................
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
