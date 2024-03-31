import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shieldy/model/user.dart' as model;
import 'package:shieldy/pages/home.dart';
import 'package:shieldy/resources/storage_methods.dart';
import 'package:shieldy/responsive/mobileScreen.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('User_Details').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

      // get user username
    Future<String> getUserUsername() async {
      User currentUser = _auth.currentUser!;
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('User_Details').doc(currentUser.uid).get();
      return documentSnapshot.get('username');
    }


      // get user profile image URL
    Future<String> getUserProfileImageUrl() async {
      User currentUser = _auth.currentUser!;
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('User_Details').doc(currentUser.uid).get();
      return documentSnapshot.get('photoUrl');
    }

  // Signing Up User

  Future<String> signUpUser({
    required String email,
    required String password,
    required String confirmPass,
    required String username,
    required Uint8List file,
    required String age,
    required String nic,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          age.isNotEmpty ||
          nic.isNotEmpty ||
          password == confirmPass ||
          file != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl =
            await StorageMethods().uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          nic : nic,
          age: age,
        );

        // adding user in our database
        await _firestore
            .collection("User_Details")
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  //logging in user

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  signInWithGoogle(BuildContext context) async {
  try {
    // Begin interactive sign-in process
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in with the Google credential
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // Check if the user exists in Firestore
    DocumentSnapshot userDoc = await _firestore.collection('User_Details').doc(userCredential.user!.uid).get();

    if (!userDoc.exists) {
      // Create a new user document in Firestore
      String username = userCredential.user!.displayName ?? '';
      String photoUrl = userCredential.user!.photoURL ?? '';

      model.User user = model.User(
        username: username,
        uid: userCredential.user!.uid,
        photoUrl: photoUrl,
        email: userCredential.user!.email!,
        age: '',
        nic: '',
      );

      await _firestore.collection('User_Details').doc(userCredential.user!.uid).set(user.toJson());
    }

    // Navigate to the home screen or desired screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MobileScreenLayout(), // Replace with your desired screen
      ),
    );
  } catch (e) {
    print('Error signing in with Google: $e');
  }
}


  signInWithFacebook(BuildContext context) async {
  try {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Sign in with the Facebook credential
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    // Check if the user exists in Firestore
    DocumentSnapshot userDoc = await _firestore.collection('User_Details').doc(userCredential.user!.uid).get();

    if (!userDoc.exists) {
      // Create a new user document in Firestore
      String username = userCredential.user!.displayName ?? '';
      String photoUrl = userCredential.user!.photoURL ?? '';

      model.User user = model.User(
        username: username,
        uid: userCredential.user!.uid,
        photoUrl: photoUrl,
        email: userCredential.user!.email!,
        age: '',
        nic: '',
      );

      await _firestore.collection('User_Details').doc(userCredential.user!.uid).set(user.toJson());
    }

    // Navigate to the home screen or desired screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MobileScreenLayout(), // Replace with your desired screen
      ),
    );
  } catch (e) {
    print('Error signing in with Facebook: $e');
  }
}




  //signing out user
  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }
}
