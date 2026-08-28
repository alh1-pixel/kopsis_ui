import 'package:flutter/material.dart';
import 'barang_card.dart';
void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final List<Map<String, dynamic>> daftarBarang = const[
    {'nama': 'Buku Tulis', 'kategori': 'ATK' ,'anggota' : 3000, 'umum' : 3500, 'stok' : 0},
    {'nama': 'Pulpen', 'kategori': 'ATK', 'anggota' : 2500, 'umum' : 3000, 'stok' : 25},
    {'nama': 'Roti', 'kategori': 'MAKANAN', 'anggota' : 5000, 'umum' : 5500, 'stok' : 15},
    {'nama': 'Susu UHT', 'kategori': 'MINUMAN', 'anggota' : 6000, 'umum' : 6500, 'stok' : 5},
    {'nama': 'Pensil', 'kategori': 'ATK', 'anggota' : 2000, 'umum' : 2500, 'stok' : 10},
    {'nama': 'Penghapus', 'kategori': 'ATK', 'anggota' : 2000, 'umum' : 2500, 'stok' : 15},
    {'nama': 'Donat', 'kategori': 'MAKANAN', 'anggota' : 5000, 'umum' : 5500, 'stok' : 25},
    {'nama': 'Kopi', 'kategori': 'Minuman', 'anggota' : 7000, 'umum' : 7500, 'stok' : 10},
    {'nama': 'Kripik', 'kategori': 'MAKANAN', 'anggota' : 5000, 'umum' : 5500, 'stok' : 7},
    {'nama': 'Kentang Goreng', 'kategori': 'MAKANAN', 'anggota' : 6000, 'umum' : 6500, 'stok' : 4},
  ];
  @override
  Widget build(BuildContext context) {
    // cek stok barang
    final barangTersedia = daftarBarang.where((b) => b['stok'] > 0).toList();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Koperasi Sekolah"),),
        body: ListView.builder(
          itemCount: barangTersedia.length,
          itemBuilder: (context, index) {
            final barang = barangTersedia[index];
            return BarangCard(
              nama: barang['nama'], 
              kategori: barang['kategori'],
              hargaAnggota: barang['anggota'], 
              stok: barang['stok']);
          }
        ),
      ),
    );
  }
}