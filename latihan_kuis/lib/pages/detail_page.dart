import 'package:flutter/material.dart';
import '../models/tourism_place.dart';

class DetailPage extends StatefulWidget {
  final TourismPlace place;

  const DetailPage({super.key, required this.place});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.place.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.place.imagePath.length,
                itemBuilder: (context, index) {
                  return Image.network(widget.place.imagePath[index]);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.place.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(widget.place.location),
                  SizedBox(height: 20),
                  Text(widget.place.description),
                  SizedBox(height: 20),
                  Text('${widget.place.openDays} | ${widget.place.openTime}'),
                  Text('Tiket: ${widget.place.ticketPrice}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}