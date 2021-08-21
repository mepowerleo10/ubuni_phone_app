import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Image.asset(
          'assets/images/img${index + 1}.jpg',
          fit: BoxFit.cover,
        );
      },
      containerHeight: 50,
      containerWidth: 50,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    );
  }
}
