// import 'package:flutter/material.dart';
// import 'app_config.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flavor Demo',
//       theme: AppConfig.theme,
//       home: Scaffold(
//         appBar: AppBar(title: Text("Brand: ${AppConfig.brandRaw.toUpperCase()}")),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Environment: ${AppConfig.envRaw}"),
//               Text("API Key: ${AppConfig.apiKey}"),
//               Image.asset('assets/current_brand/logo.png'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'brand_config.dart';

class EnvConfig {
  // Read from --dart-define
  static const String brandKey = String.fromEnvironment('BRAND');
  static const String envKey = String.fromEnvironment('ENV');
  static const String apiKey = String.fromEnvironment('API_KEY');

  static BrandConfig get brand {
    return brandKey == 'beta' ? BetaBrand() : AlphaBrand();
  }

  static String get baseUrl {
    switch (envKey) {
      case 'qa': return "https://qa-api.example.com";
      case 'prod': return "https://api.example.com";
      default: return "https://dev-api.example.com";
    }
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brand = EnvConfig.brand;
    return MaterialApp(
      title: brand.name,
      theme: brand.theme,
      home: Scaffold(
        appBar: AppBar(title: Text("${brand.name} - ${EnvConfig.envKey.toUpperCase()}")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("API Key: ${EnvConfig.apiKey}"),
              Text("Base URL: ${EnvConfig.baseUrl}"),
              const SizedBox(height: 20),
              // Asset path is dynamic based on brand
              Image.asset('assets/current_brand/logo.png', height: 100),
            ],
          ),
        ),
      ),
    );
  }
}