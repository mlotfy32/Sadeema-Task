part of 'getclasses_cubit.dart';

@immutable
abstract class GetclassesState {}

class GetclassesInitial extends GetclassesState {}

class GetclassesLoading extends GetclassesState {}

class GetclassesSuccess extends GetclassesState {
  final List<ClassesModel> classes;

  GetclassesSuccess({required this.classes});
}

class GetclassesFailure extends GetclassesState {
  final String error;

  GetclassesFailure({required this.error});
}
