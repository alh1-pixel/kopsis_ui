import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  final int stok;
  final int hargaAnggota;

  const KeranjangItem({
    super.key,
    required this.stok,
    required this.hargaAnggota,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;

  @override
  void initState() {
    super.initState();
    debugPrint("initState dipanggil");
  }
  @override
  void dispose() {
    debugPrint("dispose dipanggil");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build dipanggil');
    int totalHarga = jumlah * widget.hargaAnggota;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (jumlah > 0) jumlah--;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(jumlah.toString()),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.add),
          onPressed: () {
            if (jumlah < widget.stok) {
              setState(() {
                jumlah++;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Stok tidak cukup! Jumlah tersedia ${widget.stok}'),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
        ),
        const SizedBox(width: 12),
        Text(
          'Total: Rp$totalHarga',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
} 