import 'package:flutter/material.dart';

class MyNotif extends StatefulWidget {
  const MyNotif({super.key});

  @override
  State<MyNotif> createState() => _MyNotifState();
}

class _MyNotifState extends State<MyNotif> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,),),
        centerTitle: true,
        title: Text("Notification"),
        backgroundColor: Color(0XFF121212),
        elevation: 0,
      ),
      body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0XFF121212),
      child: Column(
        children: [
          
        ],
      ),
    ),
    );
  }
}