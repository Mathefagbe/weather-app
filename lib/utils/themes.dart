import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/cubit/themes_cubit.dart';
import 'package:weather_app/logics/weatherlogics.dart';

class Changer extends StatelessWidget {
  const Changer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemesState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.switchtheme ? ThemeData.light() : ThemeData.dark(),
          home: const WeatherLogics(),
        );
      },
    );
  }
}
