import 'package:flutter/material.dart';

class txtland extends StatelessWidget {
  const txtland({
    Key? key,
    required this.t1,
    this.lbl,
    this.hnttxt,
    required this.focus,
    required this.fcnd,
  }) : super(key: key);
  final FocusNode fcnd;
  final bool focus;
  final TextEditingController t1;
  final lbl;
  final hnttxt;
  @override
  Widget build(BuildContext context) {
    return TextField(

      keyboardType: TextInputType.number,
      autofocus: focus,
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
