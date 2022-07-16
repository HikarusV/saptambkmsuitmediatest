import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmediatest/presentation/pages/firstpage.dart';
import 'package:suitmediatest/presentation/provider/second_provider.dart';
import 'package:suitmediatest/presentation/provider/third_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThirdProvider>(
        create: (context) => ThirdProvider(),
      ),
      ChangeNotifierProvider<SecondProvider>(
        create: (context) => SecondProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}
