import 'package:equatable/equatable.dart';

abstract class SolutionEvent extends Equatable {}

class InitEvent extends SolutionEvent {
  InitEvent();
  @override
  List<Object?> get props => [];
}