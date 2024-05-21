import 'package:devfest_demo/home/home_bloc.dart';
import 'package:devfest_demo/home/home_provider.dart';
import 'package:devfest_demo/home/home_state.dart';

abstract class HomeEvent {
  Future<HomeState> applyAsync();
}

class HomeLoadEvent extends HomeEvent {
  final IHomeProvider _homeProvider = HomeProvider();

  HomeLoadEvent();

  @override
  String toString() {
    return 'HomeLoadEvent';
  }

  @override
  Future<HomeState> applyAsync() async {
    try {
      var speakersData = await _homeProvider.getSpeakers();
      var sessionsData = await _homeProvider.getSessions();
      var teamsData = await _homeProvider.getTeams();

      return HomeInitializedState(speakersData: speakersData, sessionsData: sessionsData, teamsData: teamsData);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return HomeErrorState(_.toString());
    }
  }
}