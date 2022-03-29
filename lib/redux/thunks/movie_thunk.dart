import 'package:flutter_redux_module_movie_app/redux/actions/movie_action.dart';
import 'package:flutter_redux_module_movie_app/redux/states/app_state.dart';
import 'package:flutter_redux_module_movie_app/services/remote_services.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> getMovieDataThunk() => (Store<AppState> store) async {
      try {
        store.dispatch(GetMovieDataLoadingAction());
        final movieData = await RemoteServices.getMovieData();
        store.dispatch(GetMovieDataSuccessAction(movieData: movieData));
      } catch (error) {
        store.dispatch(GetMovieDataFailedAction());
      }
    };
