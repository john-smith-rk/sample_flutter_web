import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_fields_com/bloc/solution_bloc/solution_event.dart';
import 'package:key_fields_com/bloc/solution_bloc/solution_state.dart';

class SolutionBloc extends Bloc<SolutionEvent, SolutionState> {

  SolutionBloc() : super(InitialState());

}