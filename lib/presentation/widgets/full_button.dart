import 'package:flutter/material.dart';
import 'package:suitmediatest/common/style.dart';

class FullButton extends StatelessWidget {
  const FullButton(
      {Key? key,
      this.onPressed,
      this.text = 'BUTTON',
      this.marginTop = 15,
      this.marginBottom = 0})
      : super(key: key);
  final Function()? onPressed;
  final String text;
  final double marginTop;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: double.infinity,
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff2B637B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text, style: textButtonStyle),
      ),
    );
  }
}
