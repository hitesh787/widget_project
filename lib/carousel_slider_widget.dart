import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              autoPlay: true,
            ),
            items: [1, 2, 3, 4, 5,6,7,8,9,10].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.amber),
                      child: Center(
                          child: Text(
                        'text $i',
                        style: const TextStyle(fontSize: 20.0),
                      )));
                },
              );
            }).toList(),
          ),

          CarouselSlider.builder(
            itemCount: 15,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
                           width: MediaQuery.of(context).size.width,
                           margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                           decoration: const BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.amber),
                       child: Center(child: Text("Number : ${itemIndex+1}",style: const TextStyle(fontSize: 20.0),),),),
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              // autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
