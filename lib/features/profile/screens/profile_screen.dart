import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_ahir_mobile_teori/repository/auth_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository = Get.find();
    const Color primaryColor = Color(0xFFFF4B00); // Warna utama

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Heading
                const SizedBox(height: 40),
                Text(
                  "MY PROFILE",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),

                const SizedBox(height: 30),

                // Profile Image
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: primaryColor.withOpacity(0.2),
                        backgroundImage: const AssetImage(
                          'assets/dejan.jpeg',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Name Section
                _buildProfileItem(
                  title: "Nama",
                  content: "Dejan Azul Ultamar", // Contoh nama
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 20),

                // Kesan Section
                _buildProfileItem(
                  title: "Kesan Mata Kuliah",
                  content: "Mata kuliah yang sangat menantang :D",
                  icon: Icons.text_snippet_outlined,
                ),
                const SizedBox(height: 20),

                // Saran Section
                _buildProfileItem(
                  title: "Saran Mata Kuliah",
                  content:
                      "Mungkin tugas dan projek akhir nya bisa lebih diringankan lagi, seperti projek akhir yang berkelompok misalnya :D",
                  icon: Icons.feedback_outlined,
                ),
                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      authRepository.logout();
                    },
                    child: Text(
                      "Logout",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan item profil
  Widget _buildProfileItem(
      {required String title,
      required String content,
      required IconData icon}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.black.withOpacity(0.7),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
