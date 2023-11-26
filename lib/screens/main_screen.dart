import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:uts_mobile2_ireniusbonan/screens/date_screen.dart';
import 'package:uts_mobile2_ireniusbonan/screens/list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  final Map<String, String> fruitsAndDescriptions = {
    'Apple':
        'Apples are a good source of fiber and vitamin C. They are also low in calories and high in antioxidants.',
    'Orange':
        'Oranges are well known for their vitamin C content. They are also a good source of fiber and antioxidants.',
    'Banana':
        'Bananas are rich in potassium, vitamins, and fiber. They are a great source of natural energy.',
    'Grape':
        'Grapes are high in antioxidants and contain several vitamins and minerals, including vitamin C, vitamin K, and potassium.',
    'Pineapple':
        'Pineapples are loaded with nutrients, antioxidants, and enzymes that may provide various health benefits.',
    'Watermelon':
        'Watermelon is low in calories but high in antioxidants, electrolytes, and water content, which may help hydration.',
    'Mango':
        'Mangoes are rich in vitamins, minerals, and antioxidants. They are also a great source of vitamin A and fiber.',
    'Strawberry':
        'Strawberries are rich in antioxidants and vitamin C. They are also low in calories and high in fiber.',
    'Pear':
        'Pears are a good source of dietary fiber and antioxidants. They also contain vitamins C and K.',
    'Cherry':
        'Cherries are packed with antioxidants and offer several health benefits, including reducing inflammation.',
    'Lemon':
        'Lemons are high in vitamin C and antioxidants. They also aid digestion and promote hydration.',
    'Peach':
        'Peaches are low in calories and a good source of vitamins A and C. They also contain antioxidants.',
    'Plum':
        'Plums are rich in antioxidants and fiber. They also provide vitamins and minerals like vitamin K and potassium.',
  };

  final Map<String, String> shoppingCartItems = {
    'Apple': 'Rp20.000-30.000',
    'Orange': 'Rp15.000-25.000',
    'Banana': 'Rp10.000-20.000',
    'Grape': 'Rp30.000-50.000',
    'Pineapple': 'Rp15.000-25.000',
    'Watermelon': 'Rp10.000-20.000',
    'Mango': 'Rp20.000-30.000',
    'Strawberry': 'Rp50.000-70.000',
    'Pear': 'Rp20.000-30.000',
    'Cherry': 'Rp50.000-70.000',
    'Lemon': 'Rp20.000-30.000',
    'Peach': 'Rp20.000-30.000',
    'Plum': 'Rp20.000-30.000',
    'Kiwi': 'Rp30.000-50.000',
    'Raspberry': 'Rp50.000-70.000',
    'Blueberry': 'Rp50.000-70.000',
    'Cantaloupe': 'Rp20.000-30.000',
    'Avocado': 'Rp30.000-50.000',
    'Coconut': 'Rp15.000-25.000',
    'Papaya': 'Rp20.000-30.000',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fruit Menu',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: _getBody(_index),
      bottomNavigationBar: CurvedNavigationBar(
        index: _index,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.calendar_today, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.deepPurpleAccent,
        buttonBackgroundColor: Colors.pinkAccent,
        backgroundColor: Colors.blueGrey,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return _buildFruitList();
      case 1:
        return _buildShoppingScreen();
      case 2:
        return const DateScreen();
      case 3:
        return _buildFavoriteScreen();
      case 4:
        return const ListScreen();
      default:
        return Container();
    }
  }

  Widget _buildFruitList() {
    return ListView.builder(
      itemCount: fruitsAndDescriptions.length,
      itemBuilder: (context, index) {
        final fruitName = fruitsAndDescriptions.keys.elementAt(index);
        final description = fruitsAndDescriptions[fruitName];

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(
              fruitName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              description!,
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              print('Selected fruit: $fruitName');
              // Implement action when a fruit is selected
            },
          ),
        );
      },
    );
  }

  Widget _buildShoppingScreen() {
    return ListView.builder(
      itemCount: shoppingCartItems.length,
      itemBuilder: (context, index) {
        final fruitName = shoppingCartItems.keys.elementAt(index);
        final description = shoppingCartItems[fruitName];

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(
              fruitName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              description!,
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              print('Selected fruit in shopping cart: $fruitName');
              // Implement action when a fruit is selected in shopping cart
            },
          ),
        );
      },
    );
  }

  Widget _buildFavoriteScreen() {
    return ListView(
      children: [
        _buildFavoriteItem('Bananas',
            'Bananas are the most popular fruit globally, with an annual production of over 115 million tons. They are easy to eat, portable, and a good source of potassium, which is essential for muscle and nerve function.'),
        _buildFavoriteItem('Watermelons',
            'Watermelons are the second most popular fruit, with an annual production of over 100 million tons. They are refreshing, hydrating, and a good source of vitamins A, C, and lycopene, an antioxidant with potential health benefits.'),
        // ... other favorite items
        _buildFavoriteItem('Grapes',
            'Grapes are the fifth most popular fruit, with an annual production of over 70 million tons. They are versatile, can be eaten fresh or dried, and are a good source of antioxidants, including resveratrol, which has been linked to various health benefits.'),
      ],
    );
  }

  Widget _buildFavoriteItem(String title, String subtitle) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 14),
        ),
        onTap: () {
          print('Selected favorite fruit: $title');
          // Implement action when a favorite fruit is selected
        },
      ),
    );
  }
}
