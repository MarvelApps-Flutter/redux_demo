import 'package:flutter/foundation.dart';
import 'package:flutter_redux_module_movie_app/models/movie_detail_model.dart';

@immutable
class MovieDetailDataState {
  final bool? isFetching;
  final bool? fetchingError;
  final MovieDetailModel? movieDetailModel;

  const MovieDetailDataState({this.isFetching, this.movieDetailModel, this.fetchingError});

  factory MovieDetailDataState.initial() {
    return const MovieDetailDataState(isFetching: true, movieDetailModel: null, fetchingError: null);
  }

  MovieDetailDataState copyWith(
      {required bool isFetching, required bool fetchingError, MovieDetailModel? movieDetailModel}) {
    return MovieDetailDataState(
        isFetching: isFetching,
        fetchingError: fetchingError,
        movieDetailModel: movieDetailModel);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MovieDetailDataState &&
              runtimeType == other.runtimeType &&
              isFetching == other.isFetching &&
              fetchingError == other.fetchingError &&
              movieDetailModel == other.movieDetailModel;

  @override
  int get hashCode => isFetching.hashCode ^ movieDetailModel.hashCode;
}
