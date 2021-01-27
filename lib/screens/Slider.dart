import 'package:api_task/widgets/slider_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final CarouselController btn_controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          color: Colors.black54,
          child: CarouselSlider(
            options: CarouselOptions(
              // autoPlay: true,
              height: 1000,
              enableInfiniteScroll: false,
              viewportFraction: 1,
            ),
            carouselController: btn_controller,
            items: [sliderPage1, sliderPage2].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
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
          child: SliderButton(title: 'Skip', color: Colors.red),
          top: 540,
          left: 10,
        ),
        Positioned(
          child: FlatButton(
            minWidth: 50,
            color: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Next",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              btn_controller.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            },
          ),
          top: 540,
          left: 270,
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
          child: SliderButton(title: 'Skip', color: Colors.red),
          top: 540,
          left: 10,
        )
      ],
    );
  }
}
