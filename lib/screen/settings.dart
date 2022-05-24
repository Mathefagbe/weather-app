import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/cubit/themes_cubit.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Settings"),
            leading: IconButton(
                onPressed: () {
                  BlocProvider.of<WeatherCubit>(context).back();
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  heightFactor: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Dark Mode",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<ThemesCubit>(context).dark();
                          },
                          icon: Icon(state.switchtheme
                              ? Icons.circle_outlined
                              : Icons.dark_mode)),
                    ],
                  ),
                ),
                Align(
                  heightFactor: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Light Mode",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<ThemesCubit>(context).light();
                          },
                          icon: Icon(state.switchtheme
                              ? Icons.light_mode
                              : Icons.circle_outlined)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
