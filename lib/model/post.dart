import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  // ignore: prefer_typing_uninitialized_variables
  final likes;
  // ignore: prefer_typing_uninitialized_variables
  final dislikes;
  final String postId;
  // ignore: prefer_typing_uninitialized_variables
  final datePublished;
  final String postUrl;
  final String profImage;
  final String location; // Added location field

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.likes,
    required this.dislikes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.location, // Added location field
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        description: snapshot["description"],
        uid: snapshot["uid"],
        likes: snapshot["likes"],
        dislikes: snapshot["dislikes"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        username: snapshot["username"],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage'],
        location: snapshot['location'], // Added location field
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "likes": likes,
        "dislikes": dislikes,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        'postUrl': postUrl,
        'profImage': profImage,
        'location': location, // Added location field
      };
}
