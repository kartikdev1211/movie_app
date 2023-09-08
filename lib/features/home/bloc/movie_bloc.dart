// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/models/popular_movie_models.dart';
import 'package:movies/features/models/top_rated_movies.dart';
import 'package:movies/features/models/upcoming_movies.dart';
import 'package:movies/features/repos/movie_repo.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<PopularMovieInitialFetchEvent>(popularMovieInitialFetchEvent);
    on<UpcomingMovieInitialFetchEvent>(upcomingMovieFetchEvent);
    on<TopRatedMovieInitialFetchEvent>(topRatedMovieInitialFetchEvent);
  }

  Future<void> popularMovieInitialFetchEvent(
      PopularMovieInitialFetchEvent event, Emitter<MovieState> emit) async {
    emit(MovieFetchingLoadingState());
    List<PopularMovies> popularMovies = await MovieRepo.fetchPopularMovies();
    emit(PopularMovieFetchSuccessfulState(popular: popularMovies));
  }

  FutureOr<void> upcomingMovieFetchEvent(
      UpcomingMovieInitialFetchEvent event, Emitter<MovieState> emit) async {
    emit(MovieFetchingLoadingState());
    List<UpcomingMovies> upcomingMovies = await MovieRepo.fetchUpcomingMovies();
    emit(UpcomingMovieFetchinSuccessfulState(upcoming: upcomingMovies));
  }

  FutureOr<void> topRatedMovieInitialFetchEvent(
      TopRatedMovieInitialFetchEvent event, Emitter<MovieState> emit) async {
    emit(MovieFetchingLoadingState());
    List<TopRated> topRatedMovies = await MovieRepo.fetchTopRatedMovies();
    emit(TopRatedMovieFetchinSuccessfulState(topRated: topRatedMovies));
  }
}
