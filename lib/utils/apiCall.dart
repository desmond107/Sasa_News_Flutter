import 'dart:collection';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiCall {
  Map<String, String> headers = HashMap();

  Future<http.Response> sendGet(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _loggedin = prefs.getBool('isUserLoggedIn') ?? false;
    return await http.get(
      url,
      headers: _loggedin
          ? {HttpHeaders.authorizationHeader: prefs.getString('accessToken')}
          : null,
    );
  }

  Future<http.Response> sendPost(String url, var payload) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _loggedin = prefs.getBool('isUserLoggedIn') ?? false;

    return await http.post(
      url,
      body: payload,
      headers: _loggedin
          ? {HttpHeaders.authorizationHeader: prefs.getString('accessToken')}
          : null,
    );
  }

  Future<http.Response> sendPatch(String url, headers, var payload) async {
    return await http.patch(url, body: payload);
  }
}
