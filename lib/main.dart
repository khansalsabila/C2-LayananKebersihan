// ignore_for_file: non_constant_identifier_names

import 'package:firedart/firedart.dart'; /// digunakan untuk berinteraksi dengan layanan Firebase.
import 'package:flutter/material.dart'; /// untuk membangun antarmuka pengguna (UI).
import 'package:get/get.dart'; ///  paket yang digunakan untuk manajemen state dan navigasi dalam Flutter
import 'package:hive_flutter/hive_flutter.dart'; /// digunakan untuk penyimpanan lokal (kemungkinan database Hive).
import 'package:login_app/data/hive_store.dart';
import 'package:login_app/data/token_adapter.dart';
import 'package:login_app/ui/login_page.dart';
import 'package:login_app/ui/splash_screen.dart';

///Menambahkan firebase untuk memasukkan akun///
const apiKey = "AIzaSyDNExE1QxkeM_AMvABVGuz69IwFO-zH1v4";
const projectId = "kebersihan-53a70";

//method untuk menyimpan data login//
void main() async {
  Firestore.initialize('kebersihan-53a70');

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  await Hive.initFlutter(); ///menginisialisasi Hive untuk Flutter.
  Hive.registerAdapter(TokenAdapter()); ///mendaftarkan adapter Hive untuk TokenAdapter.

///  menginisialisasi Otentikasi Firebase dengan kunci API yang diberikan dan toko Hive untuk persistensi.
  FirebaseAuth.initialize(apiKey, await HiveStore.create());

  runApp(const MyApp());
}

class Firebase {
  static initializeApp() {}
}

//Explanation of what the query code is for
//what will be geanerated by this query when run
//Membuat class//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // untuk menampilkan halaman selanjutnya yang dibuka//
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kebersihan Kota',
        home: const SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContextcontext) => LoginPage()
        });
  }
}
