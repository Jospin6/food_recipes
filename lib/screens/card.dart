import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
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
                Text("Card", style: TextStyle(color: Colors.white,fontSize: 20),)
              ],
            ),
          )
        ],
      ),
    );
  }
}