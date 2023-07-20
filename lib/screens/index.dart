import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/categories.dart';

import 'package:http/http.dart' as http;

import 'meal.dart';

class Indexpages extends StatefulWidget {
  const Indexpages({super.key});

  @override
  State<Indexpages> createState() => _IndexpagesState();
}

class _IndexpagesState extends State<Indexpages> {
  List<Categories> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        categories = (data['categories'] as List)
            .map((mealCateg) => Categories.fromJson(mealCateg))
            .toList();
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                    color: Color(0XFFE2B378),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.food_bank,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "FoodRecipe",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            height: 130,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(150, 0, 0, 0),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(top: 40, left: 10),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Descover",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    )),
                                Container(
                                    padding: EdgeInsets.only(left: 10),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "the best recipes",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ],
                            ),
                          ),
                          Positioned(
                              top: 0,
                              right: 18,
                              child: Container(
                                width: 130,
                                height: 130,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/meal.png"),
                                        fit: BoxFit.fill)),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 250,
                  child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(),
                      child: ListView.builder(
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Card(
                                elevation: 10,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context, 
                                          MaterialPageRoute(
                                            builder: 
                                            (context)=>
                                            Meals(
                                              strCategory: categories[index].strCategory,)));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    categories[index]
                                                        .strCategoryThumb),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ExpansionTile(
                                          title: Text(
                                              categories[index].strCategory),
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(categories[index]
                                                    .strCategoryDescription)),
                                          ],
                                        ))
                                  ],
                                ));
                          })))
            ],
          ),
        ));
  }
}
