abstract class ICurrencyAPIService {
  Future<String?> getAmountForGivenCurrency({
    required String sourceCode,
    required String targetCode,
    required String amount,
  });
}
