// import 'dart:typed_data';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:shieldy/resources/auth_method.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();
//   group('AuthMethods', () {
//     late AuthMethods authMethods;
//     late FirebaseAuth firebaseAuth;
//     User? testUser;

//     setUp(() async {
//       await Firebase.initializeApp();
//       firebaseAuth = FirebaseAuth.instance;
//       authMethods = AuthMethods();

//       // Create a test user
//       String email = 'test@example.com';
//       String password = 'password123';
//       UserCredential userCredential =
//           await firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       testUser = userCredential.user;
//     });

//     tearDown(() async {
//       if (testUser != null) {
//         await testUser!.delete();
//       }
//     });

//     test('signUpUser', () async {
//       // Arrange
//       String email = 'test@example.com';
//       String password = 'password123';
//       String confirmPass = 'password123';
//       String username = 'testuser';
//       Uint8List file = Uint8List.fromList([1, 2, 3]);
//       String age = '25';
//       String nic = '123456789V';

//       // Act
//       String result = await authMethods.signUpUser(
//         email: email,
//         password: password,
//         confirmPass: confirmPass,
//         username: username,
//         file: file,
//         age: age,
//         nic: nic,
//       );

//       // Assert
//       expect(result, 'success');

//       // Clean up
//       User? user = firebaseAuth.currentUser;
//       if (user != null) {
//         await user.delete();
//       }
//     });

//     test('loginUser', () async {
//       // Arrange
//       String email = 'test@example.com';
//       String password = 'password123';

//       // Act
//       String result = await authMethods.loginUser(
//         email: email,
//         password: password,
//       );

//       // Assert
//       expect(result, 'success');
//     });
//   });
// }