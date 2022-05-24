import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class IsError extends StatelessWidget {
  const IsError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(2),
      contentPadding: const EdgeInsets.all(2),
      title: const Text("Something went wrong"),
      elevation: 0,
      backgroundColor: Colors.grey.withOpacity(0.03),
      actions: [
        TextButton(
            onPressed: () {
              BlocProvider.of<WeatherCubit>(context).back();
            },
            child: const Text("Try again"))
      ],
      content: const Text(
        "Requested data couldn't be loaded",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
