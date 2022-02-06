import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apikey = 'b3561673aeae8496239ed985b7d35a39';
  final String _lang = 'es-ES';
  List<Movie> onDisplayMovies = [];
  List<Movie> onDisplayPopulars = [];

  Map<int, List<Cast>> movieCast = {};

  int _popularpage = 0;
  MoviesProvider() {
    getOnDisplayMOVIES();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apikey, 'language': _lang, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMOVIES() async {
    final response = await _getJsonData('3/movie/now_playing');
    final nowPlayinhResponse = NowPlayingResponse.fromJson(response);
    onDisplayMovies = nowPlayinhResponse.results;
    notifyListeners(); //avisa del cambio a todos los widgets que escuchen
  }

  getPopularMovies() async {
    _popularpage++;
    final response = await _getJsonData('3/movie/popular', _popularpage);
    final popularResponse = PopularResponse.fromJson(response);
    onDisplayPopulars = [...onDisplayPopulars, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final castResponse = CastResponse.fromJson(jsonData);
    movieCast[movieId] = castResponse.cast;
    return castResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    var url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apikey, 'language': _lang, 'query': query});
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }
}
