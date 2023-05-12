// To parse this JSON data, do
//
//     final weatherDetailModel = weatherDetailModelFromJson(jsonString);

import 'dart:convert';

WeatherDetailModel weatherDetailModelFromJson(String str) =>
    WeatherDetailModel.fromJson(json.decode(str));

String weatherDetailModelToJson(WeatherDetailModel data) =>
    json.encode(data.toJson());

class WeatherDetailModel {
  String celcius;
  String status;
  double tempMin;
  double tempMax;
  DateTime dtTxt;

  WeatherDetailModel({
    required this.celcius,
    required this.status,
    required this.tempMin,
    required this.tempMax,
    required this.dtTxt,
  });

  factory WeatherDetailModel.fromJson(Map<String, dynamic> json) =>
      WeatherDetailModel(
        celcius: json["celcius"],
        status: json["status"],
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        dtTxt: DateTime.parse(json["dt_txt"]),
      );

  Map<String, dynamic> toJson() => {
        "celcius": celcius,
        "status": status,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "dt_txt": dtTxt.toIso8601String(),
      };
}
