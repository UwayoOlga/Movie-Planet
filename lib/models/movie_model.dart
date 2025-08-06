class Movie {
  final String id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double rating;
  final String releaseDate;
  final List<String> genres;
  final int runtime;
  final String director;
  final List<String> cast;
  final String trailerUrl;
  final String streamingUrl;
  final bool isTrending;
  final bool isPopular;
  final bool isLatest;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.releaseDate,
    required this.genres,
    required this.runtime,
    required this.director,
    required this.cast,
    required this.trailerUrl,
    required this.streamingUrl,
    this.isTrending = false,
    this.isPopular = false,
    this.isLatest = false,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      releaseDate: json['release_date'] ?? '',
      genres: List<String>.from(json['genres'] ?? []),
      runtime: json['runtime'] ?? 0,
      director: json['director'] ?? '',
      cast: List<String>.from(json['cast'] ?? []),
      trailerUrl: json['trailer_url'] ?? '',
      streamingUrl: json['streaming_url'] ?? '',
      isTrending: json['is_trending'] ?? false,
      isPopular: json['is_popular'] ?? false,
      isLatest: json['is_latest'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'rating': rating,
      'release_date': releaseDate,
      'genres': genres,
      'runtime': runtime,
      'director': director,
      'cast': cast,
      'trailer_url': trailerUrl,
      'streaming_url': streamingUrl,
      'is_trending': isTrending,
      'is_popular': isPopular,
      'is_latest': isLatest,
    };
  }

  String get fullPosterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
  String get fullBackdropUrl =>
      'https://image.tmdb.org/t/p/original$backdropPath';
  String get year => releaseDate.split('-').first;
  String get formattedRating => rating.toStringAsFixed(1);
  String get formattedRuntime => '${runtime ~/ 60}h ${runtime % 60}m';
  String get genreString => genres.take(3).join(', ');
}
