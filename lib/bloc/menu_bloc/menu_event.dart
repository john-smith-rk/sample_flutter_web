import 'package:equatable/equatable.dart';

abstract class MenuEvent extends Equatable {}

class InitEvent extends MenuEvent {
  InitEvent();
  @override
  List<Object?> get props => [];
}

class FetchMenuEvent extends MenuEvent {
  final String? menu;
  FetchMenuEvent({required this.menu});
  @override
  List<Object?> get props => [];
}