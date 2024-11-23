import 'package:flutter/material.dart';
import 'package:projek_ahir_mobile_teori/features/profile/screens/profile_screen.dart';
import 'package:projek_ahir_mobile_teori/features/ticket/screeens/ticket_screen.dart';
import 'package:projek_ahir_mobile_teori/features/ticket/screeens/user_ticket_screen.dart';

class MainNavigation extends StatefulWidget {
  final String email;

  const MainNavigation({super.key, required this.email});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      TicketScreen(email: widget.email),
      const UserTicketScreen(),
      const ProfileScreen()
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Menampilkan halaman berdasarkan indeks
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ticket List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
