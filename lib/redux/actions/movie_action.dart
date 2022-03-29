import 'package:flutter_redux_module_movie_app/models/movie_model.dart';

class GetMovieDataLoadingAction {}

class GetMovieDataSuccessAction {
  final List<Result>? movieData;
  GetMovieDataSuccessAction({this.movieData});
}

class GetMovieDataFailedAction {}
