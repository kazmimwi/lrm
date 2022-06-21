import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:landareacalculator/conststring/texts.dart';
import '../widgets/appbar.dart';
import '../widgets/btnwidget.dart';
import '../widgets/texfild.dart';
import '../widgets/resulttexfild.dart';
// import 'db.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  //double num1 = 0, num2 = 0, res = 0; //res = Result...................
  List<Map<String, dynamic>> _items = [];
  int TKanal = 0, TMarla = 0, TSqfoot = 0;
  final _raqbaBox = Hive.box('raqba_box');
  int? existingkey;
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  @override
  void initState() {
    focusNode1;
    focusNode2;
    focusNode3;

    super.initState();
    _refreshItems();
    // _count(); // Load data when app starts
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    super.dispose();
  }

  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');
  TextEditingController t3 = TextEditingController(text: '');
  // hivebox
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          child:
          Expanded(
            // main column
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                   child:  resulttxtfield(focus: false, hnttxt: "hint", lbl: "lable"),
                ),
                // text fields row
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: Colors.white, style: BorderStyle.solid),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: txtland(
                          fcnd: focusNode1,
                          t1: t1,
                          lbl: texts.lblk,
                          focus: true,
                          hnttxt: texts.hintk,
                        ),

                        //The Text field for the second number
                      ),
                      Expanded(
                        child: txtland(
                          fcnd: focusNode2,
                          focus: false,
                          t1: t2,
                          lbl: texts.lblm,
                          hnttxt: texts.hintm,
                        ),

                        //The Text field for the second number
                      ),
                      Expanded(
                        child: txtland(
                          fcnd: focusNode3,
                          focus: false,
                          t1: t3,
                          lbl: texts.lblsqf,
                          hnttxt: texts.hinksqfoot,
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
                            onPressed: () {
                              _createItem({
                                "kanal": t1.text.isEmpty ? "0" : t1.text.trim(),
                                "marla": t2.text.isEmpty ? "0" : t2.text.trim(),
                                "sqfoot": t3.text.isEmpty ? "0" : t3.text.trim()
                              });
                              clear();
                              focusNode1.requestFocus();
                            },
                            btntxt: texts.btnadd,
                          ),
                          BtnWidget(
                            onPressed: () {
                              _updateItem(existingkey, {
                                "kanal": t1.text.isEmpty ? "0" : t1.text.trim(),
                                "marla": t2.text.isEmpty ? "0" : t2.text.trim(),
                                "sqfoot": t3.text.isEmpty ? "0" : t3.text.trim()
                              });
                              clear();
                            },
                            btntxt: texts.btnupdate,
                          ),
                          BtnWidget(
                            onPressed: () {
                              _clearall();
                              clear();
                            },
                            btntxt: texts.btnreset,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BtnWidget(
                            // onPressed: () => _showModel(context),
                            onPressed: () {},
                            btntxt: texts.btnperson,
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
                                      texts.nodata,
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
                                              "${currentItem['kanal']} - ${currentItem['marla']} - ${currentItem['sqfoot']} "),
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
                                              onPressed: () => _showForm(
                                                  currentItem['key'])),
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
      ),
    );
  }

  void clear() {
    t1.text = '';
    t2.text = '';
    t3.text = '';
  }

// db classes
// EDIT ITEMS
  void _showForm(int? itemKey) async {
    // itemKey == null -> create new item
    // itemKey != null -> update an existing item
    existingkey = itemKey;
    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemKey);
      t1.text = existingItem['kanal'];
      t2.text = existingItem['marla'];
      t3.text = existingItem['sqfoot'];
    }
    if (itemKey == null) {
      _createItem({"kanal": t1.text, "marla": t2.text});
    }
  }

  // Get all items from the database
  void _refreshItems() {
    final data = _raqbaBox.keys.map((key) {
      final value = _raqbaBox.get(key);
      return {
        "key": key,
        "kanal": value["kanal"],
        "marla": value['marla'],
        "sqfoot": value['sqfoot']
      };
    }).toList();

    TKanal = 0;
    TMarla = 0;
    TSqfoot = 0;
    for (var i = 0; i < data.length; i++) {
      TKanal += int.tryParse(data[i]['kanal']) ?? 0;
      TMarla += int.tryParse(data[i]['marla']) ?? 0;
      TSqfoot += int.tryParse(data[i]['sqfoot']) ?? 0;
    }
    setState(() {
      _items = data.reversed.toList();
      TKanal;
      TMarla;
      TSqfoot;
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  // Create new item
  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _raqbaBox.add(newItem);
    _refreshItems(); // update the UI
  }

  // Retrieve a single item from the database by using its key
  // Our app won't use this function but I put it here for your reference
  Map<String, dynamic> _readItem(int key) {
    final item = _raqbaBox.get(key);
    return item;
  }

  // Update a single item
  Future<void> _updateItem(int? itemKey, Map<String, dynamic> item) async {
    if (itemKey != null) {
      await _raqbaBox.put(itemKey, item);
      _refreshItems(); // Update the UI
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text(texts.notupdated)));
    }
  }

  // Delete a single item
  Future<void> _deleteItem(int itemKey) async {
    await _raqbaBox.delete(itemKey);
    _refreshItems(); // update the UI

    // Display a snackbar
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text(texts.itemdeleted)));
  }

// delete all data
  Future<void> _clearall() async {
    await _raqbaBox.clear();
    _refreshItems(); // update the UI

    // Display a snackbar
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text(texts.nodataleft)));
  }

// show model

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
