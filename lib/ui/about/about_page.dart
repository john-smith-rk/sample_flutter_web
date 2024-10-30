import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_fields_com/bloc/about_bloc/about_bloc.dart';
import 'package:key_fields_com/bloc/about_bloc/about_state.dart';
import 'package:key_fields_com/model/founder_person_model.dart';
import 'package:key_fields_com/ui/footer_page.dart';
import 'package:key_fields_com/utils/device_checker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AboutPage extends StatelessWidget{

  AboutPage({super.key});

  final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'))
    ..initialize();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(_) => AboutBloc(),
      child: BlocBuilder<AboutBloc, AboutState>(
        builder: (context,state){
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                buildHeaderView(context),

                buildThreeMissionView(context),

                videoView(context),

                buildManagementTeamView(context, state),

                buildClientView(context),

                const FooterPage(),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Header Text View
  Widget buildHeaderView(BuildContext context){
    return Container(
      color: Colors.grey.shade100,
      child: isWebView()?Row(
        children: [
          Expanded(child: buildHeaderText(context)),
          Expanded(child: buildHeaderDescr(context)),
        ],
      ):Column(
        children: [
          buildHeaderText(context),
          buildHeaderDescr(context),
        ],
      ),
    );
  }

  /// build  Header Text
  Widget buildHeaderText(BuildContext context){
    return Container(
      margin: const EdgeInsets.all(20),
      child: Text("KEYFIELDS: Who We Are?",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.black87, fontWeight: FontWeight.bold ),
      ),
    );
  }

  /// build  Header Descr
  Widget buildHeaderDescr(BuildContext context){
    return Container(
      margin: const EdgeInsets.all(20),
      child: Text("Established in 2003, KEYfields’ is formed by a team of professionals with decades of experience in providing IT solutions. KEYfields’ is a software provider for an award-winning solution, iLOGON. Specialized in providing comprehensive supply chain and transport solutions, KEYfields’ has a proven track record & successful delivery of many large-scale projects by adopting a consultative approach by adding with the know-hows and best practices in the industry.",
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87,  ),
      ),
    );
  }

  /// Three Mission, Vision, Values
  Widget buildThreeMissionView(BuildContext context){
    return Container(
      color: Colors.grey.shade50,
      child: isWebView()?Row(
        children: [
          Expanded(child: buildMissionView(context)),
          Expanded(child: buildVisionView(context)),
          Expanded(child: buildValuesView(context))
        ],
      ):Column(
        children: [
          buildMissionView(context),
          buildVisionView(context),
          buildValuesView(context)
        ],
      ),
    );
  }

  /// Mission View
  Widget buildMissionView(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        color: Colors.blueGrey.shade900,
        constraints: const BoxConstraints(
          minHeight: 400,
        ),
        child:  Column(
            children: [

              const SizedBox(height: 20,),

              const Icon(
                Icons.flag_circle,
                size: 80,
                color: Colors.white,
              ),

              const SizedBox(height: 10,),

              Text("Mission",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white,
                      fontWeight: FontWeight.w500, fontFamily: GoogleFonts.notoSans().fontFamily)),

              const SizedBox(height: 10,),

              Text("To offer comprehensive business solutions with cutting edge technology to our business partners enabling them to compete and grow through Information Technology.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith( color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

            ]
        )
    );
  }

  /// Vision View
  Widget buildVisionView(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        color: Colors.blueGrey.shade900,
        constraints: const BoxConstraints(
          minHeight: 400,
        ),
        child:  Column(
            children: [

              const SizedBox(height: 20,),

              const Icon(
                Icons.lightbulb_outline_sharp,
                size: 80,
                color: Colors.white,
              ),

              const SizedBox(height: 10,),

              Text("Vision",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white,
                      fontWeight: FontWeight.w500, fontFamily: GoogleFonts.notoSans().fontFamily)),

              const SizedBox(height: 10,),

              Text("To be a leader in providing cost effective and technological advanced business solutions to assist our business partners.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith( color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

            ]
        )
    );
  }

  /// Values View
  Widget buildValuesView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        color: Colors.blueGrey.shade900,
        constraints: const BoxConstraints(
          minHeight: 400,
        ),
        child:  Column(
            children: [

              const SizedBox(height: 20,),

              const Icon(
                Icons.accessibility_new,
                size: 80,
                color: Colors.white,
              ),

              const SizedBox(height: 10,),

              Text("Values",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white,
                      fontWeight: FontWeight.w500, fontFamily: GoogleFonts.notoSans().fontFamily)),

              const SizedBox(height: 10,),

              Text("Purpose Driven – Clear & Concise \nRelationships – Internal & External \nInnovative – Embrace Change\nDependability – Delivering Success\nExcellence – In What We Do",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith( color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

            ]
        )
    );
  }

  /// Build Message Video View
 Widget videoView(BuildContext context){
   return Container(
       width: MediaQuery.of(context).size.width,
       padding: const EdgeInsets.all(20),
       margin: const EdgeInsets.all(20),
       child:  Column(
           children: [

             Text("Message From Our Group CEO",
               textAlign: TextAlign.center,
               style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.black87, fontWeight: FontWeight.bold ),
             ),

             const SizedBox(height: 10,),

            Container(
              width: 500,
              height: 300,
              alignment: Alignment.center,
              child:  Chewie(controller: ChewieController(
                videoPlayerController: videoPlayerController,
                autoPlay: false,
                autoInitialize: true,
                allowFullScreen: true,
                looping: true,
                showControls: true,
                aspectRatio: 16 / 9,
                ),
              )
            )

           ]
       )
   );
 }

 /// Build Management Team View
 Widget buildManagementTeamView(BuildContext context , AboutState state){

   return Container(
       width: MediaQuery.of(context).size.width,
       padding: const EdgeInsets.all(20),
       margin: const EdgeInsets.all(20),
       child:  Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [

             Text("KEYfields’ Management Team",
               textAlign: TextAlign.start,
               style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.black87, fontWeight: FontWeight.bold ),
             ),

             const SizedBox(height: 10,),


             isWebView()?Column(
               children: [
                 Row(
                   children: [
                     Expanded(child: buildPersonView(context, state.founder[0])),
                     Expanded(child: buildPersonView(context, state.founder[1])),
                   ],
                 ),

                 Row(
                   children: [
                     Expanded(child: buildPersonView(context, state.founder[2])),
                     Expanded(child: buildPersonView(context, state.founder[3])),
                   ],
                 )

               ],
             ):Column(
               children: [
                 buildPersonView(context, state.founder[0]),
                 buildPersonView(context, state.founder[1]),
                 buildPersonView(context, state.founder[2]),
                 buildPersonView(context, state.founder[3])
               ],
             ),


           ]
       )
   );
 }

 /// Build Person View
 Widget buildPersonView(BuildContext context, FounderPersonModel founder){
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
        minHeight: 400
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              shape: BoxShape.circle,
              image:  DecorationImage(
                image: AssetImage(founder.profile.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Text(founder.name.toString(),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black87, fontWeight: FontWeight.bold ),
          ),

          Text(founder.position.toString(),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.indigo, fontWeight: FontWeight.w500 ),
          ),

          const SizedBox(height: 10,),

          Text(founder.description.toString(),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.labelLarge,
          ),

        ],
      ),
    );
 }

 /// Build Client View
Widget buildClientView(BuildContext context){
  return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      child:  Column(
          children: [

            Text("Our Clients",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.black87, fontWeight: FontWeight.bold ),
            ),

            const SizedBox(height: 10,),

            CarouselSlider(
              disableGesture: false,
              options: CarouselOptions(
                  height: 80,
                  autoPlay: true,
                  autoPlayAnimationDuration : const Duration(milliseconds: 1500)
              ),
              items: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Row(
                      children: [
                        Expanded(child: buildSliderView(context)),
                        Expanded(child: buildSliderView(context)),
                        Expanded(child: buildSliderView(context)),
                        Expanded(child: buildSliderView(context)),
                      ],
                    );
                  },
                );
              }).toList(),
            )

          ]
      )
  );
}

/// Slider View
Widget buildSliderView(BuildContext context){
  return Container(
    width: 100,
    height: 50,
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.blueGrey.shade50,
      //shape: BoxShape.circle,
      image: const DecorationImage(
        image: AssetImage("assets/images/pic2.png"),
        fit: BoxFit.cover,
      ),
    ),
  );
}

}

