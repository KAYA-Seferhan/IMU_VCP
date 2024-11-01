import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imu_vcp/mainpage.dart';

void main() => runApp(const IMUVCP());

class IMUVCP extends StatelessWidget {
  const IMUVCP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'İstanbul Medeniyet University - Virtual Control Panel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme)),
      home: const MainPage(),
    );
  }
}
