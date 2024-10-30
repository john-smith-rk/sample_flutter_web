import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {}

class InitEvent extends MainEvent {
  InitEvent();
  @override
  List<Object?> get props => [];
}

class AddTitleEvent extends MainEvent {

  final String? title;

  AddTitleEvent({required this.title});

  @override
  List<Object?> get props => [];
}