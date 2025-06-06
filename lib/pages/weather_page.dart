import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/weather_model.dart';
import '../serivces/weather_services.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<WeatherPage> {
  final _weatherService = WeatherService("4876955361ce6811463de0c07cfdcab2");
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "loading city ..."),
            Lottie.asset('assets/1.json'),
            Text('${_weather?.temperture.round()}°C'),
          ],
        ),
      ),
    );
  }
}
