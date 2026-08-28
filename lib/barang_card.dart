import 'package:flutter/material.dart';
import 'keranjang_item.dart';

class BarangCard extends StatelessWidget {
  final String nama;
  final String kategori;
  final int hargaAnggota;
  final int stok;
  final bool sorot;
  
  const BarangCard({
    super.key,
    required this.nama,
    required this.kategori,
    required this.hargaAnggota,
    required this.stok,
    this.sorot = false,
  });
  
  IconData _getKategoriIcon(String kategori){
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
  @override
  Widget build(BuildContext context) {
    return Card(
      color: sorot ? Colors.amber[100] : Colors.white,
      margin:  const EdgeInsets.all(8),
      child: ListTile(
        leading: Icon(
          _getKategoriIcon(kategori),
          color: Colors.lightBlue,
        ),
        title: Text(nama),
        subtitle: Text('Anggota Rp' + hargaAnggota.toString()),
        trailing: KeranjangItem(
          stok: stok,
          hargaAnggota: hargaAnggota),
      ),
    );
  }
}