// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cuaca/data/model/weather_model.dart';
import 'package:cuaca/data/provider/weather_provider.dart';
import 'package:cuaca/data/repositories/weather_repositori.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cuaca/main.dart';

void main() {
  test('Test Repo', () async {
    WeatherRepositori weatherRepositori = WeatherRepositori();
    Map<String, dynamic> resultWeatherRepositori =
        await weatherRepositori.dataWeather();

    expect(resultWeatherRepositori['error'], false);
    expect(resultWeatherRepositori['data'], isNotNull);

    WeatherModel weatherModel = resultWeatherRepositori['data'];
    expect(weatherModel, isA<WeatherModel>());
  });
}
