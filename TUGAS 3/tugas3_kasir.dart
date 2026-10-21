
void main() {
  // Daftar menu
  List<Map<String, dynamic>> menu = [
    {'nama': 'Nasi Goreng', 'harga': 15000},
    {'nama': 'Gulai Kambing', 'harga': 45000},
    {'nama': 'Sate', 'harga': 15000},
    {'nama': 'Nasi Pecel:', 'harga': 13000},
    {'nama': 'Bakso Lontong', 'harga': 16000},
    {'nama': 'Es Teh', 'harga': 5000},
    {'nama': 'Jus Jeruk', 'harga': 8000},
    {'nama': 'Air Mineral', 'harga': 4000},
  ];

  // Menampilkan menu
  print('========== DAFTAR MENU ==========');
  for (int i = 0; i < menu.length; i++) {
    print('${i + 1}. ${menu[i]['nama']} - Rp ${menu[i]['harga']}');
  }

  // Daftar pesanan
  List<Map<String, dynamic>> pesanan = [
    {'nama': 'Gulai Kambing', 'qty': 2, 'subtotal': 90000},
    //{'nama': 'Sate', 'qty': 2, 'subtotal': 30000},
    {'nama': 'Air Mineral', 'qty': 2, 'subtotal': 8000 },
  ];

  // Menghitung total menggunakan fungsi
  int total = hitungTotal(pesanan);

  // Menghitung diskon langsung di main
  int diskon = 0;
  if (total >= 100000) {
    diskon = (total * 0.10).round();
  } else if (total >= 50000) {
    diskon = (total * 0.05).round();
  }

  int setelahDiskon = total - diskon;

  // Menghitung PPN menggunakan fungsi
  int ppn = hitungPPN(setelahDiskon);
  int totalBayar = setelahDiskon + ppn;

  // Menampilkan struk langsung di main
  print('\n========== STRUK KASIR ==========');
  for (var item in pesanan) {
    print(
      "${item['nama']} x${item['qty']} = Rp ${item['subtotal']}",
    );
  }

  print('---------------------------------');
  print('Total       : Rp $total');
  print('Diskon      : Rp $diskon');
  print('PPN 10%     : Rp $ppn');
  print('TOTAL BAYAR : Rp $totalBayar');
  print('=================================');
}

// Fungsi 1: Menghitung total pesanan
int hitungTotal(List<Map<String, dynamic>> pesanan) {
  int total = 0;
  for (var item in pesanan) {
    total += item['subtotal'] as int;
  }
  return total;
}

// Fungsi 2: Menghitung PPN 10%
int hitungPPN(int totalSetelahDiskon) {
  return (totalSetelahDiskon * 0.10).round();
}

/*
CONTOH DATA UJI:
1. Total Rp 40.000  -> Diskon 0%
2. Total Rp 60.000  -> Diskon 5% = Rp 3.000
3. Total Rp 120.000 -> Diskon 10% = Rp 12.000
*/
