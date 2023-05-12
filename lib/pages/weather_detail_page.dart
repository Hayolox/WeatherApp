import 'package:cuaca/constant/format_date.dart';
import 'package:flutter/material.dart';

import '../data/model/weather_detail_model.dart';

class WheatherDetailPage extends StatelessWidget {
  const WheatherDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as WeatherDetailModel;

    String date = formatDate(args.dtTxt.toString());
    String time = formatTime(args.dtTxt.toString());
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            Text(
              date,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              time,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${args.celcius} C',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                args.status == 'Rain'
                    ? Image.asset(
                        'assets/rain.png',
                        height: 50,
                      )
                    : Image.asset(
                        'assets/cloud.png',
                        height: 50,
                      ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              args.status,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text('Temp (min)'),
                    Text(
                      '${args.tempMin.toStringAsFixed(2)} C',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Temp (max)'),
                    Text(
                      '${args.tempMax.toStringAsFixed(2)} C',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
