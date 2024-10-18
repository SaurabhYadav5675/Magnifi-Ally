import 'package:flutter/services.dart';

class PlatformChannel {
  void init() {
    const channel = MethodChannel("com.tifin.magnifi_ally/action");
    channel.setMethodCallHandler((call) async {
      if (call.method.toLowerCase() == "send_message") {
        return "welcome to magnifi ally with method response";
      }
      return "welcome to magnifi ally without method response. action not found ";
    });
  }
}
