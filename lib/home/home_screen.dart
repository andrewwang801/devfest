import 'dart:math';

import 'package:devfest_demo/home/home_event.dart';
import 'package:devfest_demo/home/home_state.dart';
import 'package:devfest_demo/utils/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'home_bloc.dart';
import 'home_widgets/home_front.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen();

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeLoadEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<HomeBloc>(context),
      listener: (context, state) {
        if (state is HomeErrorState) {
          // Show Error Dialog
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (context, state) {
          if (state is HomeUnintializedState) {
            return Center(
              child: SpinKitChasingDots(
                color: Tools.multipleColors[Random().nextInt(3)],
              ),
            );
          }
          if (state is HomeErrorState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return HomeFront();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}