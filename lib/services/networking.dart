import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking({required this.url});
  final String url;

  void getData() async {
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      String data = res.body;
      print(data);
      var decodedData = jsonDecode(data);

      var Longitude = decodedData['coord']['lon'];
      var weadetails = decodedData['weather'][0]['id'];
      var cityname = decodedData['name'];
      print(Longitude);
      print(weadetails);
      print(cityname);
    } else
      print(res.statusCode);
  }
}
