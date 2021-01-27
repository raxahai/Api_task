import 'package:flutter/material.dart';

class SliderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: 50,
      color: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        "Skip",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
