import 'package:flutter_redux_module_movie_app/models/genre_model.dart';
import 'package:flutter_redux_module_movie_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class GenreViewModel {
  final bool? isFetching;
  final bool? fetchingError;
  final List<Genre>? genreData;

  GenreViewModel({this.isFetching, this.fetchingError, this.genreData});

  factory GenreViewModel.fromStore(Store<AppState> store) => GenreViewModel(
      isFetching: store.state.genreDataState!.isFetching,
      genreData: store.state.genreDataState!.genreList,
      fetchingError: store.state.genreDataState!.fetchingError);
}
