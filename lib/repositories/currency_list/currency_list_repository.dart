import 'dart:convert';
import 'package:currency_converter/repositories/currency_list/models/currency.dart';
import 'package:dio/dio.dart';

String apiURL = 'https://www.cbr-xml-daily.ru/daily_json.js';

class CurrencyListRepository {
  Future<String> getUpdatedTime() async {
    final response = await Dio().get(apiURL);
    final data = jsonDecode(response.data) as Map<String, dynamic>;
    final String timestamp = data['Timestamp'];
    return timestamp;
  }

  Future<List<Currency>> getCurrencyList() async {
    final response = await Dio().get(apiURL);
    final data = jsonDecode(response.data) as Map<String, dynamic>;

    final currencies = data['Valute'] as Map<String, dynamic>;
    final allCurrencyList = currencies.entries
        .map((e) => Currency(
            name: e.key,
            priceInRUB: ((e.value as Map<String, dynamic>)['Nominal'] == 1)
                ? (e.value as Map<String, dynamic>)['Value']
                : (e.value as Map<String, dynamic>)['Value'] /
                    (e.value as Map<String, dynamic>)['Nominal']))
        .toList();
    final neededCurrencyList = <Currency>[];
    for (var element in allCurrencyList) {
      switch (element.name) {
        case 'AZN':
        case 'AMD':
        case 'BYN':
        case 'KZT':
        case 'KGS':
        case 'USD':
        case 'EUR':
          neededCurrencyList.add(element);
      }
    }
    return neededCurrencyList;
  }
}
