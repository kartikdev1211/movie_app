import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/features/models/popular_movie_models.dart';
import 'package:movies/features/models/top_rated_movies.dart';
import 'package:movies/features/models/upcoming_movies.dart';

class MovieRepo {
  String imageUrl = "https://image.tmdb.org/t/p/w500";
  static Future<List<PopularMovies>> fetchPopularMovies() async {
    String baseUrl = "https://api.themoviedb.org/3/";
    String apiKey = "fea05a28289147d9921503f8335dfaad";

    late String endPoint;
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint?api_key=$apiKey";
    List<PopularMovies> popularMovies = [];
    try {
      final response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body.toString());
      for (int i = 0; i < data.length; i++) {
        PopularMovies popular = PopularMovies.fromJson(data);
        popularMovies.add(popular);
      }
      return popularMovies;
    } catch (e) {
      e.toString();
      return [];
    }
  }

  static Future<List<UpcomingMovies>> fetchUpcomingMovies() async {
    String baseUrl = "https://api.themoviedb.org/3/";
    String apiKey = "fea05a28289147d9921503f8335dfaad";
    late String endPoint;
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint?api_key=$apiKey";
    List<UpcomingMovies> upcomingMovies = [];
    try {
      final response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body.toString());
      for (int i = 0; i < data.length; i++) {
        UpcomingMovies upcoming = UpcomingMovies.fromJson(data);
        upcomingMovies.add(upcoming);
      }
      return upcomingMovies;
    } catch (e) {
      e.toString();
      return [];
    }
  }

  static Future<List<TopRated>> fetchTopRatedMovies() async {
    String baseUrl = "https://api.themoviedb.org/3/";
    String apiKey = "fea05a28289147d9921503f8335dfaad";
    late String endPoint;
    endPoint = "movie/top_rated";
    final url = "$baseUrl$endPoint?api_key=$apiKey";
    List<TopRated> topRatedMovies = [];
    try {
      final response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body.toString());
      for (int i = 0; i < data.length; i++) {
        TopRated top = TopRated.fromJson(data);
        topRatedMovies.add(top);
      }
      return topRatedMovies;
    } catch (e) {
      e.toString();
      return [];
    }
  }
}
