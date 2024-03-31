// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy and Policy',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "\nShieldy Privacy Policy",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Text(
                "\nbuilt the Shieldy app as a Free app. This SERVICE is provided by at no cost and is intended for use as is.This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.\n"
                "\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service.We will not use or share your information with anyone except as described in this Privacy Policy.\n\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Shieldy unless otherwise defined in this Privacy Policy.\n",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const Text(
              "\nInformation Collection and Use",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Text(
              "\nFor a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to NIC number, Name, Age, Email address . The information that we request will be retained by us and used as described in this privacy policy.The app does use third-party services that may collect information used to identify you.\n\nLink to the privacy policy of third-party service providers used by the app :\n\n",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              child: const Row(
                children: [
                  Icon(
                    Icons.play_circle_fill, // This adds a Play Store icon
                    color: Colors.blue, // Change this to your desired color
                  ),
                  Text(
                    " Google Play Services",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Change this to your desired color
                    ),
                  ),
                ],
              ),
              onTap: () => launch(
                  'https://developers.google.com/android/guides/overview'),
            ),
            InkWell(
              child: const Row(
                children: [
                  Icon(
                    Icons.analytics, // This adds an analytics icon
                    color: Colors.blue, // Change this to your desired color
                  ),
                  Text(
                    "\n\n Google Analytics for Firebase\n\n",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Change this to your desired color
                    ),
                  ),
                ],
              ),
              onTap: () => launch('https://firebase.google.com/docs/analytics'),
            ),
            InkWell(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start, // Add this line
                children: [
                  Icon(
                    Icons.bug_report, // This adds a bug report icon
                    color: Colors.blue, // Change this to your desired color
                  ),
                  Text(
                    "\n Firebase Crashlytics\n",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Change this to your desired color
                    ),
                  ),
                ],
              ),
              onTap: () =>
                  launch('https://firebase.google.com/docs/crashlytics'),
            ),
            const Text(
              "\nLog Data",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Text(
                "\nWe want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.\n",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const Text(
              "\nCookies",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Text(
                "\nCookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.This Service does not use these “cookies” explicitly. \n\nHowever, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.\n",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const Text(
              "\nSecurity",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Text(
                "\nWe value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.\n",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const Text(
              "\nContact Us",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Text(
                "\nIf you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at:\n",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            InkWell(
              child: const Row(
                children: [
                  Icon(
                    Icons.mail, // This adds a mail icon
                    color: Colors.blue, // Change this to your desired color
                  ),
                  Text(
                    " nuwan.20220104@iit.ac.lk",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Change this to your desired color
                    ),
                  ),
                ],
              ),
              onTap: () => launch('mailto:nuwan.20220104@iit.ac.lk'),
            ),
          ],
        ),
      ),
    );
  }
}
