import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class Share_Button extends StatelessWidget {
  final String postUrl;
  final String postText; // Optional post text to share

  const Share_Button({super.key, required this.postUrl, this.postText = ''});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _sharePost(context, postUrl, postText),
      icon: const Icon(Icons.share),
    );
  }

  Future<void> _sharePost(BuildContext context, String postUrl, String postText) async {
    final box = context.findRenderObject() as RenderBox?;

    if (box != null && postText.isNotEmpty) {
      final text = postText + '\n' + postUrl;
      await Share.shareXFiles(
        [XFile.fromData(Uint8List.fromList(text.codeUnits), mimeType: 'text/plain')],
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
    } else {
      await Share.share(postUrl, subject: 'Check out this post!');
    }
  }
}