import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_ahir_mobile_teori/features/ticket/models/ticket_model.dart';
import 'package:projek_ahir_mobile_teori/features/ticket/screeens/detail_screen.dart';
import 'package:projek_ahir_mobile_teori/features/ticket/widgets/popular_card.dart';
import 'package:projek_ahir_mobile_teori/features/ticket/widgets/top_concert_card.dart';
import 'package:projek_ahir_mobile_teori/repository/api_service.dart';
import 'package:projek_ahir_mobile_teori/repository/auth_repository.dart';

class TicketScreen extends StatefulWidget {
  final String? email;
  const TicketScreen({super.key, this.email});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final AuthRepository authRepository = Get.find();
  late Future<List<TicketModel>> futureTicket;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureTicket = apiService.fetcTicket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: GoogleFonts.albertSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.88, // 16% of font size
              ),
            ),
            GestureDetector(
              onTap: authRepository.logout,
              child: Text(
                widget.email ?? 'Guest',
                style: GoogleFonts.albertSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Opacity(
              opacity: 0.6,
              child: Text(
                "Popular Now",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.9,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Popular Now Card
            SizedBox(
              height: 225,
              width: double.infinity,
              child: FutureBuilder(
                future: futureTicket,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('Failed to fetch data'));
                  } else {
                    final tickets = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tickets.length,
                      itemBuilder: (context, index) {
                        final ticket = tickets[index];
                        return PopularCard(
                          title: ticket.name,
                          imageUrl: ticket.images[3].url,
                          backgroundColor: index % 2 == 0
                              ? const Color(0xFFFF4B00)
                              : Colors.black,
                          onTap: () {
                            Get.to(DetailScreen(
                              title: ticket.name,
                              date: ticket.dates.start.localDate,
                              genre: ticket.classifications.first.genre.name,
                              imageUrl: ticket.images.first.url,
                              priceRanges: ticket.priceRanges.first.max,
                              localTime: ticket.dates.start.localTime,
                            ));
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Opacity(
              opacity: 0.6,
              child: Text(
                "Top Concerts",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.9,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Top concert
            Expanded(
              child: FutureBuilder(
                future: futureTicket,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('Failed to fetch data'));
                  } else {
                    final tickets = snapshot.data!;
                    return ListView.builder(
                      itemCount: tickets.length,
                      itemBuilder: (context, index) {
                        final ticket = tickets[index];
                        return TopConcertCard(
                          title: ticket.name,
                          genre: ticket.classifications.first.genre.name,
                          date: ticket.dates.start.localDate,
                          imageUrl: ticket.images.first.url,
                          onTap: () {
                            Get.to(DetailScreen(
                              title: ticket.name,
                              date: ticket.dates.start.localDate,
                              genre: ticket.classifications.first.genre.name,
                              imageUrl: ticket.images.first.url,
                              priceRanges: ticket.priceRanges.first.max,
                              localTime: ticket.dates.start.localTime,
                            ));
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
