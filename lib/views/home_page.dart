import 'package:flutter/material.dart';
import 'package:flutter_perlinda/views/features/profile.dart';
import 'package:flutter_perlinda/views/features/report.dart';
import 'package:flutter_perlinda/views/features/report_history.dart';
import 'package:flutter_perlinda/views/features/emergency.dart';
import 'package:flutter_perlinda/views/features/bantuan_hukum.dart';
import 'package:flutter_perlinda/views/features/bantuan_psikolog.dart';
import 'package:flutter_perlinda/views/features/undang_undang_kdrt.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Index of the selected item

  final List<String> titles = [
    'Buat Laporan',
    'Bantuan Hukum',
    'Bantuan Psikolog',
    'Riwayat Laporan',
    'Undang-Undang KDRT',
    'Telepon Darurat'
  ];

  final List<String> images = [
    'images/buat_laporan.png',
    'images/bantuan_hukum.png',
    'images/bantuan_psikolog.png',
    'images/riwayat_laporan.png',
    'images/uud_kdrt.png',
    'images/telepon_darurat.png'
  ];

  // Function to handle navigation item selection
  void _onBottomNavTapped(int index) {
    setState(() {
      if (index == 0) {
        // If Home is pressed, do nothing
        _selectedIndex = index;
      } else if (index == 1) {
        // If Profile is pressed, navigate to the profile page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      }
    });
  }

  // Function to handle grid item taps
  void _onGridItemTapped(int index) {
    if (index == 0) {
      // Navigate to Buat Laporan page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BuatLaporan()),
      );
    } else if (index == 1) {
      // Navigate to Bantuan Hukum page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BantuanHukumPage()),
      );
    } else if (index == 2) {
      // Navigate to Bantuan Psikolog page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BantuanPsikologPage()),
      );
    } else if (index == 3) {
      // Navigate to Report History page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReportHistory()),
      );
    } else if (index == 4) {
      // Navigate to UUDKDRTPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UUDKDRTPage()),
      );
    } else if (index == 5) {
      // Navigate to EmergencyScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmergencyScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with custom image and logo
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'images/logo_home.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: Image.asset(
                    'images/logo_perlinda.png',
                    width: 50.0, // Adjust the width as needed
                    height: 50.0, // Adjust the height as needed
                  ),
                ),
              ],
            ),
            // Greeting text
            Padding(
              padding: const EdgeInsets.only(top: 1.0, left: 15.0),
              child: Text(
                'Semoga harimu baik, Linda Permatasari!',
                style: TextStyle(
                  color: Color(0xFF00355C),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5.0), // Spacing

            // Grid of 6 boxes
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns in each row
                    childAspectRatio: 0.85, // Adjusted to fit text below
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _onGridItemTapped(index); // Handle item tap
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            height: 100.0, // Adjust height as needed
                            width: double
                                .infinity, // Make container take full width
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                              height: 8.0), // Spacing between box and text
                          Text(
                            titles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0, // Adjust font size as needed
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF00355C),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue, // Color of selected item
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF00355C), // Color of unselected item
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
