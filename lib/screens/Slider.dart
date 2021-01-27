import 'package:api_task/widgets/slider_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui';

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      backgroundColor: Colors.transparent,
      body: Container(
          color: Colors.black54,
          child: CarouselSlider(
            options: CarouselOptions(height: 1000, viewportFraction: 1),
            items: [sliderPage1, sliderPage2].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    // decoration: BoxDecoration(color: Colors.amber),
                    child: i(context),
                  );
                },
              );
            }).toList(),
          )),
    );
  }

  Widget sliderPage1(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: [
        Positioned(
          child: Icon(
            Icons.arrow_circle_up,
            size: 40,
            color: Colors.yellow,
          ),
          // bottom: 200,
          bottom: 490,
          left: 5,
        ),
        Positioned(
          child: Text(
            "Menu Drawer",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          top: 110,
          left: 5,
        ),
        Positioned(
          child: SliderButton(),
          top: 540,
          left: 10,
        )
      ],
    );
  }

  Widget sliderPage2(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          child: Icon(
            Icons.arrow_circle_up,
            size: 40,
            color: Colors.yellow,
          ),
          // bottom: 200,
          bottom: 435,
          left: 297,
        ),
        Positioned(
          child: Text(
            "Delete task",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          top: 160,
          left: 240,
        ),
        Positioned(
          child: SliderButton(),
          top: 540,
          left: 10,
        )
      ],
    );
  }
}
