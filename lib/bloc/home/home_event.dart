import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class InitEvent extends HomeEvent {
  InitEvent();
  @override
  List<Object?> get props => [];
}