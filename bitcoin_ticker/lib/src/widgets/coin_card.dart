import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    Key? key,
    required String coin,
    required String rate,
    required String selectedCurrency,
  })  : _coin = coin,
        _rate = rate,
        _selectedCurrency = selectedCurrency,
        super(key: key);

  final String _coin;
  final String _rate;
  final String _selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 28.0,
          ),
          child: Text(
            '1 $_coin = $_rate $_selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
