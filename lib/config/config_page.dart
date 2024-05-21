import 'package:devfest_demo/agenda/agenda_page.dart';
import 'package:devfest_demo/faq/faq_page.dart';
import 'package:devfest_demo/home/home_bloc.dart';
import 'package:devfest_demo/home/home_page.dart';
import 'package:devfest_demo/speakers/speaker_page.dart';
import 'package:devfest_demo/sponsors/sponsor_page.dart';
import 'package:devfest_demo/team/team_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devfest_demo/utils/devfest.dart';

import 'index.dart';

class ConfigPage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
    late ConfigBloc configBloc;

    @override
    void initState() {
      super.initState();
      setupApp();
    }

    setupApp() {
      configBloc = ConfigBloc();
      // configBloc.darkModeOn = Devfest.prefs.getBool(Devfest.darkModePref) ?? false;
      configBloc.darkModeOn = false;
    }

    @override
    Widget build(BuildContext context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => configBloc,
          ),
          BlocProvider(
            create: (context) => HomeBloc(),
          ),
        ],
        child: BlocBuilder<ConfigBloc, ConfigState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Google Devfest',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: Devfest.google_sans_family,
                primarySwatch: Colors.red,
                primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
                disabledColor: Colors.grey,
                cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
                canvasColor: configBloc.darkModeOn ? Colors.black : Colors.white,
                brightness: configBloc.darkModeOn ? Brightness.dark : Brightness.light,
                buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: configBloc.darkModeOn ? ColorScheme.dark() : ColorScheme.light(),
                ),
                appBarTheme: AppBarTheme(
                  elevation: 0.0,
                ),
              ),
              home: HomePage(),
              routes : {
                HomePage.routeName: (context) => HomePage(),
                AgendaPage.routeName: (context) => AgendaPage(),
                SpeakerPage.routeName: (context) => SpeakerPage(),
                TeamPage.routeName: (context) => TeamPage(),
                SponsorPage.routeName: (context) => SponsorPage(),
                FaqPage.routeName: (context) => FaqPage(),
              },
            );
          }
        ),
      );
    }
}