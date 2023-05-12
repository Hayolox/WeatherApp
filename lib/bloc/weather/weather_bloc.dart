import 'package:bloc/bloc.dart';
import 'package:cuaca/data/model/weather_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/weather_repositori.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepositori weatherRepositori = WeatherRepositori();

  WeatherBloc() : super(WeatherInitial()) {
    Future.delayed(Duration.zero, () {
      add(GetWeatherEvent());
    });
    on<GetWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        Map<String, dynamic> resultWeatherRepositori =
            await weatherRepositori.dataWeather();
        WeatherModel weatherModel = resultWeatherRepositori['data'];
        emit(WeatherCompleted(weatherModel));
      } catch (_) {
        emit(WeatherError());
      }
    });
  }
}
