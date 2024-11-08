import 'package:flutter/material.dart';
import 'package:magnifi_ally/core/constants/colors.dart';
import 'package:magnifi_ally/core/widgets/common/loader.dart';
import 'package:magnifi_ally/screens/dashboard.dart';
import 'package:magnifi_ally/services/shared_preference.dart';
import 'package:magnifi_ally/startup/auth_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkTokenStatus() async {
    Future.delayed(const Duration(seconds: 1), () async {
      bool isTokenExist = SharedPreference().authToken.toString().isNotEmpty;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isTokenExist ? const Dashboard() : const AuthPage(),
        ),
        (Route<dynamic> route) => false,
      );
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: MagnifiColorPalette.primary.bronze.v400,
      body: FutureBuilder<bool>(
          future: checkTokenStatus(),
          builder: (ctx, snapData) {
            if (snapData.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: Loader(
                height: 500,
                width: 300,
              ));
            } else {
              return const Center(
                  child: Loader(
                height: 500,
                width: 300,
              ));
            }
          }),
    );
  }
}
