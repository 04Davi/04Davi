// models/cocktail.dart
class Cocktail {
  final String id;
  final String name;
  final String thumbnail;

  Cocktail({required this.id, required this.name, required this.thumbnail});

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      id: json['idDrink'],
      name: json['strDrink'],
      thumbnail: json['strDrinkThumb'],
    );
  }
}

class CocktailDetail {
  final String id;
  final String name;
  final String thumbnail;
  final String instructions;
  final List<String> ingredients;

  CocktailDetail({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.instructions,
    required this.ingredients,
  });

  factory CocktailDetail.fromJson(Map<String, dynamic> json) {
    var ingredients = <String>[];
    for (int i = 1; i <= 15; i++) {
      if (json['strIngredient$i'] != null) {
        ingredients.add(json['strIngredient$i']);
      }
    }

    return CocktailDetail(
      id: json['idDrink'],
      name: json['strDrink'],
      thumbnail: json['strDrinkThumb'],
      instructions: json['strInstructions'],
      ingredients: ingredients,
    );
  }
}
