import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mplus_app/app/pages/home/home_controller.dart';
import 'package:mplus_app/app/pages/home/home_page.dart';
import 'package:mplus_app/data/data_sources/local/cached_service.dart';
import 'package:mplus_app/data/data_sources/remote/rest_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs().init();
  DioClient().init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: const MyApp(),
    ),
  );
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
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}
