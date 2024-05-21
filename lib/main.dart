import 'package:devfest_demo/config/config_page.dart';
import 'package:devfest_demo/utils/dependency_injection.dart';
import 'package:devfest_demo/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  Devfest.prefs = await SharedPreferences.getInstance();

  Injector.configure(Flavor.MOCK, DataMode.JSON);
  runApp(ConfigPage());
}
