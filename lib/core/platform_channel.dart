import 'package:flutter/services.dart';
import 'package:magnifi_ally/services/network_service.dart';

class PlatformChannel {
  void init() {
    const channel = MethodChannel("com.tifin.magnifi_ally/action");
    channel.setMethodCallHandler((call) async {
      if (call.method.toLowerCase() == "send_message") {
        print("Data11 getting started with ${call.arguments}");
        final response=await NetworkService.post("---cold_start---");
        return response;
      }
      return "welcome to magnifi ally without method response. action not found ";
    });
  }
}
