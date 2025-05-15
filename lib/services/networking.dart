import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking({required this.url});
  final String url;

  Future getData() async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      String data = res.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else
      print(res.statusCode);
    return ('Error');
  }
}
