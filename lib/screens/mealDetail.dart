

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class MealDetail extends StatefulWidget {
  final String id;
  const MealDetail({super.key, required this.id});

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {

  // late MealDetails meal;
  late Future<MealDetails> _mealFuture;

  @override
  void initState() {
    super.initState();
     _mealFuture = fetchMeal();
  }

   Future<MealDetails> fetchMeal() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.id}'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final meal = MealDetails.fromJson(data['meals'][0]);
      return meal;
    } else {
      throw Exception('Failed to load meal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back_ios)),
        title: Text("meal.strMeal"),
      ),
      body: FutureBuilder<MealDetails>(
        future: _mealFuture,
        builder: (context, snapshot){
        if (snapshot.hasData) {
          final meal = snapshot.data;
          return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Image(image: NetworkImage(meal!.strMealThumb),
              fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 350,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(meal.strMeal, style: const TextStyle(fontSize: 25),),
                    ),
                    const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Ingredients:',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: meal.ingredients.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(meal.ingredients[index]),
                        subtitle: Text(meal.measures[index]),
                      );
                    },
                  ),
                  )
                  ],
                ),
              ))
          ],
        ),
      );
        }
        return const CircularProgressIndicator();
      })
    );
  }
}



class MealDetails {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final List<String> ingredients;
  final List<String> measures;

  MealDetails({required this.idMeal, required this.strMeal, required this.strMealThumb, required this.ingredients, required this.measures});

  factory MealDetails.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      if (json['strIngredient$i'] != null && json['strIngredient$i'].trim().isNotEmpty) {
        ingredients.add(json['strIngredient$i']);
        measures.add(json['strMeasure$i']);
      }
    }

    return MealDetails(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      ingredients: ingredients,
      measures: measures,
    );
  }
}