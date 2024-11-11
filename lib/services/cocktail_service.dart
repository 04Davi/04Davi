import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cocktail.dart';

class CocktailService {
  static const String baseUrl = "https://www.thecocktaildb.com/api/json/v1/1";  // URL base de la API de The Cocktail DB

  // Obtener cócteles aleatorios
  Future<Cocktail> fetchRandomCocktail() async {
    final response = await http.get(Uri.parse('$baseUrl/random.php'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Cocktail.fromJson(data['drinks'][0]);
    } else {
      throw Exception('Failed to load random cocktail');
    }
  }

  // Obtener cócteles por categoría
  Future<List<Cocktail>> fetchCocktailsByCategory(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/filter.php?c=$category'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final drinks = data['drinks'] as List;
      return drinks.map((drink) => Cocktail.fromJson(drink)).toList();
    } else {
      throw Exception('Failed to load cocktails');
    }
  }

  // Obtener detalles de un cóctel por ID
  Future<CocktailDetail> fetchCocktailDetail(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/lookup.php?i=$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return CocktailDetail.fromJson(data['drinks'][0]);
    } else {
      throw Exception('Failed to load cocktail details');
    }
  }
}
