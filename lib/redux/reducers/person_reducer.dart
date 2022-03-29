import 'package:flutter_redux_module_movie_app/redux/actions/movie_action.dart';
import 'package:flutter_redux_module_movie_app/redux/actions/person_action.dart';
import 'package:flutter_redux_module_movie_app/redux/states/movie_state.dart';
import 'package:flutter_redux_module_movie_app/redux/states/person_state.dart';
import 'package:redux/redux.dart';

final personDataReducer = combineReducers<PersonDataState>([
  TypedReducer<PersonDataState, GetPersonDataSuccessAction>(_getPersonDataSuccess),
  TypedReducer<PersonDataState, GetPersonDataFailedAction>(_getPersonDataFailed),
  TypedReducer<PersonDataState, GetPersonDataLoadingAction>(_getPersonDataLoading),
]);
PersonDataState _getPersonDataSuccess(PersonDataState state, GetPersonDataSuccessAction action) {
  return state.copyWith(
      personResult: action.personData!, isFetching: false, fetchingError: false);
}

PersonDataState _getPersonDataFailed(PersonDataState state, GetPersonDataFailedAction action) {
  return state.copyWith(personResult: [], isFetching: false, fetchingError: true);
}

PersonDataState _getPersonDataLoading(PersonDataState state, GetPersonDataLoadingAction action) {
  return state.copyWith(isFetching: true, fetchingError: false, personResult: []);
}
