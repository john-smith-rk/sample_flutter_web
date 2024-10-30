import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderTitlePage extends StatelessWidget {

  final String title;

  const HeaderTitlePage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height/5,
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

          Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white,  ),
          ),

        ],
      ),
    );
  }
}