import 'package:http/http.dart';

class Networking {
  final String url;

  Networking(this.url);

  Future<Response> getData() async {
    Client client = Client();
    Response response = await client.get(url);

    return response;
  }
}
