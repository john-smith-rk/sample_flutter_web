import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_fields_com/bloc/solution_bloc/solution_bloc.dart';
import 'package:key_fields_com/bloc/solution_bloc/solution_state.dart';
import 'package:key_fields_com/ui/footer_page.dart';
import 'package:key_fields_com/ui/solutions/solution_details_page.dart';
import 'package:key_fields_com/utils/device_checker.dart';

class SolutionPage extends StatelessWidget{

  const SolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(_) => SolutionBloc(),
      child: BlocBuilder<SolutionBloc, SolutionState>(
        builder: (context,state){
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                buildFirstView(context),

                buildImageView(context),

                buildSolutionView(context),

                const SolutionDetailsPage(),

                const FooterPage(),

              ],
            ),
          );
        },
      ),
    );
  }

  /// First View
  Widget buildFirstView(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height/3,
      ),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration:    BoxDecoration(
          color: Colors.black87.withOpacity(0.9),
          image: const DecorationImage(
              fit: BoxFit.cover,
              opacity: 0.5,
              image: AssetImage("assets/images/background.jpg"))
      ),
      child: Column(
        children: [

          Text("Solutions",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white,  ),
          ),

          const SizedBox(height: 10,),

          Text("KEYfields’ offer flexible solutions that can be deployed across different operating system & platforms. The system is a modular software allowing functionality to be added, enhanced or replaced. KEYfields’ scalable design enables organizations big or small to stay equipped and provide value to their customers.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white ),
          ),


        ],
      ),
    );
  }

  /// Solution1 Image View
  Widget buildImageView(BuildContext context){
    return Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          minHeight: 300,
        ),
        height: MediaQuery.of(context).size.height/2,
        child: const Image(
            fit: BoxFit.fill,
            image:AssetImage("assets/images/solution1.png")));
  }

/// Build Solution View
Widget buildSolutionView(BuildContext context){
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(20),
    width: double.infinity,
    child: Column(
      children: [

        Text("Our Software Is Quick, Lean, And Market-Focused.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.black87, fontWeight: FontWeight.bold ),
        ),

        const SizedBox(height: 10,),

        Text("iLOGON an end-to-end solution, modular and scalable, enabling organizations to stay equipped amidst the dynamic business landscape.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87 ),
        ),


        isWebView()? Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(child: buildWMSView(context)),

                Expanded(child: buildTMSView(context)),

                Expanded(child: buildFMSView(context)),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(child: buildCMSView(context)),

                Expanded(child: buildCTMSView(context)),

                Expanded(child: buildAccountingView(context)),

              ],
            )

          ],
        ): Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            buildWMSView(context),

            buildTMSView(context),

            buildFMSView(context),

            buildCMSView(context),

            buildCTMSView(context),

            buildAccountingView(context),

          ],
        ),


      ],
    ),
  );
}

  /// Build WMS View
  Widget buildWMSView(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
          minHeight: 200
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
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage("assets/images/WMS-solutions-Logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Text("Warehouse Management System",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87 ),
          ),

          const SizedBox(height: 10,),

          Text("iWMS, a total warehouse management solution. Practical functionality & user friendly UI…",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87 ),
          ),

        ],
      ),
    );
}

  /// Build TMS View
  Widget buildTMSView(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
          minHeight: 200
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
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage("assets/images/TMS-solution-logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Text("Transport Management System",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87 ),
          ),

          const SizedBox(height: 10,),

          Text("iTMS allows management of your transport operations with a single view…",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87 ),
          ),

        ],
      ),
    );
  }

  /// Build FMS View
  Widget buildFMSView(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
          minHeight: 200
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
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage("assets/images/FMS-solutions-logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Text("Freight Management System",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87 ),
          ),

          const SizedBox(height: 10,),

          Text("iFMS features multiple sales quotation & billing, import & export detail booking…",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87 ),
          ),

        ],
      ),
    );
  }

  /// Build CMS View
  Widget buildCMSView(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
          minHeight: 200
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
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage("assets/images/CMS-solutions-logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Text("Container Management System",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87 ),
          ),

          const SizedBox(height: 10,),

          Text("iCMS simplifies management of container assets for container owners…",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87 ),
          ),

        ],
      ),
    );
  }

  /// Build CYMS View
  Widget buildCTMSView(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
          minHeight: 200
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
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage("assets/images/CYMS-solution-logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Text("Container Yard Management System",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87 ),
          ),

          const SizedBox(height: 10,),

          Text("iCYMS is designed for port & container operators for asset visibility, accuracy…",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87 ),
          ),

        ],
      ),
    );
  }

  /// Build Accounting View
  Widget buildAccountingView(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
          minHeight: 200
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
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage("assets/images/oneaccounting-solutions-logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Text("Accounting",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87 ),
          ),

          const SizedBox(height: 10,),

          Text("iAccounting provides users with ins & outs to keep track of their business operation finances…",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87 ),
          ),

        ],
      ),
    );
  }


}