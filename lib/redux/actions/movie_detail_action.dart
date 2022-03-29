import 'package:flutter_redux_module_movie_app/models/movie_detail_model.dart';

class GetMovieDetailDataLoadingAction {}

class GetMovieDetailDataSuccessAction {
  final MovieDetailModel? movieDetailModel;
  GetMovieDetailDataSuccessAction({this.movieDetailModel});
}

class GetMovieDetailDataFailedAction {}
