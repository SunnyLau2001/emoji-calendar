class WeatherDetail {
  final DateTime dateTime;
  final double temp;
  final String weather;

  const WeatherDetail({
    required this.dateTime,
    required this.temp,
    required this.weather,
  });

  factory WeatherDetail.fromJson(Map<String, dynamic> json) {
    return WeatherDetail(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      temp: json['main']['temp'],
      weather: json['weather'].length == 0 ? "" : json['weather'][0]['main'],
    );
  }
}
