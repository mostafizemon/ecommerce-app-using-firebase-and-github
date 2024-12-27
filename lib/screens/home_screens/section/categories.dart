import 'package:flutter/Material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 15,
          );
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.2),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/images/fashion_img.png",
                  height: 30,
                ),
              ),
              const Text("Fashion", style: TextStyle(fontSize: 12),),
            ],
          );
        },
      ),
    );
  }
}
