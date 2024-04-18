class WeatherAPI {
  String api(String lat, String lng) =>
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lng&current=temperature_2m,weather_code";
}
