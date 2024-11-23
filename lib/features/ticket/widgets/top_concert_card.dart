import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopConcertCard extends StatelessWidget {
  final String title;
  final String genre;
  final String date;
  final String imageUrl;
  final VoidCallback onTap;

  const TopConcertCard({
    super.key,
    required this.title,
    required this.genre,
    required this.date,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15), // Padding antar card
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 150, // Tinggi card
          decoration: BoxDecoration(
            color: Colors.white, // Background putih
            border: Border.all(
                color: Colors.black.withOpacity(0.3),
                width: 2), // Outline hitam
            borderRadius: BorderRadius.circular(20), // Sudut melengkung
          ),
          child: Padding(
            padding: const EdgeInsets.all(16), // Padding dalam card
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gambar dari API
                Container(
                  width: 125,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF4B00), // Warna background default
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl), // Gambar dari API
                      fit: BoxFit.cover, // Agar gambar memenuhi area
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Jarak antara gambar dan teks
                // Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      const SizedBox(height: 4),
                      Opacity(
                        opacity: 0.5,
                        child: Text(genre,
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      const SizedBox(height: 4),
                      Text(date,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
