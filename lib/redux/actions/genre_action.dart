import 'package:flutter_redux_module_movie_app/models/genre_model.dart';

class GetGenreDataLoadingAction {}

class GetGenreDataSuccessAction {
  final List<Genre>? genreData;
  GetGenreDataSuccessAction({this.genreData});
}

class GetGenreDataFailedAction {}
