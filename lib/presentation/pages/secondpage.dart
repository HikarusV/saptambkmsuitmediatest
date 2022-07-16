import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmediatest/common/style.dart';
import 'package:suitmediatest/presentation/pages/firstpage.dart';
import 'package:suitmediatest/presentation/pages/thirdpage.dart';
import 'package:suitmediatest/presentation/provider/second_provider.dart';
import 'package:suitmediatest/presentation/widgets/custom_scaffold.dart';
import 'package:suitmediatest/presentation/widgets/full_button.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Second Screen",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 21, right: 5, top: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome", style: textWelcomeStyle),
                Text(cacheName ?? "JohnDoe", style: textTitleStyle),
              ],
            ),
          ),
          Center(
            child: Text(
              context.watch<SecondProvider>().name ?? "Selected User Name",
              style: textSelectedBoldStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 33, right: 33, bottom: 32),
            child: FullButton(
              text: "Choose a User",
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThirdScreen(),
                ),
              ).then((value) {
                if (value != null) {
                  context.read<SecondProvider>().changeName(value);
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
