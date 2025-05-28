import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class MovieProvider with ChangeNotifier {
  final MovieService _movieService = MovieService();
  List<Movie> _movies = [];
  bool _isLoading = false;

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _movies = await _movieService.getMovies();
    } catch (e) {
      _movies = [];
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Movie> getMovieById(int id) async {
    return await _movieService.getMovieById(id);
  }

  Future<void> addMovie(Movie movie) async {
    await _movieService.addMovie(movie);
    await fetchMovies();
  }

  Future<void> updateMovie(int id, Movie movie) async {
    await _movieService.updateMovie(id, movie);
    await fetchMovies();
  }

  Future<void> deleteMovie(int id) async {
    await _movieService.deleteMovie(id);
    await fetchMovies();
  }
}