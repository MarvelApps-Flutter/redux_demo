import 'package:flutter/foundation.dart';
import 'package:flutter_redux_module_movie_app/models/person_model.dart';

@immutable
class PersonDataState {
  final bool? isFetching;
  final bool? fetchingError;
  final List<Results>? persons;

  const PersonDataState({this.isFetching, this.persons, this.fetchingError});

  factory PersonDataState.initial() {
    return const PersonDataState(isFetching: true, persons: [], fetchingError: null);
  }

  PersonDataState copyWith(
      {required bool isFetching, required bool fetchingError, required List<Results> personResult}) {
    return PersonDataState(
        isFetching: isFetching,
        fetchingError: fetchingError,
        persons: personResult);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PersonDataState &&
              runtimeType == other.runtimeType &&
              isFetching == other.isFetching &&
              fetchingError == other.fetchingError &&
              persons == other.persons;

  @override
  int get hashCode => isFetching.hashCode ^ persons.hashCode;
}
