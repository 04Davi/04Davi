import 'package:flutter/material.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:cocktail_app/services/cocktail_service.dart';
import 'detail_drink_screen.dart';

// Página de inicio
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

  // Estado de la página de inicio
class _HomePageState extends State<HomePage> {
  final cocktailService = CocktailService();
  List<Cocktail> cocktailList = [];

  @override
  void initState() {
    super.initState();
    fetchTwoCocktails();
  }

  Future<void> fetchTwoCocktails() async {
    try {
      final cocktails = await cocktailService.fetchCocktailsByCategory('Ordinary_Drink');
      setState(() {
        cocktailList = cocktails.take(2).toList();
      });
    } catch (e) {
      print('Error fetching cocktails: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Cocktail App')),
      body: cocktailList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: cocktailList.length,
              itemBuilder: (context, index) {
                final cocktail = cocktailList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailDrinkPage(id: cocktail.id),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.network(cocktail.thumbnail),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cocktail.name,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}