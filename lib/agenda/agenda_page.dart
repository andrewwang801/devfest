import 'dart:math';

import 'package:devfest_demo/agenda/mobile_screen.dart';
import 'package:devfest_demo/agenda/web_screen.dart';
import 'package:flutter/material.dart';
import 'cloud_screen.dart';
import 'package:devfest_demo/home/index.dart';
import 'package:devfest_demo/universal/dev_scaffold.dart';
import 'package:devfest_demo/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgendaPage extends StatelessWidget {
  static const String routeName = "/agenda";

  const AgendaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: DevScaffold(
        tabBar: TabBar(
          indicatorColor: Tools.multipleColors[Random().nextInt(4)],
          labelStyle: TextStyle(fontSize: 12),
          isScrollable: true,
          tabs: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child :Tab(
                child: Text("Cloud"),
                icon: Icon(
                  FontAwesomeIcons.cloud,
                  size: 12
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Tab(
                child: Text("Mobile"),
                icon: Icon(
                  FontAwesomeIcons.mobile,
                  size: 12
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Tab(
                child: Text("Web & More"),
                icon: Icon(
                  FontAwesomeIcons.chrome,
                  size: 12
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            CouldScreen(),
            MobileScreen(),
            WebScreen(),
          ]
        ), 
        title: "Agenda"
      ),
    );
  }
}