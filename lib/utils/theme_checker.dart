import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

bool isDarkTheme(){
  var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  return isDarkMode;
}