import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller/slide_indicator_index_controller.dart';

class ProductSliderSection extends StatelessWidget {
  final Map<String, dynamic> productsslider;
  const ProductSliderSection({super.key, required this.productsslider});

  @override
  Widget build(BuildContext context) {
    final gallery=productsslider['gallery'];

    final SliderController sliderController = Get.put(SliderController());

    return Stack(
      children: [
        // Carousel Slider
        CarouselSlider.builder(
          itemCount: gallery.length,
          itemBuilder: (context, index, pageindex) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(gallery[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              sliderController.updateActionIndexProductsdetails(index);
            },
            height: 300,
            viewportFraction: 1,
          ),
        ),
        // Overlaid Buttons
        Positioned(
          top: 20,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFFFF7643)),
                onPressed: () {
                  Get.back();
                },
              ),
              Row(
                children: [
                  // Wishlist Icon
                  IconButton(
                    icon:
                        const Icon(Icons.favorite_border, color: Color(0xFFFF7643)),
                    onPressed: () {
                      // TODO: Wishlist
                    },
                  ),
                  // Cart Icon
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart_rounded,
                        color: Color(0xFFFF7643)),
                    onPressed: () {
                      // TODO: CartIcon
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        // Smooth Indicator
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Obx(
              () => AnimatedSmoothIndicator(
                activeIndex: sliderController.activeIndexProductsdetails.value,
                count: gallery.length,
                effect: const ExpandingDotsEffect(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
