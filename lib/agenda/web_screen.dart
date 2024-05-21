import 'package:devfest_demo/home/home_bloc.dart';
import 'package:devfest_demo/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'session_list.dart';
import 'package:devfest_demo/home/index.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = context.read<HomeBloc>().state as HomeInitializedState;
    var sessions = state.sessionsData.sessions;
    var webSessions = sessions.where((element) => element.track == "web").toList();
    return SessionList(allSessions: webSessions);
  }
}