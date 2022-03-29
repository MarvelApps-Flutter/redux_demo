import 'package:flutter_redux_module_movie_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'reducers/app_reducers.dart';

class Redux {
  static final Store<AppState> _store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware],
  );

  static Store<AppState> get store => _store;
}
