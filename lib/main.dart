import 'package:flutter/material.dart';
import 'barang_card.dart';
void main()=> runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  String kataCari = '';
  final List<Map<String, dynamic>> daftarBarang = const[
    {'nama': 'Buku Tulis', 'kategori': 'ATK' ,'anggota' : 3000, 'umum' : 3500, 'stok' : 5},
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
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // cek stok barang
    final hasilCari = daftarBarang
        .where((b) => b['nama'].toLowerCase().contains(kataCari))
        .toList();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Koperasi Sekolah"),),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Cari Barang...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (nilai) {
                setState(() {
                  kataCari = nilai.toLowerCase();
                });
              },
            ),
            Text('Lebar layar: ' +  MediaQuery.of(context).size.width.toStringAsFixed(0)),
            Expanded(
              child: LayoutBuilder(
                builder : (context, constraints) {
                  int kolom;
                  if (constraints.maxWidth < 600) {
                    kolom = 1;
                  } else if (constraints.maxWidth < 900) {
                    kolom = 2;
                  } else {
                    kolom = 3;
                  }
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: kolom,
                      childAspectRatio: 3,
                    ),
                    itemCount: hasilCari.length,
                    itemBuilder: (context, index) {
                      final barang = hasilCari[index];
                      return BarangCard(
                        nama: barang['nama'], 
                        kategori: barang['kategori'],
                        hargaAnggota: barang['anggota'], 
                        stok: barang['stok']
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}