import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shieldy/model/post.dart';
import 'package:shieldy/resources/auth_method.dart';
import 'package:shieldy/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String postUrl,
  ) async {
    String res = 'some error occured';
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('Posts', file, true);

      String postId = const Uuid().v1();

      // Fetch current location
      Position position = await _determinePosition();
      String location = "${position.latitude}, ${position.longitude}";
       // Get current user's username
      String username = (await AuthMethods().getUserDetails()).username;
      // Get current user's profile image
      String profImage = await AuthMethods().getUserProfileImageUrl();



      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
        dislikes: [],
        location: location,
      );
      await _firestore.collection('Posts').doc(postId).set(
            post.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

//likes adding to the firebase
Future<void> updateLikes(String postId, bool isLiked) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final likesRef = _firestore.collection('Posts').doc(postId);

    if (isLiked) {
      await likesRef.update({
        'likes': FieldValue.arrayUnion([uid]),
      });
    } else {
      await likesRef.update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    }
  }

  Future<void> updateLikesAndDislikes(
    String postId,
    bool isLiked,
    bool isDisliked,
  ) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final postRef = _firestore.collection('Posts').doc(postId);

    if (isLiked) {
      await postRef.update({
        'likes': FieldValue.arrayUnion([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else if (isDisliked) {
      await postRef.update({
        'likes': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayUnion([uid]),
      });
    } else {
      await postRef.update({
        'likes': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    }
  }

  Future<List<String>> getPostLocations() async {
    final snapshots = await _firestore
        .collection('Posts')
        .where('likes', arrayContains: FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snapshots.docs
        .map((doc) => doc.data()['location'] as String)
        .toList();
  }

Future<void> checkLocationAndSendNotification() async {
  final userPosition = await Geolocator.getCurrentPosition();
  final userLocation = "${userPosition.latitude}, ${userPosition.longitude}";
  final postLocations = await getPostLocations();

  for (final postLocation in postLocations) {
    final distance = Geolocator.distanceBetween(
      userPosition.latitude,
      userPosition.longitude,
      double.parse(postLocation.split(',')[0]),
      double.parse(postLocation.split(',')[1]),
    );

    if (distance <= 1000) { // Within 1 km range
      // Send a notification to the user
      _sendNotification('You are near a post location');
    }
  }
}

Future<void> _sendNotification(String message) async {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  await addNotification(userId, message);
}
 Future<void> addNotification(String userId, String message) async {
    try {
      await _firestore.collection('users').doc(userId).collection('notifications').add({
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error adding notification: $e');
    }
  }

  Future<void> deleteNotification(String userId, String notificationId) async {
    try {
      await _firestore.collection('users').doc(userId).collection('notifications').doc(notificationId).delete();
    } catch (e) {
      print('Error deleting notification: $e');
    }
  }

  //method to fetch all the post locations from firestore database
  Future<List<LatLng>> getAllPostLocations() async {
  final snapshots = await _firestore.collection('Posts').get();
  return snapshots.docs
      .map((doc) {
        final locationString = doc.data()['location'] as String;
        final latLng = locationString.split(',');
        return LatLng(double.parse(latLng[0]), double.parse(latLng[1]));
      })
      .toList();
}

}
