import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'screens/index.dart';

// import 'screens/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyResto',
      home: Indexpages(),
    );
  }
}

class Meal {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  Meal({required this.idMeal, required this.strMeal, required this.strMealThumb});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
    );
  }
}

class MealsList extends StatefulWidget {
  @override
  _MealsListState createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  List<Meal> meals = [];

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=beef'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        meals = (data['meals'] as List).map((meal) => Meal.fromJson(meal)).toList();
      });
    } else {
      throw Exception('Failed to load meals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals List'),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(meals[index].strMealThumb),
            title: Text(meals[index].strMeal),
            subtitle: Text(meals[index].idMeal),
          );
        },
      ),
    );
  }
}