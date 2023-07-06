import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mybeauty/services/burger.dart';

import '../services/dessert.dart';
import '../services/drink.dart';
import '../services/food.dart';
import '../services/frite.dart';
import '../services/hotdog.dart';
import '../services/kebab.dart';
import '../services/nuggets.dart';
import '../services/pizza.dart';
import '../services/poulet.dart';
import 'datail.dart';

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
  
  List<Food> app = burger;

  void move(int a){
    switch(a){
      case 1:{
        app = burger;
      }
      break;
      case 2:{
        app = hotdog;
      }
      break;
      case 3:{
        app = pizza;
      }
      break;
      case 4:{
        app = nuggets;
      }
      break;
      case 5:{
        app = frite;
      }
      break;
      case 6:{
        app = poulet;
      }
      break;
      case 7:{
        app = kebab;
      }
      break;
      case 8:{
        app = drink;
      }
      break;
      case 9:{
        app = dessert;
      }
      break;
    }
  }

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
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodcat.length,
                itemBuilder: (context, index){
                  return InkWell(
                     onTap: () {
                      for (var i = 0; i <= foodcat.length; i++) {
                        setState(() {
                          if (index == i) {
                            move(i+1);
                          }
                        });
                      }
                      },
                    child: Container(
                      child: Categoriecard(categ: foodcat[index]),
                    ),
                  );
                }),
            ),
            SizedBox(height: 10,),
            Expanded(
              child:ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: app.length,
                itemBuilder: (context, index){
                  return ShowInfo(food: app[index]);
                }), )
          ],
        )
      );
  }
}

class FoodCategorie{
  final String name;
  FoodCategorie({required this.name});

}

class Categoriecard extends StatelessWidget {
  final FoodCategorie categ;
  Categoriecard({required this.categ});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 8.0, right: 8.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.grey)
      ),
      child: Text(categ.name,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }


}
class ShowInfo extends StatelessWidget {
  final Food food;
  const ShowInfo({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(food.img),
              fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(20)
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(150, 43, 43, 43),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail(food: food,)));
                },
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 10,top: 25),
                      child: Text(food.name, 
                        style: TextStyle(color: Colors.white,fontSize: 25), 
                        textAlign: TextAlign.start,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 10),
                      child: Text("${food.price}\$", 
                        style: TextStyle(
                          color: Colors.white,fontSize: 20),
                           textAlign: TextAlign.start,),
                    )
                  ],
                ),
              ),
            )
            ),
            Positioned(
              right: 10,
              bottom: 0,
              child: InkWell(
                onTap: () {
                  
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0XFFFF7F27),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20)
                    )
                  ),
                  child: Center(child: Icon(Icons.add, color: Colors.white,)
                  ),
                ),
              ))

        ],
      ),
    );
  }
}
