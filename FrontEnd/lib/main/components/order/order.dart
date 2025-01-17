import 'package:crud_basic/main/components/order/form.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController namaMakanan = TextEditingController();
  final TextEditingController jumlah = TextEditingController();
  final TextEditingController alamat = TextEditingController();


  void pesanMakanan() {
    print("Nama Makanan: ${namaMakanan.text}");
    print("Jumlah: ${jumlah.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.all(10),
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
                          "Pesan makanan kamu",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Mau makan apa hari ini?",
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),

              SizedBox(height: 20,),

              // form inputan 
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    FormOrder(
                      textLabel : "Nama Makanan",
                      namaMakanan: namaMakanan
                    ),
                    SizedBox(height: 20,),
                    FormOrder(
                      textLabel : "Jumlah",
                      namaMakanan: jumlah
                    ),
                    FormOrder(
                      textLabel : "Jumlah",
                      namaMakanan: alamat
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () => pesanMakanan(),
                      child: Text("Pesan"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}