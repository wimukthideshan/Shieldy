import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shieldy/model/post.dart';

class PostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> toggleLike(String postId, String userId) async {
    DocumentReference postRef = _firestore.collection('posts').doc(postId);

    DocumentSnapshot snap = await postRef.get();
    if (!snap.exists) {
      print('Post not found!');
      return;
    }

    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    Map<String, bool> likes = Map<String, bool>.from(data['likes'] ?? {});

    // If the user has already liked the post, remove their like.
    // Otherwise, add their like.
    if (likes.containsKey(userId)) {
      likes.remove(userId);
    } else {
      likes[userId] = true;
    }

    // Update the post with the new likes
    await postRef.update({'likes': likes});
  }
}

// Assuming you have a Post object for which the button is being displayed
