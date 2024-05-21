import 'package:devfest_demo/universal/dev_scaffold.dart';
import 'package:flutter/cupertino.dart';

import 'home_screen.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return DevScaffold(body: HomeScreen(), title: "Home");
  }
}