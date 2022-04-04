import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/bar.dart';
import 'package:weather_app/common/label.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:weather_app/pages/search/search.dart';
import 'package:weather_app/pages/weathericon/weathericon.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({Key? key}) : super(key: key);
  final c = Get.put(WeatherController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
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
                  const SizedBox(height: 60),
                  WeatherIcon(),
                  const SizedBox(height: 50),
                  Container(
                    margin:const EdgeInsets.fromLTRB(20, 40, 20, 0),
                    padding:const EdgeInsets.fromLTRB(0, 25, 0, 25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color:const Color(0xffB2C9DD),
                        width: 2,
                      ),
                      color:const Color(0xffFFFFFF).withOpacity(0.30),
                    ),
                    child: c.isLoading.value
                        ? Center(
                            child:const SizedBox(
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
                              Text(
                                'Today: ${c.day} ${c.month}',
                                style:const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SimpleShadow(
                                opacity: 0.25,
                                color: Colors.black,
                                offset: Offset(3, 7),
                                sigma: 25,
                                child: Text(
                                  '${(c.weather.value.temp - 273).toStringAsFixed(0)}\u00B0',
                                  style:const TextStyle(
                                    fontSize: 90,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                '${c.weather.value.description.toUpperCase()}',
                                style:const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Label(icon: Icons.flag_outlined,title: 'Country'),
                                      const SizedBox(height: 15),
                                      Label(icon:Icons.location_on_outlined,title: 'City'),
                                      const SizedBox(height: 15),
                                      Label(icon: Icons.air,title: 'Wind'),
                                      const SizedBox(height: 15),
                                      Label(icon: Icons.water_damage_outlined,title: 'Humidity'),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Bar(),
                                      const SizedBox(height: 13),
                                      Bar(),
                                      const SizedBox(height: 13),
                                      Bar(),
                                      const SizedBox(height: 13),
                                      Bar(),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${c.weather.value.country}',
                                        style:const  TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 17),
                                      Text(
                                        '${c.weather.value.name}',
                                        style:const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 17),
                                      Text(
                                        '${c.weather.value.speed} km/h',
                                        style:const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 17),
                                      Text(
                                        '${c.weather.value.humidity} %',
                                        style:const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                  )
                ],
              ),
            ),
            SafeArea(child: SearchPage()),
          ],
        ),
      ),
    );
  }
}
