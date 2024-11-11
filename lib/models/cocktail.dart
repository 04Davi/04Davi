
// Modelos de datos para la API de The Cocktail DB
class Cocktail {
  final String id;
  final String name;
  final String thumbnail;

  Cocktail({required this.id, required this.name, required this.thumbnail});

  // Crear un objeto Cocktail a partir de un mapa JSON
  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      id: json['idDrink'],
      name: json['strDrink'],
      thumbnail: json['strDrinkThumb'],
    );
  }
}
// Modelo de datos para la página de detalles de un cóctel
class CocktailDetail {
  final String id;
  final String name;
  final String thumbnail;
  final String instructions;
  final List<String> ingredients;

  // Crear un objeto CocktailDetail a partir de un mapa JSON
  CocktailDetail({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.instructions,
    required this.ingredients,
  });
    
  // Crear un objeto CocktailDetail a partir de un mapa JSON
  factory CocktailDetail.fromJson(Map<String, dynamic> json) {
    var ingredients = <String>[];
    for (int i = 1; i <= 15; i++) {
      if (json['strIngredient$i'] != null) {
        ingredients.add(json['strIngredient$i']);
      }
    }
    // Agregar otros ingredientes si existen
    return CocktailDetail(
      id: json['idDrink'],
      name: json['strDrink'],
      thumbnail: json['strDrinkThumb'],
      instructions: json['strInstructions'],
      ingredients: ingredients,
    );
  }
}
