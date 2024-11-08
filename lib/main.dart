import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magnifi_ally/core/platform_channel.dart';
import 'package:magnifi_ally/core/theme.dart';
import 'package:magnifi_ally/screens/watchlist/bloc/watchlist_cubit.dart';
import 'package:magnifi_ally/services/shared_preference.dart';
import 'package:magnifi_ally/startup/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PlatformChannel().init();
  await SharedPreference().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => WatchlistCubit())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Magnifi Ally',
          theme: theme,
          home: const SplashScreen(),
        ));
  }
}
