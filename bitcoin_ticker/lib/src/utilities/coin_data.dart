import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinApiHost = 'rest.coinapi.io';
const coinApiPath = '/v1/exchangerate';
const apiKey = '5F8C2464-C832-4AE7-A0B2-138A60CE32C3';

class CoinData {
  static Future<double> getCoinData({
    required String currency,
    String coin = 'BTC',
  }) async {
    try {
      http.Response response = await http.get(
          Uri.https(
            coinApiHost,
            '$coinApiPath/$coin/$currency',
          ),
          headers: {
            'X-CoinAPI-Key': apiKey,
          });
      Map<String, dynamic> result = json.decode(response.body);
      return result['rate'];
    } catch (e, s) {
      print('Error fetching bitcoin data:\n$e\n$s');
      return 0.0;
    }
  }
}
