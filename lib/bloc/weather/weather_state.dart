part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherCompleted extends WeatherState {
  final WeatherModel data;

  const WeatherCompleted(this.data);

  @override
  List<Object> get props => [data];
}

class WeatherError extends WeatherState {}
