import 'package:flutter/material.dart';
import 'package:landareacalculator/db.dart';
import 'package:hive/hive.dart';
// import 'db.dart';

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
          height: 200,
          child: appbarwid(res: this.res),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            bottom: 15.0, top: 15.0, left: 10.0, right: 10.0),
        child: Expanded(
          // main column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // text fields row
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                decoration: BoxDecoration(
                  border: const Border(
                    top: BorderSide(
                        color: Colors.white, style: BorderStyle.solid),
                  ),
                ),
                child: Row(
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
              ),
              pading(),
              // buttons and db section
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // buttons section
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            BtnWidget(
                              onPressed: doAddition,
                              btntxt: "Add",
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
                            Expanded(child: Text(""))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (_, index) {
                              final currentItem = index;
                              return ListTile(
                                title: Text(index.toString()),
                                subtitle: Text(index.toString()),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Edit button
                                    IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {}),
                                    // Delete button
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              pading(),
            ],
          ),
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
          // color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              // result titles
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Text(
                            "Kanal",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ))),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Text(
                            "Marla",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ))),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Text(
                            "Sq/Foot",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ))),
                ],
              ),
            ),
            Expanded(
              // result figures
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  resltmethod(res),
                  resltmethod(res),
                  resltmethod(
                    res,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded resltmethod(double resltvalues) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FittedBox(
          child: Center(
            child: Text(
              "$res",
              // style: TextStyle(fontSize: 20.0, color: Colors.tealAccent),
              style: TextStyle(fontSize: 58),
              softWrap: false,
              overflow: TextOverflow.ellipsis,
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
    return Container(
      margin: EdgeInsets.all(2),
      child: OutlinedButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        child:
            Text(btntxt, style: TextStyle(fontSize: 20, color: Colors.white)),
        onPressed: () {
          onPressed();
        },
      ),
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
