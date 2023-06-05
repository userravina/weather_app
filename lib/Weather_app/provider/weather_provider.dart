import 'package:flutter/material.dart';
import 'package:weather_app/Weather_app/modal/weather_modal.dart';
import 'package:weather_app/utils/api_helper/Api_Weather.dart';

import '../modal/modal_simple.dart';

class weather_provider extends ChangeNotifier{

  Future<WeatherModel> getWeather(String l1,String l2)
  async {
    Api_helper api_helper = Api_helper();
    return await api_helper.getweatherdata(l1,l2);
  }

   // Change weather
  String Name = "Surat";
  TextEditingController txtcityname = TextEditingController();

  List<Simple_modal> namecity = [
    Simple_modal(lat:"21.1702" ,long: "72.8311",cityname: "Surat"),
    Simple_modal(lat:"26.9124" ,long: "75.7873",cityname: "jaypur"),
    Simple_modal(lat:"22.3039" ,long: "70.8022",cityname: "Rajkot"),
    Simple_modal(lat:"31.1048" ,long: "77.1734",cityname: "Shimla"),
    Simple_modal(lat:"28.7041" ,long: "77.1025",cityname: "Delhi"),
    Simple_modal(lat:"23.2599" ,long: "77.4126",cityname: "Bhopal"),
    Simple_modal(lat:"22.5726",long: "88.3639",cityname: "Kolkata"),
    Simple_modal(lat:"26.8467" ,long: "80.9462",cityname: "Lucknow"),
  ];
  List<String> citylist = [
    "Surat","jaypur","Rajkot","Shimla","Delhi","Bhopal","Kolkata","Lucknow"
  ];
  String selectcity = "Surat";
  int index = 0;

  void changeitem(String value)
  {
    selectcity = value;
    index = citylist.indexOf(value);
    notifyListeners();
  }
  void changeData(String name){
    Name = name;
    notifyListeners();
  }
}