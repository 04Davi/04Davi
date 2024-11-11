// pages/list_drinks_page.dart
import 'package:cocktail_app/screens/detail_drink_screen.dart';
import 'package:flutter/material.dart';
import '../services/cocktail_service.dart';
import '../models/cocktail.dart';

class ListDrinksPage extends StatefulWidget {
  @override
  _ListDrinksPageState createState() => _ListDrinksPageState();
}

class _ListDrinksPageState extends State<ListDrinksPage> {
  final CocktailService cocktailService = CocktailService();
  List<Cocktail> cocktails = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCocktails();
  }

  Future<void> fetchCocktails() async {
    try {
      final fetchedCocktails = await cocktailService.fetchCocktailsByCategory('Cocktail');
      setState(() {
        cocktails = fetchedCocktails;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Drinks')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: cocktails.length,
              itemBuilder: (context, index) {
                final cocktail = cocktails[index];
                return ListTile(
                  leading: Image.network(cocktail.thumbnail),
                  title: Text(cocktail.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailDrinkPage(id: cocktail.id),
                      ),
                    );
                  },
                );
              },
            ),
      /*bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List Drinks'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),*/
    );
  }
}
