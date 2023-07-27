import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mplus_app/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[700],
        appBarTheme: AppBarTheme(
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle()
                .copyWith(statusBarColor: Colors.transparent)),
        textTheme: GoogleFonts.notoSansThaiTextTheme(),
        // textTheme: GoogleFonts.mitrTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}
