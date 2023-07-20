
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'mealDetail.dart';

class Meals extends StatefulWidget {
  final strCategory;
  const Meals({super.key, required this.strCategory});

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {

   List<Meal> meals = [];

   @override
  void initState() {
    super.initState();
    fetchMeals(widget.strCategory);
  }

  Future<void> fetchMeals(String strCategory) async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$strCategory'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      
      final mealsData = data['meals'] as List;

      setState(() {
        mealsData.forEach((mealData) {
        final meal = Meal.fromJson(mealData);
        meals.add(meal);
      });
      });


    } else {
      throw Exception('Failed to load meals');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFE2B378),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios)),
        title: Text(widget.strCategory,),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MealDetail(id: meals[index].idMeal,)));
              },
              child: Card(
                elevation: 0,
                child: ListTile(
                  leading: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(meals[index].strMealThumb),
                      fit: BoxFit.cover
                      )
                    ),
                    ),
                  title: Text(meals[index].strMeal),
                  subtitle: Text(meals[index].strArea),
                ),
              ),
            );
          }
          )
      ),
    );
  }
}

class Meal {
  final String idMeal;
  final String strMeal;
  final String strArea;
  final String strMealThumb;

  Meal({required this.idMeal, required this.strMeal, required this.strArea, required this.strMealThumb});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strArea: json['strArea'],
      strMealThumb: json['strMealThumb'],
    );
  }
}