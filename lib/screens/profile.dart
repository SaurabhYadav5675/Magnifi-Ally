import 'package:flutter/material.dart';
import 'package:magnifi_ally/core/constants/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MagnifiColorPalette.primary.neutral.v0,
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          color: MagnifiColorPalette.primary.offWhite.v0,
        ),
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        elevation: 4,
        shadowColor: MagnifiColorPalette.primary.neutral.v0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        leading: Semantics(
          label: "Back",
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: MagnifiColorPalette.primary.neutral.v900,
              )),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ProfileSection(),
            // Policies(showSecondLine: true, showFAQ: false),
            // Version(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
