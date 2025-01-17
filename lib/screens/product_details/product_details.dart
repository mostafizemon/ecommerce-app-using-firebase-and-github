import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commarce_app_firebase/screens/product_details/section/details_section.dart';
import 'package:e_commarce_app_firebase/screens/product_details/section/product_slider_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../widgets/toproundedcontainer.dart';

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> productsdetails;
  final String productid;

  const ProductDetails(
      {super.key, required this.productsdetails, required this.productid});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductSliderSection(
              productsslider: productsdetails,
            ),
            DetailsSection(
              productsdetails: productsdetails,
            ),
          ],
        ),
      ),
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFFF7643),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(100, 48),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                onPressed: () async {
                  final cartproduct = await firestore
                      .collection("carts")
                      .where("product_id", isEqualTo: productid)
                      .where("user_email", isEqualTo: user!.email)
                      .get();

                  if (cartproduct.docs.isEmpty) {
                    await firestore.collection("carts").add({
                      'product_id': productid,
                      'title': productsdetails['title'],
                      'price': productsdetails['discount_price'] ??
                          productsdetails['orginial_price'],
                      'image': productsdetails['thumbnail'],
                      'quantity': 1,
                      'user_email': user.email,
                      'user_uid': user.uid,
                    });
                  } else {
                    firestore
                        .collection("carts")
                        .doc(cartproduct.docs.first.id)
                        .update({
                      'quantity': FieldValue.increment(1),
                    });
                  }
                  Get.snackbar("Successfull","Cart added successfully");
                },
                child: const Text("Add To Cart"),
              )),
        ),
      ),
    );
  }
}
