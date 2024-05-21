import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_demo/agenda/session_detail.dart';
import 'package:flutter/material.dart';
import 'package:devfest_demo/models/index.dart';
import 'package:devfest_demo/utils/tools.dart';

class SessionList extends StatelessWidget {
  final List<Session> allSessions;

  const SessionList({Key? key, required this.allSessions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      itemCount: allSessions.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 3.0,
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => SessionDetail(session: allSessions[index])
                )
              );
            },
            isThreeLine: true,
            trailing: RichText(
              text: TextSpan(
                text: "${allSessions[index].sessionTotalTime}\n",
                style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "${allSessions[index].sessionStartTime}",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 12),
                  ),
                ]
              ),
            ),

            leading: Hero(
              tag: allSessions[index].speakerImage ?? "", 
              child: CircleAvatar(
                radius: 30,
                backgroundImage: CachedNetworkImageProvider(allSessions[index].speakerImage ?? ""),
                ),
            ),

            title: RichText(
              text: TextSpan(
                text: "${allSessions[index].sessionTitle}\n",
                style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 15),
                children: [
                  TextSpan(
                    text: "${allSessions[index].speakerName}",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 14,
                      color: Tools.multipleColors[Random().nextInt(4)],
                    ),
                  ),
                ]
              ),
            ),
            
            subtitle: Text(
              allSessions[index].speakerDesc ?? "",
              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
            ),
          ),
        );
      },
    );
  }
}