import 'package:cocktail_app/screens/detail_drink_screen.dart';
import 'package:flutter/material.dart';
import '../services/cocktail_service.dart';
import '../models/cocktail.dart';

class ListDrinksPage extends StatefulWidget {
  @override
  _ListDrinksPageState createState() => _ListDrinksPageState();
}

  // Estado de la página de lista de cócteles
class _ListDrinksPageState extends State<ListDrinksPage> {
  final CocktailService cocktailService = CocktailService();
  List<Cocktail> cocktails = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCocktails();
  }

  // Obtener cócteles por categoría
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


  // Construir la página de lista de cócteles
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cocteles disponibles')),
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
    );
  }
}
