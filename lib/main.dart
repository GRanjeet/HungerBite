import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderanytime/modules/screens/tabs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final themeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeData,
      home: const Tabs(),
    );
  }
}
