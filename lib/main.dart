import 'package:flutter/material.dart';
import 'package:magnifi_ally/core/platform_channel.dart';
import 'package:magnifi_ally/core/theme.dart';
import 'package:magnifi_ally/screens/dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  PlatformChannel().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Magnifi Ally',
        theme: theme,
        home: const Dashboard());
  }
}
