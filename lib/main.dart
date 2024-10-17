import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/views/login_page.dart';  // Pastikan jalur ini benar
import 'app/modules/home/views/medicine_view.dart'; // Halaman Medicine yang akan Anda buat

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditek',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),        // Halaman Login
        GetPage(name: '/medicine', page: () => MedicineView()), // Halaman Medicine
      ],
    );
  }
}

