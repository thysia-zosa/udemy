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
  // String _rate = '?';
  final Map<String, CoinCard> _coinCards = {};

  void _setNewCurrency(String newCurrency) {
    _selectedCurrency = newCurrency;
    _coinCards.forEach((key, value) {
      setState(() {
        _coinCards[key] = CoinCard(
          coin: key,
          rate: '?',
          selectedCurrency: _selectedCurrency,
        );
      });
    });
    _getRates();
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
      onChanged: (value) => _setNewCurrency(value!),
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
      onSelectedItemChanged: (value) => _setNewCurrency(currenciesList[value]),
      children: pickerItems,
    );
  }

  Future<void> _getRates() async {
    _coinCards.forEach((key, value) async {
      double result = await CoinData.getCoinData(
        currency: _selectedCurrency,
        coin: key,
      );
      setState(() {
        _coinCards[key] = CoinCard(
          coin: key,
          rate: result.toStringAsFixed(0),
          selectedCurrency: _selectedCurrency,
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
    for (String crypto in cryptoList) {
      _coinCards.addAll({
        crypto: CoinCard(
          coin: crypto,
          rate: '?',
          selectedCurrency: _selectedCurrency,
        ),
      });
    }
    _getRates();
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
            children: _coinCards.values.toList(),
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
