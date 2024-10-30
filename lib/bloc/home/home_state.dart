import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class InitialState extends HomeState{

  InitialState();

  @override
  List<Object?> get props => [];

}