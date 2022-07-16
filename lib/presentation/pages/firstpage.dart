import 'package:flutter/material.dart';
import 'package:suitmediatest/presentation/widgets/error_handler.dart';
import 'package:suitmediatest/presentation/widgets/full_button.dart';
import 'package:suitmediatest/presentation/widgets/text_input.dart';

String? cacheName;

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  final TextEditingController name = TextEditingController();
  final TextEditingController palindrome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 32, right: 33, top: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/photo.png",
              width: 116,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 30),
              child: Column(
                children: [
                  TextInputCustom(
                    controller: name,
                    textHint: "Name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInputCustom(
                    controller: palindrome,
                    textHint: "Palindrome",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 42),
              child: Column(
                children: [
                  FullButton(
                    text: "CHECK",
                    onPressed: () {
                      String text = palindrome.text;
                      if (text.isNotEmpty) {
                        if (text == text.split('').reversed.join()) {
                          print("Sama");
                        }
                      } else {
                        snackbarError(
                          context,
                          duration: 2,
                          message: "Kolom Palindrome tidak boleh kosong",
                        );
                      }
                    },
                  ),
                  FullButton(
                    text: "NEXT",
                    onPressed: () {
                      String text = name.text;
                      if (text.isNotEmpty) {
                        FocusScope.of(context).unfocus();
                        cacheName = text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Scaffold(),
                          ),
                        );
                      } else {
                        snackbarError(
                          context,
                          duration: 2,
                          message: "Kolom nama tidak boleh kosong",
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
