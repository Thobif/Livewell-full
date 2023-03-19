import 'package:flutter/material.dart';
import 'package:abc/fitness/fitnesspage.dart';
import 'package:abc/food/foodpage.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 1;

void _onItemTapped(int index) {
  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/'); // go to home
      break;
    case 1:
      Navigator.pushNamed(context, FitnessScreen.routeName); // go to fitness
      break;
    case 2:
      Navigator.pushNamed(context, FoodScreen.routeName); // go to food
      break;
    default:
      break;
  }

  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: Text('Page ${_selectedIndex + 1}'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.fitness_center),
            label: 'Fitness',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.fastfood),
            label: 'Food',
          ),
        ],
      ),
    );
  }
}
