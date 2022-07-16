import 'package:flutter/material.dart';
import 'package:suitmediatest/common/style.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, this.title = "Title", this.body})
      : super(key: key);
  final String title;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
            color: Color(0xFF554AF0),
          ),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: textTitleStyle,
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            color: const Color(0xFFE2E3E4),
            height: 0.5,
          ),
        ),
      ),
      body: body ?? Container(),
    );
  }
}
