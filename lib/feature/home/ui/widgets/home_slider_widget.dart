import 'package:carousel_slider/carousel_slider.dart';
import 'package:negociosapp/core/provicional_borrar_al_empezar_bakend/slider.dart';
import '../../../../core/provicional_borrar_al_empezar_bakend/slider.dart'
    as prefix0;
//import '../models/slider.dart';

import 'package:flutter/material.dart';

class HomeSliderWidget extends StatefulWidget {
  const HomeSliderWidget({super.key});

  @override
  HomeSliderWidgetState createState() => HomeSliderWidgetState();
}

class HomeSliderWidgetState extends State<HomeSliderWidget> {
  @override
  Widget build(BuildContext context) {
    final SliderList sliderList = SliderList();
    const int current = 0;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        CarouselSlider(
          items: sliderList.list.map((prefix0.Slider slide) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(slide.image), fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 9)
                    ],
                  ),
                  child: Container(
                    alignment: AlignmentDirectional.bottomEnd,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            height: 200,
            viewportFraction: 1.0,
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: sliderList.list.map((prefix0.Slider slide) {
              return Container(
                width: 20.0,
                height: 3.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 70.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: current == sliderList.list.indexOf(slide)
                        ? Theme.of(context).hintColor
                        : Theme.of(context).hintColor.withOpacity(0.3)),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
