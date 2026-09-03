import 'package:flutter/material.dart';

class Transaksi {
  final String keterangan;
  final String jenis;
  final String kategori;
  final int jumlah;
  final String tanggal;

  Transaksi({
    required this.keterangan,
    required this.jenis,
    required this.kategori,
    required this.jumlah,
    required this.tanggal,
  });
}

//switchcase jenis
String jenis(String jenis) {
  switch(jenis) {
    case 'in':
      return 'Masuk';
    case 'out':
      return 'Keluar';
    default:
      return 'Jenis tidak valid';
  }
}

// switchcase kategori
String kategori(String kategori) {
  switch(kategori) {
    case '1':
      return 'Penjualan';
    case '2':
      return 'Belanja';
    case '3':
      return 'Operasional';
    default:
      return 'Kategori tidak valid';
  }
}

void main() {
  runApp(const MyApp());

  Transaksi transaksi1 = Transaksi(
    keterangan: 'Penjualan hari senin',
    jenis: jenis('out'),
    kategori: kategori('1'),
    jumlah: 50000,
    tanggal: '2023-06-01',
  );

  Transaksi transaksi2 = Transaksi(
    keterangan: 'Gaji Bulanan',
    jenis: jenis('in'),
    kategori: kategori('3'),
    jumlah: 5000000,
    tanggal: '2023-06-01',
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buku Kas',
    );
  }
}
