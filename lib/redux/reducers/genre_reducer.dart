import 'package:flutter_redux_module_movie_app/redux/actions/genre_action.dart';
import 'package:flutter_redux_module_movie_app/redux/states/genre_state.dart';
import 'package:redux/redux.dart';

final genreDataReducer = combineReducers<GenreDataState>([
  TypedReducer<GenreDataState, GetGenreDataSuccessAction>(_getGenreDataSuccess),
  TypedReducer<GenreDataState, GetGenreDataFailedAction>(_getGenreDataFailed),
  TypedReducer<GenreDataState, GetGenreDataLoadingAction>(_getGenreDataLoading),
]);
GenreDataState _getGenreDataSuccess(GenreDataState state, GetGenreDataSuccessAction action) {
  return state.copyWith(
      genreResult: action.genreData!, isFetching: false, fetchingError: false);
}

GenreDataState _getGenreDataFailed(GenreDataState state, GetGenreDataFailedAction action) {
  return state.copyWith(genreResult: [], isFetching: false, fetchingError: true);
}

GenreDataState _getGenreDataLoading(GenreDataState state, GetGenreDataLoadingAction action) {
  return state.copyWith(isFetching: true, fetchingError: false, genreResult: []);
}
