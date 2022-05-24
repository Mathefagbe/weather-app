import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/screen/locationscreen.dart';
import 'package:weather_app/screen/settings.dart';

import 'package:weather_app/screen/weatherscreen.dart';
import 'package:weather_app/widgets/iserror.dart';
import 'package:weather_app/widgets/isloading.dart';

class WeatherLogics extends StatelessWidget {
  const WeatherLogics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherScreens) {
          return const WeatherScreen();
        }
        if (state is WeatherLoading) {
          return const IsLoading();
        }
        if (state is WeatherLoaded) {
          return const WeatherScreen();
        }

        if (state is WeatherError) {
          return const IsError();
        }

        if (state is Location) {
          return const LocationScreen();
        }
        if (state is WeatherSettings) {
          return const Settings();
        } else {
          return Container();
        }
      },
    );
  }
}
