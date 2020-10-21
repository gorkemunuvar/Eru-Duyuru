import 'dart:io';
import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';

class Networking {
  final String url;

  Networking(this.url);

  Stream<String> getStream() async* {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();

    await for (var contents in response.transform(Utf8Decoder())) {
      print(contents);
      yield contents;
    }
  }

  Future<String> getHttpClientResponse() async {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();

    await for (var contents in response.transform(Utf8Decoder())) {
      return contents;
    }
  }

  /* Future<String> getHttpClientResponse() {
    HttpClient client = new HttpClient();
    /* client.badCertificateCallback = (
      X509Certificate cert,
      String host,
      int port,
    ) =>
        true; */

    client.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      /* return response; */
      response.transform(Utf8Decoder()).listen(getString);

      /* final completer = Completer<String>();
      final contents = StringBuffer();

      response.transform(utf8.decoder).listen((data) {
        contents.write(data);
      }, onDone: () => completer.complete(contents.toString()));

      return completer.future; */
    });
  } */

  Future<Response> getData() async {
    Client client = Client();
    Response response = await client.get(url);

    return response;
  }
}

/* 
Future main() async {
  HttpClient client = new HttpClient();
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    request.response.write('Hello, world!');
    await request.response.close();
  }
}
 */
