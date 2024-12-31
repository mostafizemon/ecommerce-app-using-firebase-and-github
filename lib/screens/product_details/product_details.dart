import 'package:e_commarce_app_firebase/screens/product_details/section/details_section.dart';
import 'package:e_commarce_app_firebase/screens/product_details/section/product_slider_section.dart';
import 'package:flutter/Material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductSliderSection(),
            DetailsSection(),
          ],
        ),
      ),
    );
  }
}
