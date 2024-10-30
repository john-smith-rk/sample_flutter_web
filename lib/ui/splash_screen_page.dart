import 'package:flutter/material.dart';
import 'package:key_fields_com/bloc/splash_bloc/splash_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_fields_com/bloc/splash_bloc/splash_event.dart';
import 'package:key_fields_com/bloc/splash_bloc/splash_state.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'menu_page.dart';

class SplashScreenPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    BlocProvider.of<SplashBloc>(context).add(InitSplashEvent());

    return Scaffold(
    body:BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if(state is CompletedState){

         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuPage()));
        }
      },
      builder: (context, state) {
          if(state is InitialState || state is LoadingState){
            return  Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('KEYFields.com',
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                      ))
                ],

              ));
          }

          return const SizedBox();
        }

      )
    );
  }

}