import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_demo/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:devfest_demo/models/index.dart';
import 'package:devfest_demo/universal/dev_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionDetail extends StatelessWidget {
  static const String routeName = "/session_detail";
  final Session session;

  const SessionDetail({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Hero(
                  tag: session.speakerImage ?? "", 
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: CachedNetworkImageProvider(session.speakerImage ?? ""),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Text(
                "${session.speakerDesc}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(fontSize : 14, color: Tools.multipleColors[Random().nextInt(4)]),
              ),

              SizedBox(height: 10),

              Text(
                "${session.sessionTitle}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(fontSize : 16, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              Text(
                session.sessionDesc ?? "",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
              ),

              SizedBox(height: 20,),

              SocialActions(context),
            ],
          ),
        ),
      ), 
      title: session.speakerName ?? "",
    );
  }

  Widget SocialActions(context) => FittedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            launch(speakers[0].fbUrl ?? "");
          }, 
          icon: Icon(
            FontAwesomeIcons.facebookF,
            size: 15,
          ),
        ),
        IconButton(
              icon: Icon(
                FontAwesomeIcons.twitter,
                size: 15,
              ),
              onPressed: () {
                launch(speakers[0].twitterUrl ?? "");
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.linkedinIn,
                size: 15,
              ),
              onPressed: () {
                launch(speakers[0].linkedinUrl ?? "");
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.github,
                size: 15,
              ),
              onPressed: () {
                launch(speakers[0].githubUrl ?? "");
              },
            ),
      ],
    ),
  );


}