import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditItem extends StatelessWidget {
  final Widget widget;
  final String title;
  const EditItem({
    Key? key,
    required this.widget,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            // Add Padding here
            padding: EdgeInsets.only(top: 20), // Adjust as needed
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 12,
          child: widget,
        ),
      ],
    );
  }
}
