import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../controller/slide_indicator_index_controller.dart';

class SliderSection extends StatelessWidget {
  const SliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final SliderController sliderController = Get.put(SliderController());

    List<String> slider = [
      "https://kalidas365itsolutions.wordpress.com/wp-content/uploads/2014/06/every-sale.jpg",
      "https://helloyubo.com/wp-content/uploads/2022/09/IMG-20220913-WA0040-1024x465.jpg"
    ];
    return StreamBuilder(
        stream: firestore.collection('slider').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No Slider"),
            );
          }
          return Stack(
            children: [
              CarouselSlider.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              snapshot.data!.docs[itemIndex]['image']),
                          fit: BoxFit.cover),
                    ),
                  );
                },
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    sliderController.updateActiveIndex(index);
                  },
                  height: 150,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Center(
                  child: Obx(
                    () => AnimatedSmoothIndicator(
                      activeIndex: sliderController.activeIndex.value,
                      count: snapshot.data!.docs.length,
                      effect: const SwapEffect(),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
