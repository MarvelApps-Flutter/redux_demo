import 'package:flutter_redux_module_movie_app/models/movie_model.dart';
import 'package:flutter_redux_module_movie_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class MovieViewModel {
  final bool? isFetching;
  final bool? fetchingError;
  final List<Result>? userData;

  MovieViewModel({this.isFetching, this.fetchingError, this.userData});

  factory MovieViewModel.fromStore(Store<AppState> store) => MovieViewModel(
      isFetching: store.state.userDataState!.isFetching,
      userData: store.state.userDataState!.movies,
      fetchingError: store.state.userDataState!.fetchingError);
}
