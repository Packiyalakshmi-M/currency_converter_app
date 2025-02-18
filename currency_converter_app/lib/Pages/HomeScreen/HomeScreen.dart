import 'package:currency_converter_app/Pages/HomeScreen/HomeScreenVM.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final HomeScreenVM _homeScreenVM = Get.put(HomeScreenVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text("Currency converter app"),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter amount",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    _homeScreenVM.onAmountChanged(value: double.parse(value));
                  },
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Source currency code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 44,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _homeScreenVM.sourceCurrencyCode!.value,
                    items: _homeScreenVM.currencyCodeList.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (String? newSource) {
                      _homeScreenVM.onSourceCurrencyCodeChanged(
                        code: newSource ?? "",
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Target currency code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 44,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: _homeScreenVM.targetCurrencyCode!.value,
                    items: _homeScreenVM.currencyCodeList.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (String? newTarget) {
                      _homeScreenVM.onTargetCurrencyCodeChanged(
                        code: newTarget ?? "",
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width - 44,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.amber[100]),
                    ),
                    onPressed: () {
                      _homeScreenVM.convertToTargetCurrency();
                    },
                    child: Text(
                      "Convert",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Converted amount: ${_homeScreenVM.convertedAmount.value}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
