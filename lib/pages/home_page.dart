import 'package:cuaca/bloc/weather/weather_bloc.dart';
import 'package:cuaca/data/model/weather_detail_model.dart';
import 'package:cuaca/data/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant/format_date.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherBloc weatherB = context.read<WeatherBloc>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: weatherB,
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: Text('Loading'),
              );
            }

            if (state is WeatherCompleted) {
              WeatherModel data = state.data;
              return Center(
                child: ListView.builder(
                  itemCount: data.list.length,
                  itemBuilder: (context, index) {
                    String formattedDateTime =
                        formatDateTime(data.list[index].dtTxt.toString());
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/weather_detail_page',
                              arguments: WeatherDetailModel(
                                celcius: (data.list[index].main.temp - 273.15)
                                    .toStringAsFixed(2),
                                status: data.list[index].weather[0].main,
                                tempMin: data.list[index].main.tempMin,
                                tempMax: data.list[index].main.tempMax,
                                dtTxt: data.list[index].dtTxt,
                              ),
                            );
                          },
                          child: ListTile(
                            leading: data.list[index].weather[0].main == 'Rain'
                                ? Image.asset('assets/rain.png')
                                : Image.asset('assets/cloud.png'),
                            title: Text(formattedDateTime),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.list[index].weather[0].main),
                                Text(
                                    'Temp ${(data.list[index].main.temp - 273.15).toStringAsFixed(2)}°C')
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              );
            }

            return const Center(
              child: Text('Error'),
            );
          },
        ));
  }
}
