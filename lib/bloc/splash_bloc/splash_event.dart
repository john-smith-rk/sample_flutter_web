import 'package:equatable/equatable.dart';
abstract class SplashEvent extends Equatable {}

class InitSplashEvent extends SplashEvent {

  InitSplashEvent();

  @override
  List<Object?> get props => [];

}
