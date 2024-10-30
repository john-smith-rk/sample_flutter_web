import 'package:flutter/material.dart';

bool isThereCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;