import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Devfest {
  static const String app_name = "Devfest";
  static const String app_version = "Version 1.0.0";
  static const int app_version_code = 1;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static const String google_sans_family = "GoogleSans";
  static bool isDebugMode = true;
  //*  Texts
  static const String welcomeText = "Welcome to GDG DevFest";
  static const String descText =
      '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''';

  //* Images
  static const String home_img = "assets/images/home_img.jpeg";
  static const String banner_light = "assets/images/banner_light.png";
  static const String banner_dark = "assets/images/banner_dark.png";
  
  // * Url related
  static String baseUrl = "https://storage.googleapis.com/gdg-devfest";
  
  //* Preferences
  static late SharedPreferences prefs;
  static const String darkModePref = "darkModePref";

  //* JSON URLS
  static const String speakersAssetJson = "assets/json/speakers.json";
  static const String sessionsAssetJson = "assets/json/sessions.json";
  static const String teamsAssetJson = "assets/json/teams.json";
}