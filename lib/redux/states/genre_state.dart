import 'package:flutter/foundation.dart';
import 'package:flutter_redux_module_movie_app/models/genre_model.dart';

@immutable
class GenreDataState {
  final bool? isFetching;
  final bool? fetchingError;
  final List<Genre>? genreList;

  const GenreDataState({this.isFetching, this.genreList, this.fetchingError});

  factory GenreDataState.initial() {
    return const GenreDataState(isFetching: true, genreList: [], fetchingError: null);
  }

  GenreDataState copyWith(
      {required bool isFetching, required bool fetchingError, required List<Genre> genreResult}) {
    return GenreDataState(
        isFetching: isFetching,
        fetchingError: fetchingError,
        genreList: genreResult);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GenreDataState &&
              runtimeType == other.runtimeType &&
              isFetching == other.isFetching &&
              fetchingError == other.fetchingError &&
              genreList == other.genreList;

  @override
  int get hashCode => isFetching.hashCode ^ genreList.hashCode;
}
