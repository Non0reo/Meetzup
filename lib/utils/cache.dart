import 'dart:ui';

import 'package:arobaze/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Color> getGlobalColor() async {
  final prefs = await SharedPreferences.getInstance();
  bool isSwitched = prefs.getBool('mainSwitchActivated') ?? false;
  return !isSwitched ? AppColors.primary1 : AppColors.primary2;
}

Future<bool> getGlobalState() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('mainSwitchActivated') ?? false;
}