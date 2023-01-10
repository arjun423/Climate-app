import 'package:http/http.dart' as http;
import 'dart:convert';

class Net {
  Net(this.url);
  final url;
  Future jso() async {
    try {
      http.Response res = await http.get(url);
      return jsonDecode(res.body);
    } catch (e) {
      return e;
    }
  }
}
