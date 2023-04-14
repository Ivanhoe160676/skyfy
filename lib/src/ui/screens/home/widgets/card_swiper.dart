import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:skyfy/src/tools/bnb/images.dart';

class CardSwiperEmptyLegs extends StatelessWidget {
  const CardSwiperEmptyLegs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.15,
      child: Swiper(
        axisDirection: AxisDirection.right,
        itemCount: 5,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.13,
        itemWidth: size.width * 0.4,
        itemBuilder: (_, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: NetworkImage('https://via.placeholder.com/400x200'),
              image: NetworkImage(cover),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
