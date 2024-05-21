import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_demo/home/home_bloc.dart';
import 'package:devfest_demo/home/home_state.dart';
import 'package:devfest_demo/models/index.dart';
import 'package:devfest_demo/universal/dev_scaffold.dart';
import 'package:devfest_demo/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakerPage extends StatelessWidget {
  static final String routeName = "/speakers";

  const SpeakerPage({Key? key}) : super(key: key);

  Widget SocialActions(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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

  @override
  Widget build(BuildContext context) {
    var state = context.read<HomeBloc>().state as HomeInitializedState;
    var speakers = state.speakersData.speakers;

    return DevScaffold(
      body: ListView.builder(
        itemCount: speakers.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3.0,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: speakers[index].speakerImage ?? "",
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),

                  SizedBox(width: 20),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              speakers[index].speakerName ?? "",
                              style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
                            ),
                            SizedBox(height: 5),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: 5,
                              color: Tools.multipleColors[Random().nextInt(4)],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          speakers[index].speakerDesc ?? "",
                          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        Text(
                          speakers[index].speakerSession ?? "",
                          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        SocialActions(context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ), 
      title: "Speakers"
    );
  }
}