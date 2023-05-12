import 'package:cuaca/bloc/weather/weather_bloc.dart';
import 'package:cuaca/pages/home_page.dart';
import 'package:cuaca/pages/weather_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeatherBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/weather_detail_page': (context) => const WheatherDetailPage(),
      },
    );
  }
}
