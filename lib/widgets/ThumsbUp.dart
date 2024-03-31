import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ThumsbUp {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
}