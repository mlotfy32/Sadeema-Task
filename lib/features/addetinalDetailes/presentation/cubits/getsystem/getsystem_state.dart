part of 'getsystem_cubit.dart';

@immutable
abstract class GetsystemState {}

class GetsystemInitial extends GetsystemState {}

class GetsystemLoading extends GetsystemState {}

class GetsystemFailure extends GetsystemState {
  final String error;

  GetsystemFailure({required this.error});
}

class GetsystemSuccess extends GetsystemState {
  final List<SystemModel> systems;

  GetsystemSuccess({required this.systems});
}
