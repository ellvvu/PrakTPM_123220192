import 'package:flutter/material.dart';
import 'package:latihan_kuis/models/tourism_place.dart';
import 'package:latihan_kuis/pages/favorites_page.dart';
import 'package:latihan_kuis/pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(TourismApp());
}

class TourismApp extends StatelessWidget {
  const TourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // LoginPage sebagai halaman awal
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<TourismPlace> tourismPlaces = [
    // Data dummy tempat wisata
  ];

  final List<Widget> _pages = [
    HomePage(),
    FavoritesPage(favoritePlaces: []), // Awalnya kosong
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        // Perbarui daftar favorit saat halaman favorit dipilih
        _pages[1] = FavoritesPage(
          favoritePlaces: tourismPlaces.where((place) => place.isFavorite).toList(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}
