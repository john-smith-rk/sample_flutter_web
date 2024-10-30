import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_fields_com/utils/device_checker.dart';

class FooterPage extends StatelessWidget{
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: const BoxConstraints(
        minHeight: 180,
      ),
      color: Colors.indigo.shade900,
      child: isWebView()?Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: buildContact1View(context)),
            Expanded(child: buildContact2View(context)),
            Expanded(child: buildContact3View(context)),
            Expanded(child: buildContact4View(context)),
          ]
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildContact1View(context),
          buildContact2View(context),
          buildContact3View(context),
          buildContact4View(context),
        ]
      )
    );
  }

}

/// build  Contact1
Widget buildContact1View(BuildContext context){
  return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text("Singapore(HQ):",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white,
                    fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                        .notoSans()
                        .fontFamily)),

            const SizedBox(height: 10,),

            Text("Tel: (65) 6842 7886",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

            const SizedBox(height: 10,),

            Text("Email: info@keyfields.com",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

          ]
      )
  );
}

/// build  Contact2
Widget buildContact2View(BuildContext context){
  return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text("Myanmar:",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white,
                    fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                        .notoSans()
                        .fontFamily)),

            const SizedBox(height: 10,),

            Text("Tel: (65) 6842 7886",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

            const SizedBox(height: 10,),

            Text("Email: info@keyfields.com",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

          ]
      )
  );
}

/// build  Contact3
Widget buildContact3View(BuildContext context){
  return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text("Indonesia:",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white,
                    fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                        .notoSans()
                        .fontFamily)),

            const SizedBox(height: 10,),

            Text("Tel: (65) 6842 7886",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

            const SizedBox(height: 10,),

            Text("Email: info@keyfields.com",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

          ]
      )
  );
}

/// build  Contact4
Widget buildContact4View(BuildContext context){
  return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text("Thailand:",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white,
                    fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                        .notoSans()
                        .fontFamily)),

            const SizedBox(height: 10,),

            Text("Tel: (65) 6842 7886",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

            const SizedBox(height: 10,),

            Text("Email: info@keyfields.com",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

          ]
      )
  );
}