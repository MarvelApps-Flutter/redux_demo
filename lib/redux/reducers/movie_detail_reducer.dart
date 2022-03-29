import 'package:flutter_redux_module_movie_app/redux/actions/movie_detail_action.dart';
import 'package:flutter_redux_module_movie_app/redux/states/movie_detail_state.dart';
import 'package:redux/redux.dart';

var data;
final movieDetailDataReducer = combineReducers<MovieDetailDataState>([
  TypedReducer<MovieDetailDataState, GetMovieDetailDataSuccessAction>(_getMovieDetailDataSuccess),
  TypedReducer<MovieDetailDataState, GetMovieDetailDataFailedAction>(_getMovieDetailDataFailed),
  TypedReducer<MovieDetailDataState, GetMovieDetailDataLoadingAction>(_getMovieDetailDataLoading),
]);
MovieDetailDataState _getMovieDetailDataSuccess(MovieDetailDataState state, GetMovieDetailDataSuccessAction action) {
  return state.copyWith(
      movieDetailModel: action.movieDetailModel!, isFetching: false, fetchingError: false);
}

MovieDetailDataState _getMovieDetailDataFailed(MovieDetailDataState state, GetMovieDetailDataFailedAction action) {
  return state.copyWith(isFetching: false, fetchingError: true);
}

MovieDetailDataState _getMovieDetailDataLoading(MovieDetailDataState state, GetMovieDetailDataLoadingAction action) {
  return state.copyWith(isFetching: true, fetchingError: false);
}
