import 'package:flutter_redux_module_movie_app/models/genre_model.dart';
import 'package:flutter_redux_module_movie_app/models/movie_detail_model.dart';
import 'package:flutter_redux_module_movie_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class MovieDetailViewModel {
  final bool? isFetching;
  final bool? fetchingError;
  final MovieDetailModel? movieDetailModelData;

  MovieDetailViewModel({this.isFetching, this.fetchingError, this.movieDetailModelData});

  factory MovieDetailViewModel.fromStore(Store<AppState> store) => MovieDetailViewModel(
      isFetching: store.state.movieDetailDataState!.isFetching,
      movieDetailModelData: store.state.movieDetailDataState!.movieDetailModel,
      fetchingError: store.state.movieDetailDataState!.fetchingError);
}
