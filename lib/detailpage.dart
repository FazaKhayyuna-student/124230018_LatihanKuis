import 'package:flutter/material.dart';
import 'package:latihankuis/datamakanan.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController _jumlahController = TextEditingController();
  int totalHarga = 0;

  void _hitungTotal() {
    int jumlah = int.tryParse(_jumlahController.text) ?? 0;
    String hargaString =
        foodList[widget.index].price.replaceAll(RegExp(r'[^0-9]'), '');
    int harga = int.tryParse(hargaString) ?? 0;

    setState(() {
      totalHarga = harga * jumlah;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Pesanan ditambahkan: Rp.$totalHarga | $jumlah item")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final food = foodList[widget.index];

    return Scaffold(
      appBar: AppBar(title: Text("Detail Page")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              food.imageUrls[0],
              height: 200,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.broken_image, size: 100),
            ),
            const SizedBox(height: 15),
            Text(food.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Review: ${food.reviewAverage}"),
            Text("Harga : ${food.price}"),
            const SizedBox(height: 20),
            TextField(
              controller: _jumlahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Masukkan Jumlah",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungTotal,
              child: Text("Submit"),
            ),
            const SizedBox(height: 20),
            Text(
              "Total Harga: Rp $totalHarga",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
