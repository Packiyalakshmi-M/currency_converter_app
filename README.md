# Flutter - Currency Converter App

This project is a Flutter application that allows users to convert currency from one unit to another using a free open-source API. It follows the MVVM architecture pattern and utilizes GetX for state management and GetIt for dependency injection. The app fetches real-time exchange rates via an HTTP request to an external API and performs currency conversion based on user input.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Author](#author)

## Features

- **Real-time Currency Conversion:** Converts the amount from a source currency to a target currency using an external API.
- **MVVM Architecture:** The project is structured following the MVVM pattern for better code organization and maintainability.
- **GetX State Management:** Efficient state management is handled using the GetX package.
- **Dependency Injection:** GetIt is used for injecting dependencies, making the app scalable and testable.
- **HTTP API Calls:** Utilizes the http package to fetch real-time exchange rates from an open-source API.
- **Cross-platform Support:** Fully functional on both iOS and Android devices.

## Technologies Used

- **Programming Language:** Dart
- **Framework:** Flutter
- **State Management:** GetX
- **Dependency Injection:** GetIt
- **Networking:** http package for API calls
- **IDE:** Android Studio / Visual Studio Code
- **Version Control:** Git

## Installation

Follow these steps to get the project up and running locally:

```bash
# Clone the repository
git clone https://github.com/Packiyalakshmi-M/currency_converter_app.git

# Navigate into the project directory
cd currency_converter_app

# Install dependencies
flutter pub get
```

## Usage

The following code snippet demonstrates how the app fetches exchange rates and performs currency conversion:

```

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


```

## License

This project is open source and available under the MIT License.

## Author

- Packiyalakshmi Murugan
- [LinkedIn Link](https://www.linkedin.com/in/packiyalakshmi-m-7a9844210/)
- [Github link](https://github.com/Packiyalakshmi-M/)
