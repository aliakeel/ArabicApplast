import 'dart:convert';

import 'package:http/http.dart' as http;

class MyHttpClient {
  getRequest(
    String apiUrl,
    data,
    headers,
  ) async {
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);
      final js = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return js;
      } else {
        return js;
      }
    } catch (e) {
      print('get catch inside http client');
      print(e);
    }
  }

  postRequest(
    String apiUrl,
    Map<String, dynamic>? data,
    headers,
  ) async {
    try {
      final response =
          await http.post(Uri.parse(apiUrl), body: data, headers: headers);
      var js = jsonDecode(response.body);
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return js;
      }
      return js;
    } catch (e) {
      print('post catch inside http client');
      print(e);
    }
  }

  putRequest(String apiUrl, data, headers) async {
    try {
      final response =
          await http.put(Uri.parse(apiUrl), body: data, headers: headers);
      var js = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return js;
      } else {
        return js;
      }
    } catch (e) {
      print('put catch inside http client');

      print(e);
    }
  }

  deleteRequest(String apiUrl, data, headers) async {
    try {
      final response =
          await http.delete(Uri.parse(apiUrl), body: data, headers: headers);
      var js = jsonDecode(response.body);
      print(js);
      if (response.statusCode == 200) {
        return js;
      }
      return js;
    } catch (e) {
      print('delete catch inside http client');

      print(e);
    }
  }
}
