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
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // Text("Selamat Datang $username"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return _foodlist(context, index);
                  },
                  itemCount: foodList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _foodlist(context, int index) {
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
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 209, 231, 241),
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(foodList[index].imageUrls[0]),
            ),
            Text(foodList[index].name),
            Text("Review: ${foodList[index].reviewAverage}"),
            Text("Harga : ${foodList[index].price}"),
          ],
        ),
      ),
    );
  }
}
