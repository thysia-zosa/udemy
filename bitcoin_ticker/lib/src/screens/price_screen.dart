import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/coin_data.dart';
import '../widgets/coin_card.dart';

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

  Future<void> _getRate() async {
    double result = await CoinData.getCoinData(currency: _selectedCurrency);
    setState(() {
      _rate = result.toStringAsFixed(0);
    });
  }

  List<Widget> get _getColumnItems {
    List<Widget> items = [];
    for (String crypto in cryptoList) {
      items.add(
        CoinCard(
          coin: crypto,
          rate: _rate,
          selectedCurrency: _selectedCurrency,
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _getColumnItems,
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
