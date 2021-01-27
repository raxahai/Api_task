import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
          color: Colors.black54,
          child: CarouselSlider(
            options: CarouselOptions(height: 1000, viewportFraction: 1),
            items: [sliderPage1()].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    // decoration: BoxDecoration(color: Colors.amber),
                    child: i,
                  );
                },
              );
            }).toList(),
          )),
    );
  }

  Widget sliderPage1() {
    return Stack(
      children: [
        Icon(Icons.arrow_circle_up),
      ],
    );
  }
}
