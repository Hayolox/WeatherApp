import 'package:cuaca/constant/api.dart';

class WeatherProvider {
  final API _api = API();

  Future<Map<String, dynamic>> getDataWeather() async {
    try {
      final response = await _api.dio.get(
          'data/2.5/forecast?lat=-6.302287708604747&lon=106.6541003450607&appid=fc8f334a154550ae2d8f6f1055efbb1d');

      if (response.statusCode != 200) {
        return {
          'error': true,
          'message': '${response.statusCode}',
        };
      }

      return {
        'error': false,
        'message': '${response.statusCode}',
        'data': response.data
      };
    } catch (e) {
      return {
        'error': true,
        'message': '$e',
      };
    }
  }
}
