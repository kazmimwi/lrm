import 'package:flutter/material.dart';

class resulttxtfield extends StatelessWidget {

  const resulttxtfield({
    Key? key,
    //required this.t1,
    this.lbl,
    this.hnttxt,
    required this.focus,
  }) : super(key: key);
  final bool focus;
  //final TextEditingController t1;
  final lbl;
  final hnttxt;
  @override
  Widget build(BuildContext context) {
    return TextField(

      readOnly: true,
      keyboardType: TextInputType.number,

      cursorColor: Colors.tealAccent,
      // controller: t1,
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
