import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/cubit/cubit/themes_cubit.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/utils/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedStorage storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => WeatherCubit(),
      ),
      BlocProvider(
        create: (context) => ThemesCubit(),
      )
    ], child: const Changer());
  }
}
