import 'package:flutter/material.dart';
import '../models/tourism_place.dart';
import 'detail_page.dart';
import 'login_page.dart'; // Import LoginPage untuk logout

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<TourismPlace> filteredPlaces = tourismPlaces;

  void _filterPlaces(String query) {
    setState(() {
      filteredPlaces = tourismPlaces
          .where((place) =>
              place.name.toLowerCase().contains(query.toLowerCase()) ||
              place.location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  } //search bar

  void _toggleFavorite(int index) {
    setState(() {
      tourismPlaces[index].isFavorite = !tourismPlaces[index].isFavorite;
    });
  } //favorite toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _filterPlaces,
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: filteredPlaces.length,
        itemBuilder: (context, index) {
          final place = filteredPlaces[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(place: place),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      place.imagePath[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(place.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(place.location),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      place.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: place.isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => _toggleFavorite(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}