import 'package:flutter/material.dart';
import 'package:landareacalculator/db.dart';
import 'package:hive/hive.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text('LesCalc'),
      // ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
          ]),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: appbarwid(res: this.res),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            bottom: 15.0, top: 15.0, left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // pading(),
            // Expanded(child: HomePage()),
            // Text Fiels
            Row(
              children: [
                Expanded(
                  child: txtland(
                    t1: t1,
                    lbl: "K",
                    hnttxt: "Kanal",
                  ),

                  //The Text field for the second number
                ),
                Expanded(
                  child: txtland(
                    t1: t2,
                    lbl: "M",
                    hnttxt: "Marla",
                  ),

                  //The Text field for the second number
                ),
                Expanded(
                  child: txtland(
                    t1: t2,
                    lbl: "Sq/F",
                    hnttxt: "Squre Foot",
                  ),

                  //The Text field for the second number
                )
              ],
            ),
            pading(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BtnWidget(
                  onPressed: doAddition,
                  btntxt: "add",
                ),
                BtnWidget(
                  onPressed: doClear,
                  btntxt: "Subtract",
                ),
                BtnWidget(
                  onPressed: doClear,
                  btntxt: "Person",
                ),
                BtnWidget(
                  onPressed: doClear,
                  btntxt: "Person",
                ),
              ],
            ),
            pading(),
          ],
        ),
      ),
    );
  }
}

class appbarwid extends StatelessWidget {
  appbarwid({required this.res});
  double res;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.navigate_before,
              size: 40,
              color: Colors.white,
            ),
            resltmethod(res, "K"),
            resltmethod(res, "M"),
            resltmethod(res, "Sq/F"),
          ],
        ),
      ),
    );
  }

  Expanded resltmethod(double resltvalues, String lble) {
    return Expanded(
      child: Card(
        child: ListTile(
          title: Center(
            child: Text(
              "$lble = $res",
              style: TextStyle(fontSize: 20.0, color: Colors.tealAccent),
            ),
          ),
        ),
      ),
    );
  }
}

class BtnWidget extends StatelessWidget {
  BtnWidget({
    Key? key,
    required this.onPressed,
    this.btntxt,
  }) : super(key: key);
  final Function onPressed;
  final btntxt;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(btntxt),
      shape: StadiumBorder(),
      color: Colors.teal,
      onPressed: () {
        onPressed();
      },
    );
  }
}

class dvdr extends StatelessWidget {
  const dvdr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 5,
      color: Colors.black,
    );
  }
}

class pading extends StatelessWidget {
  const pading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
    );
  }
}

class txtland extends StatelessWidget {
  const txtland({
    Key? key,
    required this.t1,
    this.lbl,
    this.hnttxt,
  }) : super(key: key);

  final TextEditingController t1;
  final lbl;
  final hnttxt;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      cursorColor: Colors.tealAccent,
      controller: t1,
      decoration: InputDecoration(
        labelText: lbl,
        fillColor: Colors.white,
        hintText: hnttxt,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}
