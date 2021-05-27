

import 'package:flutter/material.dart';

import 'drawer_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Stack(
        children: [
         DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
