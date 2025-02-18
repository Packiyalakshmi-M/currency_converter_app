import 'package:currency_converter_app/Helpers/Utilities/Utilities.dart';
import 'package:currency_converter_app/Pages/HomeScreen/HomeScreenModel.dart';

class HomeScreenVM extends HomeScreenModel {
  // Function for invoke a service method to get the converted amount
  Future<void> convertToTargetCurrency() async {
    try {
      String newAmount = await currencyAPIService.getAmountForGivenCurrency(
            sourceCode: sourceCurrencyCode!.value,
            targetCode: targetCurrencyCode!.value,
            amount: amount.toString(),
          ) ??
          "";

      convertedAmount.value = double.parse(newAmount);
    } catch (ex) {
      ex.logException();
    }
  }

  // Amount TextFormField OnChanged
  void onAmountChanged({required double value}) {
    try {
      amount.value = value;
    } catch (ex) {
      ex.logException();
    }
  }

  // Source currency code dropdown selection OnChanged
  void onSourceCurrencyCodeChanged({required String code}) {
    try {
      sourceCurrencyCode!.value = code;
    } catch (ex) {
      ex.logException();
    }
  }

  // Source currency code dropdown selection OnChanged
  void onTargetCurrencyCodeChanged({required String code}) {
    try {
      targetCurrencyCode!.value = code;
    } catch (ex) {
      ex.logException();
    }
  }
}
