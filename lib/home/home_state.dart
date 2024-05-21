import 'package:devfest_demo/models/index.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeUnintializedState extends HomeState {
  HomeUnintializedState();

  @override
  String toString() {
    return 'homeUnitializedState';
  }

  @override
  List<Object> get props => [];
}

class HomeInitializedState extends HomeState {
  final SpeakersData speakersData;
  final SessionsData sessionsData;
  final TeamsData teamsData;

  HomeInitializedState({required this.speakersData, required this.sessionsData, required this.teamsData});

  @override
  String toString() {
    return 'HomeInitializedState';
  }

  @override
  List<Object> get props => [];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);

  @override
  String toString() {
    return 'HomeErrorState';
  }

  @override
  List<Object> get props => [];
}