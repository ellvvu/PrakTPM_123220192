class Movie {
  final int id;
  final String title;
  final int year;
  final double rating;
  final String? imgUrl;
  final String? genre;
  final String? director;
  final String? synopsis;
  final String? movieUrl;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    this.imgUrl,
    this.genre,
    this.director,
    this.synopsis,
    this.movieUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      rating: json['rating']?.toDouble() ?? 0.0,
      imgUrl: json['imgUrl'],
      genre: json['genre'],
      director: json['director'],
      synopsis: json['synopsis'],
      movieUrl: json['movieUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'year': year,
      'rating': rating,
      'genre': genre,
      'director': director,
      'synopsis': synopsis,
    };
  }
}
