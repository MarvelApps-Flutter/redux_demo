import 'package:flutter_redux_module_movie_app/redux/actions/genre_action.dart';
import 'package:flutter_redux_module_movie_app/redux/actions/movie_action.dart';
import 'package:flutter_redux_module_movie_app/redux/actions/person_action.dart';
import 'package:flutter_redux_module_movie_app/redux/states/app_state.dart';
import 'package:flutter_redux_module_movie_app/services/remote_services.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> getGenreDataThunk() => (Store<AppState> store) async {
  try {
    store.dispatch(GetGenreDataLoadingAction());
    final genreData = await RemoteServices.getGenreList();
    store.dispatch(GetGenreDataSuccessAction(genreData: genreData));
  } catch (error) {
    store.dispatch(GetGenreDataFailedAction());
  }
};
