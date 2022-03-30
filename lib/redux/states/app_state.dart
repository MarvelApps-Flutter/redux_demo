import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_module_movie_app/redux/states/movie_state.dart';
import 'package:flutter_redux_module_movie_app/redux/states/person_state.dart';
import 'genre_state.dart';
import 'movie_detail_state.dart';

@immutable
class AppState extends Equatable{
  final MovieDataState? movieDataState;
  final PersonDataState? personDataState;
  final GenreDataState? genreDataState;
  final MovieDetailDataState? movieDetailDataState;

  const AppState({
    @required this.movieDataState,
    @required this.personDataState,
    @required this.genreDataState,
    @required this.movieDetailDataState
  });

  factory AppState.initial() {
    return AppState(
        movieDataState: MovieDataState.initial(),
      personDataState: PersonDataState.initial(),
      genreDataState: GenreDataState.initial(),
      movieDetailDataState: MovieDetailDataState.initial()
    );
  }

  AppState copyWith({
    MovieDataState? movieState,
    PersonDataState? personState,
    GenreDataState? genreState,
    MovieDetailDataState? movieDetailDataState
  }) {
    return AppState(
        movieDataState: movieState ?? this.movieDataState,
      personDataState: personState ?? this.personDataState,
      genreDataState: genreState ?? this.genreDataState,
      movieDetailDataState: movieDetailDataState ?? this.movieDetailDataState
    );
  }

  // @override
  // int get hashCode => hash2(userDataState.hashCode, personDataState.hashCode);
  //
  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is AppState && userDataState == other.userDataState;

  @override
  List<Object?> get props => [movieDataState, personDataState, genreDataState, movieDetailDataState];
}
