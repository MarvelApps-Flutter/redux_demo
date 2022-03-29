import 'package:flutter_redux_module_movie_app/models/person_model.dart';

class GetPersonDataLoadingAction {}

class GetPersonDataSuccessAction {
  final List<Results>? personData;
  GetPersonDataSuccessAction({this.personData});
}

class GetPersonDataFailedAction {}
