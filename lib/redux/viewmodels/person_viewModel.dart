import 'package:flutter_redux_module_movie_app/models/movie_model.dart';
import 'package:flutter_redux_module_movie_app/models/person_model.dart';
import 'package:flutter_redux_module_movie_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class PersonViewModel {
  final bool? isFetching;
  final bool? fetchingError;
  final List<Results>? personData;

  PersonViewModel({this.isFetching, this.fetchingError, this.personData});

  factory PersonViewModel.fromStore(Store<AppState> store) => PersonViewModel(
      isFetching: store.state.personDataState!.isFetching,
      personData: store.state.personDataState!.persons,
      fetchingError: store.state.personDataState!.fetchingError);
}
