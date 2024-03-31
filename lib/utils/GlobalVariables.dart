import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shieldy/pages/Heatmap.dart';
import 'package:shieldy/pages/account_screen.dart';
import 'package:shieldy/pages/add_post_page.dart';
import 'package:shieldy/responsive/mobileScreen.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:shieldy/pages/home.dart';
import 'package:shieldy/pages/search_screen.dart';
import 'package:shieldy/widgets/database.dart';


const webScreenSize = 600;
var homeScreenItems = [
  Homepage(),
  Heatmap(),
  AddPostScreen(),
  // AddPostScreen(),
  SearchScreen(),
  AccountScreen(),
];
  
  

  //const AddPostScreen(),
  //const Text('notifications'),
  //ProfileScreen(

  // ...

  //uid: FirebaseAuth.instance.currentUser!.uid,

