import 'package:flutter/material.dart';

class MyCount extends StatefulWidget {
  const MyCount({super.key});

  @override
  State<MyCount> createState() => _MyCountState();
}

class _MyCountState extends State<MyCount> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0XFF121212),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("My Count", style: TextStyle(color: Colors.white,fontSize: 20),)
              ],
            ),
          )
        ],
      ),
    );
  }
}