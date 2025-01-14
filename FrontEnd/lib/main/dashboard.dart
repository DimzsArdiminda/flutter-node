// import 'package:crud_basic/main/components/button.dart';
import 'package:crud_basic/main/components/carousel.dart';
import 'package:crud_basic/main/components/listViewdata.dart';
import 'package:crud_basic/main/data/data.dart';
import 'package:crud_basic/settings/settings.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String getTimer() {
    if (DateTime.now().hour < 12) {
      return 'Good Morning';
    } else if (DateTime.now().hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  String getUserData() {
    return 'User';
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataDummy = dataDummymakanan();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(context, 
            MaterialPageRoute(builder: (context) => const Settings())),

          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${getTimer()}, ${getUserData()} 👋",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Selamat datang di aplikasi QWERTY",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sapaan dan deskripsi
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Halo, ${getUserData()}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Mau makan apa hari ini?",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      'public/image/broke.jpg',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Carousel Slider
              CarouselDashboard(),

              const SizedBox(height: 20),

              // Sorting Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Pilih Menu",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sorting sesuai kemauanmu",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // List of Menu
              ListViewProdukDashboard(dataDummy: dataDummy),
            ],
          ),
        ),
      ),
    );
  }
}
