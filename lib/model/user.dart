import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String age;
  final String nic;


  const User(
      {required this.username,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.age,
      required this.nic,
      });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      age: snapshot["age"],
      nic: snapshot["nic"],
      
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "age": age,
        "nic": nic,
        
      };
}