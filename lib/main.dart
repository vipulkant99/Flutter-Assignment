import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iaminw_assignment/horizontal_list.dart';
import 'package:iaminw_assignment/vertical_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PAYMENT CATEGORIES",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                MyHoriList(),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "LATEST TRANSACTION",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    Text(
                      "SEE ALL",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                MyVertiList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
