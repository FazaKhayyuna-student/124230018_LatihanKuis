import 'package:flutter/material.dart';
import 'package:latihankuis/datamakanan.dart'; 
import 'package:latihankuis/login.dart'; 
import 'package:latihankuis/modelmakanan.dart';
import 'package:latihankuis/detailpage.dart'; 

class homepage extends StatelessWidget {
  final String username;
  const homepage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Makanan Favorit"),
        backgroundColor: Colors.indigo.shade700,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage(); 
                  },
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Text(
              "Halo, ${username}! Temukan menu favoritmu:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.indigo.shade800,
              ),
            ),
          ),
          // Grid View
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8, 
                ),
                itemBuilder: (context, index) {
                  return _foodCard(context, index);
                },
                itemCount: foodList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _foodCard(BuildContext context, int index) {
    final foodItem = foodList[index];

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(index: index);
            },
          ),
        );
      },
      child: Card(
        elevation: 5, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAlias, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  foodItem.imageUrls[0], 
                  fit: BoxFit.cover, 
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.broken_image, color: Colors.grey));
                  },
                ),
              ),
            ),
            
            // Detail Teks
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      foodItem.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          foodItem.reviewAverage,
                          style: const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),

                    Text(
                      foodItem.price,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
