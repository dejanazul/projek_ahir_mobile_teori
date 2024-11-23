import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:projek_ahir_mobile_teori/features/ticket/screeens/user_ticket_screen.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String genre;
  final String date; // localDate dari API
  final String localTime; // localTime dari API
  final String imageUrl;
  final double priceRanges;

  DetailScreen({
    super.key,
    required this.title,
    required this.genre,
    required this.date,
    required this.localTime,
    required this.imageUrl,
    required this.priceRanges,
  });

  final Map<String, double> staticExchangeRates = {
    "IDR": 15300.0, // Indonesia Rupiah
    "JPY": 110.53, // Yen Jepang
    "AUD": 1.45, // Dollar Australia
    "GBP": 0.77, // Pound Inggris
    "EUR": 0.91, // Euro Jerman
  };

  //konversi uang
  double convertCurrency(double amount, String targetCurrency) {
    final rate = staticExchangeRates[targetCurrency];
    if (rate != null) {
      return amount * rate;
    } else {
      throw Exception("Currency not found");
    }
  }

  // konversi waktu
  String convertToTimeZone(String localTime, int offset) {
    final parts = localTime.split(":"); // Misal "21:00:00"
    final int hours = int.parse(parts[0]);
    final int minutes = int.parse(parts[1]);
    final int seconds = int.parse(parts[2]);

    int convertedHours =
        (hours + offset) % 24; // Modulo untuk menjaga rentang 0-23
    if (convertedHours < 0) {
      convertedHours += 24; // Menghindari hasil negatif
    }

    return "${convertedHours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}:"
        "${seconds.toString().padLeft(2, '0')}";
  }

  void _purchaseTicket(BuildContext context) async {
    final box = Hive.box('purchasedTickets');

    await box.add({
      'title': title,
      'genre': genre,
      'date': date,
      'localTime': localTime,
      'priceRanges': priceRanges,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "TICKET DETAILS",
          style: GoogleFonts.albertSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.4,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar besar dan gambar kecil di kanan
                  SizedBox(
                    height: 210,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF4B00),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Judul dan genre
                  Text(
                    title,
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    genre,
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Deskripsi
                  Text(
                    "Descriptions",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Concert date : $date',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Concert time in various time zones:',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Zona Waktu
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildTimeContainer(
                          'WIB', convertToTimeZone(localTime, 7)),
                      _buildTimeContainer(
                          'WIT', convertToTimeZone(localTime, 9)),
                      _buildTimeContainer(
                          'WITA', convertToTimeZone(localTime, 8)),
                      _buildTimeContainer(
                          'GMT', convertToTimeZone(localTime, 0)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Rentang Harga
                  Text(
                    "Price Range",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "\$${priceRanges.toStringAsFixed(2)} USD",
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Price in Other Currencies:",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: staticExchangeRates.entries.map((entry) {
                      final currency = entry.key;
                      final convertedPrice =
                          convertCurrency(priceRanges, currency);

                      return Text(
                        "$currency: ${convertedPrice.toStringAsFixed(2)}",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          // Tombol Purchase Ticket
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4B00),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 90,
                    vertical: 25,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  _purchaseTicket(context);
                  Get.to(() => const UserTicketScreen());
                },
                child: Text(
                  "Purchase Ticket",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeContainer(String zone, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "$time $zone",
        style: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
