import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState>{

  MainBloc() : super(MainInitial()){
    on<AddTitleEvent>((event, emit) {
      emit(MainSuccess(event.title??"KEYFields.com"));
    });
  }

}