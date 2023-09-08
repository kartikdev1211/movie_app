part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailState {}

final class MovieDetailInitial extends MovieDetailState {}

class MovieDetailFetchingLoadingState extends MovieDetailState {}

class MovieDetailFetchingErrorState extends MovieDetailState {}

class MovieDetailSuccessState extends MovieDetailState {
  final List<PopularMovies> popularMovies;

  MovieDetailSuccessState({required this.popularMovies});
}
