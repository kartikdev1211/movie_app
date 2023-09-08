part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

abstract class MovieActionState extends MovieState {}

final class MovieInitial extends MovieState {}

class MovieFetchingLoadingState extends MovieState {}

class MovieFetchingErrorState extends MovieState {}

class PopularMovieFetchSuccessfulState extends MovieState {
  final List<PopularMovies> popular;

  PopularMovieFetchSuccessfulState({required this.popular});
}

class UpcomingMovieFetchinSuccessfulState extends MovieState {
  final List<UpcomingMovies> upcoming;

  UpcomingMovieFetchinSuccessfulState({required this.upcoming});
}

class TopRatedMovieFetchinSuccessfulState extends MovieState {
  final List<TopRated> topRated;

  TopRatedMovieFetchinSuccessfulState({required this.topRated});
}
