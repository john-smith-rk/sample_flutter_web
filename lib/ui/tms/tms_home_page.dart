import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_fields_com/ui/footer_page.dart';
import 'package:key_fields_com/ui/header_title_page.dart';
import 'package:key_fields_com/utils/device_checker.dart';

class TmsHomePage extends StatelessWidget {
   TmsHomePage({Key? key}) : super(key: key);

   final List<String> featureList = [
     "Multi-Companies / Accounts / Site",
     "Multi-Language Support",
     "Personnel Management",
     "Last Mile Delivery",
     "Route Planning",
     "Driver POD",
     "Drivers’ Incentive",
     "Payment Management",
     "Billing Management",
     "Sales Management",
     "Manpower Planning",
     "Vehicle Upkeep",
     "Vehicle Pump Transaction",
     "Equipment Expiry Schedule",
     "Transport Job Order Register",
     "Photo Capturing",
     "Signature Capture",
     "Dashboard for manager to monitor overall transport status"
   ];


   @override
   Widget build(BuildContext context) {
     return  SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [

           const HeaderTitlePage("Transport Management System"),

           buildHeaderView(context),

           systemMultiplePlatformView(context),

           buildWMSFeature(context),

           buildFooterView(context),

           const FooterPage(),

         ],
       ),
     );
   }


   /// Header View
   Widget buildHeaderView(BuildContext context) {
     return Container(
       margin: const EdgeInsets.all(20),
       width: MediaQuery.of(context).size.width,
       child: isWebView()?Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Expanded(
             flex: 1,
             child: buildTitleView(context),
           ),

           Expanded(
             flex: 1,
             child: builtTitleImageView(context),
           ),

         ],
       ):Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           buildTitleView(context),

           builtTitleImageView(context),
         ],
       ),

     );
   }

   /// Title View
   Widget buildTitleView(BuildContext context) {
     return  Container(
       margin: const EdgeInsets.only(top:20,bottom:20),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Text(
             "Simplifying Your Transport Operations",
             style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.indigo.shade900, fontWeight: FontWeight.bold ),
           ),
           const SizedBox(height: 10,),
           Text( "iTMS is a full web-based Transport Management solution that provides real-time transportation management. Have full visibility over your transport operations, improving efficiency and streamlining workflows by having information in a central repository. iTMS also effectively manage your resource utilization and productivity simplifying processes and administrative tasks.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade900, fontWeight: FontWeight.w500 ),
           ),
         ],
       ),
     );
   }

   Widget builtTitleImageView(BuildContext context) {
     return Container(
       margin: const EdgeInsets.only(top:20,bottom:20),
       width: MediaQuery
           .of(context)
           .size
           .width,
       child: Image.asset("assets/images/iWMS-GR-removebg-preview.png", fit: BoxFit.cover,),
     );
   }

   /// System Multiple platform
   Widget systemMultiplePlatformView(BuildContext context) {
     return Container(
       padding: const EdgeInsets.all(20),
       width: double.infinity,
       color: Colors.grey.shade100,
       constraints: BoxConstraints(
         minHeight: MediaQuery.of(context).size.height/6,
       ),
       child: Column(
         children: [

           const SizedBox(height: 20,),

           Text("One System Multiple Platforms",
             textAlign: TextAlign.center,
             style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.indigo.shade900, fontWeight: FontWeight.bold ),
           ),

           const SizedBox(height: 20,),

           Container(
             margin: const EdgeInsets.only(top:20,bottom:20),
             width: isWebView()?600:300,
             height: isWebView()?300:150,
             child: Image.asset("assets/images/multi-platform.png", fit: BoxFit.fill,),
           ),

           const SizedBox(height: 20,),

         ],
       ),

     );
   }

   /// Build WMS features
   Widget buildWMSFeature(BuildContext context) {
     return Container(
       padding: const EdgeInsets.all(20),
       width: double.infinity,
       constraints: BoxConstraints(
         minHeight: MediaQuery
             .of(context)
             .size
             .height / 6,
       ),
       child: isWebView()?Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Expanded(child: builtWMSFeatureImageView(context)),
           Expanded(child: buildFeatureText(context)),
         ],
       ):Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [

           builtWMSFeatureImageView(context),

           buildFeatureText(context),

         ],
       ),

     );
   }

   /// Tms Feature Text
   Widget buildFeatureText(BuildContext context) {
     return SizedBox(
       width: double.infinity,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [

           const SizedBox(height: 20,),

           Text("KEYfields’ ITMS Features",
             textAlign: TextAlign.start,
             style: Theme
                 .of(context)
                 .textTheme
                 .displaySmall
                 ?.copyWith(color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
           ),

           const SizedBox(height: 20,),

           Container(
             alignment: Alignment.centerLeft,
             padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: featureList.map((str) {
                 return Container(
                   padding: const EdgeInsets.only(top: 5),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text(
                         '\u2022',
                         style: TextStyle(
                           fontSize: 16,
                           height: 1.55,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       const SizedBox(width: 5,),
                       Expanded(
                         child: Text(
                           str,
                           textAlign: TextAlign.left,
                           softWrap: true,
                           style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: GoogleFonts.notoSans().fontFamily, fontWeight: FontWeight.bold,),
                         ),
                       ),
                     ],
                   ),
                 );
               }).toList(),
             ),
           ),

           const SizedBox(height: 20,),

         ],
       ),

     );
   }

   Widget builtWMSFeatureImageView(BuildContext context) {
     return Container(
       alignment: Alignment.centerLeft,
       margin: const EdgeInsets.only(top:20,bottom:20),
       width: MediaQuery
           .of(context)
           .size
           .width,
       child: Image.asset("assets/images/iTMS.png", fit: BoxFit.cover,),
     );
   }


   /// Footer View
   Widget buildFooterView(BuildContext context) {
     return Container(
       padding: const EdgeInsets.all(20),
       width: double.infinity,
       color: Colors.grey.shade100,
       constraints: BoxConstraints(
         minHeight: MediaQuery.of(context).size.height/6,
       ),
       child: isWebView()?Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [

           Expanded(child: buildFooter1(context)),

           Expanded(child: buildFooter2(context)),

           Expanded(child: buildFooter3(context)),

         ],
       ):Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [

           buildFooter1(context),

           buildFooter2(context),

           buildFooter3(context),

         ],
       ),

     );
   }

   /// Build Footer1
   Widget buildFooter1(BuildContext context) {
     return Container(
         margin: const EdgeInsets.all(20),
         child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [

               Text("Driver ePOD",
                   textAlign: TextAlign.start,
                   style: Theme
                       .of(context)
                       .textTheme
                       .titleLarge
                       ?.copyWith(color: Colors.indigo.shade900,
                       fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                           .playfairDisplay()
                           .fontFamily)),


               const SizedBox(height: 10,),

               Text("Drivers may capture/upload images as well as input remarks during jobs",
                   textAlign: TextAlign.start,
                   style: Theme
                       .of(context)
                       .textTheme
                       .bodyLarge
                       ?.copyWith(fontFamily: GoogleFonts
                       .notoSans()
                       .fontFamily)),

             ]
         )
     );
   }

   /// Build Footer2
   Widget buildFooter2(BuildContext context) {
     return Container(
         margin: const EdgeInsets.all(20),
         child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [

               Text("Automatic Job Allocation",
                   textAlign: TextAlign.start,
                   style: Theme
                       .of(context)
                       .textTheme
                       .titleLarge
                       ?.copyWith(color: Colors.indigo.shade900,
                       fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                           .playfairDisplay()
                           .fontFamily)),


               const SizedBox(height: 10,),

               Text("Jobs are automatically distributed to streamline manual job assignments process",
                   textAlign: TextAlign.start,
                   style: Theme
                       .of(context)
                       .textTheme
                       .bodyLarge
                       ?.copyWith(fontFamily: GoogleFonts
                       .notoSans()
                       .fontFamily)),

             ]
         )
     );
   }

   /// Build Footer3
   Widget buildFooter3(BuildContext context) {
     return Container(
         margin: const EdgeInsets.all(20),
         child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [

               Text("Driver GPS Tracking",
                   textAlign: TextAlign.start,
                   style: Theme
                       .of(context)
                       .textTheme
                       .titleLarge
                       ?.copyWith(color: Colors.indigo.shade900,
                       fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                           .playfairDisplay()
                           .fontFamily)),


               const SizedBox(height: 10,),

               Text("Overview of your driver’s current location while on the job",
                   textAlign: TextAlign.start,
                   style: Theme
                       .of(context)
                       .textTheme
                       .bodyLarge
                       ?.copyWith(fontFamily: GoogleFonts
                       .notoSans()
                       .fontFamily)),

             ]
         )
     );
   }
}