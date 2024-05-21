import 'package:devfest_demo/home/home_bloc.dart';
import 'package:devfest_demo/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'session_list.dart';
import 'package:devfest_demo/home/index.dart';

class CouldScreen extends StatelessWidget {
  const CouldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = context.read<HomeBloc>().state as HomeInitializedState;
    var sessions = state.sessionsData.sessions;
    var cloudSessions = sessions.where((element) => element.track == "cloud").toList();
    return SessionList(allSessions: cloudSessions);
  }
}