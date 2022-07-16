import 'package:flutter/material.dart';

import '../../common/style.dart';

class TextInputCustom extends StatelessWidget {
  const TextInputCustom({
    Key? key,
    required this.controller,
    this.title = '',
    this.textHint = 'Text Hint',
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final String textHint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Container(
            height: 39.88,
            decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffE2E3E4), width: 0.5)),
          ),
          TextField(
            controller: controller,
            maxLines: 1,
            minLines: 1,
            style: textInputStyle,
            decoration: InputDecoration(
              hintText: textHint,
              hintStyle: textHintStyle,
              contentPadding: const EdgeInsets.only(
                top: 7.94,
                bottom: 7.94,
                left: 20,
                right: 16,
              ),
              isDense: true,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
