import 'package:flutter/material.dart';

Widget blackColorButton(BuildContext context, String title, VoidCallback? onPressed) {
  return MaterialButton(
    onPressed: onPressed,
    color: Colors.black,
    hoverColor: Colors.blueGrey,
    shape: const StadiumBorder(),
    child: Text(
      title,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),
    ),
  );
}