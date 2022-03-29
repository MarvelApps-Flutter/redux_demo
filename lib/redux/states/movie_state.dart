import 'package:flutter/foundation.dart';
import 'package:flutter_redux_module_movie_app/models/movie_model.dart';

@immutable
class MovieDataState {
  final bool? isFetching;
  final bool? fetchingError;
  final List<Result>? movies;

  const MovieDataState({this.isFetching, this.movies, this.fetchingError});

  factory MovieDataState.initial() {
    return const MovieDataState(isFetching: true, movies: [], fetchingError: null);
  }

  MovieDataState copyWith(
      {required bool isFetching, required bool fetchingError, required List<Result> movieResult}) {
    return MovieDataState(
        isFetching: isFetching,
        fetchingError: fetchingError,
        movies: movieResult);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDataState &&
          runtimeType == other.runtimeType &&
          isFetching == other.isFetching &&
          fetchingError == other.fetchingError &&
          movies == other.movies;

  @override
  int get hashCode => isFetching.hashCode ^ movies.hashCode;
}
