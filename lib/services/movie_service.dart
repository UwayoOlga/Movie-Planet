import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class MovieService {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey =
      'YOUR_TMDB_API_KEY'; // Replace with your API key

  // Mock data for development (when API key is not available)
  static final List<Movie> _mockMovies = [
    Movie(
      id: '1',
      title: 'Inception',
      overview:
          'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
      posterPath: '/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
      backdropPath: '/s3TBrRGB1iav7gFOCNx3H31MoES.jpg',
      rating: 8.8,
      releaseDate: '2010-07-16',
      genres: ['Sci-Fi', 'Action', 'Thriller'],
      runtime: 148,
      director: 'Christopher Nolan',
      cast: ['Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Ellen Page'],
      trailerUrl: 'https://www.youtube.com/watch?v=YoHD9XEInc0',
      streamingUrl: 'https://example.com/stream/inception',
      isTrending: true,
      isPopular: true,
    ),
    Movie(
      id: '2',
      title: 'The Dark Knight',
      overview:
          'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
      posterPath: '/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
      backdropPath: '/hkBaDkMWbLaf8B1lsWsKX7Ew3Xq.jpg',
      rating: 9.0,
      releaseDate: '2008-07-18',
      genres: ['Action', 'Crime', 'Drama'],
      runtime: 152,
      director: 'Christopher Nolan',
      cast: ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart'],
      trailerUrl: 'https://www.youtube.com/watch?v=EXeTwQWrcwY',
      streamingUrl: 'https://example.com/stream/dark-knight',
      isTrending: true,
      isPopular: true,
    ),
    Movie(
      id: '3',
      title: 'Interstellar',
      overview:
          'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
      posterPath: '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
      backdropPath: '/xu9zaAevzQ5nnrsXN6JcahLnG4i.jpg',
      rating: 8.6,
      releaseDate: '2014-11-07',
      genres: ['Adventure', 'Drama', 'Sci-Fi'],
      runtime: 169,
      director: 'Christopher Nolan',
      cast: ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain'],
      trailerUrl: 'https://www.youtube.com/watch?v=2LqzF5WauAw',
      streamingUrl: 'https://example.com/stream/interstellar',
      isTrending: false,
      isPopular: true,
    ),
    Movie(
      id: '4',
      title: 'The Shawshank Redemption',
      overview:
          'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
      posterPath: '/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
      backdropPath: '/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg',
      rating: 9.3,
      releaseDate: '1994-09-23',
      genres: ['Drama'],
      runtime: 142,
      director: 'Frank Darabont',
      cast: ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton'],
      trailerUrl: 'https://www.youtube.com/watch?v=6hB3S9bIaco',
      streamingUrl: 'https://example.com/stream/shawshank',
      isTrending: false,
      isPopular: true,
    ),
    Movie(
      id: '5',
      title: 'Pulp Fiction',
      overview:
          'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.',
      posterPath: '/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg',
      backdropPath: '/suaEOtk1N1sgg2QM528GluxMcE.jpg',
      rating: 8.9,
      releaseDate: '1994-10-14',
      genres: ['Crime', 'Drama'],
      runtime: 154,
      director: 'Quentin Tarantino',
      cast: ['John Travolta', 'Uma Thurman', 'Samuel L. Jackson'],
      trailerUrl: 'https://www.youtube.com/watch?v=s7EdQ4FqbhY',
      streamingUrl: 'https://example.com/stream/pulp-fiction',
      isTrending: true,
      isPopular: false,
    ),
  ];

  // Get trending movies
  Future<List<Movie>> getTrendingMovies() async {
    try {
      if (_apiKey == 'YOUR_TMDB_API_KEY') {
        // Return mock data if API key is not set
        await Future.delayed(const Duration(seconds: 1)); // Simulate API delay
        return _mockMovies.where((movie) => movie.isTrending).toList();
      }

      final response = await http.get(
        Uri.parse('$_baseUrl/trending/movie/week?api_key=$_apiKey'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['results'] as List)
            .map((json) => Movie.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (e) {
      // Fallback to mock data
      return _mockMovies.where((movie) => movie.isTrending).toList();
    }
  }

  // Get popular movies
  Future<List<Movie>> getPopularMovies() async {
    try {
      if (_apiKey == 'YOUR_TMDB_API_KEY') {
        await Future.delayed(const Duration(seconds: 1));
        return _mockMovies.where((movie) => movie.isPopular).toList();
      }

      final response = await http.get(
        Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['results'] as List)
            .map((json) => Movie.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e) {
      return _mockMovies.where((movie) => movie.isPopular).toList();
    }
  }

  // Get latest movies
  Future<List<Movie>> getLatestMovies() async {
    try {
      if (_apiKey == 'YOUR_TMDB_API_KEY') {
        await Future.delayed(const Duration(seconds: 1));
        return _mockMovies.where((movie) => movie.isLatest).toList();
      }

      final response = await http.get(
        Uri.parse('$_baseUrl/movie/now_playing?api_key=$_apiKey'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['results'] as List)
            .map((json) => Movie.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load latest movies');
      }
    } catch (e) {
      return _mockMovies.where((movie) => movie.isLatest).toList();
    }
  }

  // Search movies
  Future<List<Movie>> searchMovies(String query) async {
    try {
      if (_apiKey == 'YOUR_TMDB_API_KEY') {
        await Future.delayed(const Duration(seconds: 1));
        return _mockMovies
            .where(
              (movie) =>
                  movie.title.toLowerCase().contains(query.toLowerCase()) ||
                  movie.overview.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }

      final response = await http.get(
        Uri.parse(
          '$_baseUrl/search/movie?api_key=$_apiKey&query=${Uri.encodeComponent(query)}',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['results'] as List)
            .map((json) => Movie.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to search movies');
      }
    } catch (e) {
      return _mockMovies
          .where(
            (movie) =>
                movie.title.toLowerCase().contains(query.toLowerCase()) ||
                movie.overview.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
  }

  // Get movie details
  Future<Movie?> getMovieDetails(String movieId) async {
    try {
      if (_apiKey == 'YOUR_TMDB_API_KEY') {
        await Future.delayed(const Duration(seconds: 1));
        return _mockMovies.firstWhere((movie) => movie.id == movieId);
      }

      final response = await http.get(
        Uri.parse('$_baseUrl/movie/$movieId?api_key=$_apiKey'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Movie.fromJson(data);
      } else {
        throw Exception('Failed to load movie details');
      }
    } catch (e) {
      try {
        return _mockMovies.firstWhere((movie) => movie.id == movieId);
      } catch (_) {
        return null;
      }
    }
  }

  // Get all movies (for categories)
  Future<List<Movie>> getAllMovies() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockMovies;
  }
}
