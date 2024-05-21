import 'package:devfest_demo/agenda/agenda_page.dart';
import 'package:devfest_demo/config/config_bloc.dart';
import 'package:devfest_demo/faq/faq_page.dart';
import 'package:devfest_demo/speakers/speaker_page.dart';
import 'package:devfest_demo/sponsors/sponsor_page.dart';
import 'package:devfest_demo/team/team_page.dart';
import 'package:devfest_demo/universal/image_card.dart';
import 'package:devfest_demo/utils/devfest.dart';
import 'package:devfest_demo/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageCard(img: context.read<ConfigBloc>().darkModeOn ? Devfest.banner_dark : Devfest.banner_light),
            SizedBox(height: 20.0),
            ...DevFestText(context),
            SizedBox(height:20.0),
            Actions(context),  
            SizedBox(height:20.0),
            SocialActions(context),
          ],
        ),
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Couldn't launch $url";
    }
  }

  List<Widget> DevFestText(context) {
    return [
      Text(
        Devfest.welcomeText,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20),
      Text(
        Devfest.descText,
        style: Theme.of(context).textTheme.caption,
        textAlign: TextAlign.center,
      )
    ];
  }

  Widget SocialActions(context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () async {
              await _launchUrl("https://facebook.com/imthepk");
            }, 
            icon: Icon(FontAwesomeIcons.facebookF),
          ),
          IconButton(
            onPressed: () async {
              await _launchUrl("https://facebook.com/imthepk");
            }, 
            icon: Icon(FontAwesomeIcons.twitter),
          ),
          IconButton(
            onPressed: () async {
              await _launchUrl("https://facebook.com/imthepk");
            }, 
            icon: Icon(FontAwesomeIcons.linkedin),
          ),
          IconButton(
            onPressed: () async {
              await _launchUrl("https://facebook.com/imthepk");
            }, 
            icon: Icon(FontAwesomeIcons.youtube),
          ),
          IconButton(
            onPressed: () async {
              await _launchUrl("https://facebook.com/imthepk");
            }, 
            icon: Icon(FontAwesomeIcons.meetup),
          ),
          IconButton(
            onPressed: () async {
              await _launchUrl("https://facebook.com/imthepk");
            }, 
            icon: Icon(FontAwesomeIcons.envelope),
          ),
        ],
      ),
    );
  }

  Widget Actions(context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20.0,
      runSpacing: 20.0,
      children: [
        ActionCard(
          icon: Icons.schedule,
          color: Colors.red,
          title: "Agenda",
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AgendaPage(),
              ),
            ),
          },
        ),
        ActionCard(
          icon: Icons.person,
          color: Colors.green,
          title: "Speakers",
          onPressed: () => {
            Navigator.push(context, 
            MaterialPageRoute(builder: 
              (context) => SpeakerPage(),
            ),
          ),
          },
        ),
        ActionCard(
          icon: Icons.people,
          color: Colors.amber,
          title: "Team",
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeamPage(),
              ),
            ),  
          },
        ),
        ActionCard(
          icon: Icons.attach_money,
          color: Colors.purple,
          title: "Sponsors",
          onPressed: () => {
            Navigator.push(context, 
            MaterialPageRoute(builder: 
              (context) => SponsorPage(),
            ),
          ),
          },
        ),
        ActionCard(
          icon: Icons.question_answer,
          color: Colors.brown,
          title: "FAQ",
          onPressed: () => {
            Navigator.push(context, 
            MaterialPageRoute(builder: 
              (context) => FaqPage(),
            ),
          ),
          },
        ),
        ActionCard(
          icon: Icons.map,
          color: Colors.blue,
          title: "Locate Us",
          onPressed: () => {},
        ),
      ],
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({Key? key, required this.onPressed, required this.icon, required this.title, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onPressed();
        },
        child: Ink(
          height: MediaQuery.of(context).size.height * 0.09,
          width: MediaQuery.of(context).size.width * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: context.read<ConfigBloc>().darkModeOn
                  ? Tools.hexToColor("#1f2124")
                  : Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: context.read<ConfigBloc>().darkModeOn
                      ? null 
                      : [
                        BoxShadow(
                          color: Colors.grey[200]!,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ]
          ),
        ),
    );
  }
}