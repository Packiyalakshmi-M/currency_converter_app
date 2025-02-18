import 'package:currency_converter_app/Services/CurrencyAPIService/ICurrencyAPIService.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomeScreenModel extends GetxController {
  // Create an instance for ICurrencyAPIService
  final ICurrencyAPIService currencyAPIService =
      GetIt.instance<ICurrencyAPIService>();

  // State variables
  RxDouble amount = 0.0.obs;
  RxDouble convertedAmount = 0.0.obs;
  RxString? sourceCurrencyCode = "USD".obs;
  RxString? targetCurrencyCode = "USD".obs;
  List<String> currencyCodeList = [
    "USD", // United States Dollar
    "EUR", // Euro
    "GBP", // British Pound
    "JPY", // Japanese Yen
    "AUD", // Australian Dollar
    "CAD", // Canadian Dollar
    "CHF", // Swiss Franc
    "CNY", // Chinese Yuan
    "INR", // Indian Rupee
    "NZD" // New Zealand Dollar
  ].obs;
}
