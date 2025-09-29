import 'package:flutter/material.dart';
import 'package:latihankuis/datamakanan.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController _jumlahController = TextEditingController(text: '1');
  int totalHarga = 0;
  
  @override
  void initState() {
    super.initState();
    _hitungTotal();
    _jumlahController.addListener(_hitungTotal);
  }

  @override
  void dispose() {
    _jumlahController.removeListener(_hitungTotal);
    _jumlahController.dispose();
    super.dispose();
  }

  String _formatRupiah(int number) {
    final String numberStr = number.toString();
    final RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return 'Rp ${numberStr.replaceAllMapped(regex, (Match m) => '${m[1]}.')}';
  }

  void _hitungTotal() {
    int jumlah = int.tryParse(_jumlahController.text) ?? 0;
    String hargaString =
        foodList[widget.index].price.replaceAll(RegExp(r'[^0-9]'), '');
    int harga = int.tryParse(hargaString) ?? 0;

    setState(() {
      totalHarga = harga * jumlah;
    });
  }

  void _tambahPesanan() {
    _hitungTotal();
    int jumlah = int.tryParse(_jumlahController.text) ?? 0;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Pesanan ditambahkan: ${_formatRupiah(totalHarga)} (${jumlah} item)"),
        backgroundColor: Colors.blueGrey,
        duration: const Duration(seconds: 2),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final food = foodList[widget.index];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Makanan"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Image.network(
            food.imageUrls[0],
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.broken_image, size: 100, color: Colors.grey),
          ),
          const SizedBox(height: 16),

          Text(
            food.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Harga: ${food.price}",
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
              Text(
                "Review: ${food.reviewAverage}",
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ],
          ),
          const Divider(height: 30),

          const Text(
            "Deskripsi Produk:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            food.about,
            style: const TextStyle(fontSize: 15, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _jumlahController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Jumlah Pesanan",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          
          Center(
            child: Text(
              "Total: ${_formatRupiah(totalHarga)}",
              style: const TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: Colors.red, 
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          ElevatedButton(
            onPressed: _tambahPesanan,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: const RoundedRectangleBorder(), 
            ),
            child: const Text(
              "Tambahkan ke Keranjang",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
