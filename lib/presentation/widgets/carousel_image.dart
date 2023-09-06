import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselImage extends StatefulWidget {
  final List<String> images;
  const CarouselImage({super.key, required this.images});

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  int activeIndex = 0;
  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Карусель
        CarouselSlider.builder(
          itemCount: widget.images.length,
          options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1,
            initialPage: 1,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              widget.images[itemIndex],
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Center(
                  child: Text(
                "Фото не найдено",
                style: MyTextStyle.headLine2S(color: gray),
              )),
            ),
          ),
        ),

        //Индикатор
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPaddin / 2, vertical: defaultPaddin / 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: white,
              ),
              child: AnimatedSmoothIndicator(
                onDotClicked: animateToSlide,
                effect: const ColorTransitionEffect(
                    dotWidth: 7,
                    activeDotColor: black,
                    dotColor: gray,
                    dotHeight: 7),
                activeIndex: activeIndex,
                count: widget.images.length,
              ),
            ),
          ),
        )
      ],
    );
  }

  void animateToSlide(int index) => controller.animateToPage(index);
}
