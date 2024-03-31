import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shieldy/pages/account_screen.dart';
import 'package:shieldy/pages/login_screen.dart';
import 'package:shieldy/pages/splash_screen.dart'; // Import the SplashScreen
import 'package:shieldy/responsive/mobileScreen.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:shieldy/widgets/database.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shieldy',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: SplashScreen(), // Set the SplashScreen as the initial route
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => MobileScreenLayout()
      },
    );
  }
}
