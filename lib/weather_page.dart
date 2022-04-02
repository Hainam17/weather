import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:simple_shadow/simple_shadow.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({Key? key}) : super(key: key);
  final c = Get.put(WeatherController());
  // final width = MediaQuery.of(context).size.width;
  // final height = MediaQuery.of(context).size.height;
  var day = DateFormat.d().format(DateTime.now());
  var month = DateFormat.LLLL().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    TextEditingController cityText = TextEditingController();

    handleSearchCity() {
      c.fetchWeather(cityText.text);
      // Close keyboard after enter
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
    Widget searchCity() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              Icons.search_outlined,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(width: 5),
            Expanded(
              child: TextFormField(
                controller: cityText,
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  handleSearchCity();
                },
                style: TextStyle(color: Colors.black, fontSize: 24),
                decoration: InputDecoration(
                  hintText: 'Search City',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 24),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget weatherIcon() {
      return Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          height: 150,
          child: SimpleShadow(
            opacity: 0.20,
            color: Colors.black,
            offset: Offset(3, 10),
            sigma: 30,
            child: c.isLoading.value
                ? Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
                : (c.weatherIcon.value != '' ? LottieBuilder.network(
              c.weatherIcon.value,
              fit: BoxFit.cover,
              width: 200,
            ) : const SizedBox()),
          ),
        ),
      );
    }

    Widget weatherInformation() {
      return Container(
        margin: EdgeInsets.fromLTRB(30, 40, 30, 0),
        padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          border: Border.all(
            color: Color(0xffB2C9DD),
            width: 2,
          ),
          color: Color(0xffFFFFFF).withOpacity(0.30),
        ),
        child: c.isLoading.value
            ? Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        )
            : Column(
          children: [
            // Date
            Container(
              child: Text(
                'Today, $day $month',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            // Temperature
            Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black,
                offset: Offset(3, 7),
                sigma: 25,
                child: Text(
                  '${(c.weather.value.temp - 273).toStringAsFixed(0)}\u00B0',
                  style: TextStyle(
                    fontSize: 90,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Weather Description
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                '${c.weather.value.description.toUpperCase()}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Weather Detail
            Container(
              margin: EdgeInsets.fromLTRB(0, 27, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.flag_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(height: 13),
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(height: 13),
                      Icon(
                        Icons.air,
                        color: Colors.white,
                      ),
                      SizedBox(height: 13),
                      Icon(
                        Icons.water_damage_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  // Type
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Country',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        'City',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        'Wind',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        'Humidity',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  // Divider
                  Column(
                    children: [
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  // Number
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${c.weather.value.country}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        '${c.weather.value.name}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        '${c.weather.value.speed} km/h',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        '${c.weather.value.humidity} %',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Obx(
          () => Scaffold(
        body: Container(
          // height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromRGBO(0, 29, 177, 1.0),
                Color.fromRGBO(133, 216, 236, 1.0),
              ],
            ),
          ),
          child: ListView(
            children: [
              searchCity(),
              weatherIcon(),
              weatherInformation(),
            ],
          ),
        ),
      ),
    );
  }
}