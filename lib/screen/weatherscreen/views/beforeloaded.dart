import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Data/storage/locationstorage.dart';
import 'package:weather_app/cubit/cubit/themes_cubit.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/lists/loationlist.dart';
import 'package:weather_app/constant/strings.dart';

class Beforeloaded extends StatefulWidget {
  const Beforeloaded({Key? key}) : super(key: key);

  @override
  State<Beforeloaded> createState() => _BeforeloadedState();
}

class _BeforeloadedState extends State<Beforeloaded> {
  late TextEditingController _textcontroller;
  String protocol = "Https:";

  // void readinfo() async {
  //   final mystore = await Completedtask.loadcomplete();
  //   setState(() {
  //     locations = mystore;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _textcontroller = TextEditingController();
    //readinfo();
  }

  @override
  void dispose() {
    _textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<ThemesCubit, ThemesState>(
          builder: (context, state) {
            return Container(
              height: 735,
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(state.switchtheme
                          ? "assets/images/mode.jpg"
                          : "assets/images/citynight.jpg"),
                      fit: BoxFit.cover,
                      opacity: 0.2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          BlocProvider.of<WeatherCubit>(context).settings();
                        },
                        icon: const Icon(Icons.settings)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Check the weather by the city",
                    style: TextStyle(fontSize: 17),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onEditingComplete: () {
                      cityname = _textcontroller.text;
                      BlocProvider.of<WeatherCubit>(context).loaded();
                      // Completedtask.savecomplete();
                    },
                    controller: _textcontroller,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search a city",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  const Spacer(),
                  const Text(
                    "My Locations",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 250,
                    width: double.maxFinite,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<WeatherCubit>(context)
                                  .loactions(locations[index]);
                            },
                            child: Container(
                              height: 250,
                              width: 150,
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              locations.removeAt(index);
                                            });
                                            // Completedtask.savecomplete();
                                          },
                                          icon:
                                              const Icon(Icons.remove_circle))),
                                  Text(
                                    locations[index].location.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${locations[index].current.tempC}",
                                    style: const TextStyle(fontSize: 60),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        protocol +
                                            locations[index]
                                                .current
                                                .condition
                                                .icon!,
                                        height: 20,
                                        width: 25,
                                      ),
                                      Text(
                                        locations[index].current.condition.text,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                  const Spacer()
                                ],
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        state.switchtheme
                                            ? "assets/images/light.jpg"
                                            : "assets/images/street.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                      opacity: 0.8),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          );
                        },
                        separatorBuilder: (contex, index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                        itemCount: locations.length),
                  ),
                  const Spacer()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
