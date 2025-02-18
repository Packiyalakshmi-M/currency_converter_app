import 'dart:convert';

import 'package:currency_converter_app/Helpers/Utilities/Utilities.dart';
import 'package:currency_converter_app/Services/CurrencyAPIService/ICurrencyAPIService.dart';
import 'package:http/http.dart' as http;

class CurrencyAPIService implements ICurrencyAPIService {
  @override
  Future<String?> getAmountForGivenCurrency(
      {required String sourceCode,
      required String targetCode,
      required String amount}) async {
    try {
      var client = http.Client();
      var response = await client.get(
        Uri.parse(
            "https://v6.exchangerate-api.com/v6/7dad10f606012563a156f98f/pair/$sourceCode/$targetCode/$amount"),
      );
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return decodedResponse['conversion_result'].toString();
    } catch (ex) {
      ex.logException();
      return null;
    }
  }
}
