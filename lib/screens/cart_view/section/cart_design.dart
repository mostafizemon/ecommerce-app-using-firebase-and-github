import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../../controller/cart_controller.dart';

class CartDesign extends StatelessWidget {
  const CartDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;
    final CartController cartController = Get.put(CartController());
    return StreamBuilder(
        stream: firestore
            .collection('carts')
            .where('user_email', isEqualTo: user!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No Cart Products"),
            );
          }

          final totalAmount = snapshot.data!.docs.fold(0.0, (sum, doc) {
            final product = doc.data();
            final price = double.parse(product['price'].toString());
            return sum + (price * product['quantity']);
          });
          WidgetsBinding.instance.addPostFrameCallback((_) {
            cartController.updateTotalAmount(totalAmount);
          });

          return ListView.separated(
            itemCount: snapshot.data!.docs.length,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemBuilder: (context, index) {
              final products = snapshot.data!.docs[index];
              return Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 3),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(products['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            products['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text("৳${products['price'] * products['quantity']}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      if (products['quantity'] == 1) {
                                      } else {
                                        await firestore
                                            .collection("carts")
                                            .doc(products.id)
                                            .update({
                                          'quantity': FieldValue.increment(-1),
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Color(0xFFFF7643),
                                    ),
                                  ),
                                  Text(
                                    "${products['quantity']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await firestore
                                          .collection("carts")
                                          .doc(products.id)
                                          .update({
                                        'quantity': FieldValue.increment(1),
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: Color(0xFFFF7643),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () async {
                                  await firestore
                                      .collection('carts')
                                      .doc(products.id)
                                      .delete();
                                },
                                icon: const Icon(
                                  Icons.delete_sharp,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 5,
              );
            },
          );
        });
  }
}
