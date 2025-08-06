import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../services/movie_service.dart';

class MovieProvider extends ChangeNotifier {
  final MovieService _movieService = MovieService();

  List<Movie> _trendingMovies = [];
  List<Movie> _popularMovies = [];
  List<Movie> _latestMovies = [];
  List<Movie> _searchResults = [];
  Movie? _selectedMovie;

  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';

  // Getters
  List<Movie> get trendingMovies => _trendingMovies;
  List<Movie> get popularMovies => _popularMovies;
  List<Movie> get latestMovies => _latestMovies;
  List<Movie> get searchResults => _searchResults;
  Movie? get selectedMovie => _selectedMovie;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get searchQuery => _searchQuery;

  // Load trending movies
  Future<void> loadTrendingMovies() async {
    _setLoading(true);
    _clearError();

    try {
      _trendingMovies = await _movieService.getTrendingMovies();
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Load popular movies
  Future<void> loadPopularMovies() async {
    _setLoading(true);
    _clearError();

    try {
      _popularMovies = await _movieService.getPopularMovies();
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Load latest movies
  Future<void> loadLatestMovies() async {
    _setLoading(true);
    _clearError();

    try {
      _latestMovies = await _movieService.getLatestMovies();
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Search movies
  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
      _searchQuery = '';
      notifyListeners();
      return;
    }

    _setLoading(true);
    _clearError();
    _searchQuery = query;

    try {
      _searchResults = await _movieService.searchMovies(query);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Get movie details
  Future<void> getMovieDetails(String movieId) async {
    _setLoading(true);
    _clearError();

    try {
      _selectedMovie = await _movieService.getMovieDetails(movieId);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Load all initial data
  Future<void> loadInitialData() async {
    _setLoading(true);
    _clearError();

    try {
      await Future.wait([
        loadTrendingMovies(),
        loadPopularMovies(),
        loadLatestMovies(),
      ]);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Clear search results
  void clearSearch() {
    _searchResults = [];
    _searchQuery = '';
    notifyListeners();
  }

  // Clear selected movie
  void clearSelectedMovie() {
    _selectedMovie = null;
    notifyListeners();
  }

  // Helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
  }

  // Get movies by category
  List<Movie> getMoviesByCategory(String category) {
    switch (category.toLowerCase()) {
      case 'trending':
        return _trendingMovies;
      case 'popular':
        return _popularMovies;
      case 'latest':
        return _latestMovies;
      default:
        return [];
    }
  }

  // Get all movies (for browse page)
  List<Movie> get allMovies {
    final allMovies = <Movie>[];
    allMovies.addAll(_trendingMovies);
    allMovies.addAll(_popularMovies);
    allMovies.addAll(_latestMovies);

    // Remove duplicates based on movie ID
    final seen = <String>{};
    return allMovies.where((movie) => seen.add(movie.id)).toList();
  }
}
