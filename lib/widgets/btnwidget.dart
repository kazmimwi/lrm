import 'package:flutter/material.dart';

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
