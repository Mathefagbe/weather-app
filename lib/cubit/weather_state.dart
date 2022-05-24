// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherScreens extends WeatherState {}

class WeatherError extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<Weather> weather;
  WeatherLoaded({required this.weather});
  @override
  List<Object> get props => [weather];
}

class Location extends WeatherState {
  final Weather details;
  Location(this.details);

  @override
  List<Object> get props => [details];
}

class WeatherSettings extends WeatherState {}
