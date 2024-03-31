import 'dart:convert';
import 'dart:io';

import 'package:shieldy/model/post.dart';

Future<void> sendEmailForHighLikes(Post post) async {
  final likes = post.likes.length;
  if (likes > 5) {
    final emailBody = '''
Description: ${post.description}
Location: ${post.location}
Post URL: ${post.postUrl}
''';

    const emailSubject = 'Post with high likes count';
    const smtpServer = 'smtp.example.com';
    const smtpPort = 587;
    const smtpUsername = 'Sheildy admin';
    const smtpPassword = 'sheildy';
    const recipientEmail = 'topsecrets.gpt@gmai.com';

    final message = '''
From: nuwintharana007@gmail.com
To: $recipientEmail
Subject: $emailSubject

$emailBody
''';

    final socket = await Socket.connect(smtpServer, smtpPort);
    socket.listen((data) {
      print(String.fromCharCodes(data));
    });

    socket.write('HELO\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('AUTH LOGIN\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('${base64.encode(utf8.encode(smtpUsername))}\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('${base64.encode(utf8.encode(smtpPassword))}\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('MAIL FROM:<sender@example.com>\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('RCPT TO:<$recipientEmail>\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('DATA\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write(message);
    socket.write('\n.\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('QUIT\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.destroy();
  }
}