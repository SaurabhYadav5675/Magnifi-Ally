import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
        'Magnifi Ally',
        style: TextStyle(color: Colors.black, fontSize: 20),
      )),
      body: const Center(child: Text('Welcome to Magnifi Ally.')),
    );
  }
}
