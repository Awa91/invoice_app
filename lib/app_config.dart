import 'package:flutter/material.dart';

enum Brand { alpha, beta }
enum Environment { dev, qa, prod }

class AppConfig {
  static const String brandRaw = String.fromEnvironment('BRAND');
  static const String envRaw = String.fromEnvironment('ENV');
  static const String apiKey = String.fromEnvironment('API_KEY');

  static Brand get brand => brandRaw == 'beta' ? Brand.beta : Brand.alpha;

  static ThemeData get theme {
    return brand == Brand.alpha
        ? ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'BrandAlphaFont')
        : ThemeData(primarySwatch: Colors.orange, fontFamily: 'BrandBetaFont');
  }
}