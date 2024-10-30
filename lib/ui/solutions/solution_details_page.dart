import 'package:flutter/material.dart';
import 'package:key_fields_com/utils/device_checker.dart';
import 'package:google_fonts/google_fonts.dart';

class SolutionDetailsPage extends StatelessWidget {
  const SolutionDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: isWebView()? Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Expanded(child: buildCFView(context)),

              Expanded(child: buildFCView(context)),

              Expanded(child: buildSIView(context)),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Expanded(child: buildEESView(context)),

              Expanded(child: buildAICView(context)),

              Expanded(child: buildACView(context)),

            ],
          )

        ],
      ): Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          buildCFView(context),

          buildFCView(context),

          buildSIView(context),

          buildEESView(context),

          buildAICView(context),

          buildACView(context),

        ],
      ),
    );

  }


  /// Build CF View
  Widget buildCFView(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child:  Column(
            children: [

              FloatingActionButton(
                backgroundColor: Colors.indigo.shade900,
                hoverColor: Colors.blue.shade900,
                onPressed: () {},
                shape: const StadiumBorder(),
                child: const Icon(
                  Icons.format_list_bulleted_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10,),

              Text("Comprehensive Features",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.indigo.shade900,
                      fontWeight: FontWeight.w500, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),

              const SizedBox(height: 10,),

              Text("Features to cater to your dynamic needs as we understand every operation is unique and different.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith( fontFamily: GoogleFonts.notoSans().fontFamily)),

            ]
        )
    );
  }

  /// Build FC View
  Widget buildFCView(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child:  Column(
            children: [

              FloatingActionButton(
                backgroundColor: Colors.indigo.shade900,
                hoverColor: Colors.blue.shade900,
                onPressed: () {},
                shape: const StadiumBorder(),
                child: const Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10,),

              Text("Flexible Configurations",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.indigo.shade900,
                      fontWeight: FontWeight.w500, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),

              const SizedBox(height: 10,),

              Text("Configurations to fine tune and suit your operations, streamlining your internal process flows.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith( fontFamily: GoogleFonts.notoSans().fontFamily)),

            ]
        )
    );
  }

  /// Build SI View
  Widget buildSIView(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child:  Column(
            children: [

              FloatingActionButton(
                backgroundColor: Colors.indigo.shade900,
                hoverColor: Colors.blue.shade900,
                onPressed: () {},
                shape: const StadiumBorder(),
                child: const Icon(
                  Icons.link_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10,),

              Text("Software Integration",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.indigo.shade900,
                      fontWeight: FontWeight.w500, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),

              const SizedBox(height: 10,),

              Text("Software integration capabilities to link with current or new software. Improving the flow of information.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith( fontFamily: GoogleFonts.notoSans().fontFamily)),

            ]
        )
    );
  }

  /// Build EES View
  Widget buildEESView(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child:  Column(
            children: [

              FloatingActionButton(
                backgroundColor: Colors.indigo.shade900,
                hoverColor: Colors.blue.shade900,
                onPressed: () {},
                shape: const StadiumBorder(),
                child: const Icon(
                  Icons.lightbulb_outline,
                  size: 30,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10,),

              Text("End to End Solution",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.indigo.shade900,
                      fontWeight: FontWeight.w500, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),

              const SizedBox(height: 10,),

              Text("Full suite of solutions at your fingertips. Providing a full suite of solutions to fully cover your operations.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith( fontFamily: GoogleFonts.notoSans().fontFamily)),

            ]
        )
    );
  }

  /// Build EES View
  Widget buildAICView(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child:  Column(
            children: [

              FloatingActionButton(
                backgroundColor: Colors.indigo.shade900,
                hoverColor: Colors.blue.shade900,
                onPressed: () {},
                shape: const StadiumBorder(),
                child: const Icon(
                  Icons.phone_android_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10,),

              Text("Android & iOS Compatible",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.indigo.shade900,
                      fontWeight: FontWeight.w500, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),

              const SizedBox(height: 10,),

              Text("KEYfields’ application is compatible with both Android & iOS. Making it easier to receive on ground updates.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith( fontFamily: GoogleFonts.notoSans().fontFamily)),

            ]
        )
    );
  }

  /// Build EES View
  Widget buildACView(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child:  Column(
            children: [

              FloatingActionButton(
                backgroundColor: Colors.indigo.shade900,
                hoverColor: Colors.blue.shade900,
                onPressed: () {},
                shape: const StadiumBorder(),
                child: const Icon(
                  Icons.auto_awesome_mosaic_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10,),

              Text("Automation Capabilities",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.indigo.shade900,
                      fontWeight: FontWeight.w500, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),

              const SizedBox(height: 10,),

              Text("Integration with hardware such as ASRS, AMR, AGV, lean lift, weight machines and many more.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith( fontFamily: GoogleFonts.notoSans().fontFamily)),

            ]
        )
    );
  }


}