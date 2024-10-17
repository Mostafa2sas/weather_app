import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                colorSchemeSeed: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.condition,
                ),
                appBarTheme: AppBarTheme(
                  elevation: 2,
                  shadowColor: Colors.black,
                  backgroundColor: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.condition,
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;

    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.lightBlue;

    case 'Mist':
    case 'Patchy rain possible':
    case 'Thundery outbreaks possible':
    case 'Patchy light rain':
    case 'Fog':
    case 'Light drizzle':
    case 'Patchy light drizzle':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.blueGrey;

    case 'Moderate or heavy snow with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy showers of ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy snow showers':
    case 'Light snow showers':
    case 'Moderate or heavy sleet showers':
    case 'Light sleet showers':
    case 'Ice pellets':
    case 'Heavy snow':
    case 'Patchy heavy snow':
    case 'Moderate snow':
    case 'Patchy moderate snow':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Moderate or heavy sleet':
    case 'Light sleet':
    case 'Moderate or heavy freezing rain':
    case 'Light freezing rain':
    case 'Heavy freezing drizzle':
    case 'Freezing drizzle':
    case 'Freezing fog':
    case 'Blizzard':
    case 'Blowing snow':
    case 'Patchy freezing drizzle possible':
    case 'Patchy sleet possible':
    case 'Patchy snow possible':
      return Colors.lightBlue;

    default:
      return Colors.blue;
  }
}
