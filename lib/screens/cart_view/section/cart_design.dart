import 'package:flutter/Material.dart';

class CartDesign extends StatelessWidget {
  const CartDesign({super.key});

  @override
  Widget build(BuildContext context) {
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
              image: const DecorationImage(
                image: NetworkImage(
                    "https://static.vecteezy.com/system/resources/thumbnails/024/841/285/small_2x/wireless-headphone-isolated-on-transparent-background-high-quality-bluetooth-headphone-for-advertising-and-product-catalogs-generative-ai-png.png"),
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
                const Text(
                  "Wireless Bluethood Headphone",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text("\$35.00"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Color(0xFFFF7643),
                          ),
                        ),
                        const Text(
                          "1",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle,
                            color: Color(0xFFFF7643),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
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
  }
}
