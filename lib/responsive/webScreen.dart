import 'package:flutter/material.dart';
import 'package:shieldy/pages/login_screen.dart';
import 'package:shieldy/resources/auth_method.dart';
import 'package:shieldy/utils/GlobalVariables.dart';
import 'package:shieldy/utils/colors.dart';

class webScreenLayout extends StatefulWidget {

  
   webScreenLayout({super.key});

  @override
  State<webScreenLayout> createState() => _webScreenLayoutState();
}

class _webScreenLayoutState extends State<webScreenLayout> {



  int _page = 0;
  late PageController pageController; //to get the  tabs animation

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
    //colour change when page changes
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor, // Set background color here
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Implement the action when the profile icon is pressed
            },
          ),
          Spacer(),

          

          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Implement the action when the notification icon is pressed
            },
          ),

          //Sign out button
          IconButton(
            onPressed: () async {
              // Show loading dialog
              _showLoadingDialog(context);
              await Future.delayed(Duration(seconds: 2));
              // Call sign out method
              await _authMethods.signOut();
              // Close the loading dialog
              Navigator.of(context).pop();
              // Navigate to login screen
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: PageView(
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: whenPageChanged,

        //children: [Text("feed page"),Text("map page"),Text(" camera page"),Text("phone page"),Text("settings page")],

        physics:
            const NeverScrollableScrollPhysics(), //stop scrolling of page by touching horizontally
      ),
      
      
    );
  }

   void _showLoadingDialog(BuildContext context) {
    print("Showing loading dialog");
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing the dialog
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Signing out...'),
              ],
            ),
          ),
        );
      },
    );
  }
}