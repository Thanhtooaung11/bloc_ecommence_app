import 'dart:convert';

import 'package:bloc_ecommence_app/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<UserModel> auth(String uri, Map<String, dynamic> data) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    http.Request request = http.Request('POST', Uri.parse(uri));

    request.body = json.encode(data);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String _data = await response.stream.bytesToString();
      Map _result = json.decode(_data);
      print(_data);
      UserModel user = UserModel.fromJson(_result);
      return user;
    } else if (response.statusCode == 400) {
      throw 'Bad request';
    } else {
      print(response.statusCode);
      throw 'No internet connection';
    }
  }
}
