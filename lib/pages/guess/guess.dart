import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/bar.dart';
import 'package:weather_app/common/label.dart';
import 'package:weather_app/controllers/weather_controller.dart';
// import 'package:simple_shadow/simple_shadow.dart';

class GuessPage extends StatelessWidget {
  GuessPage({Key? key}) : super(key: key);
  final c = Get.put(WeatherController());
  @override
  Widget build(BuildContext context) {
    return Container(
        margin:const EdgeInsets.fromLTRB(20, 20, 20, 0),
        padding:const EdgeInsets.fromLTRB(0, 25, 0, 25),
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
            const Text('Tomorrow',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Label(icon: Icons.thermostat_outlined,title: 'Temperature'),
                    const SizedBox(height: 15),
                    Label(icon: Icons.water_damage_outlined,title: 'Humidity'),
                    const SizedBox(height: 15),
                    Label(icon: Icons.arrow_upward_rounded,title: 'Pressure'),
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
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 17),
                    // Text(
                    //   '${(c.guess.value.current?.temp).toString()} \u00B0',
                    //   style:const TextStyle(
                    //     fontSize: 18,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    const SizedBox(height: 17),
                    Text(
                      '${c.weathers.value.humidity} %',
                      style:const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 17),
                    Text(
                      '${c.weathers.value.pressure} PA',
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
      );
  }
}
