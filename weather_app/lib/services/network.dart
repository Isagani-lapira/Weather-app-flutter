import '../utilities/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final double latitude;
  final double longitude;

  const NetworkHelper({required this.latitude, required this.longitude});
  void getData() async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/forecast', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': kAPIKey,
    });
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        var data = response.body; //content
        var decodedData = jsonDecode(data); //json data
        print(data);
      }
    } catch (e) {
      print('rar');
    }
  }
}
