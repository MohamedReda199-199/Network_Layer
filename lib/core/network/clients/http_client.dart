import 'package:http/http.dart' as http;

class HttpClient {
  HttpClient._();

  static final http.Client client = http.Client();
}
