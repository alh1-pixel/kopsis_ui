import 'package:flutter/material.dart';
void main()=> runApp(const MyApp());
IconData getKategoriIcon(String kategori){
  switch(kategori.toLowerCase()){
    case 'atk':
      return Icons.edit_note;
    case 'makanan':
      return Icons.fastfood;
    case 'minuman':
      return Icons.local_drink;
    default:
      return Icons.inventory_2;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final List<Map<String, dynamic>> daftarBarang = const[
    {'nama': 'Buku Tulis', 'kategori': 'ATK' ,'anggota' : 3000, 'umum' : 3500, 'stok' : 40},
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Koperasi Sekolah"),),
        body: ListView.builder(
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading:  Icon(
                  getKategoriIcon(barang['kategori']),
                  color: Colors.lightBlue,
                ),
                title: Text(barang['nama']),
                subtitle: Text('Anggota Rp' + barang['anggota'].toString()),
                trailing: Text('Stok ' + barang['stok'].toString()),
              ),
            );
          }
        ),
      ),
    );
  }
}