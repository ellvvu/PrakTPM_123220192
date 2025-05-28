import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../providers/movie_provider.dart';

class AddEditMovieScreen extends StatefulWidget {
  final Movie? movie;

  const AddEditMovieScreen({super.key, this.movie});

  @override
  State<AddEditMovieScreen> createState() => _AddEditMovieScreenState();
}

class _AddEditMovieScreenState extends State<AddEditMovieScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _yearController;
  late TextEditingController _ratingController;
  late TextEditingController _genreController;
  late TextEditingController _directorController;
  late TextEditingController _synopsisController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.movie?.title ?? '');
    _yearController = TextEditingController(
        text: widget.movie?.year.toString() ?? '');
    _ratingController = TextEditingController(
        text: widget.movie?.rating.toString() ?? '');
    _genreController = TextEditingController(text: widget.movie?.genre ?? '');
    _directorController = TextEditingController(
        text: widget.movie?.director ?? '');
    _synopsisController = TextEditingController(
        text: widget.movie?.synopsis ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _yearController.dispose();
    _ratingController.dispose();
    _genreController.dispose();
    _directorController.dispose();
    _synopsisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie == null ? 'Add Movie' : 'Edit Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(labelText: 'Year'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a year';
                  }
                  final year = int.tryParse(value);
                  if (year == null || year < 1900 || year > 2025) {
                    return 'Year must be between 1900-2025';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ratingController,
                decoration: const InputDecoration(labelText: 'Rating (0-10)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a rating';
                  }
                  final rating = double.tryParse(value);
                  if (rating == null || rating < 0 || rating > 10) {
                    return 'Rating must be between 0-10';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genreController,
                decoration: const InputDecoration(labelText: 'Genre'),
              ),
              TextFormField(
                controller: _directorController,
                decoration: const InputDecoration(labelText: 'Director'),
              ),
              TextFormField(
                controller: _synopsisController,
                decoration: const InputDecoration(labelText: 'Synopsis'),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final movie = Movie(
                        id: widget.movie?.id ?? 0,
                        title: _titleController.text,
                        year: int.parse(_yearController.text),
                        rating: double.parse(_ratingController.text),
                        genre: _genreController.text,
                        director: _directorController.text,
                        synopsis: _synopsisController.text,
                      );

                      final provider =
                          Provider.of<MovieProvider>(context, listen: false);

                      if (widget.movie == null) {
                        await provider.addMovie(movie);
                      } else {
                        await provider.updateMovie(widget.movie!.id, movie);
                      }

                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                },
                child: Text(widget.movie == null ? 'Add Movie' : 'Update Movie'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}