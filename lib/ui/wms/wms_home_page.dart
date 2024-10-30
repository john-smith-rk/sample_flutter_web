import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key_fields_com/ui/footer_page.dart';
import 'package:key_fields_com/ui/header_title_page.dart';
import 'package:key_fields_com/utils/device_checker.dart';
import 'package:google_fonts/google_fonts.dart';

class WMSHomePage extends StatelessWidget {

  final List<String> wmsFeatureList = [
    "Multi-Companies / Accounts / Sites",
    "Multi-Language support",
    "Location mapping",
    "Bonded Warehouse",
    "Harmonized System (HS) & CASC Code for Customs",
    "Flexible putaway & allocation strategy configuration",
    "Advanced lot configuration & UOM",
    "Warehouse billing configuration and invoice generation",
    "Inbound & Outbound activities",
    "Barcode Scanning",
    "Inventory Management",
    "Batch Picking",
    "Pick & Pack functionality",
    "Pick face & replenishment",
    "Kitting and assembly (VAS)",
    "Report Scheduler",
    "Integration capabilities",
    "Dashboard for manager to monitor overall shipment status",
    "Warehouse billing configuration and invoice generation"
  ];

  WMSHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const HeaderTitlePage("Warehouse Management System"),

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
          "Everything You Need For Your Warehouse Operations",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.indigo.shade900, fontWeight: FontWeight.bold ),
        ),
        const SizedBox(height: 10,),
        Text(
          "iWMS is designed to be operational centric and scalable which allows for flexibility when adding or enhancing functionalities configured to different business needs. \n\n KEYfields’ iWMS process flows and control procedures are refined from years of experience and caters to usage in any industry be it Pharmaceuticals, e-Commerce, Chemical, Cold Chain, FMCG, Electronics, Oil & Gas, Healthcare, Bonded Goods and many more.",
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
        Expanded(child: buildWMSFeatureText(context)),
      ],
    ):Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        builtWMSFeatureImageView(context),

        buildWMSFeatureText(context),

      ],
    ),

  );
}

/// WMS Feature Text
Widget buildWMSFeatureText(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        const SizedBox(height: 20,),

        Text("KEYfields’ IWMS Features",
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
            children: wmsFeatureList.map((str) {
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
      child: Image.asset("assets/images/iWMS-Brochure.png", fit: BoxFit.cover,),
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

              Text("Pick & Pack functionality",
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

              Text("iWMS is built with a flexible Pick & Pack functionality which supports your business requirement",
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

              Text("Kitting And Assembly (VAS)",
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

              Text("iWMS kitting and Assembly caters for unique Value Added Services for your warehouse operation",
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

              Text("Multi-System Integration",
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

              Text("iWMS is able to link up with multiple external systems to support your businesses",
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