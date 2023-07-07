import 'package:flutter/material.dart';

class Favory extends StatefulWidget {
  const Favory({super.key});

  @override
  State<Favory> createState() => _FavoryState();
}

class _FavoryState extends State<Favory> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text("Favory", style: TextStyle(color: Colors.white,fontSize: 20),)
              ],
            ),
          )
        ],
      ),
    );
  }
}