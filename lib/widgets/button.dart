import 'package:flutter/material.dart';

import '../constant/text_style.dart';

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final Function()? onLongPress;
  final String text;

  const AppButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * 0.74,
            MediaQuery.of(context).size.height * 0.05),
        backgroundColor: Colors.green,
      ),
      child: Text(
        text,
        style: AppTextStyle.textStyle3WBold,
      ),
    );
  }
}
