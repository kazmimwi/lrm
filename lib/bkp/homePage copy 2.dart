import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        title: const Text('LesCalc'),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            bottom: 15.0, top: 15.0, left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            pading(),
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
              ],
            ),
            pading(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  child: Text('Person'),
                  color: Colors.teal,
                  shape: StadiumBorder(),
                  onPressed: () {
                    //TODO:
                    doSub();
                  },
                ),
                MaterialButton(
                  child: Text('Person'),
                  shape: StadiumBorder(),
                  color: Colors.teal,
                  onPressed: () {
                    //TODO:
                    doDiv();
                  },
                ),
              ],
            ),
            pading(),
            //Result
            Row(children: [
              Expanded(
                child: Text(
                  'K',
                  style: TextStyle(fontSize: 20.0, color: Colors.tealAccent),
                ),
              ),
            ]),

            dvdr(),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'K',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.tealAccent),
                      ),
                      subtitle: Text('$res'),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'K',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.tealAccent),
                      ),
                      subtitle: Text('$res'),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'K',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.tealAccent),
                      ),
                      subtitle: Text(
                        '$res',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                  ),
                ),
              ],
            ),
          ],
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
