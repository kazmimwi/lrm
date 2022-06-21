import 'package:flutter/material.dart';
import 'package:landareacalculator/db.dart';
import 'package:hive/hive.dart';
// import 'db.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key}) : super(key: key);
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double num1 = 0, num2 = 0, res = 0; //res = Result...................
  List<Map<String, dynamic>> _items = [];
  double TKanal = 0, TMarla = 0.0, TSqfoot = 0;
  final _shoppingBox = Hive.box('shopping_box');

  @override
  void initState() {
    super.initState();
    _refreshItems();
    // _count(); // Load data when app starts
  }

  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');
  // hivebox

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
          child: appbarwid(
            tkanal: TKanal,
            tmarla: TMarla,
            tsqfoot: TSqfoot,
          ),
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
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BtnWidget(
                          onPressed: doAddition,
                          btntxt: "Add",
                        ),
                        BtnWidget(
                          onPressed: doClear,
                          btntxt: "Update",
                        ),
                        BtnWidget(
                          onPressed: doClear,
                          btntxt: "Person",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BtnWidget(
                          onPressed: () {
                            _createItem({"name": t1.text, "quantity": t2.text});
                          },
                          btntxt: "Reset",
                        ),
                        BtnWidget(
                          onPressed: () {
                            _createItem({"name": t1.text, "quantity": t2.text});
                          },
                          btntxt: "Setting",
                        ),
                        BtnWidget(
                          onPressed: () {
                            _createItem({"name": t1.text, "quantity": t2.text});
                          },
                          btntxt: "Dbstore",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // List of items
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // buttons section

                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: _items.isEmpty
                            ? Expanded(
                                child: const Center(
                                  child: Text(
                                    'No Data',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: _items.length,
                                itemBuilder: (_, index) {
                                  final currentItem = _items[index];
                                  return ListTile(
                                    title: Row(
                                      children: [
                                        Text("${_items.length - index} : "),
                                        Text(
                                            "- ${currentItem['name']} - ${currentItem['quantity']} - ${currentItem['quantity']} "),
                                      ],
                                    ),
                                    // subtitle: Text(
                                    //     currentItem['quantity'].toString()),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Edit button
                                        IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () =>
                                                _showForm(currentItem['key'])),
                                        // Delete button
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () =>
                                              _deleteItem(currentItem['key']),
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

// db classes
  void _showForm(int? itemKey) async {
    // itemKey == null -> create new item
    // itemKey != null -> update an existing item

    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemKey);
      t1.text = existingItem['name'];
      t2.text = existingItem['quantity'];
    }
    if (itemKey == null) {
      _createItem({"name": t1.text, "quantity": t2.text});
    }

    // update an existing item
    if (itemKey != null) {
      _updateItem(
          itemKey, {'name': t1.text.trim(), 'quantity': t2.text.trim()});
    }

    // // Clear the text fields
    // t1.text = '';
    // t2.text = '';
  }

  // Get all items from the database
  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final value = _shoppingBox.get(key);
      return {"key": key, "name": value["name"], "quantity": value['quantity']};
    }).toList();
    TKanal = 0;
    for (var i = 0; i < data.length; i++) {
      TKanal += double.parse(data[i]['quantity']);
    }
    setState(() {
      _items = data.reversed.toList();
      TKanal;
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  // Create new item
  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _shoppingBox.add(newItem);
    _refreshItems(); // update the UI
  }

  // Retrieve a single item from the database by using its key
  // Our app won't use this function but I put it here for your reference
  Map<String, dynamic> _readItem(int key) {
    final item = _shoppingBox.get(key);
    return item;
  }

  // Update a single item
  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    await _shoppingBox.put(itemKey, item);
    _refreshItems(); // Update the UI
  }

  // Delete a single item
  Future<void> _deleteItem(int itemKey) async {
    await _shoppingBox.delete(itemKey);
    _refreshItems(); // update the UI

    // Display a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }
}

class appbarwid extends StatelessWidget {
  appbarwid(
      {required this.tkanal, required this.tmarla, required this.tsqfoot});
  double tkanal, tmarla, tsqfoot;
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
                  resltmethod(tkanal),
                  resltmethod(tmarla),
                  resltmethod(
                    tsqfoot,
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
              "$resltvalues",
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
