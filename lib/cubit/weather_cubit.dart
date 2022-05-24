import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_app/Data/api_manger/service.dart';
import 'package:weather_app/Data/models/weathermodel.dart';

import 'package:weather_app/lists/loationlist.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial()) {
    emit(WeatherScreens());
  }

  final datas = DataService();
  void loaded() async {
    try {
      emit(WeatherLoading());
      final datainfo = await datas.weatherinfo();
      locations.add(datainfo);

      emit(WeatherLoaded(weather: locations));
    } catch (e) {
      emit(WeatherError());
    }
  }

  void loactions(details) {
    emit(Location(details));
  }

  void settings() {
    emit(WeatherSettings());
  }

  void back() {
    emit(WeatherScreens());
  }

  void remov() {
    emit(WeatherScreens());
  }
}
