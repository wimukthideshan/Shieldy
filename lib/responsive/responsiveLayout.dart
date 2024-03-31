import 'package:flutter/material.dart';
import 'package:shieldy/utils/dimension.dart';


class responsiveLayout extends StatelessWidget {

  final Widget webScreenLayout;
  final Widget mobileScreenLayout; 

  const responsiveLayout({super.key, required this.webScreenLayout, required this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >webScreenSize) {
          return webScreenLayout;

          //webScreenSize

          
        
        }
          return mobileScreenLayout;
        //mobileScreenSize
        
      }
    );
  }
}