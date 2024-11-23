import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Color backgroundColor;
  final VoidCallback onTap;

  const PopularCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 350, // Lebar kartu
        margin: const EdgeInsets.symmetric(horizontal: 8), // Jarak antar kartu
        decoration: BoxDecoration(
          color: backgroundColor, // Warna latar belakang untuk container
          borderRadius: BorderRadius.circular(12), // Sudut melengkung
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container untuk gambar
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                height: 175,
                width: double.infinity, // Lebar penuh
                alignment: Alignment.center, // Gambar berada di tengah
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      16), // Sudut melengkung untuk gambar
                  child: Image.network(
                    imageUrl, // URL gambar
                    height: 150, // Tinggi gambar
                    width: 300, // Lebar gambar
                    fit: BoxFit.cover, // Menyesuaikan ukuran gambar
                  ),
                ),
              ),
            ),
            // Judul
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text(
                title,
                maxLines: 1, // Maksimal 2 baris teks
                overflow: TextOverflow
                    .ellipsis, // Tambahkan '...' jika teks terlalu panjang
                textAlign: TextAlign.center, // Rata tengah
                style: GoogleFonts.lato(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors
                      .white, // Teks putih agar kontras dengan latar belakang
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
