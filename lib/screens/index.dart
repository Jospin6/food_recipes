import 'package:flutter/material.dart';

import 'accueil.dart';
import 'favory.dart';

class Indexpages extends StatefulWidget {
  const Indexpages({super.key});

  @override
  State<Indexpages> createState() => _IndexpagesState();
}

class _IndexpagesState extends State<Indexpages> {
  int _currentIndex = 0;
  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        Accueil(),
        Favory(),
      ][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setCurrentIndex(index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0XFFFF7F27),
        unselectedItemColor: Colors.grey,
        // backgroundColor: Color(0XFF2B2B2B),
        backgroundColor: Colors.black,
        iconSize: 25,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'favorite'),
        ]),
    );
  }
}