import 'package:cocktail_app/models/cocktail.dart';
import 'package:cocktail_app/screens/home_screen.dart';
import 'package:cocktail_app/screens/list_drinks_screen.dart';
import 'package:cocktail_app/services/cocktail_service.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ListDrinksPage(),
    //SearchPage(),
  ];
      // Lista de páginas para la navegación
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cocktail App')),
      body: _pages[_currentIndex], // Muestra la página correspondiente
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // Lista de elementos para la navegación
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List Drinks'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
