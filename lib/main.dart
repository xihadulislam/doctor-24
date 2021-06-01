
import 'package:flutter/material.dart';
import 'package:flutter_doctor24/providers/DataProvider.dart';
import 'package:flutter_doctor24/screens/splahScreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DataProvider(),
        )
      ],
      child: GetMaterialApp(
        title: "Doctors 24",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
              GoogleFonts.varelaRoundTextTheme(Theme.of(context).textTheme),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
