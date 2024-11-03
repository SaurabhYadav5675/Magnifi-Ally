import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:magnifi_ally/services/network_service.dart';

class PlatformChannel {
  void init() {
    const channel = MethodChannel("com.tifin.magnifi_ally/action");
    channel.setMethodCallHandler((call) async {
      if (call.method.toLowerCase() == "send_message") {
        final response = await NetworkService.post(call.arguments);
        return response;
      }
      if (call.method.toLowerCase() == "show_watchlist") {
        final response = await NetworkService.get(
            url: "https://api.magnifi.com/go-profile-service/watchlist/list");
        if (response.statusCode == 200) {
          var jsonData = response.data;
          return jsonEncode(jsonData);
        } else {
          return "Please try again";
        }
      }
    });
  }
}
