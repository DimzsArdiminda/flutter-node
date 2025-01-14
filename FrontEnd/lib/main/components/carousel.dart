
import 'package:crud_basic/main/data/data.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselDashboard extends StatelessWidget {
  const CarouselDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
      items: imgList.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
