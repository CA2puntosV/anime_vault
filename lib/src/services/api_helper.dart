import 'package:http/http.dart' as http;

class ApiHelper {
  factory ApiHelper() {
    return _singleton;
  }

  ApiHelper._internal();
  static final ApiHelper _singleton = ApiHelper._internal();

  // static final Map<String, String> headers = {
  //   'Access-Control-Allow-Origin': '*',
  //   'Accept': 'application/json',
  //   'Content-Type': 'application/json',
  // };

  Future<http.Response> get({
    required String path,
    int? id,
  }) async {
    final uri = Uri.parse('');

    final http.Response response = await http.get(
      uri,
      // headers: headers,
    );

    return response;
  }
}
