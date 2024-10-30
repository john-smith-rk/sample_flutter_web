import 'package:flutter_bloc/flutter_bloc.dart';
import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState>{

  MenuBloc() : super(MenuInitial()){
    on<FetchMenuEvent>((event, emit) {
      try {
        emit(MenuSuccess(event.menu!));
      } catch (e) {
        emit(
          MenuError(e.toString()),
        );
      }
    });
  }

}