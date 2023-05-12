import 'package:cuaca/data/model/weather_model.dart';
import 'package:cuaca/data/provider/weather_provider.dart';

class WeatherRepositori {
  WeatherProvider weatherProvider = WeatherProvider();

  Future<Map<String, dynamic>> dataWeather() async {
    Map<String, dynamic> resultWeather = await weatherProvider.getDataWeather();

    if (resultWeather['error'] == true) {
      return {
        'error': true,
        'message': 'Terjadi error saat mengambil data weather',
      };
    }

    WeatherModel weatherModel = WeatherModel.fromJson(resultWeather['data']);
    return {
      'error': false,
      'message': 'Berhasil mengambil data weather',
      'data': weatherModel
    };
  }
}
