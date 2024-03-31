// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:shieldy/pages/login_screen.dart';
// import 'package:shieldy/pages/signup_screen.dart';
// import 'package:shieldy/widgets/textfeild.dart';

// void main() {
// testWidgets('UserLoginPage UI Test', (WidgetTester tester) async {
//   // Build our app and trigger a frame.
//   await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
//   // Verify that the login page contains necessary widgets
//   expect(find.byType(TextFormField), findsNWidgets(2)); // Email and password fields
//   expect(find.text('Enter your email'), findsOneWidget); // Email text field
//   expect(find.text('Enter your password'), findsOneWidget); // Password text field
//   expect(find.text('Dont have an account?'), findsOneWidget); // 'Don't have an account?' text
//   expect(find.text('Signup.'), findsOneWidget); // Signup button text
// });

//   testWidgets('UserLoginPage Create Account Test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

//     // Tap on 'Create New Account' button
//     await tester.tap(find.text('Signup.'));
//     await tester.pump();

//     // Verify that create account widgets are displayed
//     expect(find.text('Enter your username'), findsOneWidget);
//     expect(find.text('Age'), findsOneWidget);
//     expect(find.text('NIC'), findsOneWidget);
//     expect(find.text('Email'), findsOneWidget);
//     expect(find.text('Password'), findsOneWidget);
//     expect(find.text('Confirm Password'), findsOneWidget);
//     expect(find.text('Signup.'), findsOneWidget); // Signup button text

//   });

//   testWidgets('UserLoginPage Create Account Test - Fill Form', (WidgetTester tester) async {
//     await tester.pumpWidget(
//       const MaterialApp(
//         home: LoginScreen(),
//       ),
//     );
//     // Tap on 'Create New Account' button
//     await tester.tap(find.text('Signup.'));
//     await tester.pump();

//     // Verify that create account widgets are displayed
//     expect(find.text('Enter your username'), findsOneWidget);
//     expect(find.text('Age'), findsOneWidget);
//     expect(find.text('NIC'), findsOneWidget);
//     expect(find.text('Email'), findsOneWidget);
//     expect(find.text('Password'), findsOneWidget);
//     expect(find.text('Confirm Password'), findsOneWidget);
//     expect(find.text('Sign up'), findsOneWidget);

//     // Simulate entering text into text fields
//     await tester.enterText(find.byType(Text_field_input).at(0), 'John Doe');
//     await tester.enterText(find.byType(Text_field_input).at(1), '25');
//     await tester.enterText(find.byType(Text_field_input).at(2), '675483476v');
//     await tester.enterText(find.byType(Text_field_input).at(3), 'john@gmail.com');
//     await tester.enterText(find.byType(Text_field_input).at(4), 'john123');
//     await tester.enterText(find.byType(Text_field_input).at(5), 'john123');

//     // Tap on 'Create Account' button
//     await tester.tap(find.text('Sign up'));
//     await tester.pump();
//   });
// }
