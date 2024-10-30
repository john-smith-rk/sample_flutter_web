import 'package:key_fields_com/bloc/splash_bloc/splash_event.dart';
import 'package:key_fields_com/bloc/splash_bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState>{

  SplashBloc():super(InitialState()){
    on<InitSplashEvent>((event, emit) async {
      emit(LoadingState());

      await Future.delayed(const Duration(seconds: 5));

      emit(CompletedState());
    });
  }

}