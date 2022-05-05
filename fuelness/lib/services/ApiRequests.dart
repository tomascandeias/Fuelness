//https://rapidapi.com/bitbiscuit-bitbiscuit-default/api/motivational-quotes1/

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiRequests{

  // Singleton pattern
  static final ApiRequests _apiRequests = ApiRequests._internal();
  ApiRequests._internal();
  static ApiRequests get instance => _apiRequests;

  Future<String> makePostRequest() async {
    final response = await http.post(
      Uri.parse('https://motivational-quotes1.p.rapidapi.com/motivation'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-RapidAPI-Host': 'motivational-quotes1.p.rapidapi.com',
        'X-RapidAPI-Key': 'bb6d9c19bbmsh8cd635b99ffb09cp10306ajsn6a066ba32e2b'
      },
      body: jsonEncode(<String, String>{
        'key1': 'value',
        'key2': 'value'
      }),
    );

    if (response.statusCode == 200) {
      return await json.decode(json.encode(response.body));
    } else {
      throw Exception('Failed to get the quote from the API.');
    }
  }

}