import 'package:equatable/equatable.dart';

abstract class AboutEvent extends Equatable {}

class InitEvent extends AboutEvent {
  InitEvent();
  @override
  List<Object?> get props => [];
}

class ExpandCollectEvent extends AboutEvent{
  int? index;

  ExpandCollectEvent(this.index);

  @override
  List<Object?> get props => [index];

}
