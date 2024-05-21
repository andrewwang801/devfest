import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devfest_demo/home/home_event.dart';
import 'package:devfest_demo/home/home_state.dart';

import 'index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeUnintializedState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield HomeUnintializedState();
    try {
      yield await event.applyAsync();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield state;
    }
  }
}