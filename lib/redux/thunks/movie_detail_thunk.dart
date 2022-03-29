import 'package:flutter_redux_module_movie_app/redux/actions/movie_detail_action.dart';
import 'package:flutter_redux_module_movie_app/redux/states/app_state.dart';
import 'package:flutter_redux_module_movie_app/services/remote_services.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> getMovieDetailDataThunk(int id) => (Store<AppState> store) async {
  try {
    store.dispatch(GetMovieDetailDataLoadingAction());
    final movieDetailData = await RemoteServices.getMovieDetail(id);
    store.dispatch(GetMovieDetailDataSuccessAction(movieDetailModel: movieDetailData));
  } catch (error) {
    store.dispatch(GetMovieDetailDataFailedAction());
  }
};
