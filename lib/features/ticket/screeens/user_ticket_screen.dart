import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTicketScreen extends StatelessWidget {
  const UserTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('purchasedTickets');
    final tickets = box.values.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Purchased Tickets",
            style: GoogleFonts.albertSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 2.5),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: tickets.isEmpty
          ? Center(
              child: Text(
                "No tickets purchased yet.",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return ListTile(
                  title: Text(
                    ticket['title'],
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${ticket['date']} - ${ticket['localTime']}"),
                  trailing: Text("\$${ticket['priceRanges']}"),
                );
              },
            ),
    );
  }
}
