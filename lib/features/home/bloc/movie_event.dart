part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class PopularMovieInitialFetchEvent extends MovieEvent {}

class UpcomingMovieInitialFetchEvent extends MovieEvent {}

class TopRatedMovieInitialFetchEvent extends MovieEvent {}
