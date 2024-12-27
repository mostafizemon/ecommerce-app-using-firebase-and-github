import 'package:e_commarce_app_firebase/screens/home_screens/section/categories.dart';
import 'package:e_commarce_app_firebase/screens/home_screens/section/product_section.dart';
import 'package:e_commarce_app_firebase/screens/home_screens/section/slider_section.dart';
import 'package:e_commarce_app_firebase/widgets/custom_searchbox.dart';
import 'package:e_commarce_app_firebase/widgets/custom_viewallButton.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text("Home"),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CustomSearchbox(),
              const SizedBox(
                height: 10,
              ),
              CustomViewallbutton(
                title: "Categories",
              ),
              const SizedBox(
                height: 15,
              ),
              const Categories(),
              const SizedBox(
                height: 15,
              ),
              const SliderSection(),
              const SizedBox(
                height: 15,
              ),
              CustomViewallbutton(title: "Recent Products"),
              const SizedBox(
                height: 10,
              ),
              const ProductSection(),
            ],
          ),
        ),
      ),
    );
  }
}
