import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:key_fields_com/bloc/main_bloc/main_event.dart';
import 'package:key_fields_com/ui/splash_screen_page.dart';

import 'bloc/main_bloc/main_bloc.dart';
import 'bloc/main_bloc/main_state.dart';
import 'bloc/menu_bloc/menu_bloc.dart';
import 'bloc/menu_bloc/menu_event.dart';
import 'bloc/splash_bloc/splash_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
      if (kDebugMode) {
        print('BLOC Change >>>>>$change');
      }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print('BLOC Transition >>>>> $transition');
    }
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print('BLOC Close >>>>>> $bloc');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      print('BLOC Error >>>>>> $error');
    }
  }


  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // BlocOverrides.runZoned(() {
  //    runApp( const MyApp());
  // },
  //   blocObserver: AppBlocObserver()
  // );

  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (BuildContext context, Widget? child)=>MultiBlocProvider(
        providers: [
           BlocProvider(create: (_) => MainBloc()..add(AddTitleEvent(title:"KEYFields.com")),
        )
      ],
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context,state){
          return MaterialApp(
            title: state.title,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
              primaryColor: Colors.blue.shade700,
              primaryColorDark: Colors.blue,
              useMaterial3: true,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocProvider(create: (_) => SplashBloc(), child: SplashScreenPage()),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Theme.of(context).colorScheme.primary,
    //     title: Text(widget.title),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         const Text(
    //           'You have pushed the button this many times:',
    //         ),
    //         TextField(
    //           controller: TextEditingController(),
    //           decoration:  InputDecoration(
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(50)
    //             )
    //           ),
    //           style: Theme.of(context).textTheme.labelMedium,
    //         ),
    //         MaterialButton(onPressed: () {  },
    //           color: Colors.amber,
    //           shape: const StadiumBorder(),
    //           child:  Text(
    //             'Press Me',
    //             style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    //   // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}
