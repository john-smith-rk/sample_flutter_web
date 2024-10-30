import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {}

class InitialState extends SplashState {

  InitialState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends SplashState {

  LoadingState();

  @override
  List<Object?> get props => [];
}

class CompletedState extends SplashState {
  CompletedState();

  @override
  List<Object?> get props => [];
}