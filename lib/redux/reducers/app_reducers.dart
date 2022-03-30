import 'package:flutter_redux_module_movie_app/redux/reducers/genre_reducer.dart';
import 'package:flutter_redux_module_movie_app/redux/reducers/movie_detail_reducer.dart';
import 'package:flutter_redux_module_movie_app/redux/reducers/movie_reducer.dart';
import 'package:flutter_redux_module_movie_app/redux/reducers/person_reducer.dart';
import 'package:flutter_redux_module_movie_app/redux/states/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(movieDataState: movieDataReducer(state.movieDataState!, action,
  ), personDataState: personDataReducer(state.personDataState!, action),
   genreDataState: genreDataReducer(state.genreDataState!, action),
    movieDetailDataState: movieDetailDataReducer(state.movieDetailDataState! , action),
  );
}
