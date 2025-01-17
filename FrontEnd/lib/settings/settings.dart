import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {


  logout() {
    print("Logout");
  }

  // alert logout
  alertLogout() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Keluar"),
          content: const Text("Apakah anda yakin ingin Keluar?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Tidak",
              style: TextStyle(
                color: Colors.red,
                )
              ),
            ),
            TextButton(
              onPressed: () => logout(),
              child: const Text("Ya",
              style: TextStyle(
                color: Colors.blue,
                )
              ),
            ),
          ],
        );
      },
    );
  }

  List<Map<String, String>> getDataUser() {
    var data = [
      {
        "name": "John Doe",
        "email": "dimas@gmail.com",
      }
    ];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [

            // sapaan
            Container(
              padding: EdgeInsets.only( top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisSize: MainAxisSize.max,
                children: [
                    Image.asset(
                          'public/image/broke.jpg',
                          width: 50,
                          height: 50,
                        ),
                    Column(
                      children: [
                        Text(
                      "Halo, ${getDataUser()[0]['name']}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      Text(
                        "${getDataUser()[0]['email']}",
                      ),
                      ],
                  )
                ],
              ),
            ),

            // button
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                minimumSize: Size(200, 50),
              ),
              onPressed: () => alertLogout(),
              child: const Text('Logout'),
            ),

          ],
        ),
      ),
    );
  }
}
