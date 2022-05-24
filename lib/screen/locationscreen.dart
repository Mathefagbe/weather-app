import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelines/timelines.dart';
import 'package:weather_app/cubit/cubit/themes_cubit.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String protocol = "Https:";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          var info = state as Location;
          return BlocBuilder<ThemesCubit, ThemesState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
                child: Column(
                  children: [
                    Container(
                        alignment: AlignmentDirectional.centerStart,
                        height: 50,
                        width: double.maxFinite,
                        child: IconButton(
                            onPressed: () {
                              BlocProvider.of<WeatherCubit>(context).back();
                              //readinfo();
                            },
                            icon:
                                const Icon(Icons.arrow_circle_left_outlined))),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: 180,
                      child: Column(
                        children: [
                          const Spacer(),
                          Image.network(
                            protocol + info.details.current.condition.icon!,
                            height: 70,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            info.details.location.name,
                            style: const TextStyle(fontSize: 40),
                          ),
                          Text(
                            info.details.current.condition.text,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          Text(info.details.location.localtime.split(" ").last,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300)),
                          const Spacer()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${info.details.current.tempC}⁰",
                      style: const TextStyle(fontSize: 80),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Timeline.tileBuilder(
                            builder: TimelineTileBuilder.connected(
                                nodePositionBuilder: (context, index) {
                                  return 0.1;
                                },
                                lastConnectorBuilder: (context) {
                                  return Connector.solidLine(
                                    thickness: 1.5,
                                    color: const Color.fromARGB(
                                        176, 224, 224, 224),
                                  );
                                },
                                indicatorBuilder: (context, index) {
                                  return const Icon(
                                    Icons.circle_outlined,
                                    color: Color.fromARGB(176, 224, 224, 224),
                                  );
                                },
                                indicatorPositionBuilder: ((context, index) {
                                  return 0;
                                }),
                                connectionDirection: ConnectionDirection.before,
                                contentsBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    height: 200,
                                    width: double.maxFinite,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Weather details",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Cloudy",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "${info.details.current.cloud}%",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "chance of rain",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "${info.details.forecast.forecastday[index].hour[index].chanceOfRain}%",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "humidity",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "${info.details.current.humidity}%",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "feelslike",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "${info.details.current.feelslikeC}⁰",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount: 1)),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(state.switchtheme
                            ? "assets/images/mode.jpg"
                            : "assets/images/citynight.jpg"),
                        fit: BoxFit.cover,
                        opacity: 0.7)),
              );
            },
          );
        },
      ),
    );
  }
}
