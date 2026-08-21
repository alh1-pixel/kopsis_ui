import 'package:flutter/material.dart';
void main()=> runApp(const MyApp());
IconData getKategoriIcon(String kategori){
  switch(kategori.toLowerCase()){
    case 'atk':
      return Icons.edit_note;
    case 'makanan':
      return Icons.fastfood;
    case 'minukan':
      return Icons.local_drink;
    default:
      return Icons.inventory_2;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String kategori1 = 'ATK';
  final String kategori2 = 'MAKANAN';
  final int stok = 40;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Koperasi Sekolah"),),
        body: ListView(
          children: [
            Card(
              margin: const EdgeInsets.all(12),
              elevation: 0,
              child: ListTile(
                leading: Icon(getKategoriIcon(kategori1),
                size: 32,
                color: Colors.lightBlue,),
                title:  const Text(
                  'Buku Tulis',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Anggota Rp3.000 | Umum Rp3.500'),
                trailing: Text(
                  'Stok ' + stok.toString(),
                  style: TextStyle(color: stok == 0 ? Colors.red : Colors.black),
                  ),
              )
            ),
            Card(
              margin: const EdgeInsets.all(12),
              elevation: 4,
              child: ListTile(
                leading: Icon(getKategoriIcon(kategori2),
                size: 32,
                color: Colors.lightBlue,),
                title:  const Text(
                  'Roti',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Anggota Rp4.000 | Umum Rp4.500'),
                trailing: Text(
                  'Stok ' + stok.toString(),
                  style: TextStyle(color: stok == 0 ? Colors.red : Colors.black),
                  ),
              )
            ),
          ],
        ),
      ),
    );
  }
}