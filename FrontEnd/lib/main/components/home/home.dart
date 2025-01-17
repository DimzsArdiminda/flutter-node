import 'package:crud_basic/main/components/carousel.dart';
import 'package:crud_basic/main/components/listViewdata.dart';
import 'package:crud_basic/main/data/data.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Map<String, dynamic>> dataDummy = [];

  @override
  void initState() {
    super.initState();
    dataDummy = dataDummymakanan();
  }

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
    return Scaffold(
      body: DefaultTabController(
        length: 3, // Jumlah tab
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
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

                CarouselDashboard(),
                const SizedBox(height: 20),

                const Text(
                  "Menu Hari Ini",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text("Pilih menu makanan favoritmu"),
                const SizedBox(height: 20),

                TabBar(
                  isScrollable: true,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  tabs: const [
                    // Tab(
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    //     child: Icon(Icons.fastfood, size: 20),
                    //   )
                    // ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text("Semua"),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text("Rekomendasi"),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text("Pesan Lagi"),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Menggunakan batasan ukuran agar tidak error pada TabBarView
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: TabBarView(
                    children: [
                      ListViewProdukDashboard(dataDummy: dataDummy),
                      ListViewProdukDashboard(dataDummy: dataDummy),
                      ListViewProdukDashboard(dataDummy: dataDummy),
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
