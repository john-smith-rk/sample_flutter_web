import 'package:flutter_bloc/flutter_bloc.dart';
import 'about_event.dart';
import 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState>{

  AboutBloc() : super(InitialState()){

    on<ExpandCollectEvent>((event, emit) async {
        if(event.index != null){
          emit(ExpandCollectState(event.index));
        }
    });


  }
}