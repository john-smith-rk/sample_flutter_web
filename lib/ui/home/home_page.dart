import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_fields_com/bloc/home/home_bloc.dart';
import 'package:key_fields_com/bloc/home/home_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_fields_com/custom_view/black_color_button.dart';
import 'package:key_fields_com/custom_view/blue_color_button.dart';
import 'package:key_fields_com/custom_view/proste_bezier_curve.dart';
import 'package:key_fields_com/ui/footer_page.dart';
import 'package:key_fields_com/utils/device_checker.dart';
import 'package:key_fields_com/utils/proste_bezier_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(_) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context,state){
           return SingleChildScrollView(
             child: Column(
               children: [
                 buildFirstView(context),
                 buildSecondView(context),
                 buildImageView(context),
                 buildTechnicalSupportView(context),
                 sliderView(context),
                 buildUserView(context),

                 const FooterPage(),
               ],
             ),
           );
        },
      ),
    );
  }

}

/// First View
Widget buildFirstView(BuildContext context) {
  return ClipPath(
    //clipper : !isWebView()?null:NativeClipper(),
    clipper: !isWebView()?null:ProsteBezierCurve(
      position: ClipPosition.bottom, list: [

      BezierCurveSection(
        start: Offset(0, MediaQuery.of(context).size.width),
        top: Offset(MediaQuery.of(context).size.width, MediaQuery.of(context).size.width/1.89 ),
        end: Offset(MediaQuery.of(context).size.width, MediaQuery.of(context).size.width),
      ),
      ],
    ),
    child: Container(
      alignment: Alignment.center,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height/2,
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

          Text("End To End Warehouse & Transport Solutions",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white,  ),
          ),

          const SizedBox(height: 20,),

          Text("Increase efficiency and productivity by having real time information at your fingertips!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontFamily: GoogleFonts.aboreto().fontFamily ),
          ),

          const SizedBox(height: 20,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Flexible(child: SizedBox(
                width: 250,
                child: blueColorButton(context, "Get Started Now ", (){}),
              )),

              const SizedBox(width: 20,),

              Flexible(child: SizedBox(
                width: 250,
                child: blackColorButton(context, "Discover More", (){}),
              )),

            ],
          )

        ],
      ),
    ),
  );
}

Widget buildSecondView(BuildContext context) {
  return Container(
    width: double.infinity,
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height/3,
    ),
    child: Column(
      children: [

        Text("Our Software Is Quick, Lean & Market-Focused",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.black87, fontWeight: FontWeight.bold ),
        ),

        const SizedBox(height: 20,),

        Text("iLOGON an end-to-end solution, modular and scalable, enabling organizations to stay equipped amidst the dynamic business landscape",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black87, fontWeight: FontWeight.w600),
        ),


      ],
    ),

  );
}

/// Workstation and phone devices Image
Widget buildImageView(BuildContext context){
  return Container(
    alignment: Alignment.center,
      constraints: const BoxConstraints(
        minHeight: 300,
      ),
      height: MediaQuery.of(context).size.height/2,
      child: const Image(
          fit: BoxFit.fill,
          image:AssetImage("assets/images/pic2.png")));
}

/// Build Three Technical support
Widget buildTechnicalSupportView(BuildContext context) {
  return Container(
    width: double.infinity,
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height / 3,
    ),
    child: isWebView()?Row(
      children: [

        Expanded(child: buildSoftwareView(context)),

        Expanded(child: buildTechnicalView(context)),

        Expanded(child: buildIntegrationView(context)),

      ],
    ):Column(
      children: [

        buildSoftwareView(context),

        const SizedBox(height: 20,),

        buildTechnicalView(context),

        const SizedBox(height: 20,),

        buildIntegrationView(context)
      ],
    ),
  );
}

/// Build Software View
Widget buildSoftwareView(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child:  Column(
            children: [

              Text("Our Software",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.indigo.shade900,
                      fontWeight: FontWeight.w500, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),

              const SizedBox(height: 10,),

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

              Text("Using proven technologies iLOGON is modular & configurable to suit your business needs and requirements.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith( fontFamily: GoogleFonts.notoSans().fontFamily)),

            ]
        )
    );
  }

/// Build Technical View
Widget buildTechnicalView(BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
          children: [

            Text("Technical Support",
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.indigo.shade900,
                    fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                        .playfairDisplay()
                        .fontFamily)),

            const SizedBox(height: 10,),

            FloatingActionButton(
              backgroundColor: Colors.indigo.shade900,
              hoverColor: Colors.blue.shade900,
              onPressed: () {},
              shape: const StadiumBorder(),
              child: const Icon(
                Icons.phone_enabled,
                size: 30,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10,),

            Text("Our local customer care team strive to provide the best product support and resolution time.",
                textAlign: TextAlign.center,
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

/// Build Integration View
Widget buildIntegrationView(BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
          children: [

            Text("Integration Capabilities",
                textAlign: TextAlign.center, style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.indigo.shade900,
                    fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                        .playfairDisplay()
                        .fontFamily)),

            const SizedBox(height: 10,),

            FloatingActionButton(
              backgroundColor: Colors.indigo.shade900,
              hoverColor: Colors.blue.shade900,
              onPressed: () {},
              shape: const StadiumBorder(),
              child: const Icon(
                Icons.link,
                size: 30,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10,),

            Text("iLOGON can be integrated with your inhouse or external software systems to streamline your processes.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: GoogleFonts.notoSans().fontFamily)),

          ]
      )
  );
}

/// Build Slider View
Widget sliderView(BuildContext context){
  return CarouselSlider(
    options: CarouselOptions(
        height: 450,
        autoPlay: true,
        autoPlayAnimationDuration : const Duration(milliseconds: 1500)
    ),
    items: [1,2,3,4].map((i) {
      return Builder(
        builder: (BuildContext context) {
          if(isWebView()){
            if( i == 1 || i == 3){
              return Row(
                children: [
                    Expanded(child: buildSlider1View(context)),
                    Expanded(child: buildSlider2View(context))
                ],
              );
            }else{
              return Row(
                children: [
                  Expanded(child: buildSlider3View(context)),
                  Expanded(child: buildSlider4View(context))
                ],
              );
            }
          }else{
            if(i == 1){
              return buildSlider1View(context);
            }else if(i == 2){
              return buildSlider2View(context);
            }else if(i == 3){
              return buildSlider3View(context);
            }else{
              return buildSlider4View(context);
            }
          }
        },
      );
    }).toList(),
  );
}

/// Build Slider1 View
Widget buildSlider1View(BuildContext context){
  return  Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(20),
    constraints: const BoxConstraints(
      minHeight: 400,
    ),
    decoration: BoxDecoration(
      border: Border.all(
          color: Colors.blue.shade900,
          width: 3.0,
          style: BorderStyle.solid
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          FloatingActionButton(
            backgroundColor: Colors.indigo.shade900,
            hoverColor: Colors.blue.shade900,
            onPressed: () {},
            shape: const StadiumBorder(),
            child: const Icon(
              Icons.maps_home_work,
              size: 30,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10,),

          Text("KEYfields",
              textAlign: TextAlign.center, style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.indigo.shade900,
                  fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                      .playfairDisplay()
                      .fontFamily)),

          const SizedBox(height: 10,),

          Text("SURPASSING EXCELLENCE",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: GoogleFonts.notoSans().fontFamily)),

        ]
    ),
  );
}

/// Build Slider2 View
Widget buildSlider2View(BuildContext context){
  return  Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(20),
    constraints: const BoxConstraints(
      minHeight: 400,
    ),
    decoration: BoxDecoration(
      border: Border.all(
          color: Colors.blue.shade900,
          width: 3.0,
          style: BorderStyle.solid
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          FloatingActionButton(
            backgroundColor: Colors.indigo.shade900,
            hoverColor: Colors.blue.shade900,
            onPressed: () {},
            shape: const StadiumBorder(),
            child: const Icon(
              Icons.computer_sharp,
              size: 30,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10,),

          Text("Our Systems",
              textAlign: TextAlign.center, style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.indigo.shade900,
                  fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                      .playfairDisplay()
                      .fontFamily)),

          const SizedBox(height: 10,),

          Text("Our systems include Web & Mobile solutions.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: GoogleFonts.notoSans().fontFamily)),

        ]
    ),
  );
}

/// Build Slider3 View
Widget buildSlider3View(BuildContext context){
  return  Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(20),
    constraints: const BoxConstraints(
      minHeight: 400,
    ),
    decoration: BoxDecoration(
      border: Border.all(
          color: Colors.blue.shade900,
          width: 3.0,
          style: BorderStyle.solid
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          FloatingActionButton(
            backgroundColor: Colors.indigo.shade900,
            hoverColor: Colors.blue.shade900,
            onPressed: () {},
            shape: const StadiumBorder(),
            child: const Icon(
              Icons.location_pin,
              size: 30,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10,),

          Text("Where Are We Located?",
              textAlign: TextAlign.center, style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.indigo.shade900,
                  fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                      .playfairDisplay()
                      .fontFamily)),

          const SizedBox(height: 10,),

          Text("We have offices in Singapore, Indonesia, Thailand & Myanmar.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: GoogleFonts.notoSans().fontFamily)),

        ]
    ),
  );
}

/// Build Slider4 View
Widget buildSlider4View(BuildContext context){
  return  Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(20),
    constraints: const BoxConstraints(
      minHeight: 400,
    ),
    decoration: BoxDecoration(
      border: Border.all(
          color: Colors.blue.shade900,
          width: 3.0,
          style: BorderStyle.solid
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          FloatingActionButton(
            backgroundColor: Colors.indigo.shade900,
            hoverColor: Colors.blue.shade900,
            onPressed: () {},
            shape: const StadiumBorder(),
            child: const Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10,),

          Text("About Us",
              textAlign: TextAlign.center, style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.indigo.shade900,
                  fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                      .playfairDisplay()
                      .fontFamily)),

          const SizedBox(height: 10,),

          Text("Formed by a team of logistics in 2003 with decades of experience in Supply Chain and Transport Operations in 2003.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: GoogleFonts.notoSans().fontFamily)),

        ]
    ),
  );
}

/// Build User View
Widget buildUserView(BuildContext context){
  return Container(
    alignment: Alignment.center,
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height/1.5,
    ),
    padding: const EdgeInsets.all(20),
    width: double.infinity,
    decoration:    BoxDecoration(
        color: Colors.black87.withOpacity(0.8),
        image: const DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.5,
            image: AssetImage("assets/images/pic2.png"))
    ),
    child: Column(
      children: [

        Text("We Strive To Deliver For Our Clients",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold ),
        ),

        const SizedBox(height: 20,),


        isWebView()?Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Expanded(child: buildCount1View(context)),

            Expanded(child: buildCount2View(context)),

            Expanded(child: buildCount3View(context)),

            Expanded(child: buildCount4View(context)),


          ],
        ):Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(child: buildCount1View(context)),

                Expanded(child: buildCount2View(context)),


              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Expanded(child: buildCount3View(context)),

                Expanded(child: buildCount4View(context)),


              ],
            )
          ],
        )

      ],
    ),
  );

}

/// Build Count1 View
Widget buildCount1View(BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
          children: [

            Text("65M",
                textAlign: TextAlign.center, style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.white,
                    fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                        .notoSans()
                        .fontFamily)),

            const SizedBox(height: 10,),

            Text("Warehouse Spaces Managed \n (SQFT)",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

          ]
      )
  );
}

/// Build Count2 View
Widget buildCount2View(BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
          children: [

            Text("7K+",
                textAlign: TextAlign.center, style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.white,
                    fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                        .notoSans()
                        .fontFamily)),

            const SizedBox(height: 10,),

            Text("Transport Equipment Managed",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

          ]
      )
  );
}

/// Build Count3 View
Widget buildCount3View(BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
          children: [

            Text("8000K+",
                textAlign: TextAlign.center, style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.white,
                    fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                        .notoSans()
                        .fontFamily)),

            const SizedBox(height: 10,),

            Text("Daily Job Orders Processed",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

          ]
      )
  );
}

/// Build Count4 View
Widget buildCount4View(BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
          children: [

            Text("300K+",
                textAlign: TextAlign.center, style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.white,
                    fontWeight: FontWeight.w500, fontFamily: GoogleFonts
                        .notoSans()
                        .fontFamily)),

            const SizedBox(height: 10,),

            Text("Overall Completed Projects",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white,fontFamily: GoogleFonts.notoSans().fontFamily)),

          ]
      )
  );
}
