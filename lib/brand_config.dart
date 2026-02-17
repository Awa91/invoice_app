import 'package:flutter/material.dart';

abstract class BrandConfig {
  String get name;
  ThemeData get theme;
  String get font;
}

class AlphaBrand extends BrandConfig {
  @override
  String get name => "Alpha White-Label";
  @override
  String get font => "BrandAlphaFont";
  @override
  ThemeData get theme => ThemeData(
    primarySwatch: Colors.indigo,
    fontFamily: font,
  );
}

class BetaBrand extends BrandConfig {
  @override
  String get name => "Beta White-Label";
  @override
  String get font => "BrandBetaFont";
  @override
  ThemeData get theme => ThemeData(
    primarySwatch: Colors.deepOrange,
    fontFamily: font,
  );
}