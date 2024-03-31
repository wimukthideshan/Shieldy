import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shieldy/pages/login_screen.dart';
import 'package:shieldy/resources/auth_method.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:shieldy/widgets/HOmemain_container.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _logoWidth = 100;
  double _logoHeight = 50;

  void _animateLogo() {
    setState(() {
      _logoWidth = 150; // Adjust to target width
      _logoHeight = 75; // Adjust to target height
    });
  }



  // Create an instance of AuthMethods
  final AuthMethods _authMethods = AuthMethods();


  

  // Method to show loading dialog
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(121212),
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: AnimatedContainer(
        duration: Duration(seconds: 1), // Adjust duration as needed
        curve: Curves.easeInOut, // Adjust curve as needed
        width: _logoWidth, // Define initial width
        height: _logoHeight, // Define initial height
        child: GestureDetector(
          onTap: () {
            _animateLogo(); // Trigger animation on tap
          },
          child: Image.asset(
            'images/logo1.png',
            fit: BoxFit.contain,
          ),
        ),
      ),

        // Set background color here
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.account_circle),
          //   onPressed: () {
          //     // Implement the action when the profile icon is pressed
          //   },
          // ),
          // Spacer(),

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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => FeedContainer(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
