import 'package:flutter/material.dart';
import 'package:shieldy/utils/GlobalVariables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void whenPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: whenPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(200.0), // Adjust this value to change the corner radius
        child: BottomNavigationBarTheme(
          data: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 10.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 28.0),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map, size: 28.0),
                  label: 'Map',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt, size: 28.0),
                  label: 'Camera',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.phone, size: 28.0),
                  label: 'Phone',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings, size: 28.0),
                  label: 'Settings',
                ),
              ],
              currentIndex: _page,
              onTap: navigationTapped,
              showSelectedLabels: true,
              showUnselectedLabels: true,
            ),
          ),
        ),
      ),
    );
  }
}