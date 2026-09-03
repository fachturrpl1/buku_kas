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

  // static berguna mengubah kepemilikan method menjadi milik class bukan milik object
  static String inputTanggal(int dd, int mm, int yyyy) {
    if (mm < 1 || mm > 12) {
      return 'Bulan tidak valid';
    }

    int maxHari = 31;

    if (mm == 2) {
      // Cek apakah tahun kabisat
      bool isKabisat = (
        // kelipatan 4 (kabisat)
        yyyy % 4 == 0 && 
        // abad bukan kabisat kecuali kelipatan 400
        yyyy % 100 != 0
        ) || (
        // kelipatan 400 (kabisat)
        yyyy % 400 == 0
        );
      maxHari = isKabisat ? 29 : 28;
    } else if (mm == 4 || mm == 6 || mm == 9 || mm == 11) {
      maxHari = 30;
    }
    if (dd < 1 || dd > maxHari) {
      return 'Tanggal tidak valid untuk bulan dan tahun ini';
    }
    return '$dd/$mm/$yyyy';
  }
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
    jumlah: 350000,
    tanggal: Transaksi.inputTanggal(10, 9, 2026)
  );

  Transaksi transaksi2 = Transaksi(
    keterangan: 'Gaji Bulanan',
    jenis: jenis('in'),
    kategori: kategori('3'),
    jumlah: 5000000,
    tanggal: Transaksi.inputTanggal(11, 9, 2026),
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
