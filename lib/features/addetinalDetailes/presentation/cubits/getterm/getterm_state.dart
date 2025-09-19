part of 'getterm_cubit.dart';

@immutable
abstract class GettermState {}

class GettermInitial extends GettermState {}

class GettermLoading extends GettermState {}

class GettermSuccess extends GettermState {
  final List<TermModel> terms;

  GettermSuccess({required this.terms});
}

class GettermFailure extends GettermState {
  final String error;

  GettermFailure({required this.error});
}
