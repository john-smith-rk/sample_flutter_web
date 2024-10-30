import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_fields_com/ui/footer_page.dart';
import 'package:key_fields_com/ui/header_title_page.dart';
import 'package:key_fields_com/utils/device_checker.dart';

class FreightHomePage extends StatelessWidget{

  FreightHomePage({Key? key}) : super(key: key);

  final List<String> featureList = [
    "Multi-Companies / Accounts / Site",
    "Multi-Language Support",
    "Account Master Setup",
    "Supplier Setup",
    "Costing Sheet Register",
    "Capture Adhoc Charges",
    "Update Job Route",
    "Update Vessel Details",
    "View Freight Job Milestone",
    "Freight Job Registration",
    "Documentation and reports",
    "Billing Module",
    "Master Account Management",
    "Order Management and Processing",
    "Import and Export"
  ];


  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const HeaderTitlePage("Freight Management System"),

          buildHeaderView(context),

          systemMultiplePlatformView(context),

          buildWMSFeature(context),


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
            "Streamline All Your Freight Operations",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.indigo.shade900, fontWeight: FontWeight.bold ),
          ),
          const SizedBox(height: 10,),
          Text( "KEYfields’ Freight Management Software features multiple sales quotation & billing, import & export booking details and it also contains an extensive list of configurable documents printouts such as Arrival Shipping Note, Delivery Note, Waybill, etc. Management Reports & Dashboard readily available for freight forwarders to analyze & perform critical business decisions.\niFMS provides freight forwarders with improved workflow processes, efficiency and increase productivity.",
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

          Text("KEYfields’ IFMS Features",
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
      child: Image.asset("assets/images/iFMS.png", fit: BoxFit.cover,),
    );
  }



}