// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/models/popular_movie_models.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieDetailInitialEvent>(movieDetailInitialEvent);
  }

  FutureOr<void> movieDetailInitialEvent(
      MovieDetailInitialEvent event, Emitter<MovieDetailState> emit) {
    emit(MovieDetailFetchingLoadingState());
  }
}
