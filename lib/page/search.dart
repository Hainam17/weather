import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controllers/weather_controller.dart';
class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final c = Get.put(WeatherController());
  var day = DateFormat.d().format(DateTime.now());
  var month = DateFormat.LLLL().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    TextEditingController cityText = TextEditingController();
    handleSearchCity() {
      c.fetchWeather(cityText.text);
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
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
  }
