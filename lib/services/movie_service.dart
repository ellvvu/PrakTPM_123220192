import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {
  static const String _baseUrl = 'https://tpm-api-responsi-a-h-872136705893.us-central1.run.app/api/v1';

  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse('$_baseUrl/movies'));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> moviesJson = data['data'];
      return moviesJson.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<Movie> getMovieById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/movies/$id'));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Movie.fromJson(data['data']);
    } else if (response.statusCode == 404) {
      throw Exception('Movie not found');
    } else {
      throw Exception('Failed to load movie');
    }
  }

  Future<Movie> addMovie(Movie movie) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/movies'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(movie.toJson()),
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      return Movie.fromJson(data['data']);
    } else if (response.statusCode == 400) {
      throw Exception('Field cannot be empty');
    } else if (response.statusCode == 422) {
      throw Exception('Invalid rating or year');
    } else {
      throw Exception('Failed to add movie');
    }
  }

  Future<void> updateMovie(int id, Movie movie) async {
    final response = await http.patch(
      Uri.parse('$_baseUrl/movies/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(movie.toJson()),
    );

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 400) {
      throw Exception('Field cannot be empty');
    } else if (response.statusCode == 404) {
      throw Exception('Movie not found');
    } else if (response.statusCode == 422) {
      throw Exception('Invalid rating or year');
    } else {
      throw Exception('Failed to update movie');
    }
  }

  Future<void> deleteMovie(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/movies/$id'));

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 400) {
      throw Exception('This movie is protected');
    } else if (response.statusCode == 404) {
      throw Exception('Movie not found');
    } else {
      throw Exception('Failed to delete movie');
    }
  }
}