import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: false,
          flexibleSpace: Container(
            color: MagnifiColorPalette.primary.offWhite.v0,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
          elevation: 4,
          shadowColor: MagnifiColorPalette.primary.neutral.v0,
          title: const Text(
            'Magnifi Ally',
            style: TextStyle(color: Colors.black, fontSize: 20),
          )),
      body: const Center(child: Text('Welcome to Magnifi Ally.')),
    );
  }
}
