import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;

    return StreamBuilder(
      stream: firestore.collection('categories').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong!"),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("No categories found"),
          );
        }

        return SizedBox(
          height: 95,
          child: ListView.separated(
            itemCount: snapshot.data!.docs.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 15);
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = snapshot.data!.docs[index];
              return Column(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.2),
                      shape: BoxShape.circle,
                    ),
                    child: category['icon'] != null
                        ? Image.network(
                            category['icon'],
                            height: 25,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.image_not_supported),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category['name'] ?? 'No Name',
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
