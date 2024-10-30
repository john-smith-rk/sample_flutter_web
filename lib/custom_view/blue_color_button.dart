import 'package:flutter/material.dart';

Widget blueColorButton(BuildContext context, String title, VoidCallback? onPressed) {
  return MaterialButton(
    onPressed: onPressed,
    color: Colors.blue.shade900,
    hoverColor: Colors.blueGrey,
    shape: const StadiumBorder(),
    child: Text(
      title,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),
    ),
  );
}