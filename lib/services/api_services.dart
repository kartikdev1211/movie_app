import 'dart:convert';

import 'package:movies/models/popular_movies.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/top_rated.dart';
import 'package:movies/models/upcoming_movies.dart';

class ApiServices {
  String baseUrl = "https://api.themoviedb.org/3/";
  String apiKey = "fea05a28289147d9921503f8335dfaad";
  String imageUrl = "https://image.tmdb.org/t/p/w500";
  late String endPoint;
  Future<PopularMovies> getPopularMovies() async {
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint?api_key=$apiKey";
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return PopularMovies.fromJson(data);
    } else {
      return PopularMovies.fromJson(data);
    }
  }

  Future<TopRated> getTopRatedMovies() async {
    endPoint = "movie/top_rated";
    final url = "$baseUrl$endPoint?api_key=$apiKey";
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return TopRated.fromJson(data);
    } else {
      return TopRated.fromJson(data);
    }
  }

  Future<UpcomingMovies> getUpcomingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint?api_key=$apiKey";
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return UpcomingMovies.fromJson(data);
    } else {
      return UpcomingMovies.fromJson(data);
    }
  }
}
