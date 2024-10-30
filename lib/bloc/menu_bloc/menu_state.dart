import 'package:equatable/equatable.dart';

abstract class MenuState extends Equatable {

  String menu = "";

   MenuState();

  @override
  List<Object> get props => [];
  get temp => null;

}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuSuccess extends MenuState {

  MenuSuccess(String menu){
    this.menu = menu;
  }

  @override
  List<Object> get props => [menu];
}

class MenuError extends MenuState {
  final String errMessage;

  MenuError(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}