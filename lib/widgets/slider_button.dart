import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class SliderButton extends StatelessWidget {
  final String title;
  final Color color;
  final CarouselController btncontroller;
  SliderButton({this.title, this.color, this.btncontroller});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: 50,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () {
        if (title == "Skip") {
          Navigator.pop(context);
        }
      },
    );
  }
}
