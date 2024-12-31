import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller/slide_indicator_index_controller.dart';

class ProductSliderSection extends StatelessWidget {
  const ProductSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> productslider = [
      "https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/primary/ProductShowcasesampleimages/JPEG/Product+Showcase-1.jpg",
      "https://5.imimg.com/data5/SELLER/Default/2022/1/QZ/AO/RT/142262681/istockphoto-1301394040-170667a.jpg",
      "https://images.unsplash.com/photo-1631087606988-a6be38fccaf6?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c2hvZXMlMjBwaG90b2dyYXBoeXxlbnwwfHwwfHx8MA%3D%3D",
    ];

    final SliderController sliderController = Get.put(SliderController());

    return Stack(
      children: [
        // Carousel Slider
        CarouselSlider.builder(
          itemCount: productslider.length,
          itemBuilder: (context, index, pageindex) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productslider[index]),
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
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Get.back();
                },
              ),
              Row(
                children: [
                  // Wishlist Icon
                  IconButton(
                    icon:
                        const Icon(Icons.favorite_border, color: Colors.white),
                    onPressed: () {
                      // TODO: Wishlist
                    },
                  ),
                  // Cart Icon
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart_rounded,
                        color: Colors.white),
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
                count: productslider.length,
                effect: const ExpandingDotsEffect(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
