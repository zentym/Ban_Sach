import 'package:flutter/material.dart';

import 'button.dart';

class AppDialog extends StatelessWidget {
  final Widget? icon;
  final String headingText;
  final String contentText;
  final Widget action;

  const AppDialog({
    Key? key,
    required this.headingText,
    this.icon,
    required this.contentText,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: icon,
              ),
              Text(
                headingText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                contentText,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              action,
            ],
          ),
        ),
      ),
    );
  }
}

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String textButton;
  final Function() onPressed;

  const AppAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      icon: Icon(
        Icons.error,
        size: 40.0,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      content: Text(
        content,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: [AppButton(onPressed: onPressed, text: textButton)],
    );
  }
}
