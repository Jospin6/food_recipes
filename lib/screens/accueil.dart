import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> with TickerProviderStateMixin  {

  List<FoodCategorie> foodcat = [
  FoodCategorie(name: "Burger"),
  FoodCategorie(name: "Hot dog"),
  FoodCategorie(name: "Pizza"),
  FoodCategorie(name: "Nuggets"),
  FoodCategorie(name: "Frittes"),
  FoodCategorie(name: "Poulet"),
  FoodCategorie(name: "Kebab"),
  FoodCategorie(name: "Drinks"),
  FoodCategorie(name: "Dessert"),
];
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0XFF121212),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              margin: EdgeInsets.only(top: 30,left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/hamburger.png"),
                        fit: BoxFit.cover)
                    ),
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Ionicons.notifications, color: Colors.white,))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10),
              width: MediaQuery.of(context).size.width,
              child:const Text("Discover the good food", style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.start,),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
              child:const Text("and enjoy it", style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.start,),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10, right: 20, top: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.grey,)
                  ),
                  Expanded(child: TextFormField(
                    decoration:const InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Search...",
                      border: InputBorder.none
                    ),
                  ))
                ],
              ),
            ),
          ],
        )
      );
  }
}

class FoodCategorie{
  final String name;
  FoodCategorie({required this.name});

}

