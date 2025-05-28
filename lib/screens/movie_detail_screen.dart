import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';

class MovieDetailScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: FutureBuilder(
        future: Provider.of<MovieProvider>(context, listen: false).getMovieById(movieId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final movie = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (movie.imgUrl != null)
                  Center(
                    child: Image.network(
                      movie.imgUrl!,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                const SizedBox(height: 16),
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text('Year: ${movie.year}'),
                Text('Rating: ${movie.rating}'),
                if (movie.genre != null) Text('Genre: ${movie.genre}'),
                if (movie.director != null) Text('Director: ${movie.director}'),
                const SizedBox(height: 16),
                if (movie.synopsis != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Synopsis:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(movie.synopsis!),
                    ],
                  ),
                if (movie.movieUrl != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement URL opening
                      },
                      child: const Text('View More Info'),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}