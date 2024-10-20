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
      return "Please try again";
    });
  }
}
