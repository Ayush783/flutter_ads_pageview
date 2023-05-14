import 'dart:convert';

import 'package:app/api_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AppProvider extends ChangeNotifier {
  Future<String> loadRandomImage() async {
    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/random?client_id=$unsplashApiKey'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String url = data['urls']['regular'];
      return url;
    }
    return 'https://images.unsplash.com/photo-1684069158042-de27cd720172?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80';
  }

  loadAd() {}
}
