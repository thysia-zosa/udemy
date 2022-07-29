import 'package:flutter/material.dart';

import 'screens/price_screen.dart';

class BitcoinTicker extends StatelessWidget {
  const BitcoinTicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
        ),
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PriceScreen(),
    );
  }
}
