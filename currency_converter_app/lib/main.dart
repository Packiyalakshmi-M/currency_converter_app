import 'package:currency_converter_app/App.dart';
import 'package:currency_converter_app/Services/CurrencyAPIService/CurrencyAPIService.dart';
import 'package:currency_converter_app/Services/CurrencyAPIService/ICurrencyAPIService.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() {
  runApp(const App());
  getIt.registerSingleton<ICurrencyAPIService>(CurrencyAPIService());
}
