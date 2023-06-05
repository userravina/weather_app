import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/Weather_app/modal/weather_modal.dart';
import 'package:weather_app/Weather_app/provider/weather_provider.dart';

class weather_app extends StatefulWidget {
  const weather_app({Key? key}) : super(key: key);

  @override
  State<weather_app> createState() => _weather_appState();
}

class _weather_appState extends State<weather_app> {
  weather_provider? pt;
  weather_provider? pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<weather_provider>(context, listen: true);
    pf = Provider.of<weather_provider>(context, listen: false);

    return SafeArea(
        child: Scaffold(
      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(" Error :- ${snapshot.hasError}");
            } else if (snapshot.hasData) {
              WeatherModel weatherModel = snapshot.data!;
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 100.w,
                          height: 100.h,
                          color: Colors.grey,
                          child: Image.asset(
                            "assets/images/w1.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 100.w,
                          height: 30.h,
                          color: Colors.grey,
                          child: Image.asset(
                            "assets/images/w11.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 33.h),
                      child: Container(
                        height: 30.h,
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        alignment: Alignment.center,
                        child: Text(
                          "${weatherModel.name}",
                          style: GoogleFonts.alice(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12.h),
                      child: Container(
                        height: 40.h,
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        alignment: Alignment.center,
                        child: Text(
                          "${weatherModel.main!.temp} °C",
                          style: GoogleFonts.alice(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 400, left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20.h,
                            width: 27.w,
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(height: 5.w),
                                Image.asset(
                                  "assets/images/w2.png",
                                  height: 10.h,
                                ),
                                Text(
                                  "${weatherModel.wind!.speed} m/s",
                                  style: GoogleFonts.alice(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Wind",
                                  style: GoogleFonts.alice(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 20.h,
                            width: 27.w,
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(height: 5.w),
                                Image.asset(
                                  "assets/images/w33.png",
                                  height: 10.h,
                                ),
                                Text(
                                  "${weatherModel.main!.pressure} hPa",
                                  style: GoogleFonts.alice(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Pressure",
                                  style: GoogleFonts.alice(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 20.h,
                            width: 27.w,
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(height: 5.w),
                                Image.asset(
                                  "assets/images/w4.png",
                                  height: 10.h,
                                ),
                                Text(
                                  "${weatherModel.main!.humidity} %",
                                  style: GoogleFonts.alice(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Humidity",
                                  style: GoogleFonts.alice(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 6.h,
                        child: Row(
                          children: [
                            Container(
                                height: 5.h,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white54,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Container(
                                height: 5.h,
                                width: 88.w,
                                decoration: BoxDecoration(color: Colors.white12,borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
                                child: DropdownButton(
                                  icon: Icon(Icons.add,
                                      size: 15.sp, color: Color(0x696969)),
                                  underline: Container(),
                                  dropdownColor: Colors.transparent,
                                  alignment: Alignment.center,
                                  items: pf!.citylist
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              "$e",
                                              style: GoogleFonts.alice(
                                                color: Colors.white70,

                                              ),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  value: pt!.selectcity,
                                  onChanged: (value) {
                                    pf!.changeitem(value as String);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 570, left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TempMin",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "${weatherModel.main!.tempMin}",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 610),
                      child: Divider(height: 2, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 630, left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TempMax",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "${weatherModel.main!.tempMax}",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 680),
                      child: Divider(height: 2, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 700, left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sea_level",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "${weatherModel.main!.seaLevel}",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 740),
                      child: Divider(height: 2, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 760, left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "grnd_level",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "${weatherModel.main!.grndLevel}",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 800),
                      child: Divider(height: 2, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 820, left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "speed",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "${weatherModel.wind!.speed}",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 860),
                      child: Divider(height: 2, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 870, left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "deg",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "${weatherModel.wind!.deg}",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 920),
                      child: Divider(height: 2, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 940, left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "visibility",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "${weatherModel.visibility}",
                            style: GoogleFonts.alice(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 980),
                      child: Divider(height: 2, color: Colors.white),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
          future: pt!.getWeather(pt!.namecity[pt!.index].lat!,pt!.namecity[pt!.index].long!)),
    ));
  }
}
