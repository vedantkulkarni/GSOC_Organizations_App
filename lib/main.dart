import 'package:flutter/material.dart';
import 'package:gsoc_organizations/Utilities/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const Drawer(),
      appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: blackColor),
          elevation: 0,
          backgroundColor: bgColor,
          title: SizedBox(
            height: 50,
            width: 50,
            child: gsocLogo, //Can be found in constants.dart
          )),
      body: SingleChildScrollView(
        child: Container(
            child: const Center(
          child: Text(""),
        )),
      ),
    );
  }
}
