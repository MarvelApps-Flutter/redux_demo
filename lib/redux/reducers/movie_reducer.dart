import 'package:flutter_redux_module_movie_app/redux/actions/movie_action.dart';
import 'package:flutter_redux_module_movie_app/redux/states/movie_state.dart';
import 'package:redux/redux.dart';

final movieDataReducer = combineReducers<MovieDataState>([
  TypedReducer<MovieDataState, GetMovieDataSuccessAction>(_getUserDataSuccess),
  TypedReducer<MovieDataState, GetMovieDataFailedAction>(_getUserDataFailed),
  TypedReducer<MovieDataState, GetMovieDataLoadingAction>(_getUserDataLoading),
]);
MovieDataState _getUserDataSuccess(MovieDataState state, GetMovieDataSuccessAction action) {
  return state.copyWith(
      movieResult: action.movieData!, isFetching: false, fetchingError: false);
}

MovieDataState _getUserDataFailed(MovieDataState state, GetMovieDataFailedAction action) {
  return state.copyWith(movieResult: [], isFetching: false, fetchingError: true);
}

MovieDataState _getUserDataLoading(MovieDataState state, GetMovieDataLoadingAction action) {
  return state.copyWith(isFetching: true, fetchingError: false, movieResult: []);
}
