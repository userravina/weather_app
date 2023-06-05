import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/Weather_app/modal/weather_modal.dart';
import 'package:weather_app/Weather_app/provider/weather_provider.dart';
import 'package:weather_app/Weather_app/view/weather_app.dart';

import 'Weather_app/view/search_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => weather_provider(),
      )
    ],
    child: Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => weather_app(),
            'add': (context) => AddData(),
          },
        );
      },
    ),
  ));
}
