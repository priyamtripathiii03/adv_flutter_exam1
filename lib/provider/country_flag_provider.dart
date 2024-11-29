import 'package:adv_flutter_exam1/model/model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryProvider with ChangeNotifier {
  CountryProvider() {
    fetchCountries();
  }
  List<Country> _countries = [];
  final List<Country> _savedCountries = [];

  List<Country> get countries => _countries;

  List<Country> get savedCountries => _savedCountries;

  Future<void> fetchCountries() async {
    final response =
    await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      _countries = Country.fromJsonList(jsonList);
      notifyListeners();
      print(_countries.length);
    } else {

      throw Exception('Failed to load details!');

    }
  }
  void saveCountry(Country country) {
    _savedCountries.add(country);
    notifyListeners();
  }
}
