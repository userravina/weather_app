import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Weather_app/modal/weather_modal.dart';
class Api_helper
{
   Future<WeatherModel> getweatherdata(String? lat,String? long)
   async {
     String? like="https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=21cc21e56edc421df3981ef3f14aa173";
     var response = await http.get(Uri.parse(like));
     var jsondata = jsonDecode(response.body);

     return await WeatherModel.fromJson(jsondata);

   }
}