import 'dart:convert';

import 'package:http/http.dart' as http;

class ClassifyTweet {
  static Future<String> classifyTweet(String tweet) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://127.0.0.1:5000/predict'));
    request.body = json.encode({"text": tweet});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final result = jsonDecode(await response.stream.bytesToString())
          as Map<String, dynamic>;

      return result['prediction'] as String;
    } else {
      print(response.reasonPhrase);
      return '';
    }
  }
}
