// pages/detail_drink_screen.dart
import 'package:cocktail_app/models/cocktail.dart';
import 'package:cocktail_app/services/cocktail_service.dart';
import 'package:flutter/material.dart';

class DetailDrinkPage extends StatelessWidget {
  final String id;

  DetailDrinkPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cocktail Details')),
      body: FutureBuilder<CocktailDetail>(
        future: CocktailService().fetchCocktailDetail(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final cocktailDetail = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(cocktailDetail.thumbnail),
                  SizedBox(height: 16),
                  Text(cocktailDetail.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Ingredients:', style: TextStyle(fontSize: 18)),
                  ...cocktailDetail.ingredients.map((ingredient) => Text(ingredient)),
                  SizedBox(height: 8),
                  Text('Instructions:', style: TextStyle(fontSize: 18)),
                  Text(cocktailDetail.instructions),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
        ),
        bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List Drinks'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        ),

      );


    
  }
}