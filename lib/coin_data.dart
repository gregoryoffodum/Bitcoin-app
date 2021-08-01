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

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'INSERT API KEY';

class CoinData {

  Future getCoinData(String selectedCurrency) async {
    Map <String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      var url = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(url);

      if(response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double price = data['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);

        return ;
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
