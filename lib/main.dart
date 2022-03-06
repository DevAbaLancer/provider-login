import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_test_login/providers/counter_provider.dart';
import 'package:provider_test_login/screens/details_page.dart';
import 'package:provider_test_login/screens/widgets/custom_text_field.dart';

import 'screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        canvasColor: Colors.black,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16,
          ),
          bodyText2: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 14,
          ),
          headline1: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headline2: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          headline3: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          headline4: GoogleFonts.roboto(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal),
          headline5: GoogleFonts.mukta(
            color: Colors.white,
            fontSize: 40,
          ),
          headline6: GoogleFonts.sansitaSwashed(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
