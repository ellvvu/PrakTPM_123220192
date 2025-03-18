// lib/pages/favorites_page.dart
import 'package:flutter/material.dart';
import '../models/tourism_place.dart';

class FavoritesPage extends StatelessWidget {
  final List<TourismPlace> favoritePlaces;

  const FavoritesPage({super.key, required this.favoritePlaces});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          final place = favoritePlaces[index];
          return ListTile(
            leading: Image.network(place.imagePath[0], width: 50, height: 50, fit: BoxFit.cover),
            title: Text(place.name),
            subtitle: Text(place.location),
          );
        },
      ),
    );
  }
}