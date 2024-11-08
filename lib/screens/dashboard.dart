import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magnifi_ally/core/constants/magnifi_assets.dart';
import 'package:magnifi_ally/screens/profile.dart';
import 'package:magnifi_ally/screens/watchlist/watch_list.dart';

import '../core/constants/colors.dart';
import 'home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late PageController pageController = PageController();
  List<Widget> pages = [const Home(), const WatchList()];
  int _currentIndex = 0;

  void _onTap(int index) {
    pageController.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        elevation: 4,
        shadowColor: MagnifiColorPalette.primary.neutral.v0,
        title: const Text(
          'Magnifi Ally',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const Profile()))
                },
                child: SvgPicture.asset(
                  MagnifiSvg.assetProfile,
                  colorFilter: ColorFilter.mode(
                    MagnifiColorPalette.primary.neutral.v900,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) => pages[index],
        itemCount: pages.length,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outlined),
            label: 'Watchlist',
          ),
        ],
      ),
    );
  }
}
