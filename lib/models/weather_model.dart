class WeatherModel {
  int id;
  int humidity;
  String country;
  String name;
  String description;
  double speed;
  double temp;
  int pressure;

  WeatherModel({
    required this.id,
    required this.country,
    required this.description,
    required this.name,
    required this.speed,
    required this.temp,
    required this.humidity,
    required this.pressure
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json["weather"][0]["id"],
        country: json["sys"]["country"],
        description: json["weather"][0]["description"],
        name: json["name"],
        speed: json["wind"]["speed"],
        temp: json["main"]["temp_min"],
        humidity: json["main"]["humidity"],
        pressure: json["main"]["pressure"],
      );
}
