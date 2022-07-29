import 'dart:io';

import 'package:bitcoin_ticker/src/utilities/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String _selectedCurrency = 'USD';
  String _rate = '?';

  void _updateUI(String newCurrency) {
    setState(() {
      _selectedCurrency = newCurrency;
      _rate = '?';
    });
    _getRate();
  }

  DropdownButton<String> _androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      dropdownItems.add(
        DropdownMenuItem(
          value: currency,
          child: Text(currency),
        ),
      );
    }
    return DropdownButton(
      items: dropdownItems,
      onChanged: (value) => _updateUI(value!),
      value: _selectedCurrency,
    );
  }

  CupertinoPicker _iosPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (value) => _updateUI(currenciesList[value]),
      children: pickerItems,
    );
  }

// TODO: create a method here called getData() to get the coin data from coin_data.dart
  Future<void> _getRate() async {
    double result = await CoinData.getCoinData(currency: _selectedCurrency);
    setState(() {
      _rate = result.toStringAsFixed(0);
    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: Call getData() when the screen loads up.
    _getRate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
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
                  // TODO: Update the Text Widget with the live bitcoin data here.
                  '1 BTC = $_rate $_selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              bottom: 30.0,
            ),
            color: Colors.lightBlue,
            child: Platform.isIOS ? _iosPicker() : _androidDropdown(),
          ),
        ],
      ),
    );
  }
}
