import 'package:devfest_demo/config/config_bloc.dart';
import 'package:devfest_demo/config/config_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class DevScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final PreferredSizeWidget? tabBar;

  const DevScaffold({Key? key, required this.body, required this.title, this.tabBar})
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 500),
      color: BlocProvider.of<ConfigBloc>(context).darkModeOn ? Colors.grey[800] : Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            bottom: tabBar,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  BlocProvider.of<ConfigBloc>(context).add(DarkModeEvent(!BlocProvider.of<ConfigBloc>(context).darkModeOn));
                },
                icon: Icon(
                  context.read<ConfigBloc>().darkModeOn 
                    ? FontAwesomeIcons.lightbulb
                    : FontAwesomeIcons.solidLightbulb,
                  size: 18,
                )
              ),
              IconButton(
                onPressed: () {
                  Share.share("Download the new DevFest App and share with your tech friends.\nPlayStore -  http://bit.ly/2GDr18N");
                },
                icon: Icon(
                  Icons.share,
                  size: 20,
                ),
              ),
            ],
          ),
          body: body,
        ),
      ),
    );
  }
}