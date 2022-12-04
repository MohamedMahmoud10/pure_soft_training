import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../dummy_data.dart';
import '../../size_config.dart';
import 'home_card.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction:
              SizeConfig.orientation == Orientation.portrait ? 0.9 : 0.4,
          autoPlay: true,
          aspectRatio: SizeConfig.orientation == Orientation.portrait ? 2 : 5,
          enlargeCenterPage: true,
          disableCenter: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale),
      items: dummyBanners.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return HomeCard(
              image: item.imageBanner!,
            );
          },
        );
      }).toList(),
    );
  }
}
