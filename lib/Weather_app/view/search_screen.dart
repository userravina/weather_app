import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Weather_app/provider/weather_provider.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  weather_provider? weatherScreenProviderTrue;
  weather_provider? weatherScreenProviderFalse;

  @override
  Widget build(BuildContext context) {
    weatherScreenProviderFalse =
        Provider.of<weather_provider>(context, listen: false);
    weatherScreenProviderTrue =
        Provider.of<weather_provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "Assets/Images/img.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                TextField(
                  controller: weatherScreenProviderFalse!.txtcityname,
                  decoration: InputDecoration(
                    hintText: "Search City",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    String name = weatherScreenProviderTrue!.txtcityname.text;

                    if(name.isNotEmpty){
                      print(name);
                      weatherScreenProviderFalse!.changeData(name);
                      Navigator.pop(context);
                    }
                    else{
                      weatherScreenProviderFalse!.changeData(weatherScreenProviderTrue!.Name);
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 175,
                    decoration: BoxDecoration(
                      color: Color(0xff312D56),
                      border: Border.all(
                          color: Color(0xff4E3D73), width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Submit",
                      style: GoogleFonts.alice(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}