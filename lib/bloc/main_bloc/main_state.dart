import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {

  String title = "KEYFields.com";

  MainState();

  @override
  List<Object> get props => [];
  get temp => null;

}

class MainInitial extends MainState {

  MainInitial();
  @override
  List<Object> get props => [title];
}

class MainSuccess extends MainState {

  MainSuccess(String title){
    this.title = title;
  }

  @override
  List<Object> get props => [title];
}