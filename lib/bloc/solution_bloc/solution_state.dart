import 'package:equatable/equatable.dart';

abstract class SolutionState extends Equatable {
}

class InitialState extends SolutionState{

  InitialState();

  @override
  List<Object?> get props => [];

}